#!/bin/bash

sudo npm install -g @githubnext/github-copilot-cli
echo "install -g @githubnext/github-copilot-cli"
eval "$(github-copilot-cli alias -- "$0")"
echo -e 'eval "$(github-copilot-cli alias -- "$0")"' >> ~/.bashrc