*** Settings ***

Documentation    Category products resource file for Robot Framework tests.
Resource     ../Base.Resource


*** Keywords ***


Verify Category 2
    [Documentation]    Verify that the "Category" is visible on the category products page.
    [Tags]    smoke
    [Arguments]    ${expected_category}
    Get Text    css=h2.title.text-center    *=    ${expected_category}    


Verify Category 
    [Documentation]    Verify that the "Category" is visible on the category products page.
    [Tags]    smoke
    [Arguments]    ${expected_category}
    
    # 1. Get the raw text from the element without asserting it immediately
    ${raw_text}    Get Text    css=h2.title.text-center
    
    # 2. Use Python to strip out any injected spaces (\xa0), newlines, or ad wrappers
    ${cleaned_text}    Evaluate    " ".join('''${raw_text}'''.split())
    
    # 3. Assert using BuiltIn to safely ignore case sensitivity
    Should Contain    ${cleaned_text}    ${expected_category}    ignore_case=True    