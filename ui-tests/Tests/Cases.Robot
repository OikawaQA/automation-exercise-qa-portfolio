*** Settings ***

Documentation  Test Cases page Resource for Robot Framework tests.
Resource     ../Resources/Base.Resource
Test Setup    Open Browser To Landing Page



*** Test Cases ***


Scenario 1: Verify Test Cases Page Loaded Successfully
    [Documentation]    Validate that the "Test Cases" section is visible on the test cases page.
    
    Given I am on the Automation Exercise home page
    When Click on Test Cases Button
    Then Verify Test Cases Page Loaded Successfully
    