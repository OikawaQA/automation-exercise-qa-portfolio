*** Settings ***

Documentation  Cart page Resource for Robot Framework tests.
Resource      ../Resources/Base.Resource
Test Setup    Open Browser To Landing Page


*** Test Cases ***

Scenario 1: Verify Subscription In Cart Page
    [Documentation]    Verify that the subscription section is visible on the cart page, and subscription functionality works as expected.

    Given I am on the Automation ExercisE home page
    And Click On Cart Button
    Then Verify Subscription Section Is Visible
    When Fill Subscription Email     ${Admin_Email}
    And Click On Subscribe Button
    Then Verify That User Is Subscribed Successfully
    Take Screenshot


Scenario 2: Add Product To Cart
    [Documentation]   Verify that a product can be added to the cart. 

    Given I am on the Automation Exercise home page
    When Click On Products Button
    Then Verify Products Page Loaded Successfully
    When Click On Add Product To Cart By ID    1
    And Click On Continue Shopping
    And Click On Add Product To Cart By ID    2
    And Click On View Cart
    Then Verify Products Are Added To Cart    1    2
    Take Screenshot


Scenario 3: Remove Product From Cart
    [Documentation]    Verify that a product can be removed from the cart.

    Given I am on the Automation Exercise home page
    When Click On Add Product To Cart By ID    1
    And Click On View Cart
    Then Verify User Is Landed On View Cart Page
    When Click On Remove Product From Cart By ID    1
    Then Verify Product Is Removed From Cart     
