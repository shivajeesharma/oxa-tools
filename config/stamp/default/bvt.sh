#!/bin/bash

# Open edX configuration (server-vars.yml) can be tokenized such that variable expansion
# using oxa-tools-config environment configurations is possible. Note that defaults can
# be specified in the tokenized configuration. i.e., ${foo:-bar}
#
# see: http://www.tldp.org/LDP/abs/html/parameter-substitution.html

##########################
# ENVIRONMENT IDENTIFIER
##########################
ENVIRONMENT=bvt

##########################
# SITE URLS
##########################

# the site certificate files (.crt & .key) have to be named after the BASE_URL value
BASE_URL=academy.rpsconsulting.in
LMS_URL=academy.$BASE_URL
CMS_URL=studio.$BASE_URL
PREVIEW_URL=preview.$BASE_URL

# deployment configuration
# URL-building will be replaced by the use of LMS_URL | CMS_URL (above)
# uri format: [lms|cms]-%%CLUSTERNAME%%-%%DEPLOYMENT_SLOT%%.%%REGION%%.cloudapp.azure.com
TEMPLATE_TYPE=stamp # stamp|fullstack|devstack
CLUSTERNAME={CLUSTERNAME}
ADMIN_USER=oxaadmin
OXA_TOOLS_VERSION=oxa/dev.haw

# config/server-vars.yml
#YOUTUBE_API_KEY=todo
PLATFORM_NAME=
PLATFORM_EMAIL=

# Override configured email addresses
EDXAPP_EMAIL_BUGS="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_BULK_FROM="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_CONTACT="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_FEEDBACK="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_DEFAULT_FROM="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_PAYMENT_SUPPORT="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_PRESS="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_TECH_SUPPORT="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_UNIVERSITY="${PLATFORM_EMAIL}"

# config/versions.yml
CONFIGURATION_REPO=https://github.com/Microsoft/edx-configuration.git
CONFIGURATION_VERSION=oxa/dev.haw
PLATFORM_REPO=https://github.com/Microsoft/edx-platform.git
PLATFORM_VERSION=oxa/dev.haw
THEME_REPO=https://github.com/shivajeesharma/edxthemes.git
THEME_VERSION=master
EDX_VERSION=open-release/hawthorn.master
FORUM_VERSION=oxa/dev.haw
AZURE_MEDIA_VERSION=oxa/dev.haw
KITCHEN_SINK_COURSE_VERSION=oxa/dev.haw_migration_2

# fullstack uses default EMAIL_HOST=localhost
# config/stamp/stamp.yml
EDXAPP_EMAIL_HOST=
EDXAPP_EMAIL_HOST_USER=
EDXAPP_EMAIL_HOST_PASSWORD=
EDXAPP_EMAIL_PORT=
EDXAPP_EMAIL_USE_TLS=true

# storage uploads
AZURE_ACCOUNT_NAME={AZURE_ACCOUNT_NAME}
AZURE_ACCOUNT_KEY={AZURE_ACCOUNT_KEY}

NGINX_ENABLE_SSL=True
NGINX_SSL_CERTIFICATE="/oxa/oxa-tools-config/env/${ENVIRONMENT}/cert.crt"
NGINX_SSL_KEY="/oxa/oxa-tools-config/env/${ENVIRONMENT}/cert.key"

##########################
# MONGO
##########################

# Mongo Credentials
MONGO_USER=
MONGO_PASSWORD=

# Mongo Replicaset Credentials
MONGO_REPLICASET_KEY=
MONGO_REPLICASET_NAME={MONGO_REPLICASET_NAME}

# MongoDB Installer Configurations
MONGO_INSTALLER_SCRIPT=mongodb-ubuntu-install.sh
MONGO_INSTALLER_BASE_URL=http://repo.mongodb.org/apt/ubuntu
MONGO_INSTALLER_PACKAGE_NAME=mongodb-org
MONGO_SERVER_IP_PREFIX=10.0.0.
MONGO_SERVER_IP_OFFSET=10
MONGO_SERVER_LIST=10.0.0.11,10.0.0.12,10.0.0.13

##########################
# MYSQL
##########################

# Mysql Credentials
MYSQL_ADMIN_USER=oxamysqladmin
MYSQL_ADMIN_PASSWORD=

# MySql Temporary Credentials
MYSQL_TEMP_USER=oxamysqlbackup
MYSQL_TEMP_PASSWORD=

# App and Replication accounts (same account??)
# TODO: separate the replication user from the edxapp user
MYSQL_USER=oxamysqlrepl
MYSQL_PASSWORD=
MYSQL_REPL_USER=oxamysqlrepl
MYSQL_REPL_USER_PASSWORD=

# Mysql Installer Configurations
MYSQL_INSTALLER_SCRIPT=mysql-ubuntu-install.sh
MYSQL_PACKAGE_VERSION="5.6"
MYSQL_MASTER_IP=10.0.0.16
MYSQL_SERVER_LIST=10.0.0.16,10.0.0.17,10.0.0.18
MYSQL_MASTER_PORT=3306

COMMON_HTPASSWD_PASS=
COMMON_HTPASSWD_USER=
COMMON_MONGO_READ_ONLY_PASS=
COMMON_MYSQL_ADMIN_PASS=
COMMON_MYSQL_MIGRATE_PASS=
COMMON_MYSQL_READ_ONLY_PASS=

XQUEUE_MYSQL_PASSWORD=
XQUEUE_RABBITMQ_PASS=
# Superuser Information (this gives front door access to the application. This value must be updated.)
CREATE_SUPER_USER=True
EDXAPP_SU_PASSWORD=
EDXAPP_SU_EMAIL=
EDXAPP_SU_USERNAME=

# Rabbitmq configs 
RABBIT_ADMIN_PASSWORD= 
EDXAPP_CELERY_PASSWORD= 
XQUEUE_RABBITMQ_PASS=
# Azure Active Directory OAuth2 Third Party Authentication Configuration
EDXAPP_ENABLE_THIRD_PARTY_AUTH={EDXAPP_ENABLE_THIRD_PARTY_AUTH}
EDXAPP_AAD_CLIENT_ID="{EDXAPP_AAD_CLIENT_ID}"
EDXAPP_AAD_SECURITY_KEY="{EDXAPP_AAD_SECURITY_KEY}"
EDXAPP_AAD_BUTTON_NAME="{EDXAPP_AAD_BUTTON_NAME}"

# Comprehensive Theming Configuration
EDXAPP_ENABLE_COMPREHENSIVE_THEMING={EDXAPP_ENABLE_COMPREHENSIVE_THEMING}
EDXAPP_COMPREHENSIVE_THEME_DIRS=\[\ \"{EDXAPP_COMPREHENSIVE_THEME_DIRECTORY}\"\ \]
EDXAPP_DEFAULT_SITE_THEME=$THEME_VERSION
EDXAPP_COMPREHENSIVE_THEME_VERSION={EDXAPP_COMPREHENSIVE_THEME_VERSION}

COMBINED_LOGIN_REGISTRATION=true

# Import Kitchen Sink Course Configuration
EDXAPP_IMPORT_KITCHENSINK_COURSE={EDXAPP_IMPORT_KITCHENSINK_COURSE}

# Memcache server
# In order to support multiple VMSS resources, we have to support multiple memcache target servers to avoid collision of cache keys that result in 
# broken application experiences (cache poisoning). It is therefore necessary to add explicit configuration for the memcache server and allow 
# deployment-time overrides.
MEMCACHE_SERVER_IP=$MYSQL_MASTER_IP

# Conditionally enabling Mobile Rest Api in support of MPP integration scenarios
EDXAPP_ENABLE_OAUTH2_PROVIDER=true
EDXAPP_ENABLE_MOBILE_REST_API=true
OAUTH_ENFORCE_SECURE=false

# Security
EDXAPP_ENABLE_CONNECTION_LIMITING=true
EDXAPP_ENABLE_RATE_LIMITING=true

ENABLE_LTI_PROVIDER=true
ENABLE_AZURE_MEDIA_SERVICES_XBLOCK=true

EDXAPP_REDIRECT_IS_HTTPS=true
EDXAPP_ENABLE_CUSTOM_AUTH=false

EDXAPP_ONLY_THIRD_PARTY_AUTH=true

EDXAPP_API_COOKIE_URL="https://uhf.microsoft.com/locale/shell/api/mscc?sitename=openedx&domain=microsoft.com&country=euregion&mscc_eudomain=true"

ENABLE_CSMH_EXTENDED=true
ENABLE_READING_FROM_MULTIPLE_HISTORY_TABLES=true

#newrelic 
NEWRELIC_INFRASTRUCTURE_LICENSE_KEY=""
COMMON_ENABLE_NEWRELIC_INFRASTRUCTURE=false

#Insights
EDXAPP_ANALYTICS_DASHBOARD_URL=""

# Secret keys for Django Applicatons
ANALYTICS_API_SECRET_KEY=
CREDENTIALS_SECRET_KEY=
DISCOVERY_SECRET_KEY=
ECOMMERCE_SECRET_KEY=
EDX_NOTES_API_SECRET_KEY=
EDXAPP_EDXAPP_SECRET_KEY=
EDXAPP_PROFILE_IMAGE_SECRET_KEY=
INSIGHTS_SECRET_KEY=
NOTIFIER_LMS_SECRET_KEY=

# Cookie Banner
EDXAPP_ENABLE_COOKIE_CONSENT=true

# Azure keyvault configs 
EDXAPP_GET_SECRETS_FROM_AZURE_KEYVAULT=false
EDXAPP_AZURE_MSI_REQUEST_URI=""
EDXAPP_KEYVAULT_PAYLOAD=""
EDXAPP_KEYVAULT_URL=""
EDXAPP_KEYVAULT_API_VERSION=""
EDXAPP_LMS_NON_SECURE_KEY_NAME=""
EDXAPP_LMS_SECURE_KEY_NAME=""
EDXAPP_CMS_NON_SECURE_KEY_NAME=""
EDXAPP_CMS_SECURE_KEY_NAME=""
