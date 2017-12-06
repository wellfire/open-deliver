#!/bin/sh

# Python MUST be present on the guest machine for Ansible to use remotely

set -e
set -x

sudo apt-get update
sudo apt-get install python -y
