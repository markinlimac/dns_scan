: fileformat=unix
#!/bin/bash
if [ "$1" ==  "" ]
then
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
tput setaf 4; tput bold; echo -n "|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0; tput bold; echo -n "  Uso: ./catdns wordlist.txt "; tput setaf 4; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0;
tput setaf 4; tput bold; echo -n "|-|-|-|-|-|-|-|-|-|-|"; tput sgr0; tput bold; echo -n " Marco Antônio Lima -- markinlimac@gmail.com "; tput setaf 4; echo "|-|-|-|-|-|-|-|-|-|-|"; tput sgr0;
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
else
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
tput setaf 4; tput bold; echo -n "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0; tput bold; echo -n " .. DNS HACKER v1.0 .. "; tput setaf 4; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0;
tput setaf 4; tput bold; echo -n "|-|-|-|-|-|-|-|-|-|-|"; tput sgr0; tput bold; echo -n " Marco Antônio Lima -- markinlimac@gmail.com "; tput setaf 4; echo "|-|-|-|-|-|-|-|-|-|-|"; tput sgr0;
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
echo ""
tput setaf 4; tput bold; cat hack.txt; tput sgr0
echo ""
echo "1 - DNS DIRETO"
echo "2 - DNS REVERSO"
echo "3 - TRANSFERENCIA DE ZONA"
echo "4 - ARQUIVOS E DIRETORIOS"
echo "5 - WHOIS"
echo "6 - ALL"
echo "7 - BAIXAR FERRAMENTAS NECESSARIAS"
echo ""

read usuario

while [ "$usuario" -lt "1" ]
do
tput setaf 1; tput bold; read -p "Digite uma opção valida: " usuario; tput sgr0
done

if [ "$usuario" -eq "1" ]
then
echo ""
read -p "Digite a url do site: " dominio
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| BUSCANDO DNS DIRETO |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for url in $(cat $1)
do
echo ""
echo -n $url$dominio "=> "
host $url$dominio | grep "has address" | cut -d " " -f4
done
fi

if [ $usuario == "2" ]
then
echo ""
read -p "Digite o começo do ip: " ipcomeco
read -p "Bloco do ip desejado (whois): " bloco1 bloco2
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| BUSCANDO DNS REVERSO |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for ip in $(seq $bloco1 $bloco2)
do host $ipcomeco.$ip
done
fi

if [ $usuario == "3" ]
then
echo ""
read -p "Digite a url do site: " dominio
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-| TENTANDO TRANSFERENCIA DE ZONA |-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for server in $(host -t ns $dominio | cut -d " " -f4)
do host -l $dominio $server | grep "has address"
done
fi

if [ $usuario == "4" ]
then
echo ""
read -p "Digite a url do site: " dominio
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-| ENCONTRADNO ARQUIVOS E DIRETORIOS |-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for palavra in $(cat $1)
do
resposta = $((curl -s -o /dev/null -w "%{http_code}" $dominio/$palavra/)) #diretorio
resposta1 = $((curl -s -o /dev/null -w "%{http_code}" $dominio/$palavra)) #arquivo
if [ $resposta == "200" ]
then
echo "Diretorio encontrado: $palavra"
fi
if [ $resposta1 == "200" ]
then
echo "Arquivo encontrado: $palavra"
fi
done
fi

if [ "$usuario" -eq "5" ]
then
echo ""
read -p "Digite a url do site: " dominio
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| EXECUTANDO WHOIS |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for pingip in $(ping -c 1 $dominio | grep "64 bytes" | cut -d "(" -f2 | cut -d ")" -f1)
do whois $pingip
done
fi

if [ "$usuario" -eq "6" ]
then
echo ""
read -p "Digite a url do site: " dominio
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| EXECUTANDO WHOIS |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for pingip in $(ping -c 1 $dominio | grep "64 bytes" | cut -d "(" -f2 | cut -d ")" -f1)
do whois $pingip
done
echo ""
echo ""
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| BUSCANDO DNS DIRETO |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for url in $(cat $1)
do host $url$dominio #| grep "has address" | cut -d " " -f4
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
for palavra in $(cat $1) #lendo cada palavra da lista(lista.txt) e armazenando na palavra
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
fi

if [ $usuario == "7" ]
then
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| BAIXANDO FERRAMENTAS |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
while read comando
do
$comando
done < ferramentas.txt
fi

fi
