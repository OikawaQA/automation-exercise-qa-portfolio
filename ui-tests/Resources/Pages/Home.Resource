*** Settings ***

Documentation     Home page test cases for Robot Framework tests.
Resource    ../Base.Resource

*** Keywords ***

Verify Home Page Loaded Successfully
    [Documentation]    Verify that the home page is loaded successfully.
    [Tags]    smoke
    [Arguments]    ${expected_title}
    Get Title   ==    ${expected_title}



I Am On The Automation Exercise Home Page
    [Documentation]    Navigate to the Automation Exercise home page.
    
     Verify Home Page Loaded Successfully    Automation Exercise 


Verify Recommended Items Section Is Visible
    [Documentation]    Verify that the "Recommended Items" section is visible on the home page.
    [Tags]    smoke
    
    Get Text   css=h2.title.text-center >> text="recommended items"


Click On Add Product To Cart By ID Home Page
    [Documentation]    Click the "Add to cart" button on the home page.
    [Arguments]    ${product_id}
    
    Click    css=#recommended-item-carousel a[data-product-id="${product_id}"] 
  


  