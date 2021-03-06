# deployer

[![standard-readme compliant](https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> Ansible Scripts to setup environment for Rails, Vuejs app and to serve both using nginx

This deployer uses Ansible and Capistrano to do deployment.

Ansible is used to setup the virtual machine with the necessary tools and Capistrano deploys the rails application.

## Table of Contents

- [deployer](#deployer)
  - [Table of Contents](#table-of-contents)
  - [Install the necessary dependencies in your local machine](#install-the-necessary-dependencies-in-your-local-machine)
  - [Usage](#usage)
  - [Maintainers](#maintainers)
  - [Contributing](#contributing)
  - [License](#license)
  - [TODO](#todo)

## Install the necessary dependencies in your local machine

1. Install ansible, ansible-galaxy
2. Install the dependent roles using,
`ansible-galaxy install -r requirements.yml`
3. Update the ip address of the [web, db, ui] machine in `hosts` file

## Usage
Note: all this has to be done from the rails repository

1. Use the installer script, to clone this repo into the rails app repo.
`cd <rails-app>; curl -sSl https://raw.githubusercontent.com/worldofprasanna/rails_vuejs_deployer/master/installer.sh | bash`
2. Modify the `vars/main.yml` with the necessary values for secrets. Note: This will use [ansible-vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html)
3. Make sure you can ssh into the host machine as root. For that you can add your `id_rsa.pub` key to the host machine's `/root/.ssh/authorised_keys` file.
4. To provision the new machine,
`rails provision`
5. To deploy the rails app,
`rails deploy-api`
6. To deploy the ui,
`rails deploy-ui`

## Maintainers

[@worldofprasanna](https://github.com/worldofprasanna)

## Contributing

PRs accepted.

Small note: If editing the README, please conform to the [standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

MIT © 2020 Prasanna V

## TODO

1. Don't provision the machine as root user. Create dedicated user with the corresponding permission.
2. Postgresql is failing for the first time.