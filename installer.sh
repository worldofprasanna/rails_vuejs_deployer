#!/usr/bin/env bash

if [[ ! -f config.ru ]] ; then
    echo 'It appears the current working directory is not a Rails application.'
    exit 1
fi

git clone https://github.com/worldofprasanna/rails_vuejs_deployer.git deployer && \

# Remove the installer file because it is not needed
rm ./deployer/installer.sh

# Remove deployer/.git folder to make the clone part of the Rails app itself
rm -rf ./deployer/.git && \

# Move the ansible.cfg file to rails app level
mv ./deployer/ansible.cfg .

# Add new tasks to Rakefile
cat <<EOT >> ./Rakefile

task :provision do
  sh "ansible-playbook -i ./deployer/hosts ./deployer/playbook.yml -u root"
end

task :deploy_api do
  sh "ansible-playbook -i ./deployer/hosts ./deployer/api.yml -u root"
end

task :deploy_ui do
  sh "ansible-playbook -i ./deployer/hosts ./deployer/ui.yml -u root"
end
EOT

# Credits goes to: https://github.com/bradymholt/ansible-rails