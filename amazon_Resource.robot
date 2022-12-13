*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${URL}   http://www.amazon.com.br   
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADR}    //h1[contains(.,'Eletrônicos e Tecnologia')]      
${Categoria}     //img[@src='https://images-na.ssl-images-amazon.com/images/G/32/BR-hq/2021/img/Consumer_Electronics/Storefronts/Electronics/956.Storefront_categoria_computadores_icons_240x270.jpg']
${Console}      //img[contains(@alt,'Console Xbox Series S')]      
*** Keywords ***
Abrir o navegador
    Open Browser   browser=chrome
    Maximize Browser Window
  
Fechar o navegador
    Capture Page Screenshot
    close Browser

Acessar a home page do site Amazon.com.br 
     Go To    url=${URL}   
     Wait Until Element Is Visible   locator=${MENU_ELETRONICOS} 

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${frase}"
    Wait Until Page Contains    text=${frase}
    Wait Until Element Is Visible    locator=${HEADR}

Verificar se o título da página fica "${TITULO}"
    Title Should Be   title=${TITULO}



Verificar se aparece a categoria "Computadores e Informática"
    Wait Until Element Is Visible    locator=${Categoria}

Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=Xbox Series S

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

 Verificar o resultado da pesquisa de está listando o produto pesquisado
     Wait Until Element Is Visible    locator=//img[contains(@alt,'Console Xbox Series S')]

#  Implemetação dos testes em Bdd

 Dado que estou na home page da Amazon.com.br
     Acessar a home page do site Amazon.com.br

 Quando acessar o menu "Eletrônicos"
      Entrar no menu "Eletrônicos"

 Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
   Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"    
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
      Verificar se aparece a frase "Eletrônicos e Tecnologia"
 E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"


 Quando pesquisar pelo produto "Xbox Series S"
     Digitar o nome de produto "Xbox Series S" no campo de pesquisa
     Clicar no botão de pesquisa
 Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
        Verificar se o título da página fica "Amazon.com.br : Xbox Series S"
E um produto da linha "Xbox Series S" deve ser mostrado na página
     Verificar o resultado da pesquisa de está listando o produto pesquisado

    # implemtando nos testes 

 Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
     Wait Until Element Is Visible    locator=${Console} 



 Adicionar o produto "Console Xbox Series S" no carrinho
     Click Element    locator=${Console}  
    Click Element    locator=//input[contains(@name,'submit.add-to-cart')]            

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
   Wait Until Element Is Visible    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]


Remover o produto "Console Xbox Series S" do carrinho
    Click Element    locator=//a[contains(@data-csa-c-type,'button')]
    Click Element    locator=(//span[contains(@class,'a-declarative')])[3]

 Verificar se o carrinho fica vazio
    Wait Until Page Contains    text=Seu carrinho de compras da Amazon está vazio.

    #         implementação Bdd


Quando adicionar o produto "Console Xbox Series S" no carrinho
    Quando pesquisar pelo produto "Xbox Series S"
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
     Adicionar o produto "Console Xbox Series S" no carrinho
Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
   Adicionar o produto "Console Xbox Series S" no carrinho
   Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso


 E existe o produto "Console Xbox Series S" no carrinho
    Quando pesquisar pelo produto "Xbox Series S"
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
     Adicionar o produto "Console Xbox Series S" no carrinho


Quando remover o produto "Console Xbox Series S" do carrinho
     Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio
    
