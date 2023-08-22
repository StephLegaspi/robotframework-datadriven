*** Settings ***
Library             SeleniumLibrary
Suite Setup         Open the browser
Suite Teardown      Close Browser
Test Template       Login


*** Variables ***
${URL}                      https://demo.nopcommerce.com/
${browser}                  chrome
${loginLinkLocator}         xpath=//a[@class='ico-login']
${emailInputBox}            id=Email
${passwordInputBox}         id=Password
${loginButton}              xpath=//button[@class='button-1 login-button']


*** Test Cases ***          ${username}     ${password}
Valid email address valid password                   admindemo12@gmail.com              password1234
Invalid email address valid password                 invalidadmindemo12@gmail.com       password1234


*** Keywords ***
Login
    [Arguments]     ${username}     ${password}
    wait until element is visible       ${loginLinkLocator}
    click element   ${loginLinkLocator}
    wait until element is visible     ${emailInputBox}
    input text      ${emailInputBox}        ${username}
    input text      ${passwordInputBox}     ${password}
    click button    ${loginButton}


Open the browser
    open browser        ${URL}      ${browser}
    maximize browser window
