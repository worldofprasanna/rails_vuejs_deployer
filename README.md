# deployer

[![standard-readme compliant](https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> Ansible Scripts to setup environment for Rails, Vuejs app and to serve both using nginx

This deployer uses Ansible and Capistrano to do deployment.

Ansible is used to setup the virtual machine with the necessary tools and Capistrano deploys the rails application.

## Table of Contents

- [deployer](#deployer)
  - [Table of Contents](#table-of-contents)
  - [Install](#install)
  - [Usage](#usage)
  - [Maintainers](#maintainers)
  - [Contributing](#contributing)
  - [License](#license)

## Install

1. Install ansible, ansible-galaxy
2. Install the dependent roles using,
`ansible-galaxy install -r requirements.yml`
3. Update the ip address of the machine in `hosts` file

## Usage

1. To setup a new machine,
`ansible-playbook -i ./hosts playbook.yml -u root`
This will install ruby, postgres and setup the shared files used by capistrano

2. To update the configuration for the api alone (changing the env variable, etc),
`ansible-playbook -i ./hosts api.yml -u root`

3. To deploy the rails app (using capistrano). change directory to the rails app,
`bundle exec cap production deploy`

## Maintainers

[@worldofprasanna](https://github.com/worldofprasanna)

## Contributing

PRs accepted.

Small note: If editing the README, please conform to the [standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

MIT © 2020 Prasanna V
