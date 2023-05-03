*** Settings ***
Library           SeleniumLibrary

*** Variable ***
${CARD NUMBER TEXTBOX}  xpath://*[@id="IDCardNo"]
*** Test Case ***
Case 0 : OpenBrowser
    [Documentation]  OpenBrowser>Login>InputUsernamePassword
    Open Browser  http://uat01.hengleasing.com/PersonalLoan/SecuredLoan/Create  Edge
    Sleep   1
Case 1 : ใบคำขอสินเชื่อ>รายการใบคำขอสินเชื่อ
    [Documentation]  ใบคำขอสินเชื่อ>รายการใบคำขอสินเชื่อ
    Cardnumber  6128717074264
*** Keywords ***
Login
    [Documentation]  Arguments Login & CardNumber
    [Arguments]  ${username}  ${password}
    Input Text  ${USERNAME TEXTBOX}  ${username}
    Sleep  1


CardNumber
    [Documentation]  กรอกเลขบัตรประชาชน
    [Arguments]  ${CARD}
    Input Text  ${CARD NUMBER TEXTBOX}  ${CARD}
    Sleep  4