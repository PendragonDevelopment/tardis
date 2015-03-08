Feature: Create Schedule Block
  As a user
  I want to create a schedule block
  So I can accept appointments

  Scenario: ScheduleBlock cannot be created without an AuthorizedApplication
    Given I do not have an authorized application
    When I create a new schedule block
    Then I see an no authorized application error message