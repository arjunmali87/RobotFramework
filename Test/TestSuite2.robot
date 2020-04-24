*** Settings ***
Library    SeleniumLibrary    

# This is to Test tags
Suite Setup    Log    I am inside Test suite setup
Suite Teardown    Log    I am inside Test suite Teardown


Test Setup    Run keywords    LaunchKW
    
Test Teardown    Run keywords    ExitKW

Default Tags    smoke

*** Variables ***
${Url}    https://opensource-demo.orangehrmlive.com/
*** Test Cases ***

MyFirstTest
    [Tags]    smoke
    Log    First Test Started
    
MySecondTest
    [Tags]    smoke
    Log    Second Test Started
    Remove Tags    smoke
    Set Tags    regression

MyThirdTest
    [Tags]    sanity
    Log    Third Test Started
    
MyFourthTest
    Log    Fourth Test Started
    


*** Keywords ***
LaunchKW
    Open Browser    ${Url}  chrome
    Log    I am inside Test setup
    
ExitKW
    Sleep    3
    Close Browser
    Log    I am inside Test Teardown
