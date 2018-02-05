## DNS_SCAN ##

Este repositório foi criado para armazenar a ferramenta de escaneamento de DNS (catdns), a qual ja possui algumas wordlists com muitas palavras, porém pode ser usada qualquer wordlist que esteja salva no seu computador. Esta ferramenta concatena comandos com as palavras da wordlist para saber se o host existe ou nao em um determinado dominio. Esta ferramenta tambem possui comandos para que encontre arquivos e diretorios, para executar o whois e tambem para fazer trasnferência de zona de um determinado host.
É uma ferramenta que gera ruidos no servidor e que nao possui nenhuma segurança por default. 

## Modo de uso ##
Para utilizaar essa ferramenta use o git para importar este repositorio no linux, dê permissão de execução para o arquivo usando o comando (chmod +x catdns), depois basta executar o arquivo e passar a worlist como argumento, com o comando de execuçao (./catdns wordlist.txt).

|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|  
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| .. DNS HACKER v1.0 .. |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|  
|-|-|-|-|-|-|-|-|-|-| Marco Antonio Lima -- markinlimac@gmail.com |-|-|-|-|-|-|-|-|-|-|  
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|  

1 - DNS DIRETO  
2 - DNS REVERSO  
3 - TRANSFERENCIA DE ZONA  
4 - ARQUIVOS E DIRETORIOS  
5 - WHOIS  
6 - ALL  

==> Escolha algumas das opçoes para utilizar a ferramenta:  
1 é o escaneamento de dns direto, onde você passa o dominio e a partir da wordlist escolhida o programa irá tentar localizar outros dominios.  
2 é o escaneamento de dns reverso, onde você passa um range de IP, e o programa tenta encontrar dominios para os IPs.    
3 é a transferência de zona, onde voce passa o dominio e o programa tenta a transferência de zona para que todos seus dominios sejam revelados.  
4 é a busca por arquivos e diretórios, onde a partir da mesma wordlist usada na busca de dns, o programa tenta encontrar arquivos e diretórios no dominio digitado.  
5 é o whois, ferramenta a qual o programa traz dados de quem é o hospedeiro daquele dominio, range de IP etc. Para ajudar na information gathering.  
6 é o all, onde executa todos os comandos citados.  

## Autor: ##
       Marco Antônio de Lima Costa (markinlimac@gmail.com)
