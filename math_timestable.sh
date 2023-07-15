#!/bin/bash

print_to_printer=false
table=""
number_bar=false

while getopts "pbt:" opt; do
  case $opt in
    p)
      print_to_printer=true
      ;;
    b)
      number_bar=true
      ;;
    t)
      table=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

if [[ -z $table ]]; then
  echo "Usage: $0 [-p] [-b] -t [timestable]"
  exit 1
fi

output=""

for i in {1..6} ;
do
  for j in {1..3} ;
  do
    basenum=$((1 + $RANDOM % 12))
    bignum=$(($table * $basenum))
    if [[ $(( $RANDOM % 2 )) -eq  1 ]]; then
      output+="$(printf "%10s %s %s = " "$bignum"   "÷"  "$table")"
    else
      output+="$(printf "%10s %s %s = " "$basenum"  "x"  "$table")"
    fi
  done
  output+="\n\n\n\n\n\n\n"
done

if $number_bar ; then
  output+="   +"
  for i in {0..12} ; do
    output+="---+"
  done
  output+="\n   |"
  for i in {0..12} ; do
    output+="   |"
  done
  output+="\n   +"
  for i in {0..12} ; do
    output+="---+"
  done
  output+="\n    0 "
  for i in {1..12} ; do
    output+=$(printf "%4d" $i)
  done
  output+="\n"
fi

if $print_to_printer ; then
  (figlet "$table times table" ; echo -e "$output") | paps | lpr
else
  figlet "$table times table"
  echo -e "$output"
fi

