*** Settings ***

Documentation     Contact page test cases for Robot Framework tests.
Resource     ../Resources/Base.Resource
Test Setup     Open Browser To Landing Page



*** Test Cases ***

Scenario 1: Contact Form Submission
    [Documentation]    Test the contact form submission functionality.
    
    Given I am on the Automation Exercise home page
    When Click on Contact Us Button
    Then Verify Get In Touch is Visible
    When Fill Contact Form
    And Upload File
    Pause Execution
    Then Verify Success Message Is Visible
   