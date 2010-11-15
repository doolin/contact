Feature: Send Dave an email
  In order to send Dave an email, the user has to fill in the forms, 
  and press the Send button.

  Scenario: Send Dave an email
    Given there's a message sending form
    When the user sends a message
    Then I should get email

