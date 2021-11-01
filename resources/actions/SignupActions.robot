*Settings*
Documentation           Signup actions

*Keywords*
Go To Signup Form
    Go To          ${BASE_URL}/signup

    #Checkpoint
    Wait For Elements State     css=.signup-form    visible     5

Fill Signup Form
    [Arguments]     ${user}

    Fill Text       id=name         ${user}[name]
    Fill Text       id=lastname     ${user}[lastname]
    Fill Text       id=email        ${user}[email]
    Fill Text       id=password     ${user}[password]

Submit Signup Form
    Click           css=.submit-button >> text=Cadastrar

User Should Be Registered

    ${expect_message}       Set Variable        css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.
    
    Wait For Elements State         ${expect_message}       visible         5

Modal Content Shoul Be
    [Arguments]             ${expect_message}

    ${title}                Set Variable            css=.swal2-title
    ${content}              Set Variable            css=.swal2-html-container 

    Wait For Elements State       ${title}          visible         5
    Get Text                      ${title}          equal           Oops...

    Wait For Elements State       ${content}        visible         5
    Get Text                      ${content}        equal           ${expect_message}

Alert Span Should Be
    [Arguments]                   ${expected_alert}

    Wait For Elements State       css=span[class=error] >> text=${expected_alert}
    ...                           visible             5

Alert Spans Should Be
    [Arguments]                   ${expected_alerts}

    @{got_alerts}                 Create List

    ${spans}                      Get Elements                    xpath=//span[@class="error"]

    FOR     ${span}     IN      @{spans}

        ${text}             Get Text            ${span}
        Append To List      ${got_alerts}       ${text}

    END

    Lists Should Be equal   ${expected_alerts}      ${got_alerts}