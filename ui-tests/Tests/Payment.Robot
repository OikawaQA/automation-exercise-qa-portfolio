*** Settings ***

Documentation   Payment Test Cases for Robot Framework tests.
Resource     ../Resources/Pages/Payment.Resource    
Test Setup    Open Browser to landing page



*** Test Cases ***

Scenario 1: Download Invoice After Purchase Order

    [Documentation]    Download the invoice after purchase order.

    Given I am on the Automation Exercise home page
    When Click On Add Product To Cart By ID    1
    And Click On View Cart
    Then Verify User Is Landed On View Cart Page
    When Click On Proceed To Checkout Button
    And Click On Register / Login Button
    And I Register A New User With Valid Credentials
    Then Verify That Account Created is visible
    When Click On Continue Button
    Then Verify That User Is Logged In Successfully    ${account}[Name]
    When Click On Cart Button
    And Click On Proceed To Checkout Button
    Then Verify Adress Details    ${account}[Name]    Toronto    Canada    
    When Fill Comment Text Area
    And Click On Place Order Button
    Then Verify Payment Page Loaded Successfully
    When Fill Payment Details        123456    333    08    2999
    And Click On Pay And Confirm Order Button
    Then Verify Order Placed Successfully
    When Click On Download Invoice Button
    Then Verify Invoice Is Downloaded Successfully