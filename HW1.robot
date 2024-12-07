*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem
Variables      vars/locator.py
Test Setup     Open browser in ultimateqa


*** Test Cases ***
show free courses
    Go ON Education Tab
    select free courses

sign in ultimateqa
    Go ON Education Tab
    Tap on sign in

*** Keywords ***
Open browser in ultimateqa
    ${executable_path}                         Normalize Path                            ${curdir}/drivers/chromedriver
    Open Browser                               url=https://courses.ultimateqa.com        browser=chrome
    ...                                        service=executable_path='${}'
    Maximize Browser Window
    Wait Until Page Contains Element           ${logo_image}
    Wait Until Page Contains Element           ${menu_items}

Go ON education tab
    Wait Until Page Contains Element           ${education_menu}

select free courses
    Location Should Be                         ${courses_collections}
    Wait Until Page Contains Element           ${courses_link_locator}

tap on sign in
    Click Link                                 ${sign_in_link}
    Location Should Contain                    ${sign_in_link}
    Wait Until Page Contains Element           ${heading_sign_in_page}

    


