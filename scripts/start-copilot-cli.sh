#!/bin/bash

eval "$(github-copilot-cli alias -- "$0")"
echo -e 'eval "$(github-copilot-cli alias -- "$0")"' >> ~/.bashrc
