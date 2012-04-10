Feature: Worklog features

  Scenario: Log an entry
    Given That I am logged in 
    And I visit the worklogs page
    Then I should see only my worklogs
    And I should be able to create and save new worklogs
  
  Scenario: Worklogs cannot be saved without an associated User
    Given That I am logged in
    And I create a new worklog
    Then The last worklog in the database should be saved by me

