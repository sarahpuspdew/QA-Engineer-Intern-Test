*** Settings ***
Library                OperatingSystem
Library                SeleniumLibrary
Library                Collections

Resource               ../../Config/env.robot
Resource               ../../Object Repository/Keyword/key_common.robot
Resource               ../../Object Repository/Locator/General/loc_login.robot


*** Variables ***
${msg_wrong_email}     Email tidak terdaftar. Silahkan registrasi terlebih dahulu
${msg_wrong_pass}      Kata Sandi yang Anda Masukkan Salah


*** Keywords ***
Go to Login Page
    Open Browser and Set Window Size
    Wait Until Element Is Visible    ${title_login}
    Element Should Be Visible    ${input_email}
    Element Should Be Visible    ${btn_next_email}
    Capture Page Screenshot

Input Email in Login Page
    [Timeout]    ${TIMEOUT}
    [Arguments]    ${email}    ${type}
    Input Text    ${input_email}    ${email}
    Capture Page Screenshot
    Click Button    ${btn_next_email}
    Verify Email    ${type}

Verify Email
    [Timeout]    ${TIMEOUT}
    [Arguments]    ${type}
    IF  '${type}' == 'successful'
        Element Should Not Be Visible    ${popup_error}
        Sleep    2s
        Wait Until Element Is Visible    ${input_password}
        Element Should Be Visible    ${input_password}
    ELSE
        Sleep    2s
        Element Should Be Visible    ${popup_error}
        Element Should Contain    ${popup_error_text}    ${msg_wrong_email}    
    END
    Capture Page Screenshot

Input Password in Login Page
    [Timeout]    ${TIMEOUT}
    [Arguments]    ${password}    ${type}
    Input Text    ${input_password}    ${password}
    Capture Page Screenshot
    
    ${next_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${btn_next_pass}
    ${login_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${btn_login}
    IF    '${next_visible}' == 'True'
        Click Button    ${btn_next_pass}
    END
    IF    '${login_visible}' == 'True'
        Click Button    ${btn_login}  
    END

    Verify Password    ${type}

Verify Password
    [Timeout]    ${TIMEOUT}
    [Arguments]    ${type}
    IF  '${type}' == 'successful'
        Element Should Not Be Visible    ${msg_error_login}
    ELSE
        Sleep    2s
        Element Should Be Visible    ${msg_error_login}
        Element Should Contain    ${msg_wrong_pass_title}    ${msg_wrong_pass}
    END
    Capture Page Screenshot

Verify Login Success
    [Timeout]    ${TIMEOUT}
    [Arguments]    ${email}=${EMAIL}
    Wait Until Keyword Succeeds    3x    10s    Wait Until Location Does Not Contain    /login
    Location Should Contain    /dashboardv2
    Element Should Be Visible    ${btn_user}
    Capture Page Screenshot