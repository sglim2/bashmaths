#!/bin/bash


(figlet Adding ; echo ; figlet "Bridging 10s";

for i in {1..5} ;
do 
  for j in {1..3} ;
  do 
    UNIT1=$((1 + $RANDOM % 9))
    printf "%10s + %s = " "$((1 + $RANDOM % 9))${UNIT1}" "$(( $(( 10 - ${UNIT1} )) + $(( $RANDOM % $UNIT1 )) ))";
  done
  printf "\n\n\n\n\n\n\n"
done

) \
| paps \
| lpr


