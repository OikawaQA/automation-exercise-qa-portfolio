*** Settings ***

Documentation   Category products page test file for Robot Framework tests.
Resource    ../Resources/Base.Resource
Test Setup    Open Browser To Landing Page



*** Test Cases ***

Scenario 1: View Category Products
    [Documentation]    Verify that the "Category Products" section is visible on the category products page.
    
    Given I am on the Automation Exercise home page
    When Click On Women Category
    And Click On Dress Subcategory
    Then Verify Category    Women - Dress Products 
    When Click On Men Category
    And Click On T-Shirts Subcategory
    Then Verify Category    MEN - TSHIRTS PRODUCTS
    Take Screenshot



Scenario 2: View Brand Products
    [Documentation]    Verify that the "Brand Products" section is visible on the brand products page.
    
    Given I am on the Automation Exercise home page
    When Click On Products Button
    Then Verify Brands Section Is Visible
    When Click On Polo Brand
    Then Verify Brand    Polo Products 
    When Click On H&M Brand
    Then Verify Brand    Brand - H&M Products
    Take Screenshot