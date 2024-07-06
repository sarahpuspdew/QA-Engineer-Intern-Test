*** Settings ***
Library                SeleniumLibrary

Resource               ../Config/env.robot
Resource               ../Object Repository/Keyword/key_common.robot
Resource               ../Object Repository/Keyword/key_login.robot

Documentation          Suite Test Login to Paper.id Website
Test Timeout           ${TIMEOUT}


*** Variables ***
${wrong_email}         kandidat@gmail.com
${wrong_pass}          paper_id

${successful_type}     successful
${unsuccessful_type}   unsucessful


*** Test Cases ***
Successful Login
    Go to Login Page
    Input Email in Login Page    ${EMAIL}    ${successful_type}
    Input Password in Login Page    ${PASSWORD}    ${successful_type}
    Verify Login Success

Unsuccessful Login - Wrong Email
    Go to Login Page
    Input Email in Login Page    ${wrong_email}    ${unsuccessful_type}

Unsuccessful Login - Wrong Password
    Go to Login Page
    Input Email in Login Page    ${EMAIL}    ${successful_type}
    Input Password in Login Page    ${wrong_pass}    ${unsuccessful_type}
