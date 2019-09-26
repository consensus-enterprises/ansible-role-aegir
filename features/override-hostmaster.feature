Feature: Override hostmaster
  In order to override hostmaster
  As an Aegir admin
  I need to be able to specify the version of hostmaster to install.

  @debug
  Scenario: Specify an alternate version of hostmaster
     When I run "make ansible-role-check tags=hostmaster_override"
     Then I should get:
     """
     PLAY [localhost]
     ok: [localhost]
     """

#   @debug
#   Scenario: Run Ansible test playbook test/test.yml against localhost
#      When I run "make ansible-role-test"
#      Then I should get:
#      """
#      Run the test playbook
#      ok: [localhost]
#      """
# 
#   @debug
#   Scenario: Test Ansible role target idempotence.
#      When I run "make ansible-role-test"
#      And I run "make ansible-role-test"
#      Then I should get:
#      """
#      ok: [localhost]
#      """
#      And I should not get:
#      """
#      changed: [localhost]
#      """
