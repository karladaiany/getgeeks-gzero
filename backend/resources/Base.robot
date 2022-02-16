*Settings*
Documentation           Base test

Library                 RequestsLibrary
Library                 factories/Users.py

Resource                routes/GeeksRoute.robot
Resource                routes/SessionsRoute.robot
Resource                routes/UsersRoute.robot
Resource                Helpers.robot


*Variables*
${API_USERS}            https://getgeeks-users-karla.herokuapp.com
${API_GEEKS}            https://getgeeks-geeks-karla.herokuapp.com