*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem
Variables      vars/locator.py
Test Setup     Open browser in ultimateqa


*** Test Cases ***

show free courses
    Go ON Education Tab
    Select Free Courses And Go To Sign In Page


Go sign in ultimateqa page
    Go ON Education Tab
    Select Free Courses And Go To Sign In Page
    Tap On Sign In


*** Keywords ***
Open browser in ultimateqa
    Open Browser                               url=https://ultimateqa.com/automation#        browser=chrome
    Maximize Browser Window


Go ON education tab
    Wait Until Element Is Visible              ${education_menu}                             timeout=5s
    Mouse Over                                 ${education_menu}
    Wait Until Element Is Visible              ${free_courses}                               timeout=5s


select free courses and go to sign in page
    Click Element                              ${free_courses}
    Wait Until Location Is                     ${courses_collection}

tap on sign in

    Mouse Over                                 ${sign_in}
    Click Element                              ${sign_in}
    Wait Until Location Is                     ${sign_in_link}

select the search button
    Open Browser                               url=https://courses.ultimateqa.com/collections     timeout=5s
    Wait Until Element Is Visible              ${product_title}
    Click Element                              ${search_input}

    


