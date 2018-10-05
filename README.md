## DNS_SCAN ##

Este repositório foi criado para armazenar a ferramenta de escaneamento de DNS (catdns), a qual ja possui algumas wordlists com muitas palavras, porém pode ser usada qualquer wordlist que esteja salva no seu computador. Esta ferramenta concatena comandos com as palavras da wordlist para saber se o host existe ou nao em um determinado dominio. Esta ferramenta tambem possui comandos para que encontre arquivos e diretorios, para executar o whois e tambem para fazer trasnferência de zona de um determinado host.
É uma ferramenta que gera ruidos no servidor e que nao possui nenhuma segurança por default.

## Modo de uso ##
Para utilizar essa ferramenta use o git para importar o repositorio no linux
```bash
$ git clone https://github.com/markinlimac/dns_scan.git
```
dê permissão de execução para o arquivo
```bash
$ chmod +x catdns.sh
```
depois basta executar o arquivo com o comando de execuçao
```bash
$ ./catdns.sh
```
* Escolha a wordlist que o script irá usar.
* Caso seja necessario saber as wordlists disponiveis, pode ser passado o comando <b><u>show</u></b>

<p align="middle"><img src="https://i.imgur.com/wHD4DYv.png"></p>

* Escolha algumas das opçoes para utilizar a ferramenta:

##### 1 - DNS DIRETO
É o escaneamento de dns direto, onde é passado a url e a partir da wordlist escolhida o script irá concatenar palavras com a url para tentar localizar subdominios vivos, e assim resolver seu endereço de IP.
<p align="middle"><img src="https://i.imgur.com/n8p51ua.png"></p>  

##### 2 - DNS REVERSO
É o escaneamento de dns reverso, onde é passado um range de IP, e o scrip tenta resolver subdominios existentes para os determinados IPs.
<p align="middle"><img src="https://i.imgur.com/jfNuMZt.png"></p>     

##### 3 - TRANSFERÊNCIA DE ZONA
É a transferência de zona, onde é passado a url e o script tenta a transferência de zona para que todos seus dominios e subdominios sejam revelados.
<p align="middle"><img src="https://i.imgur.com/GPaH34a.png"></p>   

##### 4 - ARQUIVOS E DIRETÓRIOS
É a busca por arquivos e diretórios, onde a partir da mesma wordlist usada na busca de dns, o script tenta encontrar arquivos e diretórios no dominio digitado.
<p align="middle"><img src="https://i.imgur.com/RLYEUw2.png"></p>   

##### 5 - WHOIS
É o whois, ferramenta a qual o programa traz dados de quem é o hospedeiro daquele dominio, range de IP etc. Para ajudar na etapa de information gathering.
<p align="middle"><img src=""></p>   

##### 6 - ALL
É o all, onde executa todos os comandos citados.

##### 7 - BAIXAR FERRAMENTAS NECESSARIAS
Como o script apenas executa comandos bash, é necessario ter algumas ferramentas instaladas para a perfeita execução do script. Essa opção irá fazer o download das ferramentas necessarias, que se encontram no arquivo ferramentas.txt.
<p align="middle"><img src="https://i.imgur.com/zru73uM.png"></p>  

## Autor: ##
       Marco Antônio de Lima Costa (markinlimac@gmail.com)
