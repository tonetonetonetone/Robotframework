*** Settings ***
Library           SeleniumLibrary


*** Variable ***
${DELAY0.6}     0.5
${DELAY1.5}     1.5
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
${CARD NUMBER TEXTBOX}   xpath=//*[@id="IDCardNo"]
${ID_CARD_MARRIED_TEXTBOX}  xpath=//*[@id="SpouseIDCardNo"]
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
    Sleep   ${DELAY0.6}
    Login  P_Manager0001  Dev@te5t
    Log     เปิด WEB สำเร็จ
Case 1 : ใบคำขอสินเชื่อ>รายการใบคำขอสินเชื่อ
    [Documentation]  ใบคำขอสินเชื่อ>รายการใบคำขอสินเชื่อ
    ApplicationForm
    Log     กรอกรายละเอียด
Case 2 : เลือกประเภทสินเชื่อ
    [Documentation]  เลือกประเภทสินเชื่อซักอัน
    Typeloan
Case 3 : Input Text
    [Documentation]    กรอกรายละเอียด"ใบคำขอสินเชื่อ" 
    InfomationฺBorrower  6128717074264   #เลขที่บัตรประชาชน
Case 4 : ที่อยู่อาศัย/หลักทรัพย์
    [Documentation]     กรอกรายละเอียด
    House
Case 5 : อาชีพ
    [Documentation]     กรอกอาชีพ
    ChoiceClass
Case 6 : รายได้-ค่าใช้จ่าย
    [Documentation]     หน้ารายได้
    IncomeExpense
Case 7 : คู่สมรส
    [Documentation]     กรอกรายละเอียดคู่สมรส
    Married     6547735015024   #เลขที่บัตรประชาชนคู่สมรส  
    #Single
*** Keywords ***
Login
    [Documentation]  Arguments Login & CardNumber
    [Arguments]  ${username}  ${password}
    Input Text  ${USERNAME TEXTBOX}  ${username}
    Sleep  ${DELAY0.6}
    Input Text  ${PASSWORD TEXTBOX}  ${password}
    Sleep  ${DELAY0.6}
    Click Element  ${LOGIN BUTTON}
    # รอให้โหลดหน้าเว็บเสร็จสมบูรณ์ 5 วินาที
    Set Browser Implicit Wait  5  
    Click Element   ${LOGIN BUTTON}
    Sleep  ${DELAY0.6}
ApplicationForm
    [Documentation]  เลือก DropDown(ใบคำขอสินเชื่อ)
    Maximize Browser Window
    Click Element   xpath=//li[@class="dropdown"]/a[text()=" ใบคำขอสินเชื่อ "]
    Sleep           ${DELAY0.6}
    Click Element   xpath=//ul[@class="dropdown-menu"]/li[1]/a
    Sleep           ${DELAY0.6}
    Click Element   xpath=//button[@class="btn btn-success"]
    Sleep           ${DELAY0.6}
Typeloan
    [Documentation]  เลือกประเภทสินเชื่อ P-LOAN
    Click Element   ${CHOICE P-LOAN}
    Sleep           ${DELAY0.6}
    Click Element   xpath=//div[@class="col-md-6"]/a[@id="btnFillIn"]
    Sleep           ${DELAY0.6}
InfomationฺBorrower
    [Documentation]   กรอกข้อมูลผู้กู้
    [Arguments]  ${CARD}
    Input Text  ${CARD NUMBER TEXTBOX}  ${CARD}
    #Sleep   ${DELAY0.6}
    Input Text       xpath=//*[@id="FirstNameTH"]  ${FIRST NAME}
    #Sleep   ${DELAY0.6}
    Input Text       xpath=//*[@id="LastNameTH"]  ${SURE NAME}
    #ชื่อเล่น
    Input Text  xpath=//*[@id="NickName"]   ทดสอบ
    INPUT Text  xpath=//*[@id="Alias"]     ทดสอบ
    #Sleep   ${DELAY0.6}
    #DropDown ประเภทเงินกู้
    Click Element    xpath=//*[@id="CustomerDemandTypeID"]/option[2]
    Sleep   ${DELAY0.6}
    #DropDown เพศ
    Click Element    xpath=//*[@id="PrefixID"]/option[2]
    #Sleep   ${DELAY0.6}
    #DropDown ระดับการศึกษา
    Click Element   xpath=//*[@id="EducationLevelID"]/option[6]
    #สถานศึกษา
    Input Text  xpath=//*[@id="EducationalInstitution"]     Bkk
    Sleep   ${DELAY0.6}
    #คณะ
    Input Text  xpath=//*[@id="Faculty"]     คณะลาบ
    Sleep   ${DELAY0.6}
    Input Text  xpath=//*[@id="BirthDate"]    ${AGE}
    #DropDown วันที่ออกบัตร
    Input Text  xpath=//*[@id="DateOfIssue"]   05/03/2565
    #Sleep   ${DELAY0.6}
    #Click ไปเรือย
    Click Element  xpath=//*[@id="customer"]/div
    #Emial
    Input Text      xpath=//*[@id="Email"]      Test.heng@hengleasing.co.th
    #เบอร์โทร
    Input Text  xpath=//*[@id="MobileNo"]  0841233456
    Sleep   ${DELAY0.6}
    #NameEng/LastNameENG
    Input Text  xpath=//*[@id="FirstNameEN"]      ${F NAME ENG}
    Sleep   ${DELAY0.6}
    Input Text  xpath=//*[@id="LastNameEN"]       ${L NAME ENG}
    Sleep   ${DELAY0.6}
    #ข้อมลูที่อยู่
    Click Element   xpath=//*[@id="buttonPermanentAddress"]
    Click Element   xpath=//*[@id="SelectAddressType"]/option[2]
    #เลขที่
    Input Text      xpath=//*[@id="AddressNo"]      10
    #อาคาร
    Input Text      xpath=//*[@id="AddressName"]    มาลีนนท์
    #หมู่ที่
    Input Text      xpath=//*[@id="VillageNo"]      หมู่ที่ 10
    #ซอย
    Input Text      xpath=//*[@id="Alley"]          ซอยอะไรนะ
    #ถนน
    Input Text      xpath=//*[@id="Road"]           ปัทมานนท์
    #DropDown จังหวัด "กทม."
    Click Element      xpath=//*[@id="ProvinceID"]/option[2]
    #DropDown อำเภอ
    Click Element      xpath=//*[@id="DistrictID"]/option[32]
    #DropDown ตำบล
    Click Element      xpath=//*[@id="SubDistrictID"]/option[2]
    Sleep   ${DELAY0.6}
    #ไปรษณีย์
    #Input Text         xpath=//*[@id="PostalCode"]      10120
    #กดบันทึก
    Click Element      xpath=//*[@id="frmAddress"]/div[8]/div/button
    #Sleep      5
    #ที่อยู่ปัจจุบัน
    Click Element       xpath=//*[@id="buttonPresentAddress"]
    #DropDown"ตามทะเบียนบ้าน"
    Sleep   ${DELAY0.6}
    Click Element       xpath=//*[@id="SelectAddressType"]/option[2]
    Click Element       xpath=//*[@id="IsCopyAddress"]
    Sleep   ${DELAY0.6}
    Click Element       xpath=//*[@id="frmAddress"]/div[8]/div/button
House
    [Documentation]     #ที่อยู่อาศัย>เจ้าบ้าน>รัศมีการตรวจสอบ
    Click Element   xpath=//*[@id="IsHouseholdRegistrationOwner"]
    Sleep   ${DELAY0.6}
    Input Text  xpath=//*[@id="CustomerLocationDistance"]   5
    #Sleep   ${DELAY0.6}
    #DropDown สถานะปัจจุบัน
    Click Element   xpath=//*[@id="CurrentResidenceStatus"]/option[2]
    Sleep   ${DELAY0.6}
    #DropDown ลักษณะบ้าน
    Click Element   xpath=//*[@id="ResidenceType"]/option[4]
    Sleep   ${DELAY0.6}
    #ลักษณะบ้านอื่นๆ
    Input Text  xpath=//div[@class="col-lg-9"]/input[@id="ResidenceTypeOther"]  บ้านบ้าน
    Sleep   ${DELAY0.6}
    #จำนวนชั้น
    Input Text  xpath=//*[@id="ResidenceFloor"]    2
    Sleep   ${DELAY0.6}
    #สี
    Input Text  xpath=//*[@id="ResidenceColor"]   สีทนได้
    Sleep   ${DELAY0.6}
    #จำนวนห้องนอน
    Input Text  xpath=//*[@id="NoOfBedroom"]      5
    Sleep   ${DELAY0.6}
    #จำนวนสมาชิก
    Input Text  xpath=//*[@id="NoOfResidenceMember"]  3
    Sleep   ${DELAY0.6}
    #กรรมสิทธิ์ที่อยู่
    Click Element   xpath=//*[@id="HouseOwnerShip"]/option[1]
    #ผ่อนเดือนละ
    Input Text  xpath=//*[@id="RentalPerMonthAmnt"]   12000
    #ราคาประเมินบ้าน จำนวนเงิน
    Input Text  xpath=//*[@id="HouseCostEstimate"]    2000000
    #ราคาประเมินที่ดิน จำนวนเงิน
    Input Text  xpath=//*[@id="LandCostEstimate"]     4000000
    #เครื่องอำนวยความสะดวก
    Input Text  xpath=//*[@id="OtherAssets"]      ทีวี,ตู้เย็น,โซฟา ฯลฯ
    #Check Box โฉนดที่ดิน
    Click Element   xpath=//*[@id="HasTitleDeed"]
    #เลขที่โฉนดที่ดิน
    Input Text  xpath=//*[@id="TitleDeedDetail"]    1231421412
    #จำนวนรถยนต์ที่ใช้ในครอบครัว
    Input Text  xpath=//*[@id="NoOfCar"]    2
    #ระบุ (ยี่ห้อ/รุ่น)
    Input Text  xpath=//*[@id="CarDescription"]     BMW
ChoiceClass
    [Documentation]     กรอกอาชีพ>อาชีพ/สถานที่ทำงาน
    #Scroll ขึ้นสุด
    Execute Javascript    window.scrollTo(0,0);
    #คลิกอาชีพ
    Click Element   xpath=//*[@id="customerTab"]/li/a[text()="อาชีพ"]
    Sleep   ${DELAY0.6}
    #DropDown อาชีพ"พนักงานบริษัท"
    Click Element   xpath=//*[@id="JobHDID"]/option[4]
    Sleep   ${DELAY1.5}
    #DropDown อาชีพรอง"บริษัทมหาชน"
    Click Element   xpath=//*[@id="JobDTID"]/option[2]
    Sleep   ${DELAY1.5}
    #เงื่อนไขคิดค่าใช้จ่ายของ ChoiceClass BUG Related กับที่อยู่ปัจจุบัน
    Click Element   xpath=//*[@id="JobDTConditionID"]
    Sleep   ${DELAY1.5}
    Click Element   xpath=//*[@id="JobDTConditionID"]//*[contains(text(),'เงินเดือนมากกว่า 25,000')]
    Sleep   ${DELAY1.5}
    #ลักษณะงาน
    Input Text      xpath=//*[@id="JobDescription"]     แอบหลับในที่ทำงาน
    Sleep   ${DELAY0.6}
    #เงื่อนไขค่าใช้จ่าย
    Click Element      xpath=//*[@id="JobDTConditionID"]
    #สถานที่ทำงาน
    Input Text      xpath=//*[@id="WorkPlace"]      บ้านโฮ่ง
    Sleep   ${DELAY0.6}
    #ประเภทธุรกิจ
    Input Text      xpath=//*[@id="WorkDescription"]    ปล่อยสินเชื่อ
    Sleep   ${DELAY0.6}
    #ตำแหน่ง
    Input Text      xpath=//*[@id="WorkPosition"]       QA
    Sleep   ${DELAY0.6}
    #DropDown ระดับตำแหน่ง "พนักงาน"
    Click Element   xpath=//*[@id="WorkLevel"]/option[4]
    #อายุการทำงาน ปี/เดือน
    Input Text      xpath=//*[@id="WorkExperienceYear"]     5
    Input Text      xpath=//*[@id="WorkExperienceMonth"]    5
    #สัญญาจ้าง  ปี/เดือน
    Input Text      xpath=//*[@id="WorkContractYear"]       5
    Input Text      xpath=//*[@id="WorkContractMonth"]      5
    Sleep   ${DELAY0.6}
    #ที่อยู่ทำงาน (ClickButton)
    Click Element   xpath=//*[@id="buttonWorkingAddress"]
    Sleep   ${DELAY0.6}
    #Click Dropdown "ทะเบียนบ้าน"
    Click Element   xpath=//*[@id="SelectAddressType"]/option[2]
    #Click CheckBox CopyAddress
    Click Element   xpath=//*[@id="IsCopyAddress"]
    sleep   ${DELAY1.5}
    Click Element   xpath=//*[@id="frmAddress"]/div[8]/div/button
    Sleep   ${DELAY0.6}
IncomeExpense
    [Documentation]     คลิก รายได้-ค่าใช้จ่าย
    Click Element   xpath=//*[@id="customerTab"]/li[3]/a
    Wait Until Page Contains Element    xpath=//*[@id="incomeHeading"]/h4/a
    #รายได้ของผู้กู้
    Input Text      xpath=//*[@id="SalaryAmnt"]     35000
    #รายได้อื่นๆ ผู้กู้
    Input Text      xpath=//*[@id="OtherIncomeDescription"]     ขายก๋วยเตี๋ยว
    Input Text      xpath=//*[@id="OtherIncomeAmnt"]        20000
    #รายได้คู่สมรส
    Input Text      xpath=//*[@id="SpouseSalaryAmnt"]       28000
    #รายได้อื่นๆ คู่สมรส
    Input Text      xpath=//*[@id="SpouseOtherIncomeDescription"]   3000
    #ค่าเช่า
    Input Text      xpath=//*[@id="RentalAmnt"]     0
    #ค่าใช้จ่ายอื่นๆ
    Input Text      xpath=//*[@id="OtherExpensesDescription"]   จ่ายค่าเด็ก
    Input Text      xpath=//*[@id="OtherExpensesAmnt"]      1500
    Sleep   ${DELAY0.6}
Married
    [Documentation]       สถานะภาพ "สมรสจดทะเบียน"
    [Arguments]     ${ID_CARD_MARRIED}     
    Click Element   xpath=//*[@id="customerTab"]/li[4]/a
    Sleep   ${DELAY0.6}
    #DropDown เลือก "สมรสจดทะเบียน"
    Click Element   xpath=//*[@id="MaritalStatus"]/option[3]
    Sleep   ${DELAY0.6}
    #DropDown เลือก "นาง"
    Click Element   xpath=//*[@id="SpousePrefixID"]/option[3]
    Sleep   ${DELAY0.6}
    #ชื่อ
    Input Text      xpath=//*[@id="SpouseFirstNameTH"]      อิอิอิอิ
    Sleep   ${DELAY0.6}
    #นามสกุล
    Input Text      xpath=//*[@id="SpouseLastNameTH"]       ฮิฮิฮิฮิ
    Sleep   ${DELAY0.6}
    #วันเดือนปีเกิด คู่สมรส
    Input Text      xpath=//*[@id="SpouseBirthDate"]        10/03/2530
    Sleep   ${DELAY0.6}
    #คลิกไปเรื่อย
    Click Element   xpath=/html/body/div[1]/div/div[2]
    Input Text      xpath=//*[@id="SpouseRace"]         ไทย
    #DropDown เลือกประเภทบัตร
    Click Element     xpath=//*[@id="SpouseIDCardType"]/option[2]
    Sleep   ${DELAY0.6}
    #เลขที่บัตรคู่สมรส
    Input Text     ${ID_CARD_MARRIED_TEXTBOX}      ${ID_CARD_MARRIED}
    Sleep   ${DELAY0.6}
    #จำนวนบุตร
    Input Text  xpath=//*[@id="NumberOfSon"]    1
    #เบอร์โทรศัพท์
    Input Text  xpath=//*[@id="SpouseTelephoneNo"]  0800000000
    Input Text  xpath=//*[@id="SpouseMobileNo"]     0800000000
    #อาชีพ
    Click Element  xpath=//*[@id="SpouseJobHDID"]/option[3]
    #ตำแหน่ง
    Input Text      xpath=//*[@id="SpouseWorkPosition"]     ผบ.ทบ. ประจำบ้าน
    #สถานท่ี่ทำงาน
    Input Text      xpath=//*[@id="SpouseWorkPlace"]        บ้าน
    #อายุงาน คู่สมรส
    Input Text      xpath=//*[@id="SpouseWorkExperienceYear"]   50
    #CheckBox
    Click Element   xpath=//*[@id="IsMarriedSigned"]
    Sleep   ${DELAY1.5}
    #Scroll ขึ้นสุด
    Execute Javascript    window.scrollTo(0,0);
    Click Element   xpath=//*[@id="customerTab"]/li[3]/a
    Sleep   ${DELAY0.6}
    Click Element   xpath=//*[@id="CalculateType"]/option[3]
    Sleep   ${DELAY0.6}
    Click Element   xpath=//*[@id="btnCalculateIncome"]
    Sleep   10
#Single

