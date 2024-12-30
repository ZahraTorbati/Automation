*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem
Variables      vars/locator.py
Test Setup     Open browser in saucedemo

*** Variables ***

${USERNAME}      standard_user
${PASSWORD}      secret_sauce

*** Test Cases ***

Adding a product to Shopping cart and fill name and address
    Login To Saucedemo Site
    Add To Shopping Card
    Go To Checkout Page And Fill Your Info
    Check Your Shopping Card


*** Keywords ***

Open browser in saucedemo
    Open Browser                              url=https://www.saucedemo.com/        browser=chrome
    Maximize Browser Window

Login to saucedemo site
    Input Text                                id:user-name                        ${USERNAME}
    Input Password                            id:password                         ${PASSWORD}
    Click Button                              id:login-button
    Wait Until Element Is Visible             ${products_page}

Add to shopping card
    Click Button                             id:add-to-cart-sauce-labs-backpack
    Click Button                             id:add-to-cart-sauce-labs-bike-light
    Click Element                            id:shopping_cart_container
    Wait Until Element Is Visible            id:checkout                          timeout=10s

Go to checkout page and fill your info
        Click Button                         id:checkout
        Wait Until Element Is Visible        id:first-name
        Input Text                           id:first-name                         zahra
        Input Text                           id:last-name                          torbati
        Input Text                           id:postal-code                        1473738571
        Click Button                         id:continue
        sleep                                7s

check your shopping card
    Wait Until Element Is Visible            ${total_price}                         timeout=10s
    Wait Until Page Contains                 43.18


