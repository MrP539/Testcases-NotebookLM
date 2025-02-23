*** Settings ***
Library         SeleniumLibrary
Resource        CommonKeywords.robot

*** Keywords ***
user login to NotebookLM platform with ${username} and ${password}
    CommonKeywords.Wait until element is ready then input text        id=identifierId            ${username}
    CommonKeywords.Wait until element is ready then click element     xpath=//span[@jsname="V67aGc" and text()="Next"]
    CommonKeywords.Wait until element is ready then input text        name=Passwd         ${password}
    CommonKeywords.Wait until element is ready then click element     xpath=//span[@jsname="V67aGc" and text()="Next"]

NotebookLM should display display validate login fail message as ${locator}
    CommonKeywords.Wait until page contains element then verify element    ${locator}

