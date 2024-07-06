*** Settings ***
Library                Collections
Library                RequestsLibrary

Resource               ../Config/env.robot

Documentation          Suite Test Reqres API
Test Timeout           ${TIMEOUT}


*** Variables ***
${SUCCESS_STATUS}      200


*** Test Cases ***
Generate Token
    ${body}=  Create Dictionary    email=eve.holt@reqres.in   password=cityslicka
    
    Create Session    reqres    ${API_URL}
    ${resp}=    POST On Session    reqres    ${API_URL}    json=${body}
    Should Be Equal As Numbers    ${resp.status_code}    ${SUCCESS_STATUS}
    Log    ${resp.json()}
    Dictionary Should Contain Key    ${resp.json()}    token