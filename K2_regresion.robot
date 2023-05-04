*** Settings ***
Library           SeleniumLibrary


*** Variable ***
${DELAY}  0.5
${URL}  http://uat01.hengleasing.com/Login
${BROWSER_EDGE}  Edge
${LOGIN BUTTON}  xpath=//*[@id="btnLogin"]
${USERNAME TEXTBOX}  xpath=//*[@id="Username"]
${PASSWORD TEXTBOX}  xpath=//*[@id="Password"]
#เลือกประเภทสินเชื่อ
#กู้
${CHOICE P-LOAN}  xpath=//div[@class="bootstrap-dialog-message"]/a[@class="btn btn-requisition-create btn-block btn-color3"]
#ปรับปรุงโครงสร้างหนี้ (TDR)
#${CHOICE TDR}   xpath=//*[@id="CustomerDemandTypeID"]/option[3]
#ปรับปรุงโครงสร้างหนี้เชิงป้องกัน (PDR)
#//*[@id="CustomerDemandTypeID"]/option[5]
#รีไฟแนนซ์ PDR ชั้น P
#//*[@id="CustomerDemandTypeID"]/option[6]
#รีไฟแนนซ์ชั้น P
#//*[@id="CustomerDemandTypeID"]/option[7]
#รีไฟแนนซ์ชั้น SM
#//*[@id="CustomerDemandTypeID"]/option[8]
#สินเชื่อแก่ผู้จัดจำหน่ายรถยนต์ (Floor Plan)
#//*[@id="CustomerDemandTypeID"]/option[8]
#สินเชื่อส่วนบุคคลเพื่อคนอยากมีรถ
#//*[@id="CustomerDemandTypeID"]/option[9]
######### ข้อมูลผู้กู้ #############
#ใส่เลขบัตรประชาชน
${CARD NUMBER TEXTBOX}  xpath=//*[@id="IDCardNo"]
#ใส่ชื่อ/นามสกุล
${FIRST NAME}   ทดสอบ 001
${SURE NAME}    นามสกุล นายทดสอบ 001 
#NameEng/LastNameENG 
${F NAME ENG}   sombun
${L NAME ENG}   test
#วันเดือนปีเกิด
${AGE}      03/05/2530
#ประเภทเงินกู้ 
#${TypeSelect}   
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
Case 3 : Input Text
    [Documentation]    กรอกรายละเอียด"ใบคำขอสินเชื่อ"
    INPUT  6128717074264
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
    Sleep           ${DELAY}
INPUT
#ข้อมูลผู้กู้
    [Documentation]   ข้อมูลผู้กู้
    [Arguments]  ${CARD}
    Input Text  ${CARD NUMBER TEXTBOX}  ${CARD}
    Sleep   ${DELAY}
    Input Text       xpath=//*[@id="FirstNameTH"]  ${FIRST NAME}
    Sleep   ${DELAY}
    Input Text       xpath=//*[@id="LastNameTH"]  ${SURE NAME}
    Sleep   ${DELAY}
    #DropDown ประเภทเงินกู้
    Click Element    xpath=//*[@id="CustomerDemandTypeID"]/option[2]
    Sleep   ${DELAY}
    #DropDown เพศ
    Click Element    xpath=//*[@id="PrefixID"]/option[2]
    Sleep   ${DELAY}
    #DropDown ระดับการศึกษา
    Click Element   xpath=//*[@id="EducationLevelID"]/option[6]
    #สถานศึกษา
    #Input Text  xpath=//*[@id="EducationalInstitution"]  Bkk
    Sleep   ${DELAY}
    #คณะ
    #Input Text  xpath=//*[@id="EducationalInstitution"] คณะลาบ
    Sleep   ${DELAY}
    Input Text  xpath=//*[@id="BirthDate"]    ${AGE}
    #DropDown วันที่ออกบัตร
    Input Text  xpath=//*[@id="DateOfIssue"]   05/03/2565
    Sleep   ${DELAY}
    #Click ไปเรือย
    Click Element  xpath=//*[@id="customer"]/div
    #เบอร์โทร
    Input Text  //*[@id="MobileNo"]  0841233456
    Sleep   ${DELAY}
    #NameEng/LastNameENG
    Input Text  //*[@id="FirstNameEN"]      ${F NAME ENG}
    Sleep   ${DELAY}
    Input Text  //*[@id="LastNameEN"]       ${L NAME ENG}
    Sleep   ${DELAY}
    
