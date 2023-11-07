#!/bin/bash

#pwd
#sudo apt-get update -y
#sudo apt-get upgrade -y
#sudo apt-get install -y mongodb

sudo service mongodb start

eval "$(github-copilot-cli alias -- "$0")"
echo -e 'eval "$(github-copilot-cli alias -- "$0")"' >> ~/.bashrc

#alias cd_workshop='type cd_workshop && cd /workspaces/Copilot-Dev-Practices/'
#echo -e 'alias cd_workshop="type cd_workshop && cd /workspaces/Copilot-Dev-Practices/"' >> ~/.bashrc
alias cd_workshop='type cd_workshop && cd /workspaces/Copilot-Dev-Practices-${GITHUB_USER}/'
echo -e 'alias cd_workshop="type cd_workshop && cd /workspaces/Copilot-Dev-Practices-${GITHUB_USER}/"' >> ~/.bashrc
alias code_copilot_cli_1='type code_copilot_cli_1 && cd_workshop && code ./scripts/copilot_cli_1.sh'
echo -e "alias code_copilot_cli_1='type code_copilot_cli_1 && cd_workshop && code ./scripts/copilot_cli_1.sh'" >> ~/.bashrc
alias run_copilot_cli_1='type run_copilot_cli_1 && cd_workshop && ./scripts/copilot_cli_1.sh'
echo -e "alias run_copilot_cli_1='type run_copilot_cli_1 && cd_workshop && ./scripts/copilot_cli_1.sh'" >> ~/.bashrc
alias code_copilot_cli_2='type code_copilot_cli_2 && cd_workshop && code ./scripts/copilot_cli_2.sh'
echo -e "alias code_copilot_cli_2='type code_copilot_cli_2 && cd_workshop && code ./scripts/copilot_cli_2.sh'" >> ~/.bashrc
alias run_copilot_cli_2='type run_copilot_cli_2 && cd_workshop && ./scripts/copilot_cli_2.sh'
echo -e "alias run_copilot_cli_2='type run_copilot_cli_2 && cd_workshop && ./scripts/copilot_cli_2.sh'" >> ~/.bashrc
alias backend_npm_start='type backend_npm_start && cd_workshop && cd backend && npm start'
echo -e "alias backend_npm_start='type backend_npm_start && cd_workshop && cd backend && npm start'" >> ~/.bashrc
alias frontend_npm_start='type frontend_npm_start && cd_workshop && ./scripts/progress_stage1.sh && cd frontend && npm start'
echo -e "alias frontend_npm_start='type frontend_npm_start && cd_workshop && ./scripts/progress_stage1.sh && cd frontend && npm start'" >> ~/.bashrc
alias code_copilot_cli_3='type code_copilot_cli_3 && cd_workshop && code ./scripts/copilot_cli_3.sh'
echo -e "alias code_copilot_cli_3='type code_copilot_cli_3 && cd_workshop && code ./scripts/copilot_cli_3.sh'" >> ~/.bashrc
alias run_copilot_cli_3='type run_copilot_cli_3 && cd_workshop && ./scripts/copilot_cli_3.sh'
echo -e "alias run_copilot_cli_3='type run_copilot_cli_3 && cd_workshop && ./scripts/copilot_cli_3.sh'" >> ~/.bashrc
alias code_copilot_cli_4='type code_copilot_cli_4 && cd_workshop && code ./scripts/copilot_cli_4.sh'
echo -e "alias code_copilot_cli_4='type code_copilot_cli_4 && cd_workshop && code ./scripts/copilot_cli_4.sh'" >> ~/.bashrc
alias run_copilot_cli_4='type run_copilot_cli_4 && cd_workshop && ./scripts/copilot_cli_4.sh'
echo -e "alias run_copilot_cli_4='type run_copilot_cli_4 && cd_workshop && ./scripts/copilot_cli_4.sh'" >> ~/.bashrc
alias code_copilot_cli_5='type code_copilot_cli_5 && cd_workshop && code ./scripts/copilot_cli_5.sh'
echo -e "alias code_copilot_cli_5='type code_copilot_cli_5 && cd_workshop && code ./scripts/copilot_cli_5.sh'" >> ~/.bashrc
alias run_copilot_cli_5='type run_copilot_cli_5 && cd_workshop && ./scripts/progress_stage2.sh &&./scripts/copilot_cli_5.sh'
echo -e "alias run_copilot_cli_5='type run_copilot_cli_5 && cd_workshop && ./scripts/progress_stage2.sh &&./scripts/copilot_cli_5.sh'" >> ~/.bashrc

alias code_geoloc_test='type code_geoloc_test && cd_workshop && code ./backend/geolocation/test-logic.js'
echo -e "alias code_geoloc_test='type code_geoloc_test && cd_workshop && code ./backend/geolocation/test-logic.js'" >> ~/.bashrc
alias run_geoloc_test='type run_geoloc_test && cd_workshop && cd backend/geolocation && node test-logic.js'
echo -e "alias run_geoloc_test='type run_geoloc_test && cd_workshop && cd backend/geolocation && node test-logic.js'" >> ~/.bashrc

alias code_backend_geo_IP2Loc='type code_backend_geo_IP2Loc && cd_workshop && code ./backend/geolocation/IP2Location.js'
echo -e "alias code_backend_geo_IP2Loc='type code_backend_geo_IP2Loc && cd_workshop && code ./backend/geolocation/IP2Location.js'" >> ~/.bashrc
alias code_backend_controller='type code_backend_controller && cd_workshop && code ./backend/app/controllers/model.controller.js'
echo -e "alias code_backend_controller='type code_backend_controller && cd_workshop && code ./backend/app/controllers/model.controller.js'" >> ~/.bashrc
alias code_frontend_http-common='type code_backend_controller && cd_workshop && ./scripts/progress_stage4.sh && code ./frontend/src/http-common.js'
echo -e "alias code_frontend_http-common='type code_backend_controller && cd_workshop && ./scripts/progress_stage4.sh && code ./frontend/src/http-common.js'" >> ~/.bashrc
alias code_branch_push='type code_branch_push && cd_workshop && code ./scripts/git_branch_push.sh'
echo -e "alias code_branch_push='type code_branch_push && cd_workshop && code ./scripts/git_branch_push.sh'" >> ~/.bashrc
alias run_branch_push='type run_branch_push && cd_workshop && ./scripts/git_branch_push.sh'
echo -e "alias run_branch_push='type run_branch_push && cd_workshop && ./scripts/git_branch_push.sh'" >> ~/.bashrc
alias code_backend_routes='type code_backend_routes && cd_workshop && code ./backend/app/routes/model.routes.js'
echo -e "alias code_backend_routes='type code_backend_routes && cd_workshop && code ./backend/app/routes/model.routes.js'" >> ~/.bashrc
alias code_backend_tests='type code_backend_tests && cd_workshop && code ./backend/test/endpoint.test.js'
echo -e "alias code_backend_tests='type code_backend_tests && cd_workshop && code ./backend/test/endpoint.test.js'" >> ~/.bashrc
alias run_backend_tests='type run_backend_tests && cd_workshop && ./scripts/progress_stage5.sh && cd backend && npm test'
echo -e "alias run_backend_tests='type run_backend_tests && cd_workshop && ./scripts/progress_stage5.sh && cd backend && npm test'" >> ~/.bashrc
alias run_backend_tests_done='type run_backend_tests_done && cd_workshop && ./scripts/progress_stage6.sh && cd backend && npm test'
echo -e "alias run_backend_tests_done='type run_backend_tests_done && cd_workshop && ./scripts/progress_stage6.sh && cd backend && npm test'" >> ~/.bashrc

sed -i "s/shiny-acorn-v64jvpv96xwhp9g4-8080.app.github.dev/${CODESPACE_NAME}-8080.app.github.dev/g" ./frontend/src/http-common.js

echo "TOKENS"
#env | grep TOKEN
env | grep TOKEN >> ./scripts/start-env.txt

pwd >> ./scripts/start-env.txt
source ./scripts/progress_env.sh >> ./scripts/start-env.txt

source ./scripts/progress_setup.sh >> ./scripts/start-env.txt
