*** Settings ***

Documentation     Contact page Resource for Robot Framework tests.
Resource     ../Base.Resource


*** Keywords ***


Verify Get In Touch is Visible
    [Documentation]    Validate that the "Get In Touch" section is visible on the contact page.
    
   Get Text    role=heading[name="Get In Touch" i]    ==  GET IN TOUCH


Verify Success Message Is Visible

    [Documentation]    Validate that the success message is displayed after form submission.
    
    Get Text    css=div.status.alert.alert-success     *=      Success!

Click On Submit Button
    [Documentation]    Click the submit button to send the contact form.
    
    Click    css=input[data-qa="submit-button"]


Fill Contact Form
    [Documentation]    Fill the contact form with the provided details.
    ${Contact} =   Get Fake Account
    
    Fill Text    css=input[data-qa="name"]    ${Contact}[Name]
    Fill Text    css=input[data-qa="email"]   ${Contact}[Email]
    Fill Text    css=input[data-qa="subject"]  ${Contact}[Message]
    Fill Text    css=textarea[data-qa="message"]  ${Contact}[Message]

    
Upload File
    [Documentation]       Upload File
    
    ${file_path}=    Set Variable    ${CURDIR}/../fixtures/test_upload.txt
    Upload File By Selector    css=input[name="upload_file"]    ${file_path}
    Handle Future Dialogs    action=accept
    Sleep    2s
    Click    css=input[data-qa="submit-button"]   
    Take Screenshot            