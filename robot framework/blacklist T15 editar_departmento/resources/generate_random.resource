*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
Library    FakerLibrary    locale=pt_BR

*** Keywords ***

Gerar Departamento Da Lista
    ${lista_departamentos}=    Create List    Financeiro    RH    TI    Vendas    Marketing    Operações
    ${dept}=    FakerLibrary.Random Element    ${lista_departamentos}
    Log    ${dept}
    RETURN    ${dept}

Gerar Nome Departamento
    ${word1}=    FakerLibrary.Word
    ${word2}=    FakerLibrary.Word
    ${nome_departamento}=    Catenate    ${word1}    ${word2}
    RETURN    ${nome_departamento}
