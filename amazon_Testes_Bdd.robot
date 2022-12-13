*** Settings ***
Documentation    nessa suite estamos  passando o scrip em Bdd , do teste  da amazon.com.br
Resource    amazon_Resource.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador


*** Test Cases ***
 
Caso de teste 01 -Acesso ao menu "Eletrônicos"
       [Documentation]       nesse caso de teste vamos testar o  menu eletronicos da amazon.com.br
    [Tags]                menu
     Dado que estou na home page da Amazon.com.br
      Quando acessar o menu "Eletrônicos"
     Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
      E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
      E a categoria "Computadores e Informática" deve ser exibida na página


 Caso de teste 02 - Pesquisa de um Produto
     [Documentation]   nesse  caso de  teste vamos testar  a busca  de um produto no site  da amazon.com.br
     [Tags]    busca_produtos
     Dado que estou na home page da Amazon.com.br
     Quando pesquisar pelo produto "Xbox Series S"
     Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
      E um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
       [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
         [Tags]             adicionar_carrinho
          Dado que estou na home page da Amazon.com.br
    
          Quando adicionar o produto "Console Xbox Series S" no carrinho
          Então o produto "Console Xbox Series S" deve ser mostrado no carrinho

Caso de Teste 04 - Remover Produto do Carrinho
      [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
      [Tags]             remover_carrinho
          Dado que estou na home page da Amazon.com.br
            E existe o produto "Console Xbox Series S" no carrinho
            Quando remover o produto "Console Xbox Series S" do carrinho
             Então o carrinho deve ficar vaziO
