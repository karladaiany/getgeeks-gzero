*Settings*
Documentation           Attempt BeGeek test suite

Resource                ${EXECDIR}/resources/Base.robot

Suite Setup             Suite Session Template

Test Template           Do Required Fields Be Geek

*Variables*
${WHATS_VALID}          45999999999
${DESC_VALID}           Realizo automação de testes com Robot Framework utilizando a biblioteca Browser, aplicando técnicas de encapsulamento, template, laços, etc.
${COST_VALID}           100

*Test Cases*
Empty desc              ${EMPTY}            ${DESC_VALID}       ${COST_VALID}       O Whatsapp deve ter 11 digitos contando com o DDD
Whats only ddd          45                  ${DESC_VALID}       ${COST_VALID}       O Whatsapp deve ter 11 digitos contando com o DDD
Whats only number       4599999999          ${DESC_VALID}       ${COST_VALID}       O Whatsapp deve ter 11 digitos contando com o DDD
Empty whats             ${WHATS_VALID}      ${EMPTY}            ${COST_VALID}       Informe a descrição do seu trabalho
Empty cost              ${WHATS_VALID}      ${DESC_VALID}       ${EMPTY}            Valor hora deve ser numérico
Cost alpha              ${WHATS_VALID}      ${DESC_VALID}       z5z                 Valor hora deve ser numérico
Cost letters            ${WHATS_VALID}      ${DESC_VALID}       wasd                Valor hora deve ser numérico
Cost special chars      ${WHATS_VALID}      ${DESC_VALID}       @$%#&               Valor hora deve ser numérico

*Keywords*
Do Required Fields Be Geek
    [Arguments]         ${whats}        ${desc}         ${cost}         ${expected_alert}

    ${form}             Create Dictionary
    ...                 whats=${whats}              desc=${desc}
    ...                 printer_repair=Não          work=Remoto         cost=${cost}

    Fill Geek Form      ${form}
    Submit Geek Form

    Alert Span Should Be  ${expected_alert}

    Take Screenshot       fullPage=True

Suite Session Template
    
    New Browser         chromium        headless=False      slowMo=00:00:00.5
    New Page            ${BASE_URL}

    ${user}             Factory User    be_geek
    Do Login            ${user}

    Go To Geek Form