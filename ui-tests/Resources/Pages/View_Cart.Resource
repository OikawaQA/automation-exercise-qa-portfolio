*** Settings ***

Documentation  View Cart page Resource for Robot Framework tests.
Resource     ../Base.Resource


*** Keywords ***

Verify Product Quantity In Cart By ID
    [Documentation]    Validate that the product quantity in the cart is correct.
    [Arguments]    ${product_id}    ${expected_quantity}

    Get Text    css=#product-${product_id} .cart_quantity button     ==    ${expected_quantity}


Verify User Is Landed On View Cart Page
    [Documentation]    Validate that the user is navigated to the view cart page.

    Get URL    ==   ${BASE_URL}/view_cart

Verify Product Is Removed From Cart
    [Documentation]    Validate that a product is removed from the cart.

    Get Text    css=#empty_cart   *=   Cart is empty!


Verify Product In Cart 
    [Documentation]     that a product is in the cart.
    [Arguments]    ${product_id}  ${product_name}  

    Get Text    css=#product-${product_id} .cart_description h4 a    ==    ${product_name}


Click On Register / Login Button
    [Documentation]    Click the "Register / Login" button on the view cart page.

    Click    css=p.text-center a[href="/login"]        

Click On Remove Product From Cart By ID
    [Documentation]    Click the "Remove" button for a product in the cart by its ID.
    [Arguments]    ${product_id}

    Click    css=#product-${product_id} .cart_quantity_delete


