*** Settings ***

Documentation   Tests Cases page Resource for Robot Framework tests.
Resource     ../Base.Resource



*** Keywords ***


Verify Test Cases Page Loaded Successfully
    [Documentation]    Validate that the "Test Cases" section is visible on the test cases page.

    Get URL    ==   ${BASE_URL}/test_cases