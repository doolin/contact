Feature: Admin manages emails

  Scenario: Admin logs on
    Given I am on the users sign_in page
    And I fill in "Name" with "Admin"
    And I fill in the "Password" with "frobnosticate"
    When I press "Login" 
    Then I should be on the email list page
    And I should see delete links

  Scenario: Admin deletes an email
    Given I open the email list page
    And I click on a email delete link
    Then the email is deleted 

  Scenario: User not logged should not see email list
    Given not logged in user on any page
    Then the "list" link should not be displayed
    And the user should be routed to index page

  @v0.2
  Scenario: Admin resends email
    Given I open the email
    And I click on the resend link
    Then the email is resent

  @v0.2
  Scenario: Admin forwards email
    Given I open the email
    And I click on the forward link
    And I fill in the forwarding email address
    Then the email is forwarded
  
