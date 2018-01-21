#!/bin/bash

#----------------------------------------------#
# Source:           sort.sh
# Data:             1 de novembro de 2017
# Desenvolvido por: Juliano Santos [SHAMAN]
# E-mail:           shellscriptx@gmail.com
#----------------------------------------------#

[[ $__SORT_SH ]] && return 0

readonly __SORT_SH=1

# func sort.int <[array]name> => [int]
#
# Retorna uma cópia dos elementos de 'name' em uma
# lista iterável em ordem crescente.
#
function sort.int()
{
	getopt.parse 1 "name:array:+:$1" ${@:2}
	
	declare -n __arr=$1
	printf "%d\n" "${__arr[@]}" | sort -n
	return 0
}

# func sort.str <[array]name> => [str]
#
# Retorna uma cópia dos elementos de 'name' em uma
# lista iterável em ordem alfabética.
#
function sort.str()
{
	getopt.parse 1 "name:array:+:$1" ${@:2}
	
	declare -n __arr=$1
	printf "%s\n" "${__arr[@]}" | sort -d
	return 0
}

# func sort.intsorted <[array]name> => [bool]
#
# Retorna 'true' se os elementos em 'name' estão em ordem crescente.
# Caso contrário 'false'.
#
function sort.intsorted()
{
	getopt.parse 1 "name:array:+:$1" ${@:2}
	
	declare -n __arr=$1
	printf "%s\n" "${__arr[@]}" | sort -nC
	return $?
}

# func sort.strsorted <[array]name> => [bool]
#
# Retorna 'true' se os elementos em 'name' estão em ordem alfabética.
# Caso contrário 'false'.
#
function sort.strsorted()
{
	getopt.parse 1 "name:array:+:$1" ${@:2}
	
	declare -n __arr=$1
	printf "%s\n" "${__arr[@]}" | sort -dC
	return $?
}

# func sort.intrev <[array]name> => [int]
#
# Retorna uma cópia dos elementos de 'name' em uma lista iterável em
# ordem decrescente.
#
function sort.intrev()
{
	getopt.parse 1 "name:array:+:$1" ${@:2}
	
	declare -n __arr=$1
	printf "%s\n" "${__arr[@]}" | sort -nr
	return 0
}

# func sort.strrev <[array]name> => [str]
#
# Retorna uma cópia dos elementos de 'name' em uma lista iterável em
# ordem alfabética inversa.
#
function sort.strrev()
{
	getopt.parse 1 "name:array:+:$1" ${@:2}
	
	declare -n __arr=$1
	printf "%s\n" "${__arr[@]}" | sort -dr
	return 0
}

# func sort.size <[array]name> => [size]
#
# Retorna uma cópia dos elementos de 'name' em uma lista iterável em
# ordem computacional crescrente.
#
# Exemplo: 10K, 1M, 5G, 2T ...
#
function sort.size()
{
	getopt.parse 1 "name:array:+:$1" ${@:2}

	declare -n __arr=$1
	printf "%s\n" "${__arr[@]}" | sort -h
	return 0
}

# func sort.sizerev <[array]name> => [size]
#
# Retorna uma cópia dos elementos de 'name' em uma lista iterável em
# ordem computacional decrescente.
#
function sort.sizerev()
{
	getopt.parse 1 "name:array:+:$1" ${@:2}

	declare -n __arr=$1
	printf "%s\n" "${__arr[@]}" | sort -hr
	return 0
}

# func sort.sizesorted <[array]name> => [bool]
#
# Retorna 'true' se os elementos de 'name' estão em ordem
# computacional crescente. Caso contrário 'false'.
#
# Exemplo: 10K, 1M, 5G, 2T ...
#
function sort.sizesorted()
{
	getopt.parse 1 "name:array:+:$1" ${@:2}

	declare -n __arr=$1
	printf "%s\n" "${__arr[@]}" | sort -hr
	return 0
}

# func sort.expstr <[str]exp> => [str]
#
# Retorna uma cópia de 'exp' com a sequência em ordem alfabética.
#
function sort.expstr()
{
	getopt.parse 1 "exp:str:-:$1" ${@:2}
	echo $(printf "%s\n" $1 | sort -d)
	return 0
}

# func sort.expstrrev <[str]exp> => [str]
#
# Retorna uma cópia de 'exp' com a sequência em ordem alfabética inversa.
#
function sort.expstrrev()
{
	getopt.parse 1 "exp:str:-:$1" ${@:2}
	echo $(printf "%s\n" $1 | sort -dr)
	return 0
}

# func sort.expint <[str]exp> => [str]
#
# Retorna uma cópia de 'exp' com a sequência de números em ordem crescente.
#
function sort.expint()
{
	getopt.parse 1 "exp:str:-:$1" ${@:2}
	echo $(printf "%s\n" $1 | sort -n)
	return 0
}

# func sort.expintrev <[str]exp> => [str]
#
# Retorna uma cópia de 'exp' com a sequência de números em ordem decrescente.
#
function sort.expintrev()
{
	getopt.parse 1 "exp:str:-:$1" ${@:2}
	echo $(printf "%s\n" $1 | sort -nr)
	return 0
}

source.__INIT__
# /* __SORT_SRC */
