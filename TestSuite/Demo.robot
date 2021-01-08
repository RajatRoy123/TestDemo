*** Settings ***
Library     AppiumLibrary
Variables   ../PageObjects/ContactPageObject.py
Resource    ../Keywords/App.robot
Library     ../Resources/Generate_Data.py
Variables   ../Resources/Config.py

Test Setup  run keyword  ApLanuchContact
Test Teardown  run keyword  Kill Application



*** Test Cases ***
TestCase01-LaunchTheApplication
    [Documentation]  This test case is related Launch Application
    [Tags]  Regression   Message
    AppLaunch

TestCase02-AddContact
    [Tags]  Sanity   Contact  Proxima  Positive
    Launching Contact Page
    ${ContactName} =   RandomString
    ${ContactNumber} =  Randomnumber
#    Enter Name and Phone number    ${ContactName}   ${ContactNumber}
    Enter Name and Phone Number  ${ContactName}   ${ContactNumber}
    Clicking Save Button



TestCase03-AddContact
    AppLaunch
    wait until element is visible  ${Start}  10s
    click element  ${Start}
    wait until element is visible  ${plusbutton}  50s
    click element  ${plusbutton}
    sleep  10s
    click element  //*[@text='Phone']
    click element  ${Select}
    input text  //android.widget.EditText[@text='Name']     ${ContactNames}[1]
    input text  //android.widget.EditText[@text='Phone']    ${ContactNumbers}[1]
    click element  ${save}
    log     Created Contact
    log to console  Created contact 1

Test04-ScrollusingSwipe
    wait until element is visible  ${Start}  10s
    click element  ${Start}
    wait until element is visible  ${plusbutton}  50s
    FOR   ${i}   IN RANGE  1   5
        swipe  520  1432  620  650  300

    END

    @list    get webelements  ${start}
        ${value}  get element attribute  ${list}[2]   text
    ${check}   run keyword and return status  should be equal  ${value}   ${ActualValue}
    run keyword if  '${check}' == 'True'   click element  ${list}[2]
    ...     ELSE    log   Contact not matched



Test05-CreateContactinloop
    wait until element is visible  ${Start}  10s
    click element  ${Start}
    wait until element is visible  ${plusbutton}  50s
    ${length} =  get length  ${ContactNames}
    FOR   ${i}   IN RANGE  1   ${length}
        input text  //android.widget.EditText[@text='Name']     ${ContactNames}[${i}]
        input text  //android.widget.EditText[@text='Phone']    ${ContactNumbers}[${i}]
    END











Test04-InitiateCallafterScroll
    wait until element is visible  ${Start}  10s
    click element  ${Start}
    FOR    ${INDEX}    IN RANGE    1    30
        swipe  520  1432  620  650  300
        ${visible}  run keyword and return status  element should be visible   //android.widget.TextView[@text='Ani-kol']
        exit for loop if  '${visible}'=='True'
    END
    click element  //android.widget.TextView[@text='Ani-kol']
    click element  id=com.samsung.android.contacts:id/expand_call_text
    sleep  10s
    click element  id=com.samsung.android.incallui:id/end_call_button