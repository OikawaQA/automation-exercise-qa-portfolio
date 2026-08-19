*** Settings ***

Documentation  Footer resource file for Robot Framework tests.
Resource     ../Resources/Base.Resource


*** Keywords ***

Verify Subscription Section is Visible
    [Documentation]    Verify that the subscription section is visible on the home page.
    [Tags]    smoke
    Get Text   role=heading[name="Subscription"]    ==    SUBSCRIPTION


Verify That User Is Subscribed Successfully
    [Documentation]    Verify that the user is subscribed successfully.
    [Tags]    smoke
    Get Text   css=.alert-success    ==    You have been successfully subscribed!


Fill Subscription Email
    [Documentation]    Fill the subscription email input field with the provided email.
    [Arguments]    ${email}
    Fill Text   id=susbscribe_email    ${email}


Click On Subscribe Button
    [Documentation]    Click the subscribe button to submit the subscription form.
    Click   id=subscribe
