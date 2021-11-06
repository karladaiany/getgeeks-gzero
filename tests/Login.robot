*Settings*
Documentation           Login test suite

Resource                ${EXECDIR}/resources/Base.robot

Test Setup              Start Session
Test Teardown           Finish Session

*Test Cases*
User Login

    ${user}                         Factory User Login

    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    User Should Be Logged In        ${user}

Incorrect Pass
    [Tags]          inv_pass

    ${user}         Create Dictionary       email=karla@hotmail.com     password=abc123

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Modal Content Shoul Be  Usuário e/ou senha inválidos.

User Not Found
    [Tags]          user_404

    ${user}         Create Dictionary       email=karla@404.net     password=abc123

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Modal Content Shoul Be  Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]          inv_email

    ${user}         Create Dictionary       email=karla.com.br     password=abc123

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Should Be Type Email



#Empty Email
    
    # Go To Login Page
    # Fill Password          pwd123    
    # Submit Credentials
    # Alert Span Should Be   E-mail obrigatório

#Empty Password

    # Go To Login Page
    # Fill Email  karllinhadeoliveira@live.com
    # Submit Credentials
    # Alert Span Should Be  Senha obrigatória

#Required Fields 
    # ${expected_alerts}      Create List
    # ...                     E-mail obrigatório
    # ...                     Senha obrigatória

    # Go To Login Page
    # Submit Credentials
    # Alert Spans Should Be  ${expected_alerts}
