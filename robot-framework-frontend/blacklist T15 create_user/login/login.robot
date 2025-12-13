*** Settings ***
Resource    ../../resources/login.resource
Resource    ../../resources/common.resource


Suite Setup        Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Cases ***
Cenario 01: Realizar login com Sucesso
    Realizar login
    Verificar Redirecionamento Para Home
    Verificar Elemento Cadastros Visivel

    
    
