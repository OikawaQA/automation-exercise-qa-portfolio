*** Settings ***

Documentation  Checkout page test cases for Robot Framework tests.
Resource    ../Resources/Base.Resource
Test Setup    Open Browser To Landing Page

*** Test Cases ***

Scenario 1: Place Order Register While Checkout
    [Documentation]    Validate that the "Proceed to checkout" button is functional.

    Given I am on the Automation Exercise home page
    When Click On Add Product To Cart By ID    1
    And Click On View Cart
    Then Verify User Is Landed On View Cart Page
    When Click On Proceed To Checkout Button
    And Click On Register / Login Button
    When I register a new user with valid credentials
    Then I verify account was created successfully
    And Verify That User Is Logged In Successfully    ${account}[Name]
    When Click On Cart Button
    Then Verify User Is Landed On View Cart Page
    When Click On Proceed To Checkout Button
    Then Verify Adress Details    ${account}[Name]    Toronto    Canada    
    When Fill Comment Text Area
    And Click On Place Order Button
    Then Verify Payment Page Loaded Successfully
    When Fill Payment Details        123456    333    08    2999
    And Click On Pay And Confirm Order Button
    Then Verify Order Placed Successfully
    When Click On Delete Account Button
    Then I Verify Account Was Deleted


Scenario 2: Place Order Register Before Checkout
    [Documentation]    Validate that the "Proceed to checkout" button is functional.

    Given I am on the Automation Exercise home page
    When Click On Sign/Login Up Button
    And I register a new user with valid credentials
    Then I verify account was created successfully
    And Verify That User Is Logged In Successfully    ${account}[Name]
    When Click On Add Product To Cart By ID    1
    And Click On View Cart
    Then Verify User Is Landed On View Cart Page
    When Click On Proceed To Checkout Button
    Then Verify Adress Details    ${account}[Name]    Toronto    Canada    
    When Fill Comment Text Area
    And Click On Place Order Button
    Then Verify Payment Page Loaded Successfully
    When Fill Payment Details        123456    333    08    2999
    And Click On Pay And Confirm Order Button
    Then Verify Order Placed Successfully
    When Click On Delete Account Button
    Then I Verify Account Was Deleted


Scenario 3: Place Order Login Before Checkout
    [Documentation]    Validate that the "Proceed to checkout" button is functional.

    Given I am on the Automation Exercise home page
    When Click On Sign/Login Up Button
    And Fill Login Form    ${Admin_Email}    ${Admin_Password}
    And Click On Login Button
    Then Verify That User Is Logged In Successfully    ${Admin_Email}
    When Click On Add Product To Cart By ID    1
    And Click On View Cart
    Then Verify User Is Landed On View Cart Page
    When Click On Proceed To Checkout Button
    Then Verify Adress Details    Mr. aa a    a a a   India
    When Fill Comment Text Area
    And Click On Place Order Button
    Then Verify Payment Page Loaded Successfully
    When Fill Payment Details        123456    333    08    2999
    And Click On Pay And Confirm Order Button
    Then Verify Order Placed Successfully
    # When Click On Delete Account Button
    # Then I Verify Account Was Deleted

