*Settings*
Documentation           Login test suite

Resource                ${EXECDIR}/resources/Base.robot

Test Setup              Start Session
Test Teardown           Finish Session

*Test Cases*
User Login

    Go To Login Page
    Fill Credentials                karllinhadeoliveira@live.com        pwd123
    Submit Credentials
    User Should Be Logged In        Karla Daiany

Empty Email
    
    Go To Login Page
    Fill Password          pwd123    
    Submit Credentials
    Alert Span Should Be   E-mail obrigatório

Empty Password

    Go To Login Page
    Fill Email  karllinhadeoliveira@live.com
    Submit Credentials
    Alert Span Should Be  Senha obrigatória

Required Fields
    ${expected_alerts}      Create List
    ...                     E-mail obrigatório
    ...                     Senha obrigatória

    Go To Login Page
    Submit Credentials
    Alert Spans Should Be  ${expected_alerts}
