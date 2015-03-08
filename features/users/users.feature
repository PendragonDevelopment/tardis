Feature: Sign in
  As a user
  I want to sign in
  So I can visit protected areas of the site

  Scenario: User cannot sign in if not registered
    Given I do not exist as a user
    When I sign in with valid credentials
    Then I see an invalid credentials message