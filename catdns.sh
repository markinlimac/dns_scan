: fileformat=unix
#!/bin/bash
if [ "$1" ==  "" ]
then
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| .. DNS HACKER v1.0 .. |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|  Uso: ./catdns wordlist.txt |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
echo "|-|-|-|-|-|-|-|-|-|-| Marco Antonio Lima -- markinlimac@gmail.com |-|-|-|-|-|-|-|-|-|-|"
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
else
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| .. DNS HACKER v1.0 .. |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
echo "|-|-|-|-|-|-|-|-|-|-| Marco Antonio Lima -- markinlimac@gmail.com |-|-|-|-|-|-|-|-|-|-|"
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
echo ""
echo "1 - DNS DIRETO"
echo "2 - DNS REVERSO"
echo "3 - TRANSFERENCIA DE ZONA"
echo "4 - ARQUIVOS E DIRETORIOS"
echo "5 - WHOIS"
echo "6 - ALL"
echo ""

read usuario

if [ "$usuario" -eq "1" ]
then
read -p "Digite a url do site: " dominio
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| BUSCANDO DNS DIRETO |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
for url in $(cat $1)
do host $url.$dominio | grep "has address" | cut -d " " -f4
done
fi

if [ $usuario == "2" ]
then
read -p "Digite o começo do ip: " ipcomeco
read -p "Bloco do ip desejado (whois): " bloco1 bloco2
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| BUSCANDO DNS REVERSO |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
for ip in $(seq $bloco1 $bloco2)
do host $ipcomeco.$ip
done
fi

if [ $usuario == "3" ]
then
read -p "Digite a url do site: " dominio
echo "|-|-|-|-|-|-|-|-|-|-|-|-| TENTANDO TRANSFERENCIA DE ZONA |-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
for server in $(host -t ns $dominio | cut -d " " -f4)
do host -l $dominio $server | grep "has address"
done
fi

if [ $usuario == "4" ]
then
read -p "Digite a url do site: " dominio
echo "|-|-|-|-|-|-|-|-|-|-|-|-| ENCONTRADNO ARQUIVOS E DIRETORIOS |-|-|-|-|-|-|-|-|-|-|-|-|"
for palavra in $(cat $1)
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

if [ "$usuario" -eq "5" ]
then
read -p "Digite a url do site: " dominio
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| EXECUTANDO WHOIS |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
for pingip in $(ping -c 1 $dominio | grep "64 bytes" | cut -d "(" -f2 | cut -d ")" -f1)
do whois $pingip
done
fi

if [ "$usuario" -eq "6" ]
then
read -p "Digite a url do site: " dominio
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| EXECUTANDO WHOIS |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
for pingip in $(ping -c 1 $dominio | grep "64 bytes" | cut -d "(" -f2 | cut -d ")" -f1)
do whois $pingip
done
echo ""
echo ""
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| EXECUTANDO DNS DIRETO |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
for url in $(cat $1)
do host $url.$dominio | grep "has address" | cut -d " " -f4
done
echo ""
echo ""
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| EXECUTANDO DNS REVERSO |-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
for ip in $(seq $bloco1 $bloco2)
do host $ipcomeco.$ip
done
echo ""
echo ""
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-|-| TENTANDO TRANSFERENCIA DE ZONA |-|-|-|-|-|-|-|-|-|-|-|-|-|-|"
for server in $(host -t ns $dominio | cut -d " " -f4)
do host -l $dominio $server | grep "has address"
done
echo ""
echo ""
echo "|-|-|-|-|-|-|-|-|-|-|-|-|-| ENCONTRADNO ARQUIVOS E DIRETORIOS |-|-|-|-|-|-|-|-|-|-|-|-|-|"
for palavra in $(cat $1); #lendo cada palavra da lista(lista.txt) e armazenando na palavra
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

fi
