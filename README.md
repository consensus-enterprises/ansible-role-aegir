# Ansible Role: Aegir

[![pipeline status](https://gitlab.com/consensus.enterprises/ansible-roles/ansible-role-aegir/badges/master/pipeline.svg)](https://gitlab.com/consensus.enterprises/ansible-roles/ansible-role-aegir/commits/master)

Installs Aegir, a control panel for deploying and managing large networks of Drupal sites.

## Requirements

A MySQL server is required. This server can be installed on the same machine,
or a separate one (hence why this isn't listed as a dependency.) See the
'Example Playbook' section below for a simple method of installing a mysql
server with Ansible. If this role is not present, then the
`mysql_root_username`and `mysql_root_password` variables must be set.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

    aegir_db_username: "{{ mysql_root_username }}"

The name of the Aegir database user. Defaults to the value of mysql_root_username.

    aegir_db_password: "{{ mysql_root_password }}"

The password for the Aegir database user. Defaults to the value of mysql_root_password.

## Role Tasks

This role provides some stand-alone tasks to:

* Generate and print a one-time login link for the installed Aegir system;
* Override the Drush Binary with an alternative from the source repo.

See the Example Playbook, below.

## Dependencies

- ergonlogic.drush (Installs Drush).

## Example Playbook

```
- hosts: servers

  vars:
    drush_install_from_source: True         # optional
    drush_source_install_version: "8.1.16"  # optional

  roles:
    - geerlingguy.mysql
    - consensus.aegir
    - geerlingguy.drush  #optional

  tasks: 

    # optional
    - name: Generate and print a one-time login link after Aegir installation.
      include_role:
        name: consensus.aegir
        tasks_from: login_link.yml

    # optional
    - name: Replace package-installed Drush with the executable from the source repo.
      include_role:
        name: consensus.aegir
        tasks_from: override_drush.yml
```

After the playbook runs, the Aegir front-end site will be available, as will
the Drush extensions (Provision, et. al.) that do the heavy lifting.

## License

MIT / BSD

## Author Information

This role was created in 2015 by [Christopher Gervais](http://ergonlogic.com/), lead maintainer of the [Aegir Hosting System](http://www.aegirproject.org).
