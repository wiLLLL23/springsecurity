##Projeto simples usando Spring MVC e Spring Security

  O foco dessa pequena aplicação é o Spring Security, nela estou mostrando como configurar de modo programático
  o spring security sem utilização daqueles arquivos .xml deixando o código mais centralizado.
  Para mostrar o spring security em funcionamento utilizei o spring MVC que é um do frameworks action based mais
  usado no mundo eu gosto de dizer isso!!!
  
##Fazendo o projeto funcionar sem complicações

Para fazer o projeto funcionar é necessario apenas uma modificação na classe **DataBaseConfig.java**
 
- Vá até essa classe br.com.tmvolpato.simplesecurity.config.**DataBaseConfig**

-  Altere esse trecho de código **dataSource.setUrl("jdbc:hsqldb:file://home//volpato//hsqldb//simplesecurityDB")**

- Usa Linux siga esse padrão: dataSource.setUrl("jdbc:hsqldb:file://home//seu_usuario//hsqldb//nome_do_DB");

- Usa Windows siga esse padrão:  dataSource.setUrl("jdbc:hsqldb:file:C:\\\hsqldb\\\nome_do_DB");
