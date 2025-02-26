*** Settings ***
Library         SeleniumLibrary
Resource        CommonKeywords.robot

*** Keywords ***
url.in.th should display home page and display message as "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expected_message}

user logout from url.in.th platform

    CommonKeywords.Wait until element is ready then click element    locator=xpath=//a[@data-bs-toggle="dropdown" and @href="#" and @class="nav-link dropdown-toggle d-none d-sm-inline-block"]
    CommonKeywords.Wait until element is ready then click element    locator=//a[@href="https://url.in.th/user/logout" and @class="dropdown-item"]
    CommonKeywords.Wait until page contains element then verify text    expected_text=คุณออกจากระบบเรียบร้อยแล้ว


    
                                   