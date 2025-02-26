*** Settings ***
Library         SeleniumLibrary
Resource        CommonKeywords.robot

*** Keywords ***
user login to url.in.th platform with ${username} and ${password}
    CommonKeywords.Wait until element is ready then click element     xpath=//a[@class="nav-link" and text() = "เข้าสู่ระบบ"]

    CommonKeywords.Wait until element is ready then input text        id=input-email            ${username}
    #CommonKeywords.Wait until element is ready then click element     xpath=//span[@jsname="V67aGc" and text()="Next"]
    CommonKeywords.Wait until element is ready then input text        id=input-password         ${password}
    CommonKeywords.Wait until element is ready then click element     xpath=//button[@type="submit" and text() = "เข้าสู่ระบบ"]

url.in.th should display display validate login fail message as ${text}
    CommonKeywords.Wait until page contains element then verify text    ${text}

