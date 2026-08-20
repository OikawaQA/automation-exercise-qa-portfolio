*** Settings ***

Documentation  Products page Resource for Robot Framework tests.
Resource     ../Resources/Base.Resource
Test Setup    Open Browser To Landing Page



*** Test Cases ***


Scenario 1: Verify All Products And Product Details Page
    [Documentation]    Validate that the "All Products" section is visible on the products page and that product details can be accessed.

    Given I am on the Automation Exercise home page
    When Click on Products Button
    Then Verify Products Page Loaded Successfully
    And Verify Product List Is Visible
    When Click On View Product Button    1
    Then Verify User Is Landed On Product Details Page    1
    When Verify Product Details Are Visible    Blue Top    Women > Tops    Rs. 500    In Stock    New    Polo
  

Scenario 2: Verify Searched Products And Product Details Page
    [Documentation]    Validate that the searched product is visible on the products page and that product details can be accessed.

    Given I am on the Automation Exercise home page
    When Click on Products Button
    Then Verify Products Page Loaded Successfully
    And Verify Product List Is Visible
    When Search For Product    Blue Top
    Then Verify Searched Product Title Is Visible
    And Verify Searched Product Is Visible    Blue Top 



Scenario 3: Search Products And Verify Cart After Login
    [Documentation]    Validate that the searched product is visible on the products page and that product details can be accessed.

    Given I am on the Automation Exercise home page
    When Click on Products Button
    Then Verify Products Page Loaded Successfully
    When Search For Product    Blue Top
    And Verify Searched Product Title Is Visible
    Then Verify Searched Product Is Visible    Blue Top  
    When Click On Add Product To Cart By ID    1  
    And Click On View Cart
    Then Verify User Is Landed On View Cart Page
    When Login User With Valid Credentials
    Then Verify That User Is Logged In Successfully    ${Admin_Email}
    When Click On Cart Button
    Then Verify Product In Cart    1    Blue Top




Scenario 4: Add Review On Product
    [Documentation]    Validate that the user can add a review on a product.

    Given I am on the Automation Exercise home page
    When Click on Products Button
    Then Verify Products Page Loaded Successfully
    And Verify Product List Is Visible
    When Click On View Product Button    1
    Then Verify User Is Landed On Product Details Page    1
    When Fill Review Form
    And Click On Submit Review Button
    Then Verify Review Submission Success Message Is Visible