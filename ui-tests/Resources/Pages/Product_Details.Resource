*** Settings ***

Documentation    Product details page Resource for Robot Framework tests.
Resource     ../Base.Resource


*** Keywords ***

Verify User Is Landed On Product Details Page
   
    [Documentation]    Validate that the user is navigated to the product details page.
    [Arguments]   ${product_id}

    Get URL    ==   ${BASE_URL}/product_details/${product_id}


Increase Product Quantity
    [Documentation]    Increase the product quantity by one on the product details page.
    [Arguments]    ${quantity}


    Fill Text    id=quantity    ${quantity}     

Click On Add To Cart Button
    [Documentation]    Click the "Add to cart" button on the product details page.
    
    Click    css=button.btn.btn-default.cart        


Fill Review Form
    [Documentation]    Fill the review form with the provided details.
    ${Review}    Get Fake Account

    Fill Text    id=name    ${Review}[Name]
    Fill Text    id=email   ${Review}[Email]
    Fill Text    id=review  ${Review}[Message]


Click On Submit Review Button
    [Documentation]    Click the submit review button on the product details page.
    
    Click    id=button-review



Verify Review Submission Success Message Is Visible
    [Documentation]    Validate that the review submission success message is displayed on the product details page.
    
    Get Text    css=div.alert-success.alert >> text="Thank you for your review."