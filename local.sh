#!/usr/bin/env bash

ansible-playbook -u ubuntu -i hosts/local packer.yml --ask-pass "${@:1}"
