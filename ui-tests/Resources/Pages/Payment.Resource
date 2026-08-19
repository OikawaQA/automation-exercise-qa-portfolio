*** Settings *** 

Documentation    Payment page Resource for Robot Framework tests.
Resource     ../Base.Resource


*** Keywords ***

Fill Payment Details
    [Documentation]    Fill in the payment details on the payment page.
    [Arguments]    ${card_number}    ${expiry_month}    ${cvc}  ${expiry_year}

    Fill Text    css=input[data-qa="name-on-card"]    Test User
    Fill Text    css=input[data-qa="card-number"]     ${card_number}
    Fill Text    css=input[data-qa="expiry-month"]     ${expiry_month}
    Fill Text    css=input[data-qa="expiry-year"]     ${expiry_year}
    Fill Text    css=input[data-qa="cvc"]             ${cvc}



Click On Pay And Confirm Order Button
    [Documentation]    Click the "Pay and Confirm Order" button on the payment page.

    Click    css=button#submit 


Verify Payment Page Loaded Successfully
    [Documentation]    Verify that the payment page is loaded successfully.

    Get URL    ==   ${BASE_URL}/payment



Verify Order Placed Successfully
    [Documentation]    Verify that the order is placed successfully.

    Get URL    *=   ${BASE_URL}/payment_done    


Verify Invoice Is Downloaded Successfully
    [Documentation]    Verify that the invoice is downloaded successfully. Then verify the file was downloaded.
    Create Directory    ${DOWNLOADS_DIR}
    ${timestamp}=    Get Time    epoch
    ${download_promise}=    Promise To Wait For Download    ${DOWNLOADS_DIR}${/}invoice_${timestamp}.pdf
    Click    css=a:has-text("Download Invoice")
    ${file}=    Wait For    ${download_promise}
    File Should Exist    ${file}[saveAs]
    Log    Invoice downloaded to: ${file}[saveAs]


Click On Download Invoice Button
    [Documentation]    Click the "Download Invoice" button on the payment confirmation page.

    Click    css=a.btn.btn-default.check_out   