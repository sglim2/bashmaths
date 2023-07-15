#!/bin/bash

#(figlet Subtracting ; echo ; figlet "Bridging 100s" ; for i in {1..5} ;  do  for j in {1..3} ; do   printf "%10s - %s = " "$((1 + $RANDOM % 10))0$((1 + $RANDOM % 10))" "$((1 + $RANDOM % 10))"; done ; printf "\n\n\n\n\n\n\n" ; done ) | enscript -f courier14 -B -h -p - | lpr

(figlet Subtracting ; echo ; figlet "Bridging 100s";

for i in {1..5} ;
do 
  for j in {1..3} ;
  do 
    printf "%10s - %s = " "$((1 + $RANDOM % 10))0$((1 + $RANDOM % 10))" "$((1 + $RANDOM % 10))";
  done
  printf "\n\n\n\n\n\n\n"
done

) \
| paps \
| lpr


