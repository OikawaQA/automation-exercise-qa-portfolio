*** Settings ***

Documentation     Login page test cases for Robot Framework tests.
Resource  ../Base.Resource
    

*** Keywords ***

Verify Form Signup Form Title is Visible
    [Documentation]    Validate that the form title is visible on the login page.
    
    Get Text    css=.signup-form h2    ==  New User Signup!


Verify Login Form Title is Visible
    [Documentation]    Validate that the form title is visible on the login page.
    
    Get Text    css=.login-form h2    ==  Login to your account


Verify That Account Created is visible
     Get Text    css=h2[data-qa="account-created"]    ==    ACCOUNT CREATED!   

Verify Enter Account Information Header
    Get Text     role=heading[name="Enter Account Information"]    ==    ENTER ACCOUNT INFORMATION

Verify That User Is Logged In Successfully
    [Arguments]    ${expected_name}
    Get Text     text="Logged in as"                     *=    Logged in as    ${expected_name}

Verify That Error Message Is Displayed For Invalid Credentials
    [Documentation]       Verify Error Message Is Visible
    [Arguments]     ${expected_message}
    Get Text    text="${expected_message}"    ==    ${expected_message}

Verify That User Is Navigated To Login Page
    [Documentation]       Verify User Is Navigated To Login Page
    Get Url    ==    https://automationexercise.com/login

Click On Signup Button
    [Documentation]    Click the signup button to submit the form.
    
    Click    css=button[data-qa="signup-button"]

Click On Login Button
    [Documentation]    Click the login button to submit the login form.
    
    Click    css=button[data-qa="login-button"]

Click On Create Account Button
    [Documentation]    Click the create account button to submit the account information form.
    
    Click    css=button[data-qa="create-account"]

Click On Continue Button
    Click    css=a[data-qa="continue-button"]


Fill Signup Form
    [Documentation]    Fill the signup form with the provided user details.
    [Arguments]    ${name}    ${email}
    
    Fill Text    css=input[data-qa="signup-name"]    ${name}
    Fill Text    css=input[data-qa="signup-email"]   ${email}

Fill Login Form
    [Documentation]    Fill the login form with the provided user credentials.
    [Arguments]    ${email}    ${password}
    
    Fill Text    css=input[data-qa="login-email"]    ${email}
    Fill Text    css=input[data-qa="login-password"]   ${password}
    


Enter Account Information
    [Documentation]    Fill in the account information form with the provided details.


    Click    css=input#id_gender1
    Fill Text  id=password    ${Admin_Password}
    Select Options By       css=#days    value  18
    Select Options By       css=#months    value  8
    Select Options By       css=#years    value  1996 
    Click    id=newsletter
    Click    id=optin 
    Fill Text    id=first_name    ${account}[Name]
    Fill Text    id=last_name    ${account}[Last_Name]
    Fill Text    id=company    ${account}[Company]
    Fill Text    id=address1    ${account}[Address]
    Fill Text    id=address2    ${account}[Address]
    Select Options By       css=#country    value  Canada
    Fill Text    id=state    Ontario
    Fill Text    id=city    Toronto
    Fill Text    id=zipcode    M5V 2H1
    Fill Text    id=mobile_number    416-555-1234
    Click On Create Account Button 
    

Login User With Valid Credentials

    Click On Sign/Login Up Button
    Verify Login Form Title is Visible
    Fill Login Form    ${Admin_Email}    ${Admin_Password}
    Click On Login Button

Login User With Invalid Credentials
    [Documentation]    Attempt to log in with invalid credentials.
    
    Click On Sign/Login Up Button
    Fill Login Form    12313132@off.com    123456        





I Register A New User with Valid Credentials
    [Documentation]    Register a new user with valid credentials.
    ${account}    Get Fake Account
    Set Test Variable    ${account}    
    Verify Form Signup Form Title is Visible
    Fill Signup Form    ${account}[Name]    ${account}[Email]
    Click On Signup Button
    Verify Enter Account Information Header
    Enter Account Information
    
      

I Verify Account Was Created Successfully
    [Documentation]    Verify that the account was created successfully.
    
    Verify That Account Created is visible
    Click On Continue Button
    Verify That User Is Logged In Successfully    ${account}[Name]
    
    

I Delete the Account
    [Documentation]    Delete the account that was created.
    
    Click On Delete Account Button
    

I Verify Account Was Deleted    
    Get Text    css=h2[data-qa="account-deleted"]    ==    ACCOUNT DELETED!
    Take Screenshot 


