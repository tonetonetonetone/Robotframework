*** Settings ***
Library           SeleniumLibrary
*** Variable ***
${LOGIN BUTTON}  xpath://*[@id="btnLogin"]
${USERNAME TEXTBOX}  xpath://*[@id="Username"]
${PASSWORD TEXTBOX}  xpath://*[@id="Password"]
*** Test Case ***
Case : 0 Open Browser
    Open Browser        http://uat01.hengleasing.com/Login   Edge
    Login  P_Manager0001  Dev@te5t
*** Keywords ***
Login
    [Arguments]  ${username}  ${password}
    Input Text  ${USERNAME TEXTBOX}  ${username}
    Sleep  1
    Input Text  ${PASSWORD TEXTBOX}  ${password}
    Sleep  1
    Click Element  ${LOGIN BUTTON}  
    Sleep  3
