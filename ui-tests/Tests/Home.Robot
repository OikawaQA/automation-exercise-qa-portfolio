*** Settings ***

Documentation     Home page test cases for Robot Framework tests.
Resource     ../Resources/Base.Resource
Suite Setup    Open Browser To Landing Page


*** Test Cases ***


Scenario 1: Verify Subscription in Home Page
    [Documentation]    Validate that the subscription section is visible on the home page, and subscription functionality works as expected.

    Given I am on the Automation Exercise home page
    Then Verify Subscription Section Is Visible
    When Fill Subscription Email     ${Admin_Email}
    And Click On Subscribe Button
    Then Verify That User Is Subscribed Successfully



Scenario 2: Verify Recommended Items in Home Page
    [Documentation]    Validate that the "Recommended Items" section is visible on the home page, and recommended items can be added to the cart.

    Given I am on the Automation Exercise home page
    Then Verify Recommended Items Section Is Visible
    When Click On Add Product To Cart By ID Home Page    1
    And Click On View Cart
    Then Verify Product In Cart    1    Blue Top