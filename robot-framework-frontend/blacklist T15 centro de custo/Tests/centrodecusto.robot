*** Settings ***
Resource    ../resources/common.resource
Resource    ../resources/login.resource
Resource    ../resources/centrodecusto.resource


Suite Setup    Abrir Navegador
Suite Teardown    Fechar Navegador

*** Test Cases ***
Cenario 01: Cadastrar e Editar Centro de Custo
    Realizar login
    Verificar Redirecionamento Para Home
    Verificar Elemento Cadastros Visivel
    Acessar Pagina Centro de Custo
    Cadastrar Novo Centro de Custo
    Editar Primeiro Centro de Custo
    






