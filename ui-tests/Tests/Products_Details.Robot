*** Settings ***

Documentation   Product Detail Page test cases for Robot Framework tests.
Resource    ../Resources/Base.Resource
Test Setup    Open Browser To Landing Page

*** Test Cases ***

Scenario 1: Verify Product Quantity In Cart
    [Documentation]    Validate that the product quantity in the cart is correct.

    Given I am on the Automation Exercise home page
    When Click On View Product Button   1
    Then Verify User Is Landed On Product Details Page    1
    And Increase Product Quantity    2
    And Click On Add To Cart Button
    And Click On View Cart
    Then Verify Product Quantity In Cart By ID    1    2
    Take Screenshot 