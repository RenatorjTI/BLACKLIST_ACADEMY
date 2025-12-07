*** Settings ***
Library    SeleniumLibrary
Resource    ../config/dev.robot
Resource    login.resource
Resource    generate_random.resource

*** Keywords ***
Acessar Pagina Centro de Custo
    Click Element    id:Cadastros

    Wait Until Element Is Visible    id:Centro de Custo    timeout=10s
    Click Element    id:Centro de Custo

    Wait Until Location Is    ${BASE_URL_UI}/costCenter    timeout=10s
    Location Should Be    ${BASE_URL_UI}/costCenter 

    Wait Until Element Is Visible    xpath://h1[text()='Centro de Custo']    timeout=10s
    Element Text Should Be    xpath://h1[text()='Centro de Custo']    Centro de Custo


Cadastrar Novo Centro de Custo
    Wait Until Element Is Visible    xpath://button[text()='Novo Centro de Custo']    timeout=10s
    Click Button    xpath://button[text()='Novo Centro de Custo']

    Wait Until Element Is Visible    xpath://h2[text()='Novo Centro de Custo']    timeout=10s
    Element Should Be Visible    xpath://h2[text()='Novo Centro de Custo']

    ${costcenterName}    Gerar Centro de Custo da Lista
    Input Text    id:costCentername   ${costcenterName}

    Wait Until Element Is Visible    xpath=//select    timeout=10s
    Sleep    2s    

    ${itens}=    Get List Items    xpath=//select

    ${itens_filtrados}=    Create List

    FOR    ${item}    IN    @{itens}
        Run Keyword If    '${item}' != '' and '${item}' != 'Diretoria'
        ...    Append To List    ${itens_filtrados}    ${item}
    END  

    ${primeiro}=    Get From List    ${itens_filtrados}    0

    Select From List By Label    xpath=//select    ${primeiro}

    Wait Until Element Is Visible    xpath://button[text()='Salvar']    timeout=10s
    Click Button    xpath://button[text()='Salvar']

Editar Primeiro Centro de Custo
    Wait Until Element Is Visible    xpath://ul    timeout=10s
    

    Wait Until Element Is Visible    xpath://ul/li[1]//button[@id='edit']    timeout=10s
    Click Button    xpath://ul/li[1]//button[@id='edit']

    Wait Until Element Is Visible    xpath://h2[text()='Editar Centro de Custo']    timeout=10s
    Element Should Be Visible    xpath://h2[text()='Editar Centro de Custo']

    Sleep    5s

    ${costcenterName}    Gerar Nome Centro de Custo
    Input Text    id:costcenterName    ${costcenterName}

    Wait Until Element Is Visible    id:Diretoria    timeout=10s

    ${itens}=    Get List Items    id:Diretoria

    ${itens_filtrados}=    Create List

    FOR    ${item}    IN    @{itens}
        Run Keyword If    '${item}' != '' and '${item}' != 'Diretoria'
        ...    Append To List    ${itens_filtrados}    ${item}
    END

    ${primeiro}=    Get From List    ${itens_filtrados}    0

    Select From List By Label    id:Diretoria    ${primeiro}

    Wait Until Element Is Visible    xpath://button[text()='salvar']    timeout=10s
    Click Button    xpath://button[text()='Salvar']

    Sleep    10s

    Validar Primeiro Item Da Lista    ${costcenterName}
    

Validar Primeiro Item Da Lista
    [Arguments]    ${nome_esperado}
    Wait Until Element Is Visible    xpath://ul/li[1]/p    timeout=10s
    ${nome_atual}=    Get Text    xpath://ul/li[1]/p
    Should Be Equal    ${nome_atual}    ${nome_esperado} 




    






