#!/bin/bash
#for subdiretorio in $(ls /home/marco/Documentos/Projetos/dns_scan/teste)
#do
#cd /home/marco/Documentos/Projetos/dns_scan/teste/$subdiretorio
#ls -w1 /home/marco/Documentos/Projetos/dns_scan/teste/$subdiretorio | while read line; do mv "$line" "$(echo $line | tr '\ ' '_')"; done
#for subdiretorio2 in $(ls /home/marco/Documentos/Projetos/dns_scan/teste/$subdiretorio)
#do
#cd /home/marco/Documentos/Projetos/dns_scan/teste/$subdiretorio/$subdiretorio2
#for arquivos in $(ls *.txt)
#do
#echo $arquivos "=>" $subdiretorio"/"$subdiretorio2
#done
#done
#done
NN="1 2 3"
NN=$(sed 's/ /_/g' <<< "$NN")
[ $NN ] && echo "EXISTE" || echo "NAO EXISTE"
