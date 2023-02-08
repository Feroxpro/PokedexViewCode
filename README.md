# PokedexViewCode

Projeto criado totalmente em viewCode, e padrão de arquitetura MVC
utilizei o gerenciador de dependência SPM para usar as bibliotecas

* Alamofire,  para realizarmos as requisições da API de maneira
mais abrangente e robusta.

* ColorKit que busca a cor dominante de uma UIimageView e aplica a cor de fundo que no caso foi em todas as views da UICollectionView.

* SDWebImage que faz o download das imagens a partir de suas URL`s retornadas da API e as injeta na memória cache onde ela fica armazenada 
por três dias para que não seja necessário baixar em toda abertura de APP.

* SnapKit para aplicar o autolayout que do meu ponto de vista mais rápido e fácil e menos verboso.

No app sempre foi utilizando boas práticas e cleancode ao final foi realizado o code review e finalizando inseri o app na plataforma GitHub.
