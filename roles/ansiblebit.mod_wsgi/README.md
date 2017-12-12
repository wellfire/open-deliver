# mod_wsgi

[![License](https://img.shields.io/badge/license-New%20BSD-blue.svg?style=flat)](https://raw.githubusercontent.com/ansiblebit/mod_wsgi/master/LICENSE)
[![Build Status](https://travis-ci.org/ansiblebit/mod_wsgi.svg?branch=master)](https://travis-ci.org/ansiblebit/mod_wsgi)

[![Platform](http://img.shields.io/badge/platform-debian-a80030.svg?style=flat)](#)
[![Platform](http://img.shields.io/badge/platform-ubuntu-dd4814.svg?style=flat)](#)

[![Project Stats](https://www.openhub.net/p/ansiblebit-mod_wsgi/widgets/project_thin_badge.gif)](https://www.openhub.net/p/ansiblebit-mod_wsgi/)

[Ansible][ansible] role to install and setup [mod_wsgi][mod_wsgi].


## Tests

| Family | Distribution | Version | Test Status |
|:-:|:-:|:-:|:-:|
| Debian | Debian  | Wheezy  | [![x86](http://img.shields.io/badge/x86-n/a-cccccc.svg?style=flat)](#) [![x86_64](http://img.shields.io/badge/x86_64-n/a-cccccc.svg?style=flat)](#) |
| Debian | Debian  | Jessie  | [![x86](http://img.shields.io/badge/x86-n/a-cccccc.svg?style=flat)](#) [![x86_64](http://img.shields.io/badge/x86_64-n/a-cccccc.svg?style=flat)](#) |
| Debian | Ubuntu  | Yakkety | [![x86](http://img.shields.io/badge/x86-n/a-cccccc.svg?style=flat)](#) [![x86_64](http://img.shields.io/badge/x86_64-n/a-cccccc.svg?style=flat)](#) |
| Debian | Ubuntu  | Xenial  | [![x86](http://img.shields.io/badge/x86-n/a-cccccc.svg?style=flat)](#) [![x86_64](http://img.shields.io/badge/x86_64-n/a-cccccc.svg?style=flat)](#) |
| Debian | Ubuntu  | Trusty  | [![x86](http://img.shields.io/badge/x86-n/a-cccccc.svg?style=flat)](#) [![x86_64](http://img.shields.io/badge/x86_64-n/a-cccccc.svg?style=flat)](#) |
| Debian | Ubuntu  | Vivid   | [![x86](http://img.shields.io/badge/x86-n/a-cccccc.svg?style=flat)](#) [![x86_64](http://img.shields.io/badge/x86_64-n/a-cccccc.svg?style=flat)](#) |
| Debian | Ubuntu  | Precise | [![x86](http://img.shields.io/badge/x86-n/a-cccccc.svg?style=flat)](#) [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](#)  |


## Requirements

- ansible >= 2.0


## Role Variables

- **debug**: flag to run debug tasks.

- **mod_wsgi_scripts**: list of WSGI scripts to be setup.
- **mod_wsgi_dir_scripts**: directory where WSGI applications will reside.
- **mod_wsgi_installation**: the installation method: `build` or `package`.
- **mod_wsgi_use_httpd**: flag to indicate if [ansiblebit.httpd][ansiblebit.httpd] dependency is enabled.


### package

Variables specific to the `package` installation process.

- **mod_wsgi_version**: (optional) the [mod_wsgi][mod_wsgi] debian package version to be installed.


### build

Variables specific to the `build` installation process.

- **mod_wsgi_version**: the [mod_wsgi][mod_wsgi] version to be installed.


## Dependencies

- [ansiblebit.httpd][ansiblebit.httpd] (optional)


## Playbooks

    - hosts: servers

      roles:
         - role: ansiblebit.mod_wsgi


## Tags

- **configuration**: configuration tasks.
- **debug**: task to debug role variables.
- **installation**: installation tasks.
- **validation**: task to validate role variables.


## Test

To run the tests you will need to install:

- [tox](https://tox.readthedocs.org/)
- [vagrant](https://www.vagrantup.com/)

To run all tests against all pre-defined OS/distributions * ansible versions:

```
$ tox
```

To run tests for `trusty64`:

```
$ cd tests
$ bash test_idempotence.sh --box trusty64.vagrant.dev
# log file will be stores under tests/log
```

To perform debugging on a specific environment:

```
$ cd tests
$ vagrant up trusty64.vagrant.dev

# to provision using the test.yml playbook (as many time as you need)
$ vagrant provision trusty64.vagrant.dev

# to access the Vagrant box
$ vagrant ssh trusty64.vagrant.dev
```


## Links

- [mod_wsgi > User Guides > Quick Installation Guide](https://modwsgi.readthedocs.io/en/develop/user-guides/quick-installation-guide.html)


[ansible]:  https://ansible.com/    "Ansible"
[ansiblebit.httpd]: https://github.com/ansiblebit/httpd "ansiblebit.httpd"
[mod_wsgi]: https://modwsgi.readthedocs.io/en/develop/index.html    "mod_wsgi documentation"
