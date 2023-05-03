*** Settings ***
Library           SeleniumLibrary


*** Variable ***
${DELAY}  0.7
${URL}  http://uat01.hengleasing.com/Login
${BROWSER_EDGE}  Edge
${LOGIN BUTTON}  xpath=//*[@id="btnLogin"]
${USERNAME TEXTBOX}  xpath=//*[@id="Username"]
${PASSWORD TEXTBOX}  xpath=//*[@id="Password"]
 #เลือกประเภทสินเชื่อ
${CHOICE P-LOAN}  xpath=//div[@class="bootstrap-dialog-message"]/a[@class="btn btn-requisition-create btn-block btn-color3"]
${CARD NUMBER TEXTBOX}  xpath=//*[@id="IDCardNo"]
*** Test Case ***
Case 0 : OpenBrowser
    [Documentation]  OpenBrowser>Login>InputUsernamePassword
    Open Browser  ${URL}  ${BROWSER_EDGE}
    Sleep   ${DELAY}
    Login  P_Manager0001  Dev@te5t
Case 1 : ใบคำขอสินเชื่อ>รายการใบคำขอสินเชื่อ
    [Documentation]  ใบคำขอสินเชื่อ>รายการใบคำขอสินเชื่อ
    ApplicationForm
Case 2 : เลือกประเภทสินเชื่อ
    [Documentation]  เลือกประเภทสินเชื่อซักอัน
    Typeloan
*** Keywords ***
Login
    [Documentation]  Arguments Login & CardNumber
    [Arguments]  ${username}  ${password}
    Input Text  ${USERNAME TEXTBOX}  ${username}
    Sleep  ${DELAY}
    Input Text  ${PASSWORD TEXTBOX}  ${password}
    Sleep  ${DELAY}
    Click Element  ${LOGIN BUTTON}
    Sleep  ${DELAY}
    Click Element   css=#btnLogin
    Sleep  ${DELAY}
ApplicationForm
    [Documentation]  เลือก DropDown(ใบคำขอสินเชื่อ)
    Maximize Browser Window
    Click Element   xpath=//li[@class="dropdown"]/a[text()=" ใบคำขอสินเชื่อ "]
    Sleep           ${DELAY}
    Click Element   xpath=//ul[@class="dropdown-menu"]/li[1]/a
    Sleep           ${DELAY}
    Click Element   xpath=//button[@class="btn btn-success"]
    Sleep           ${DELAY}
Typeloan
    [Documentation]  เลือกประเภทสินเชื่อ P-LOAN
    Click Element   ${CHOICE P-LOAN}
    Sleep           ${DELAY}
    Click Element   xpath=//div[@class="col-md-6"]/a[@id="btnFillIn"]
    Sleep           10

#CardNumber
    #[Arguments]  ${CARD}
    #Input Text  ${CARD NUMBER TEXTBOX}  ${CARD}
    #Sleep  4


  