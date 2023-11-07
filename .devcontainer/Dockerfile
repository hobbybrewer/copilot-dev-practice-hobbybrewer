FROM mcr.microsoft.com/devcontainers/universal:2-linux
#FROM mcr.microsoft.com/devcontainers/javascript-node

# [Optional] Uncomment if you want to install an additional version of node using nvm
# ARG EXTRA_NODE_VERSION=10
# RUN su node -c "source /usr/local/share/nvm/nvm.sh && nvm install ${EXTRA_NODE_VERSION}"

# [Optional] Uncomment if you want to install more global node modules
# RUN su node -c "npm install -g <your-package-list-here>"

RUN npm install -g npm@latest 
RUN sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install -y mongodb

RUN npm install -g @githubnext/github-copilot-cli

#RUN echo "install -g @githubnext/github-copilot-cli" && eval "$(github-copilot-cli alias -- "$0")"
#RUN eval '$(github-copilot-cli alias -- "$0")'
#RUN echo -e 'eval "$(github-copilot-cli alias -- "$0")"' >> ~/.bashrc

#RUN backend && npm install
#RUN ../frontend && npm install

#COPY /scripts/install-env.sh /tmp/library-scripts/
#RUN apt-get update && bash /tmp/library-scripts/install-env.sh
