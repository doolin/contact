Feature: Send Dave an email
  In order to send Dave an email, the user has to fill in the forms, 
  and press the Send button.

  Scenario: Send Dave an email
    Given I'm on the message sending form page
    And I fill in "Name" with "Dave"
    And I fill in "Email" with "dave@foo.bar"
    And I fill in "Subject" with "Nothing"
    And I fill in "Message" with "not hardly"
    When I press "Send"
    Then I should be on Thank you


