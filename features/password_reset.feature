Feature: Password reset
  As a registered user of Datong
  When I forget my password
  I want to be able to recover it


Scenario: seeing the password recovery option
  Given I am on the home page
  And I follow Sign In
  Then I should see Forgot your password?

Scenario: Recovering a password with an existing email account
  Given I have an account for datongtest@datong.berkeley.edu
  And I am on the sign in page
  Given I follow Forgot your password?
  And I fill in "Email" with "datongtest@datong.berkeley.edu"
  And I press "Send me reset password instructions"
  Then I should see We've emailed you your password
  Given I reset my password to newpassword
  When I am on the sign in page
  And I fill in "Email" with "datongtest@datong.berkeley.edu"
  And I fill in "Password" with "newpassword"
  Then I should see Signed in Successfully

Scenario: Recovering a password with a non existing email account
  Given I am on the sign in page
  And I follow Forgot your password?
  And I fill in "Email" with "random@email.com"
  And I press "Send me reset password instructions"
  Then I should see Email not found
  And I should not see 1 error prohibited this user from being saved



