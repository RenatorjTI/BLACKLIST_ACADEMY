*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
Library    FakerLibrary    locale=pt_BR

*** Keywords ***

Gerar Centro de Custo Da Lista
    ${centrodecusto}=    Create List    Oepracional    Recurso Humano    Operações    Marketing & LG    Gestao & SL    Desenvolvimento & SK    Operações HID
    ${cost}=    FakerLibrary.Random Element    ${centrodecusto}
    Log    ${cost}
    RETURN    ${cost}

Gerar Nome Centro de Custo
    ${word1}=    FakerLibrary.Word
    ${word2}=    FakerLibrary.Word
    ${costCentername}=    Catenate    ${word1}    ${word2}
    RETURN    ${costCentername}

    