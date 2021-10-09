# Ansible Role: Aegir

[![pipeline status](https://gitlab.com/consensus.enterprises/ansible-roles/ansible-role-aegir/badges/master/pipeline.svg)](https://gitlab.com/consensus.enterprises/ansible-roles/ansible-role-aegir/commits/master)

Installs the [Aegir](https://www.aegirproject.org/) hosting system, a control panel for deploying and managing large networks of Drupal sites.

## Requirements

Ubuntu Bionic (18.04) is the currently supported OS version. Debian (or any OS that
supports apt) should work, too, but YMMV.

A MySQL server is required. This server can be installed on the same machine,
or a separate one (hence why this isn't listed as a dependency). See below for
[an example](#example-playbook) of how to install MySQL using the
[consensus.mysql](https://github.com/consensus-enterprises/ansible-role-mysql) role.
For details on configuring this role to talk to local or remote MySQL servers,
see the `aegir_mysql_*` [role
variables](https://gitlab.com/consensus.enterprises/ansible-roles/ansible-role-aegir/blob/master/defaults/main.yml).

For further details regarding installation of Aegir, see the relevant [Aegir documentation](https://docs.aegirproject.org/install/#system-requirements).

## Role Variables

The default Debian package install should suffice in the majority of cases.
However, this role allows for extensive customization of all aspects of the
Aegir install process via role variables. For more details, see
[`defaults/main.yml`](https://gitlab.com/consensus.enterprises/ansible-roles/ansible-role-aegir/blob/master/defaults/main.yml) and [`vars/main.yml`](https://gitlab.com/consensus.enterprises/ansible-roles/ansible-role-aegir/blob/master/vars/main.yml).

## Example Playbook

```
---
- name: "Default Aegir install via Debian package."
  hosts: all

  roles:
    - consensus.mysql
    - consensus.aegir

  tasks: 

    # optional
    - name: Generate and print a one-time login link after Aegir installation.
      include_role:
        name: consensus.aegir
        tasks_from: login_link.yml
```

After the playbook runs, the Aegir front-end site will be available, as will
the Drush extensions (Provision, et. al.) that do the heavy lifting.

See [the various included test playbooks](https://gitlab.com/consensus.enterprises/ansible-roles/ansible-role-aegir/tree/master/tests) for examples of other ways this role can be configured:

* [deb-nginx.yml](https://gitlab.com/consensus.enterprises/ansible-roles/ansible-role-aegir/blob/master/tests/deb-nginx.yml): Aegir Debian package build with Nginx.
* [git-deploy.yml](https://gitlab.com/consensus.enterprises/ansible-roles/ansible-role-aegir/blob/master/tests/git-deploy.yml): End-to-end Aegir build from git source.
* [custom-deploy.yml](https://gitlab.com/consensus.enterprises/ansible-roles/ansible-role-aegir/blob/master/tests/custom-deploy.yml): End-to-end Aegir build from source, with custom git repos and versions (for Drush, Provision, etc.)

## License

[GNU AGPLv3](https://www.gnu.org/licenses/agpl-3.0.en.html)

## Author Information

This role was originally created in 2015 by [Christopher Gervais](https://consensus.enterprises/team/christopher/), lead maintainer of the [Aegir Hosting System](http://www.aegirproject.org).

It has also had input from [Dan Friedman](https://consensus.enterprises/team/dan/) and other folks at [Consensus Enterprises](https://consensus.enterprises). To contact us, please use our [Web contact form](https://consensus.enterprises/#contact).
