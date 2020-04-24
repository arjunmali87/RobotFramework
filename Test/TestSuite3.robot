*** Settings ***
Library    SeleniumLibrary    


*** Test Cases ***
MyFirstTest
    Log  Test the Open HRM Application
    FirstSeleniumTest
    Log    Test Completed

*** Variables ***
${Url}    https://opensource-demo.orangehrmlive.com/
@{Credentials}    admin    admin123
&{CredentialDict}    userName=admin    pwd=admin123

*** Keywords ***

LoginKW
    Input Text    id=txtUsername    ${Credentials}[0]
    Input Text    id=txtPassword    ${CredentialDict}[pwd]
    Click Button    name=Submit 
    # ${count} = Get Matching XPath Count ${welcome}
    # Run Keyword And Return If   ${count} > 0 Keyword log 
    Wait Until Element Is Visible    id=welcome
    ${WelocmeElementVisible} =    Page Should Contain Element    id=welcome
    Run keyword If    ${WelocmeElementVisible}    Log    User is able to login successfully
    

LogoutKW
    Click Element    id=welcome
    Wait Until Element Is Visible    link=Logout
    Click Element    link=Logout
    Log    User logout successfully
    

FirstSeleniumTest
    
    Open Browser    ${Url}  chrome
    Set Browser Implicit Wait    5
    LoginKW
    LogoutKW   
    Close Browser
    
