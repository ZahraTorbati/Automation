*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem
Variables      vars/locator.py
Test Setup     Open browser in saucedemo

*** Variables ***
${USERNAME}      standard_user
${PASSWORD}      secret_sauce

*** Test Cases ***

Login saucedemo site and verify sorting
    Login To saucedemo Site
    Apply Filter And Verify Sorting


*** Keywords ***

Open browser in saucedemo
    Open Browser                             url=https://www.saucedemo.com/        browser=chrome
    Maximize Browser Window

Login to saucedemo site
    Input Text                                id:user-name                        ${USERNAME}
    Input Password                            id:password                         ${PASSWORD}
    Click Button                              id:login-button
    Wait Until Element Is Visible             ${products_page}

Apply filter and verify sorting
    Click Element                              ${filter}
    Select From List By Value                  ${filter}                         lohi
    Wait Until Page Contains                   Sauce Labs Onesie                 timeout=10s
    sleep                                      30s

#چرا بعد از اجرا سریع بسته میشه؟
