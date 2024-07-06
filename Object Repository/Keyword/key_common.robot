*** Settings ***
Library        OperatingSystem
Library        SeleniumLibrary
Library        Collections

Resource       ../../Config/env.robot
# Resource       ../Keyword/key_login.robot


*** Keywords ***
# Open browser and set window size
Open Browser and Set Window Size
    Open Browser    ${WEB_URL}    ${BROWSER}
    Set Window Size	    ${WINDOW_WIDTH}     ${WINDOW_HEIGHT}

# Logout and Close Browser
#     [Timeout]    ${TIMEOUT}
#     ${present}=    Run Keyword And Return Status    Page Should Contain Element    ${btn_user}
#     Run Keyword If    ${present}==True    Logout
#     Close All Browsers

# Logout
#     [Timeout]    ${TIMEOUT}
#     Click Button    ${btn_user}
#     Wait Until Element Is Visible    ${btn_logout}
#     Click Element    ${btn_logout}
#     Wait Until Location Contains   ${WEB_URL}
#     Page Should Contain Element     ${img_logo}