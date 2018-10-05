: fileformat=unix
#!/bin/sh
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
tput setaf 4; tput bold; echo -n "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0; tput bold; echo -n " .. DNS HACKER v1.0 .. "; tput setaf 4; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0;
tput setaf 4; tput bold; echo -n "|-|-|-|-|-|-|-|-|-|-|"; tput sgr0; tput bold; echo -n " Marco Antônio Lima -- markinlimac@gmail.com "; tput setaf 4; echo "|-|-|-|-|-|-|-|-|-|-|"; tput sgr0;
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
echo ""
tput setaf 4; tput bold; cat hack.txt; tput sgr0
echo ""

read -p "Escolha a wordlist: " wordlist
while [ $wordlist == "show" ]
do
tput setaf 2; tput bold; ls wordlists/; tput sgr0
echo ""
read -p "Escolha a wordlist: " wordlist
done

#while [ $wordlist != "rato.txt" ] || [ $wordlist != "big.txt" ]
#do
#tput setaf 1; tput bold; echo -n "Digite uma opção válida "; tput sgr0
#read -p "Escolha a wordlist: " wordlist
#done

echo ""
echo "1 - DNS DIRETO"
echo "2 - DNS REVERSO"
echo "3 - TRANSFERENCIA DE ZONA"
echo "4 - ARQUIVOS E DIRETORIOS"
echo "5 - WHOIS"
echo "6 - ALL"
echo "7 - BAIXAR FERRAMENTAS NECESSARIAS"
echo ""

read -p "Escolha uma opção: " usuario

while [ "$usuario" -lt "1" ] || [ $usuario -gt "7" ]
do
tput setaf 1; tput bold; read -p "Digite uma opção valida: " usuario; tput sgr0
done

if [ "$usuario" -eq "1" ]
then
read -p "Digite a url do site: " dominio
echo ""
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| BUSCANDO DNS DIRETO |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for url in $(cat wordlists/$wordlist)
do
host=$(host $url$dominio | grep "has address" | cut -d " " -f4)
if [ -z $host ]; then continue; else echo $url$dominio "=>" $host;fi
done
fi

if [ $usuario == "2" ]
then
read -p "Digite o começo do ip: " ipcomeco
read -p "Bloco do ip desejado (whois): " bloco1 bloco2
echo ""
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| BUSCANDO DNS REVERSO |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for ip in $(seq $bloco1 $bloco2)
do host $ipcomeco.$ip
done
fi

if [ $usuario == "3" ]
then
read -p "Digite a url do site: " dominio
echo ""
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-| TENTANDO TRANSFERENCIA DE ZONA |-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
for server in $(host -t ns $dominio | cut -d " " -f4)
do host -l $dominio $server | grep "has address"
done
fi

if [ $usuario == "4" ]
then
read -p "Digite a url do site: " dominio
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
fi

if [ "$usuario" -eq "5" ]
then
read -p "Digite a url do site: " dominio
echo ""
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
fi

if [ $usuario == "7" ]
then
tput setaf 4; tput bold; echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| BAIXANDO FERRAMENTAS |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"; tput sgr0
while read comando
do
$comando
done < ferramentas.txt
fi
