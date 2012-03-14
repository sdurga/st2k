Feature: Worklog features

  Scenario: Log an entry
    Given That I am logged in 
    And I visit the worklogs page
    Then I should be able to create and save new worklogs
  
  Scenario: Check last worklog created by a user
    Given I am logged in
    And I create and save a new worklog
    Then The last worklog listed should be my me
