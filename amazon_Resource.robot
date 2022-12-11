*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${URL}   http://www.amazon.com.br   
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADR}    //h1[contains(.,'Eletrônicos e Tecnologia')]      
${Categoria}     //img[@src='https://images-na.ssl-images-amazon.com/images/G/32/BR-hq/2021/img/Consumer_Electronics/Storefronts/Electronics/956.Storefront_categoria_computadores_icons_240x270.jpg']
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