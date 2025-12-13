*** Settings ***
Resource    ../../resources/departamento.resource
Resource    ../../resources/common.resource
Resource    ../../resources/login.resource
Resource    ../../resources/departamento.resource

Test Setup    Abrir Navegador
Test Teardown    Fechar Navegador

*** Test Cases ***

Cenario 01: Editar Departamento com Sucesso
    [Documentation]    Realiza login, navega até Departamento e edita um departamento 

    Realizar login
    Verificar Redirecionamento Para Home
    Verificar Elemento Cadastros Visivel
    Acessar Pagina Departamento
    # Garantir Que Lista De Departamentos Carregou
    Editar Departamento
    Alterar Nome Do Departamento
    Alterar Centro De Custo
    Salvar Edicao
   

    
    
    