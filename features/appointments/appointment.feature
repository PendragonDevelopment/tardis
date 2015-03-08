Feature: CRUD Operations for appointment
	In order to book for an event
	As an attendee
	I want to create and modify appointmentssud

Scenario: Should be able to create a new appointment
	Given I have authorization
	When I create a new appointment
	Then the appointment should have a status of
	And the appointment should have a schedule_block_id
	And the appointment should have an attendee_id

Scenario: Should be able to read an existing appointment
	Given I have authorization
	When I read an existing appointment 
	Then the requested values should be returned

Scenario: Should be able to update an existing appointment
	Given I have authorization
	When I update an existing appointment
	Then TheDoctor should be notified of the status
	And TheDoctor should be notified of the updated fields

Scenario: Should be able to delete a appointment
	Given I have authorization
	When I delete an existing document
	Then TheDoctor should be notified of the changed status code