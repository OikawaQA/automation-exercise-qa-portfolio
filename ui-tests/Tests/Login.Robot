*** Settings ***

Documentation     Login page test cases for Robot Framework tests.
Resource     ../Resources/Base.Resource
Test Setup    Open Browser To Landing Page



*** Test Cases ***

Scenario 1: Register New User and Delete New User
    [Documentation]    This test case registers a new user and then deletes the user.
    
    Given I am on the Automation Exercise Home Page
    And Click On Sign/Login Up Button  
    When I Register A New User with Valid Credentials
    Then I Verify Account Was Created Successfully
    When I Delete the Account
    Then I Verify Account Was Deleted



Scenario 2: Login with Valid Credentials
    [Documentation]    This test case logs in with valid credentials.
    
    Given I am on the Automation Exercise Home Page
    When Click On Sign/Login Up Button
    Then Verify Login Form Title is Visible
    When Fill Login Form    ${Admin_Email}    ${Admin_Password}
    And Click On Login Button
    Then Verify That User Is Logged In Successfully    ${Admin_Email} 



Scenario 3: Login with Invalid Credentials
    [Documentation]    This test case attempts to log in with invalid credentials.
    
    Given I am on the Automation Exercise Home Page
    When Click On Sign/Login Up Button
    Then Verify Login Form Title is Visible
    When Login User With Invalid Credentials
    And Click On Login Button
    Then Verify That Error Message Is Displayed For Invalid Credentials    Your email or password is incorrect!    



Scenario 4: Logout User
    [Documentation]    This test case logs in with valid credentials and then logs out.
    
    Given I am on the Automation Exercise Home Page
    When Click On Sign/Login Up Button
    Then Verify Login Form Title is Visible
    When Fill Login Form    ${Admin_Email}    ${Admin_Password}
    And Click On Login Button
    Then Verify That User Is Logged In Successfully    ${Admin_Email} 
    When Click On Logout Button
    Then Verify That User Is Navigated To Login Page


Scenario 5: Register User With Existing Email
    [Documentation]    This test case attempts to register a user with an existing email.
    
    Given I am on the Automation Exercise Home Page
    When Click On Sign/Login Up Button
    Then Verify Form Signup Form Title is Visible
    When Fill Signup Form    ${Admin_Email}    ${Admin_Email}
    And Click On Signup Button
    Then Verify That Error Message Is Displayed For Invalid Credentials    Email Address already exist!
