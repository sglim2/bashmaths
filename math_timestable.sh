#!/bin/bash

if [[ "$#" -gt 0 ]]; then
 table=$1
else
  echo $0 [timestable]
  exit
fi

# division character is  CTRL+SHIFT+U , then 00f7
# 
# because we use special characters, use paps (instead of enscript) to convert to postscript

(figlet "$table times table" ; 
for i in {1..6} ;
do  
  for j in {1..3} ;
  do
    basenum=$((1 + $RANDOM % 12 )) ; 
    bignum=$(($table * $basenum)); 
    if [[ $(( $RANDOM % 2 )) -eq  1 ]] 
    then
      printf "%10s %s %s = " "$bignum"   "÷"  "$table" 
    else
      printf "%10s %s %s = " "$basenum"  "x"  "$table" 
    fi
  done ; 
  printf "\n\n\n\n\n\n\n" ; 
done 

printf "   +" ;  for i in {0..12} ; do  printf "%s" "---+" ; done ; printf "\n"
printf "   |" ;  for i in {0..12} ; do  printf "%s" "   |" ; done ; printf "\n"
printf "   +" ;  for i in {0..12} ; do  printf "%s" "---+" ; done ; printf "\n"
printf "    0 " ; for i in {1..12} ; do printf "%4d" $i ; done ; printf "\n" 

) \
| paps \
| lpr
