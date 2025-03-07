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

info "Installing dependencies..."
sf package:install -p 04t5Y000001wNArQAM -w 10 -b 10 -o "$org_alias" \
    || (\
        info "Please login to the org" \
        && sf org:login:web -a "$org_alias" \
        && sf package:install -p 04t5Y000001wNArQAM -w 10 -b 10 -o "$org_alias" \
    ) || { exit 1; }

info "Deploying to ${org_alias}..."
# SObjects, App, Apex and permissions
sf project:deploy:start -o "$org_alias" -d ./src/main || { exit 1; }
# Apex Tests
sf project:deploy:start -o "$org_alias" -d ./src/test || { exit 1; }
# Public site
sf project:deploy:start -o "$org_alias" -d ./src/site || { exit 1; }
# Public site profile
sf project:deploy:start -o "$org_alias" -d ./src/site-permissions || { exit 1; }

info "Assigning permissions..."
sf org:assign:permset -n BotAdmin -o "$org_alias"

info "Deployment has been finished.\\nOpen the org with 'sf org:open -o ${org_alias}'"
