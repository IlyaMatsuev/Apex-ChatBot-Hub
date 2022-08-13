#!/bin/sh

# This script creates a new scratch org with deployed and configured package
# The script requires at least 2 parameters: devhub username/alias and new scratch org alias
# Example: sh ./scripts/pkg-from-scratch.sh dev.hub@test.com test.scratch@test.com

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
default_scratch_duration=10

devhub_alias=$1
scratch_alias=$2
days=${3:-$default_scratch_duration}

info() {
    echo
    echo "${green}$1${reset}"
}

error() {
    echo "${red}$1${reset}"
	exit 1
}

if [[ -z "$devhub_alias" ]]
then
    error "Specify a dev hub org alias as the first parameter"
fi

if [[ -z "$scratch_alias" ]]
then
    error "Specify a scratch org alias as the second parameter"
fi

info "Creating scratch..."
sfdx force:org:create -f ./config/project-scratch-def.json -v "$devhub_alias" -a "$scratch_alias" -d "$days" || sfdx force:auth:web:login -a "$devhub_alias" || { exit 1; }

info "Installing dependencies..."
sfdx force:package:install -p 04t5Y000001wNArQAM -w 10 -b 10 -u "$scratch_alias"

info "Deploying to ${scratch_alias}..."
# SObjects, App, Apex and permissions
sfdx force:source:deploy -u "$scratch_alias" -p ./src/main/default/objects,./src/main/default/layouts,./src/main/default/tabs,./src/main/default/applications,./src/main/default/classes,./src/main/default/triggers,./src/main/default/permissionsets,./src/main/telegram || { exit 1; }
# Public site
sfdx force:source:deploy -u "$scratch_alias" -p ./src/main/default/pages,./src/main/default/sites || { exit 1; }
# Public site profile
sfdx force:source:deploy -u "$scratch_alias" -p ./src/main/default/profiles || { exit 1; }

info "Assigning permissions..."
sfdx force:user:permset:assign -n BotAdmin -u "$scratch_alias"

info "${green}Deployment has been finished.\\nOpen the org with 'sfdx force:org:open -u ${scratch_alias}'${reset}"
