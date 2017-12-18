==================================
Open Deliver: Platform & Packaging
==================================

A packaged combination of ORB, Oppia, and Moodle.

Overview
========

This project uses `Ansible<https://docs.ansible.com/>`_ playbooks to build and
provision either a `Vagrant<https://www.vagrantup.com/>`_ based
`VirtualBox<https://www.virtualbox.org/>`_ virtual machine or 'plain' VirtualBox
VMs using `Packer<https://www.packer.io/>`_.

Vagrant boxes are suitable for development and debugging, and this is included
as the primary means for working on Open Deliver configuration changes.

Installation
------------

Building local instances of any VM requires the following installed:

- VirtualBox
- Ansible

Packer is required for building VM artifacts and Vagrant is required for
building and provisioning Vagrant boxes.

Building
--------

To run with Vagrant, use the Vagrant command::

    vagrant up

On the first run this will provision the machine using the provided Ansible
playbooks. On subsequent runs you may want to start it up with the `--provision`
flag to ensure that the machine is provisioned with any configuration changes.
The `provision` command can always be run for running containers::

    vagrant provision

To build a VirtualBox for export use Packer::

    packer build packer.json

This will create a new `ovf` file in the `builds/` directory.

Configuration
=============

Roles
-----


Vagrant
=======


Packaging
=========
