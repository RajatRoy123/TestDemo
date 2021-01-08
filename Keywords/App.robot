*** Settings ***
Library         AppiumLibrary
Variables       ../Resources/Config.py
Variables       ../PageObjects/ContactPageObject.py

*** Keywords ***
AppLaunch
    open application  ${Server_url}  udid=${capabilities['udid']}  platformName=${capabilities['platformName']}
    ...   alias=${capabilities['alias']}     appPackage=${capabilities['appPackage']}   appActivity=${capabilities['appActivity']}

Kill Application
    close application

#Enter Name and Phone number
#    [Arguments]  ${ContactName}   ${ContactNumber}
#    input text  //android.widget.EditText[@text='Name']     ${ContactName}
#    input text  //android.widget.EditText[@text='Phone']    ${ContactNumber}

Enter Name and Phone Number
    [Arguments]  ${ContactName}  ${ContactNumber}
    input text  //android.widget.EditText[@text='Name']     ${ContactName}
    input text  //android.widget.EditText[@text='Phone']    ${ContactNumber}

Clicking Save Button
    click element  ${save}


Launching Contact Page
    wait until element is visible  ${Start}  10s
    click element  ${Start}
    wait until element is visible  ${plusbutton}  50s
    click element  ${plusbutton}
    sleep  10s
    click element  //*[@text='Phone']
    click element  ${Select}
