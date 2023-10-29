#!/bin/sh
set -e

echo "Activating feature 'lucky_cli'"

echo "Installing system dependencies"
sudo apt update
sudo apt-get -y install libc6-dev libevent-dev libpcre2-dev libpcre3-dev libpng-dev libssl-dev libyaml-dev zlib1g-dev

echo "Installing Lucky v$VERSION"

git clone https://github.com/luckyframework/lucky_cli
cd lucky_cli
git checkout v$VERSION
shards install --without-development
shards build --production
chmod +x bin/lucky
sudo cp bin/lucky /usr/local/bin
cd ..
rm -rf lucky_cli

echo "Done installing Lucky v$VERSION"