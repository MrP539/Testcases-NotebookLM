*** Settings ***
Library         SeleniumLibrary
Resource        CommonKeywords.robot

*** Keywords ***
NotebookLM should display home page and display message as "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expected_message}

user logout from NotebookLM platform
    SeleniumLibrary.Open Browser  https://accounts.google.com/Logout?ec=GAdAmgU&hl=th    browser=chrome