*** Settings ***

Documentation  Left sidebar resource file for Robot Framework tests.
Resource     ../Base.Resource


*** Keywords ***

Verify Categories Section Is Visible
    [Documentation]    Verify that the "Categories" section is visible on the home page.
    [Tags]    smoke
    Wait For Elements State    css=.left-sidebar h2:has-text("Category")    visible


Verify Brands Section Is Visible
    [Documentation]    Verify that the "Brand" section is visible on the home page.
    [Tags]    smoke
    Wait For Elements State    css=.left-sidebar h2:has-text("Brands")    visible


Click On Women Category
    [Documentation]    Click on the Women category in the left sidebar.
    Click    css=#accordian a[href="#Women"]


Click On Dress Subcategory
    [Documentation]    Click on the Dress subcategory under the Women category.
    Click    css=a[href="/category_products/1"]



Click On Men Category
    [Documentation]    Click on the Men category in the left sidebar.
    Click    css=#accordian a[href="#Men"]


Click On T-Shirts Subcategory
    [Documentation]    Click on the T-Shirts subcategory under the Men category.
    Click    css=a[href="/category_products/3"]



Click On Polo Brand
    [Documentation]    Click on the Polo brand in the left sidebar.
    Click    css=a[href="/brand_products/Polo"]



Click On H&M Brand
    [Documentation]    Click on the H&M brand in the left sidebar.
    Click    css=a[href="/brand_products/H&M"]    