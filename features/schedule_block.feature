Feature: user creates a schedule block

	As a user
	I want to create a schedule block
	so that people can sign up for my event

	Scenario: user makes a schedule block
		Given I am a signed in user
		And I have no existing schedule blocks
		When I make a new schedule block
		Then I should have 1 schedule block

