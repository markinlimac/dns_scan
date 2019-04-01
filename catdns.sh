PASTA_WORDLISTS=wordlists

## Exibe as wordlists disponíveis
function exibe_wordlists()
{
    ls $PASTA_WORDLISTS
    echo # Pula uma linha na tela
}

## Verifica se a wordlist existe
function checa_wordlist()
{
    filename=$1

    if [ -e "$filename" ]; then
        return 0
    else
        return 1
    fi
}

: fileformat=unix
#!/bin/sh
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
tput setaf 4; tput bold; echo -n "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0; tput bold; echo -n " .. DNS HACKER v1.0 .. "; tput setaf 4; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0;
tput setaf 4; tput bold; echo -n "|-|-|-|-|-|-|-|-|-|-|"; tput sgr0; tput bold; echo -n " Marco Antônio Lima -- markinlimac@gmail.com "; tput setaf 4; echo "|-|-|-|-|-|-|-|-|-|-|"; tput sgr0;
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
echo ""
tput setaf 4; tput bold; cat hack.txt; tput sgr0
echo ""

while :
do

echo "wordlists disponíveis: "
exibe_wordlists
read -p "Escolha a wordlist: " wordlist

case $wordlist in
show) tput setaf 2; tput bold; ls wordlists/; tput sgr0
echo "" ;;
SHOW) tput setaf 2; tput bold; ls wordlists/; tput sgr0
echo "" ;;
big.txt) break ;;
rato.txt) break ;;
*) tput setaf 1; tput bold; echo -e "Digite uma opção valida\n"; tput sgr0 ;;
esac
done

while :
do
echo ""
echo "1 - DNS DIRETO"
echo "2 - DNS REVERSO"
echo "3 - TRANSFERENCIA DE ZONA"
echo "4 - ARQUIVOS E DIRETORIOS"
echo "5 - WHOIS"
echo "6 - ALL"
echo "7 - BAIXAR FERRAMENTAS NECESSARIAS"
echo "8 - SAIR"
echo ""
read -p "Escolha uma opção: " usuario

case $usuario in
1) read -p "Digite a url do site: " dominio
echo ""
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| BUSCANDO DNS DIRETO |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for url in $(cat wordlists/$wordlist)
do
host=$(host $url$dominio | grep "has address" | cut -d " " -f4)
if [ -z $host ]; then continue; else echo $url$dominio "=>" $host;fi
done
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0 ;;

2) read -p "Digite o começo do ip: " ipcomeco
read -p "Bloco do ip desejado (whois): " bloco1 bloco2
echo ""
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| BUSCANDO DNS REVERSO |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for ip in $(seq $bloco1 $bloco2)
do
host=$(host $ipcomeco.$ip | cut -d " " -f5)
if [ $host == "3(NXDOMAIN)" ]; then continue; else echo $ipcomeco"."$ip "=>" $host;fi
done
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0 ;;

3) read -p "Digite a url do site: " dominio
echo ""
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-| TENTANDO TRANSFERENCIA DE ZONA |-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for server in $(host -t ns $dominio | cut -d " " -f4)
do
transferencia=$(host -l $dominio $server | grep "has address")
if [ $transferencia -z ]; then echo "Não foi possivel executar a trasnferência"; fi
done
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0 ;;

4) read -p "Digite a url do site: " dominio
echo ""
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-| ENCONTRADNO ARQUIVOS E DIRETORIOS |-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for palavra in $(cat wordlists/$wordlist)
do
resposta=$(curl -s -o /dev/null -w "%{http_code}" $dominio/$palavra/) #diretorio
resposta1=$(curl -s -o /dev/null -w "%{http_code}" $dominio/$palavra) #arquivo
echo $resposta $palavra
echo $resposta1 $palavra
if [ $resposta == "200" ]
then
echo "Diretorio encontrado: $palavra"
fi
if [ $resposta1 == "200" ]
then
echo "Arquivo encontrado: $palavra"
fi
done
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0 ;;

5) read -p "Digite a url do site: " dominio
echo ""
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| EXECUTANDO WHOIS |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for pingip in $(ping -c 1 $dominio | grep "64 bytes" | cut -d "(" -f2 | cut -d ")" -f1)
do whois $pingip
done
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0 ;;

6) echo ""
read -p "Digite a url do site: " dominio
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| EXECUTANDO WHOIS |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for pingip in $(ping -c 1 $dominio | grep "64 bytes" | cut -d "(" -f2 | cut -d ")" -f1)
do whois $pingip
done
echo ""
echo ""
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| BUSCANDO DNS DIRETO |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for url in $(cat wordlists/$wordlist)
do
host=$(host $url$dominio | grep "has address" | cut -d " " -f4)
if [ -z $host ]; then continue; else echo $url$dominio "=>" $host;fi
done
echo ""
echo ""
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| BUSCANDO DNS REVERSO |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for ip in $(seq $bloco1 $bloco2)
do host $ipcomeco.$ip
done
echo ""
echo ""
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-| TENTANDO TRANSFERENCIA DE ZONA |-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for server in $(host -t ns $dominio | cut -d " " -f4)
do host -l $dominio $server #| grep "has address"
done
echo ""
echo ""
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-| ENCONTRADNO ARQUIVOS E DIRETORIOS |-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for palavra in $(cat wordlists/$wordlist) #lendo cada palavra da lista(lista.txt) e armazenando na palavra
do
resposta = $(curl -s -o /dev/null -w "%{http_code}" $dominio/$palavra/) #diretorio
resposta1 = $(curl -s -o /dev/null -w "%{http_code}" $dominio/$palavra) #arquivo
if [ $resposta == "200" ]
then
echo "Diretorio encontrado: $palavra"
fi
if [ $resposta1 == "200" ]
then
echo "Arquivo encontrado: $palavra"
fi
done
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0 ;;

7) tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| BAIXANDO FERRAMENTAS |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
while read comando
do
$comando
done < ferramentas.txt
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0 ;;

8) echo "Obrigado por usar essa ferramenta!"
break ;;

*) tput setaf 1; tput bold; echo "Digite uma opção valida"; tput sgr0 ;;
esac
done
