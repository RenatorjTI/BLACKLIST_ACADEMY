*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../config/dev.robot
Resource    login.resource

*** Keywords ***
Acessar Pagina Departamento
    Click Element    id:Cadastros

    Wait Until Element Is Visible    id:Departamento    timeout=10s
    Click Element    id:Departamento

    Wait Until Location Is    ${BASE_URL_UI}/department    timeout=10s
    Location Should Be    ${BASE_URL_UI}/department

    Wait Until Element Is Visible    xpath://h1[text()='Departamento']    timeout=10s
    Element Text Should Be    xpath://h1[text()='Departamento']    Departamento


Editar Departamento
    wait Until Element Is Visible    id=edit    timeout=10s
    Click Button    id=edit

Alterar Nome Do Departamento
    Wait Until Element Is Visible    id:departmentName
    Clear Element Text               id:departmentName

    ${rand}=    Generate Random String    10    [LETTERS]

    ${novo_nome}=    Set Variable    Departamento ${rand}

    Set Test Variable    ${NOVO_NOME_DEPARTAMENTO}    ${novo_nome}

    Input Text    id:departmentName    ${novo_nome}

    Log To Console    \nNovo Departamento gerado: ${novo_nome}

Alterar Centro De Custo
    ${opcoes}=    Get List Items    id:Centro de Custo
    ${quantidade}=    Get Length    ${opcoes}
    
    Remove From List    ${opcoes}    0

    ${index}=    Evaluate    __import__('random').randint(0, len(${opcoes})-1)
    ${opcao_escolhida}=    Set Variable    ${opcoes}[${index}]

    Log To Console    \nCentro de Custo selecionado: ${opcao_escolhida}

    Select From List By Label    id:Centro de Custo    ${opcao_escolhida}

Salvar Edicao
    Wait Until Element Is Visible    xpath://button[text()='Salvar']    timeout=10s
    Click Button    xpath://button[text()='Salvar']

    

