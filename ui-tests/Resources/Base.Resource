*** Settings ***


Documentation     This is a base resource file for Robot Framework tests.
Library     Browser   
Library     Libs/Account.py 
Library     Dialogs 
Library     String  
Library     OperatingSystem         
Resource    Pages/Home.Resource
Resource    TopBar.Resource
Resource    Footer.Resource
Resource    Pages/Login.Resource
Resource    Pages/Contact.Resource
Resource    Pages/Cases.Resource
Resource    Pages/Products.Resource
Resource    Pages/Cart.Resource
Resource    Pages/Product_Details.Resource
Resource    Pages/View_Cart.Resource
Resource    Pages/Checkout.Resource
Resource    Pages/Payment.Resource
Resource    Pages/Category_Products.Resource
Resource    Pages/Left_sidebar.Resource
Resource    Pages/Brand_Products.Resource



*** Keywords ***

Open Browser To Landing Page

    [Documentation]    Open the browser and navigate to the landing page.
    New Browser    chromium    headless=false
    New Context     ignoreHTTPSErrors=True        acceptDownloads=True
    Set Browser Timeout    20s
    New Page    ${BASE_URL}


*** Variables ***

${Admin_Email}    testautomation@test.com.br
${Admin_Password}        abc123
${BASE_URL}          https://automationexercise.com
${DOWNLOADS_DIR}    ${CURDIR}${/}Downloads