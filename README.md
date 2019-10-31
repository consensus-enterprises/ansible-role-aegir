# Ansible Role: Aegir

[![pipeline status](https://gitlab.com/consensus.enterprises/ansible-roles/ansible-role-aegir/badges/master/pipeline.svg)](https://gitlab.com/consensus.enterprises/ansible-roles/ansible-role-aegir/commits/master)

Installs the [Aegir](https://www.aegirproject.org/) hosting system, a control panel for deploying and managing large networks of Drupal sites.

## Requirements

Ubuntu bionic is the currently supported OS version. Debian (or any OS that
supports apt) should work, too.

A MySQL server is required. This server can be installed on the same machine,
or a separate one (hence why this isn't listed as a dependency). See
`aegir_mysql_*` variables, below.

A web server configured with PHP is required; Apache (the default) and Nginx
are currently supported (see `aegir_http_service_type` variable, below). Apt
package(s) for the selected server will be installed if not already present.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

    aegir_db_username: "{{ mysql_root_username }}"

The name of the Aegir database user. Defaults to the value of `mysql_root_username`.

    aegir_db_password: "{{ mysql_root_password }}"

The password for the Aegir database user. Defaults to the value of `mysql_root_password`.

## Role Tasks

This role provides various stand-alone task files in the tasks/ directory;
although these could be executed separately, the intention is to use this role
for end-to-end Aegir installation from scratch. See the [Aegir project
documentation](https://docs.aegirproject.org/) to learn more about everyday
Aegir operations.

## Dependencies

For installation from git:

  * See Requirements, above
  * See dependencies listed under the various *_dependencies vars in defaults/main.yml 

Additionally, for .deb installation:

  * apt
  * debconf

## Example Playbook

```
- hosts: servers

  vars:
    drush_install_from_source: True         # optional
    drush_source_install_version: "8.1.16"  # optional

  roles:
    - geerlingguy.mysql
    - consensus.aegir

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

[GNU AGPLv3](https://www.gnu.org/licenses/agpl-3.0.en.html)

## Author Information

This role was originally created in 2015 by [Christopher Gervais](http://ergonlogic.com/), lead maintainer of the [Aegir Hosting System](http://www.aegirproject.org).

It has also had input from [Dan Friedman](https://consensus.enterprises/team/dan/) and other folks at [Consensus Enterprises](https://consensus.enterprises).
