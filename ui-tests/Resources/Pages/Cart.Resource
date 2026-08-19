*** Settings ***

Documentation  Cart page Resource for Robot Framework tests.
Resource     ../Base.Resource


*** Keywords ***



Verify Products Are Added To Cart
    [Documentation]    Validate that the products are added to the cart.
    [Arguments]    @{product_ids}

    FOR    ${product_id}    IN    @{product_ids}
        Wait For Elements State    css=#product-${product_id}    visible
        
    END  



    