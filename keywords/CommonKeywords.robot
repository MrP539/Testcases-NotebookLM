*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Wait until element is ready then click element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    5x    2s    Click Element    ${locator}

Wait until element is ready then input text
    [Arguments]    ${locator}    ${text}
    Wait Until Keyword Succeeds    5x    2s    Input Text    ${locator}    ${text}

Wait until page contains element then verify text
    [Arguments]    ${expected_text}
    Wait Until Keyword Succeeds    5x    2s    Page Should Contain        ${expected_text}

Wait until page contains element then verify element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds   7x    2s  Page Should Contain Element        ${locator}

Wait until page contains element then verify not element
   [Arguments]    ${locator}
    Wait Until Keyword Succeeds    7x    2s  Page Should Not Contain Element    ${locator}