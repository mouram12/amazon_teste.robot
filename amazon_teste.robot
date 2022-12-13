*** Settings ***
Documentation    Essa suit testa   o site da amazon.com.br
Resource         amazon_Resource.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador




*** Test Cases ***
Caso de teste 01 - Acesso ao menu "Eletrônicos"
      [Documentation]    Esse teste verifica  o  menu eletronicos do site amazon.com.br
      [Tags]             Menu
    
     Acessar a home page do site Amazon.com.br
     Entrar no menu "Eletrônicos"
     Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
     Verificar se aparece a frase "Eletrônicos e Tecnologia"
     Verificar se aparece a categoria "Computadores e Informática"


 Caso de teste 02 - Pesquisa de um Produto
     [Documentation]    Esse teste  verifica a busca de  um produto no site da amazon.com.br
    [Tags]             Busca de produtos
      Acessar a home page do site Amazon.com.br
      Digitar o nome de produto "Xbox Series S" no campo de pesquisa
      Clicar no botão de pesquisa
      Verificar o resultado da pesquisa de está listando o produto pesquisado


Caso de Teste 03 - Adicionar Produto no Carrinho
  [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
  [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso


Caso de teste Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
     [Tags]             remover_carrinho
      Acessar a home page do site Amazon.com.br
        Digitar o nome de produto "Xbox Series S" no campo de pesquisa
        Clicar no botão de pesquisa
       Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
        Adicionar o produto "Console Xbox Series S" no carrinho
        Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
        Remover o produto "Console Xbox Series S" do carrinho
       Verificar se o carrinho fica vazio  