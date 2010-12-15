Feature: Admin manages emails

  Scenario: Admin logs on
    Given I am on login
    And I fill in "Name" with "Admin"
    And I fill in the "Password" with "frobnosticate"
    When I press "Login" 
    Then I should be on the email list page
    And I should see delete links

  Scenario: Admin deletes an email
    Given I open the email list page
    And I click on a email delete link
    Then the email is deleted 

  Scenario: Admin resends email
    Given I open the email
    And I click on the resend link
    Then the email is resent

  Scenario: Admin forwards email
    Given I open the email
    And I click on the forward link
    And I fill in the forwarding email address
    Then the email is forwarded
  
  
