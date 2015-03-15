Feature: CRUD operations for ScheduleBlock
  As a leader
  I want to create and modify schedule blocks
  So I can manage appointments

  Scenario: ScheduleBlock cannot be created without an AuthorizedApplication
    Given I do not have an authorized application
    When I create a new ScheduleBlock
    Then I see a 'no authorized application' error message

  Scenario: Attempt to create a schedule block without being logged in  
    Given I am not logged in
    When I create a valid ScheduleBlock
    Then I see a 'you must be logged in' error message

  Scenario:  Schedule block is created when logged in
    Given I am logged in
    When I create a valid ScheduleBlock
    Then I see a 'schedule block successfully created' message
    And The schedule block has a schedule_block_id

	Scenario: Read an existing ScheduleBlock
		Given I am logged in
		And I have appropriate authorization
		When I read an existing ScheduleBlock 
		Then the requested values should be returned

	Scenario: Update an existing appointment
		Given I am logged in
		And I have appropriate authorization
		When I update an existing ScheduleBlock
		Then it should return the updated values
		And TheDoctor should be notified of the status
		And TheDoctor should be notified of the updated values

	Scenario: Delete a appointment
		Given I am logged in
		And I have appropriate authorization
		When I delete an existing ScheduleBlock
		Then TheDoctor should be notified of the changed status code
		And all attached appointments should also be deleted