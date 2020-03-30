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

# Initial the config file using the template
mv deployer/config.yml.example deployer/config.yml

# Add deployer/config.yml to .gitignore
echo "deployer/config.yml" >> .gitignore

# Add new tasks to Rakefile
cat <<EOT >> ./Rakefile

task :provision do
  sh "ansible-playbook -i ./deployer/hosts ./deployer/playbook.yml"
end

task :deploy-api do
  sh "ansible-playbook -i ./deployer/hosts ./deployer/api.yml
end

task :deploy-ui do
  sh "ansible-playbook -i ./deployer/hosts ./deployer/ui.yml
end
EOT

# Credits goes to: https://github.com/bradymholt/ansible-rails