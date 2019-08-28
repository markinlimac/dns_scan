: fileformat=unix
#!/bin/sh

read -p "Escolha a wordlist: " wordlist

read -p "Digite a url do site: " dominio

for palavra in $(cat wordlists/$wordlist)
do
wget $dominio/$palavra/ -o -q
#resposta=$(curl -s -o /dev/null -w "%{http_code}" $dominio/$palavra/) #diretorio
#resposta1=$(curl -s -o /dev/null -w "%{http_code}" $dominio/$palavra) #arquivo
#echo $resposta $palavra
#echo $resposta1 $palavra
#if [ $resposta == "200" ]
#then
# echo "Diretorio encontrado: $palavra"
# fi
# if [ $resposta1 == "200" ]
# then
# echo "Arquivo encontrado: $palavra"
# fi
done
