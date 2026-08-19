*** Settings ***

Documentation  Brand products resource file for Robot Framework tests.
Resource     ../Base.Resource

*** Keywords ***

Verify Brand 
    [Documentation]    Verify that the "Brand" is visible on the brand products page.
    [Tags]    smoke
    [Arguments]    ${expected_brand}
    
    # 1. Get the raw text from the element without asserting it immediately
    ${raw_text}    Get Text    css=h2.title.text-center
    
    # 2. Use Python to strip out any injected spaces (\xa0), newlines, or ad wrappers
    ${cleaned_text}    Evaluate    " ".join('''${raw_text}'''.split())
    
    # 3. Assert using BuiltIn to safely ignore case sensitivity
    Should Contain    ${cleaned_text}    ${expected_brand}    ignore_case=True  