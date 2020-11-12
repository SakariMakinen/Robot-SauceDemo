*** Settings ***
Resource            resource.robot

Suite Setup         Prepare Browser
#Suite Teardown      Close Browser 

Test Setup          Open Obstacle
Test Teardown       Verify Solved

*** Test Cases ***

TWINS
    [Tags]  12952
    Wait Until Page Contains Element    xpath=(//a[@id="id"])[2]
    Click Element                       xpath=(//a[@id="id"])[2]
    Verify Solved

Math
    [Tags]      32403
    Wait Until Element Is Visible   xpath=//label[@id='no1']
    ${first}      Get Text      id=no1
    ${second}     Get Text      id=no2
    ${symbol}     Get Text      id=symbol1
    ${result}     Evaluate      ${first}${symbol}${second}
    Input Text      id=result       ${result}
    Log To Console  first: ${first}

Wait a moment
    [Tags]  33678
    Click Button    id=one
    Wait Until Element Is Enabled   id=two      2 minutes
    Click Button    id=two

Table Search
    [Tags]  41036 
    ${result}   Run Keyword And Return Status   Table Should Contain    id=randomTable     15    
    Input Text   id=resulttext   ${result}

Tricentis Tosca Olympics 

# Its fails some cases. Maybe delay issue.
# Passes if player pass only one tree and then moves other side
# Fails more often when Player stays longer time in one side and passes many trees

    [Tags]  82018
    
    Wait Until Page Contains Element     xpath=//a[@id='start']
    Click Element    xpath=//a[@id='start']
    Wait Until Page Contains Element    xpath=//div[@class='instructions']
    
    Wait Until Element Does Not Contain  xpath=//div[@class='instructions']   Prepare for the start!
    ${action}    Get Text    xpath=//div[@class='instructions']

    Run Keyword If  '${action}'=='Go right!'    Move Player     ARROW_RIGHT     ${action}
    Run Keyword If  '${action}'=='Go left!'     Move Player     ARROW_LEFT      ${action}
  
*** Keywords ***

Move Player
    [Arguments]     ${keyPress}     ${action}
    Press Keys   None    ${keyPress}

    Wait Until Element Does Not Contain  xpath=//div[@class='instructions']   ${action}
    ${action}    Get Text    xpath=//div[@class='instructions']
    Run Keyword If  '${action}'=='Go right!'    Move Player     ARROW_RIGHT     ${action}
    Run Keyword If  '${action}'=='Go left!'     Move Player     ARROW_LEFT      ${action}
