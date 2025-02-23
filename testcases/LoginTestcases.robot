*** Settings ***
Library         SeleniumLibrary
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
As a user, I want to login success with valid credential
    When LoginPageKeywords.user login to NotebookLM platform with ${email} and ${valid_password}
    Then HomePageKeywords.NotebookLM should display home page and display message as "ยินดีต้อนรับสู่ NotebookLM"
    Then CommonKeywords.Wait until element is ready then click element    locator=xpath=//span[@class="mdc-button__label" and text() = "สร้าง"]
    Then CommonKeywords.Wait until page contains element then verify text    expected_text=เพิ่มแหล่งที่มาเพื่อเริ่มต้น

    ${is_element_present}=    Run Keyword And Return Status    CommonKeywords.Wait until element is ready then click element    xpath=//span[@class="mdc-button__label" and text() = "อัปโหลดแหล่งที่มา"]
    IF    not ${is_element_present}
        CommonKeywords.Wait until element is ready then click element    xpath=//button[@aria-label="ปิดกล่องโต้ตอบ"]
        CommonKeywords.Wait until element is ready then click element    xpath=//span[@class="mdc-button__label" and text() = "อัปโหลดแหล่งที่มา"]
    END

    Then CommonKeywords.Wait until page contains element then verify text  expected_text=อัปโหลดแหล่งข้อมูล
    Then CommonKeywords.Wait until element is ready then click element    locator=xpath=//span[text() = "เว็บไซต์"]
    Then CommonKeywords.Wait until element is ready then input text      locator=id=mat-input-0  text=https://policywatch.thaipbs.or.th/article/environment-21
    Then CommonKeywords.Wait until element is ready then click element    locator=xpath=//span[@class="mdc-button__label" and text() = "แทรก"]
    Then CommonKeywords.Wait until page contains element then verify element    locator=//div[@class="summary-content ng-star-inserted"]
    Then CommonKeywords.Wait until element is ready then input text      locator=xpath=//textarea[@placeholder="เริ่มพิมพ์..."]  text=สรุปข้อมูลทั้งหมดที่แนบไปภายใชใน 3 บันทัด
    Then CommonKeywords.Wait until element is ready then click element    locator=xpath=//button[@type="submit" and @aria-label="ส่ง"]
    Then CommonKeywords.Wait until page contains element then verify element    locator=//mat-card[@class="mat-mdc-card mdc-card to-user-message-card-content gmat-mdc-card"]
    Then CommonKeywords.Wait until element is ready then click element    locator=xpath=//a[@aria-label="หน้าแรกของ NotebookLM"]
    Then HomePageKeywords.NotebookLM should display home page and display message as "ยินดีต้อนรับสู่ NotebookLM"
    Then CommonKeywords.Wait until element is ready then click element    locator=xpath=//mat-icon[@class="mat-icon notranslate project-button-more-icon google-symbols mat-icon-no-color"]
    Then CommonKeywords.Wait until page contains element then verify element    locator=xpath=//mat-icon[text()="delete"]
    Then CommonKeywords.Wait until element is ready then click element    locator=xpath=//mat-icon[text()="delete"]
    Then CommonKeywords.Wait until page contains element then verify element    locator=xpath=//div[@class="delete-project-container"]
    Then CommonKeywords.Wait until element is ready then click element    locator=xpath=//button[@type="submit" and @aria-label="ยืนยันการลบ"]
    
    [Teardown]    user logout from NotebookLM platform

# As a user, I fail to login with invalid credential
#     When LoginPageKeywords.user login to NotebookLM platform with ${email} and ${invalid_password}
#     Then LoginPageKeywords.NotebookLM should display display validate login fail message as //div[@class="Ly8vae uSvLId"]

