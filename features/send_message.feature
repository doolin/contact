Feature: Send Dave an email
  In order to send Dave an email, the user has to fill in the forms, 
  and press the Send button.

  Scenario: Send Dave an email
    Given there's a message sending form web page
    And I fill in the "Name" field
    And I fill in the "Email Address" field
    And I fill in the "Subject" field
    And I fill in the "Message" field
    When I press "Send"
    Then Dave should get my email
    And I should see the "About" page


