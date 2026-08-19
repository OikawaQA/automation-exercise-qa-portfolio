*** Settings ***    


Documentation    TopBar resource file for Robot Framework tests.
Resource     ../Resources/Base.Resource


*** Keywords ***

Click On Sign/Login Up Button
    [Documentation]    Click on Sign Up Button.

    Click    css=a[href="/login"] >> text="Signup / Login"


Click On Delete Account Button
    [Documentation]       Click the delete account button 

    Click    css=a[href="/delete_account"]


Click On Logout Button
    [Documentation]       Click the logout button 

    Click    css=a[href="/logout"]    


Click On Contact Us Button
    [Documentation]       Click the contact us button 

    Click    css=a[href="/contact_us"]    


Click On Test Cases Button
    [Documentation]       Click the test cases button 

    Click    css=ul.navbar-nav a[href="/test_cases"]



Click On Products Button
    [Documentation]       Click the products button 

    Click    css=a[href="/products"]    


Click On Cart Button 
    [Documentation]       Click the cart button 

    Click    css=.navbar-nav a[href="/view_cart"]