#!/bin/ksh

################################################################################
# Escrito por: Carlos Frederico Bastarz (carlos.frederico@cptec.inpe.br)
# Objetivo: Este script foi escrito para converter sinais diacriticos em codigos
# Baseado no script 'latin2tex' de Rafael Ávila (Copyright (C) 2002
# ) e no script 'tex2latin' de Elgio Schlemer
# Data: Janeiro de 2010

################################################################################
# Opcoes gerais de execucao
#set -o xtrace

################################################################################
# Parametros de execucao:
# <1> nome do arquivo de entrada

#ajuda#
# Execucao: ./texlatin.ksh <1>
# Exemplo: ./texlatin.ksh arquivo.tex
# O exemplo acima ira executar o script para converter os sinais diacriticos par
# a codigos LaTeX
#ajuda#

# Se nenhum parametro for passado, mostra o texto de ajuda
if [ "${1}" = "ajuda" -o -z "${1}" ]
then
  cat < ${0} | sed -n '/^#ajuda#/,/^#ajuda#/p'
  exit 0
fi

# Vogais: Acento Agudo (e.g., á, é, í, ó, ú) 
sed -i "s/á/\\\'{a}/g" ${1}
sed -i "s/á/\\\'{a}/g" ${1}
sed -i "s/é/\\\'{e}/g" ${1}
sed -i "s/í/\\\'{i}/g" ${1}
sed -i "s/ó/\\\'{o}/g" ${1}
sed -i "s/ú/\\\'{u}/g" ${1}

sed -i "s/Á/\\\'{A}/g" ${1}
sed -i "s/É/\\\'{E}/g" ${1}
sed -i "s/Í/\\\'{I}/g" ${1}
sed -i "s/Ó/\\\'{O}/g" ${1}
sed -i "s/Ú/\\\'{U}/g" ${1}

# Consoantes: Acento Agudo (e.g., ć)
sed -i "s/ć/\\\'{c}/g" ${1}
sed -i "s/Ć/\\\'{C}/g" ${1}
 
# Vogais: Crase (e.g., à, è, ì, ò, ù)
sed -i 's/à/\\`{a}/g' ${1}
sed -i 's/è/\\`{e}/g' ${1}
sed -i 's/ì/\\`{i}/g' ${1}
sed -i 's/ó/\\`{o}/g' ${1}
sed -i 's/ù/\\`{u}/g' ${1}

sed -i 's/À/\\`{A}/g' ${1}
sed -i 's/È/\\`{E}/g' ${1}
sed -i 's/Ì/\\`{I}/g' ${1}
sed -i 's/Ò/\\`{O}/g' ${1}
sed -i 's/Ù/\\`{U}/g' ${1}
 
# Vogais: Til (e.g., ã, õ, ñ)
sed -i 's/ã/\\~{a}/g' ${1}
sed -i 's/õ/\\~{o}/g' ${1}
sed -i 's/ñ/\\~{n}/g' ${1}

sed -i 's/Ã/\\~{A}/g' ${1}
sed -i 's/Õ/\\~{O}/g' ${1}
sed -i 's/Ñ/\\~{N}/g' ${1}
 
# Vogais: Trema (e.g., ä, ë, ï, ö, ü)
sed -i 's/ä/\\"{a}/g' ${1}
sed -i 's/ë/\\"{e}/g' ${1}
sed -i 's/ï/\\"{i}/g' ${1}
sed -i 's/ö/\\"{o}/g' ${1}
sed -i 's/ü/\\"{u}/g' ${1}

sed -i 's/Ä/\\"{A}/g' ${1}
sed -i 's/Ë/\\"{E}/g' ${1}
sed -i 's/Ï/\\"{I}/g' ${1}
sed -i 's/Ö/\\"{O}/g' ${1}
sed -i 's/Ü/\\"{U}/g' ${1}

# Cedilha:
sed -i 's/ç/\\c{c}/g' ${1}
sed -i 's/ç/\\c{c}/g' ${1}

sed -i 's/Ç/\\c{C}/g' ${1}
sed -i 's/Ç/\\c{C}/g' ${1}

# Vogais: Acento Circunflexo (e.g., â, ê, î, ô, û)
sed -i 's/â/\\^{a}/g' ${1}
sed -i 's/ê/\\^{e}/g' ${1}
sed -i 's/î/\\^{i}/g' ${1}
sed -i 's/ô/\\^{o}/g' ${1}
sed -i 's/û/\\^{u}/g' ${1}

sed -i 's/Â/\\^{A}/g' ${1}
sed -i 's/Ê/\\^{E}/g' ${1}
sed -i 's/Î/\\^{I}/g' ${1}
sed -i 's/Ô/\\^{O}/g' ${1}
sed -i 's/Û/\\^{U}/g' ${1}

# Tracos e outros simbolos (e.g., -, ')
sed -i 's/ – / - /g' ${1}
sed -i "s/’/'/g" ${1}
sed -i 's/%/\\%/g' ${1}
sed -i 's/“/"/g' ${1}
sed -i 's/”/"/g' ${1}
sed -i 's/º/$\\,^{\circ}$/g' ${1}
sed -i 's/°/$\\,^{\circ}$/g' ${1}
sed -i 's/_/$_$/g' ${1}

exit 0
