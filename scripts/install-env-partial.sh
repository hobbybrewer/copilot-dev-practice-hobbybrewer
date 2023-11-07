#!/bin/bash

sudo service mongodb start
sudo service mongodb enable

echo "install -g @githubnext/github-copilot-cli"
eval "$(github-copilot-cli alias -- "$0")"

echo -e 'eval "$(github-copilot-cli alias -- "$0")"' >> ~/.bashrc

cd backend
npm install

cd ../frontend
npm install

sed -i "s/shiny-acorn-v64jvpv96xwhp9g4-8080.app.github.dev/${CODESPACE_NAME}-8080.app.github.dev/g" ./frontend/src/http-common.js