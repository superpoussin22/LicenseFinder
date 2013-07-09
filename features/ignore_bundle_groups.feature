Feature: Ignore Bundle Groups
  As a developer
  I want to ignore certain bundler groups
  So that any gems I use in development, or for testing, are automatically approved for use

  Scenario: Ignored bundler groups are not evaluated for licenses
    Given I have an app with license finder that depends on a GPL licensed gem in the test bundler group
    And I add the test group to the ignored bundler groups
    When I run license_finder
    Then I should not see the GPL licensed gem in the output

  Scenario: Bundler groups can be added to the ignore list from command line
    Given I have an app with license finder
    And I add the test group to the ignored bundler groups
    When I get the ignored groups from the command line
    Then I should see the test group in the output
