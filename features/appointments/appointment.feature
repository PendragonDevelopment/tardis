Feature: CRUD Operations for appointment
	In order to book for an event
	As an attendee
	I want to create and modify appointmentssud

Scenario: Should be able to create a new appointment
	Given I have authorization
	When I create a new appointment
	Then the appointment should have an intial status of 
	And the appointment should have a schedule_block_id
	And the appointment should have an attendee_id

Scenario: Should be able to read an existing appointment
	Given There is an exisiting appointment
	When I read an appointment 
	Then the requested values should be returned

Scenario: Should be able to update an existing appointment
	Given There is an exisiting appointment
	When I update an appointment
	Then TheDoctor should be notified of the status
	And TheDoctor should be notified of the updated fields

Scenario: Should be able to delete a appointment
	Given There is an existing appointment
	When I delete a document
	Then TheDoctor should be notified of the changed status code
