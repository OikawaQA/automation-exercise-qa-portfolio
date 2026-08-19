*** Settings ***

Documentation    Checkout page Resource for Robot Framework tests.
Resource     ../Base.Resource


*** Keywords ***

Click On Proceed To Checkout Button
    [Documentation]    Click the "Proceed to checkout" button on the checkout page.
    
    Click    css=a.btn.btn-default.check_out


Verify Adress Details
    [Documentation]    Verify that the address details are displayed on the checkout page.
    [Arguments]    ${expected_name}    ${expected_city}     ${expected_country}
     Get Text   css=#address_delivery .address_firstname    *=    ${expected_name}
     Get Text   css=#address_delivery .address_city    *=    ${expected_city}
     Get Text   css=#address_delivery .address_country_name    *=    ${expected_country}



Fill Comment Text Area
    [Documentation]    Fill the comment textarea on the checkout page.
    
    Fill Text    css=textarea[name="message"]    This is a test comment.



Click On Place Order Button
    [Documentation]    Click the "Place Order" button on the checkout page.
    
    Click    css=a[href="/payment"]