==================================
Open Deliver: Platform & Packaging
==================================

A packaged combination of ORB, Oppia, and Moodle for delivering training content
to frontline health workers.

    Open Deliver streamlines digital training by reconfiguring and integrating
    existing technologies. These technologies consist of a digital content sharing
    library, a learning management system (LMS), and a mobile application (app).
    mPowering typically uses ORB as the content sharing library, Moodle for the LMS
    and OppiaMobile as the Android based application.

For more information see http://mpoweringhealth.org/resources/open-deliver/

Overview
========

This project uses `Ansible <https://docs.ansible.com/>`_ playbooks to build and
provision either a `Vagrant <https://www.vagrantup.com/>`_ based
`VirtualBox <https://www.virtualbox.org/>`_ virtual machine or 'plain' VirtualBox
VMs using `Packer <https://www.packer.io/>`_.

Vagrant boxes are suitable for development and debugging, and this is included
as the primary means for working on Open Deliver configuration changes.

Installation
------------

Building local instances of any VM requires the following installed:

- VirtualBox
- Ansible

Packer is required for building VM artifacts and Vagrant is required for
building and provisioning Vagrant boxes.

You will need to create a directory in your project which is where local configuration goes:

    vars/local/

This should include valid Ansible YAML variables (JSON works as well).

This directory is excluded from source control. You may opt to source control your own local
configuration and then symlink to this location.

Building
--------

Add the base box::

    vagrant box add https://app.vagrantup.com/ubuntu/boxes/xenial32

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

The builds, Vagrant and Packer, respectively, use shell scripting to bootstrap
the configuration process (namely updating packages and installing Python on the
image for use by Ansible) and then use Ansible playbooks for managing the
detailded service and content configurations.

Roles
-----

Non-proprietary roles have been sources from `Ansible Galaxy
<https://galaxy.ansible.com/>`_ where possible.

Variables
---------

Variables used in the top-level variables folder are used to satisfy predefined
variable names in existing roles, e.g. Apache.

Default provided variables, such as host names, can be overridden on a build-by-build
basis using locally provided, non-source controlled variable files placed in the `vars/local`
folder.

Add one or more YAML files and when provisioning the `common` role will read values
from these files and update default variables.

For example, the `vars/local/orb.yaml` file might look like this::

    ---
    orb_allowed_hosts:
      - "health-platform.org"
      - "www.health-platform.org"

This would populate the `ALLOWED_HOSTS` values in the ORB settings file like so::

    ALLOWED_HOSTS = [
          "health-platform.org",
          "www.health-platform.org",
        ]

Key settings to override include host/server names and database credentials.

*NOTE*: this path is intentionally excluded from source control. If you have values here
you want to track you can initialize a separate Git repo at `vars/local` or symlink a
repository with the appropriate YAML files at the top level.

HTTPS sites
-----------

In order to set up HTTPS vhosts on Apache, valid certificates are required. These can
be setup using Let's Encrypt provided the chosen domains are public domains (e.g. not
localhost domains) and that the instance of the virtual machine is available over the
public Internet. This ensures that the Let's Encrypt certificate authority can verify
the installation.

The configuration system provides *base* HTTPS vhost files which should be found in the
`sites-available` Apache folder. In order to enable HTTPS these should first be *copied*
to a new file so that further edits are not overwritten, then these can be symlinked
from the `sites-enabled` directory, and finally the Let's Encrypt toolset can be used
to create new certificates.

Vagrant
=======


Packaging
=========

