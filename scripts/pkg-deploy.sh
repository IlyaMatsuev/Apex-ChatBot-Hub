#!/bin/sh

# Note: If you're trying to use this script for deployment to a sandbox or dev org, you first need to set up subdomain in your org manually
# Setup -> Type "Sites" in the left search box -> Sites -> Choose a name for your subdomain and register it

# This script deploys and configures the SF source part to the organization by the provided username or alias
# Example: sh ./scripts/pkg-deploy.sh test.sandbox@test.com

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

org_alias=$1

info() {
    echo
    echo "${green}$1${reset}"
}

error() {
    echo "${red}$1${reset}"
	exit 1
}

if [[ -z "$org_alias" ]]
then
	error "Specify the org alias or username as the first parameter"
fi

info "Please login to the org"
sfdx force:auth:web:login -a "$org_alias" || { exit 1; }

info "Installing dependencies..."
sfdx force:package:install -p 04t5Y000001wNArQAM -w 10 -b 10 -u "$org_alias"

info "Deploying to ${org_alias}..."
# SObjects, App, Apex and permissions
sfdx force:source:deploy -u "$org_alias" -p "./src/main/default/objects,./src/main/default/layouts,\
    ./src/main/default/flexipages,./src/main/default/tabs,./src/main/default/applications,./src/main/default/classes,\
    ./src/main/default/triggers,./src/main/default/permissionsets,./src/main/telegram,./src/test" \
    || { exit 1; }
# Public site
sfdx force:source:deploy -u "$org_alias" -p ./src/main/default/pages,./src/main/default/sites || { exit 1; }
# Public site profile
sfdx force:source:deploy -u "$org_alias" -p ./src/main/default/profiles || { exit 1; }

info "Assigning permissions..."
sfdx force:user:permset:assign -n BotAdmin -u "$org_alias"

info "Deployment has been finished.\\nOpen the org with 'sfdx force:org:open -u ${org_alias}'"
