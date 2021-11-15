*Settings*
Documentation           BeGeek test suite

Resource                ${EXECDIR}/resources/Base.robot

Test Setup              Start Session
Test Teardown           Finish Session

*Variables*
${WHATS_VALID}      45999999999
${DESC_VALID}       Realizo automação de testes com Robot Framework utilizando a biblioteca Browser, aplicando técnicas de encapsulamento, template, laços, etc.
${COST_VALID}       100
${ALERT_WHATS}      O Whatsapp deve ter 11 digitos contando com o DDD
${ALERT_DESC}       Informe a descrição do seu trabalho
${ALERT_COST}       Valor hora deve ser numérico

*Test Cases*
Be a Geek

    ${user}             Factory User    be_geek
    Do Login            ${user}

    Go To Geek Form
    Fill Geek Form      ${user}[geek_profile]
    Submit Geek Form
    Geek Form Should Be Success

Short Description

    ${user}             Factory User    short_desc
    Do Login            ${user}
    
    Go To Geek Form
    Fill Geek Form      ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be  A descrição deve ter no minimo 80 caracteres

Long Description
    [Tags]              long_desc

    ${user}             Factory User    long_desc
    Do Login            ${user}
    
    Go To Geek Form
    Fill Geek Form      ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be  A descrição deve ter no máximo 255 caracteres

# Desafio final do módulo PRO

# 1 - WhatsApp em branco
# 2 - WhatsApp somente DDD
# 3 - WhatsApp com 10 digitos
# 4 - Descrição em branco
# 5 - Valor hora em branco
# 6 - Valor hora com alphanuméricos
# 7 - Valor hora com letras
# 8 - Valor hora com caracteres especiais

# Dica 1: Use o modelo de template de teste
# Dica 2: O login ficará melhor se for executado uma única vez para todos os comportamentos.

Validate Fields
    [Tags]              fields
    [Setup]             Suite Session Template
    
    [Template]          Do Required Fields Be Geek
    ${EMPTY}            ${DESC_VALID}       ${COST_VALID}       ${ALERT_WHATS}
    45                  ${DESC_VALID}       ${COST_VALID}       ${ALERT_WHATS}
    4599999999          ${DESC_VALID}       ${COST_VALID}       ${ALERT_WHATS}
    ${WHATS_VALID}      ${EMPTY}            ${COST_VALID}       ${ALERT_DESC}
    ${WHATS_VALID}      ${DESC_VALID}       ${EMPTY}            ${ALERT_COST}
    ${WHATS_VALID}      ${DESC_VALID}       z5z                 ${ALERT_COST}
    ${WHATS_VALID}      ${DESC_VALID}       wasd                ${ALERT_COST}
    ${WHATS_VALID}      ${DESC_VALID}       @$%#&               ${ALERT_COST}

*Keywords*
Do Required Fields Be Geek
    [Arguments]         ${whats}        ${desc}         ${cost}         ${expected_alert}

    ${form}             Create Dictionary
    ...                 whats=${whats}              desc=${desc}
    ...                 printer_repair=Não          work=Remoto         cost=${cost}

    Fill Geek Form      ${form}
    Submit Geek Form

    Alert Span Should Be  ${expected_alert}