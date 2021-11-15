*Settings*
Documentation           Test Helpers

*Keywords*
Add User From Database
    [Arguments]         ${user}

    Connect To Postgres
    Insert User         ${user}    
    Disconnect From Database

Do Login
    [Arguments]         ${user}

    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    User Should Be Logged In   ${user}

Suite Session Template
    
    New Browser         chromium        headless=False      slowMo=00:00:00.5
    New Page            ${BASE_URL}

    ${user}             Factory User    be_geek
    Do Login            ${user}

    Go To Geek Form