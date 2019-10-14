#!/bin/ksh

#set -o xtrace

#Data 22/01/2010

#Para uma lista completa de codificacoes disponiveis, rode o comando iconv -l

codi=iso-8859-1
codf=utf-8

for arq in `ls`
do
	check=`file -i $arq | awk -F " " '{print $3}' | cut -c 9-19`
	if [[ $check == $codi ]];
	then
		print ">> Convertendo codificacao de '$arq' de $codi para $codf"
		cat $arq | iconv -f $codi -t $codf -o $arq
	else
		print "> Codificacao de '$arq' e: $codf"
	fi
done
