*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Resource        ../keywords/LoginPageKeywords.robot
Resource        ../keywords/HomePageKeywords.robot
Variables       /home/siwat/Desktop/project/Testcases_with_RobotFramework_Selenium/HomeWork/resources/config/config.yaml
Variables       /home/siwat/Desktop/project/Testcases_with_RobotFramework_Selenium/HomeWork/resources/testdata/testdata.yaml
Suite Setup     Open Browser And Maximize
Suite Teardown  SeleniumLibrary.Close All Browsers 

*** Keywords ***
Open Browser And Maximize
    Open Browser    ${baseUrl}    browser=chrome
    Maximize Browser Window
*** Test Cases ***
As a user, I want to login success with valid credential, convert url to short url and copy
    When LoginPageKeywords.user login to url.in.th platform with ${email} and ${valid_password}
    Then HomePageKeywords.url.in.th should display home page and display message as "กิจกรรมล่าสุด"
    Then CommonKeywords.Wait until element is ready then input text      locator=id=url  text=https://policywatch.thaipbs.or.th/article/environment-21
    Then CommonKeywords.Wait until element is ready then click element    locator=xpath=//span[text()="ย่อลิงค์"]
    Then CommonKeywords.Wait until page contains element then verify text    expected_text=ลิงค์สั้น
    Then CommonKeywords.Wait until element is ready then click element    locator=xpath=//button[text()="คัดลอก"]
    Then CommonKeywords.Wait until element is ready then click element    locator=xpath=//div[@class="modal-header border-0"]/button[@aria-label='Close']
    Then CommonKeywords.Wait until page contains element then verify not element    locator=xpath=//div[@class="modal fade show"]
    
    Then user logout from url.in.th platform
    [Teardown]    SeleniumLibrary.Close Browser

As a user, I fail to login with invalid credential
    When Open Browser And Maximize
    Then LoginPageKeywords.user login to url.in.th platform with ${email} and ${invalid_password}
    Then LoginPageKeywords.url.in.th should display display validate login fail message as อีเมลและรหัสผ่านไม่ถูกต้อง
    [Teardown]     SeleniumLibrary.Close Browser


