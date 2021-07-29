#!/bin/sh

php bin/magento maintenance:enable
rm -rf pub/static/*
rm -rf var/cache/*
rm -rf var/view_preprocessed/*
rm -rf var/generation/*
rm -rf var/page_cache/*
rm -rf var/di/*
php bin/magento deploy:mode:set developer
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento indexer:reindex
php bin/magento deploy:mode:set production
php bin/magento maintenance:disable
php bin/magento cache:clean
php bin/magento cache:flush
php bin/magento cache:enable
