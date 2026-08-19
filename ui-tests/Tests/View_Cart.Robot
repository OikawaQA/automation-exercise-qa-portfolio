*** Settings ***

Documentation  View Cart Test Cases for Robot Framework tests.
Resource     ../Resources/Pages/View_Cart.Resource    
Test Setup    Open Browser to landing page


*** Test Cases ***

Scenario 1: Verify Adress Details In Checkout Page
    [Documentation]    Validate that the address details are correct in the checkout page.

    Given I am on the Automation Exercise home page
    When Click On Sign/Login Up Button
    And I Register A New User With Valid Credentials
    Then Verify That Account Created is visible
    When Click On Continue Button
    And Click On Add Product To Cart By ID    1
    And Click On View Cart
    Then Verify User Is Landed On View Cart Page
    When Click On Proceed To Checkout Button
    Then Verify Adress Details    ${account}[Name]    Toronto    Canada    
    When Click On Delete Account Button
    Then I Verify Account Was Deleted