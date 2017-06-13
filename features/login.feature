Feature: Admin manages emails

  Background: Email list
    Given the following email_contacts exist:
      | Name | Email                  | Subject | Message |
      | Dave | david.doolin@gmail.com | foo     | bar     |
      | Mike | mikefoo@foogmail.com   | bar     | foo     |

  Scenario: Creating a new account
    Given I am not authenticated
    When I go to the admin's sign_in page
    Then I should see "Forgot your password?"


  Scenario: Admin logs on
    Given I am on the admin's sign_in page
    When I fill in "Email" with "foo@bar.com"
    And I fill in "Password" with "frobnosticate"
    When I press "Log in"
    Then I should land on the "Send me an email!" page

  # @delete
  Scenario: Admin deletes an email
    Given I am an authenticated admin
    And I am on the email contacts page
    When I click on the email "Delete" link
    Then the email is deleted

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
