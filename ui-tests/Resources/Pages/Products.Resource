*** Settings ***

Documentation  Products page Resource for Robot Framework tests.
Resource     ../Base.Resource



*** Keywords ***





Verify Products Page Loaded Successfully
    [Documentation]    Validate that the "All Products" section is visible on the products page.

    Get URL    ==   ${BASE_URL}/products


Verify Product List Is Visible
    [Documentation]    Validate that the product list is visible on the products page.

    Wait For Elements State    id=accordian    visible





Verify Product Details Are Visible
    [Documentation]    Verify that the product details are visible on the product details page.
    [Arguments]   ${product_name}     ${category}     ${price}     ${availability}     ${condition}     ${brand}
    
    Get Text    css=.product-information h2                            *=    ${product_name}
    Get Text    css=.product-information p:has-text("Category")        *=    ${category}
    Get Text    css=.product-information p:has-text("Availability")    *=    ${availability}
    Get Text    css=.product-information p:has-text("Condition")       *=    ${condition}
    Get Text    css=.product-information p:has-text("Brand")           *=    ${brand}
    Get Text    css=.product-information span >> nth=1                          *=    ${price}


Verify Product Name Is Visible
    [Documentation]    Verify that the product name is visible on the product details page.
    [Arguments]   ${product_name}
    
    Get Text    css=.product-information h2                            *=    ${product_name}

Verify Product Category
    [Documentation]    Verify that the product category on the product details page.
    [Arguments]   ${category}
    
    Get Text    css=.product-information p:has-text("Category")        *=    ${category}

Verify Product Price
    [Documentation]    Verify that the product price on the product details page.
    [Arguments]   ${price}
    
    Get Text    css=.product-information span >> nth=1                          *=    ${price}

Verify Product Availability
    [Documentation]    Verify that the product availability on the product details page.
    [Arguments]   ${availability}
    
    Get Text    css=.product-information p:has-text("Availability")    *=    ${availability}    

Verify Product Condition
    [Documentation]    Verify that the product condition on the product details page.
    [Arguments]   ${condition}
    
    Get Text    css=.product-information p:has-text("Condition")       *=    ${condition}

Verify Product Brand    
    [Documentation]    Verify that the product brand on the product details page.
    [Arguments]   ${brand}
    
    Get Text    css=.product-information p:has-text("Brand")           *=    ${brand}



Verify Searched Product Title Is Visible
    [Documentation]    Validate that the searched product title is visible on the products page.
    Get Text    css=.features_items h2.title.text-center    ==    SEARCHED PRODUCTS


Verify Searched Product Is Visible
    [Documentation]    Validate that the searched product is visible on the products page.
    [Arguments]   ${product_name}

    Get Text    css=.productinfo.text-center p   ==    ${product_name}
     


Search For Product
    [Documentation]    Search for a product using the search input field.
    [Arguments]   ${product_name}

    Fill Text    id=search_product    ${product_name}
    Click    id=submit_search


Click On View Product Button
    [Documentation]    Click the "View Product" button for a specific product.
    [Arguments]   ${product_id}

    Click    css=a[href="/product_details/${product_id}"]



Click On Add Product To Cart By ID
    [Documentation]    Click on a product by its ID.
    [Arguments]   ${product_id}

    Click    css=.productinfo a[data-product-id="${product_id}"] >> nth=0


Click On Continue Shopping
    [Documentation]    Click the "Continue Shopping" button.
    Click    css=.btn-success.close-modal


Click On View Cart
    [Documentation]    Click the "View Cart" button.
    Click     role=link[name="View Cart"] 
