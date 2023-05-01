*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${URL}  https://www.google.co.th/
${BROWSER}  Edge
${MESSAGE}   Robotframework

*** Keywords ***

    
*** Test Cases ***
เปิด BROWSER
    Open BROWSER  ${URL}   ${BROWSER}
ใส่ข้อความ
    Input Text  //*[@id="APjFqb"]    ${MESSAGE}
    Sleep   1
กดปุ่ม "ค้นหา"
    Click Element    //*[@name="btnK"]
    Sleep   1
    Close BROWSER
