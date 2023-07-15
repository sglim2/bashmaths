#!/bin/bash

print_to_printer=false

while getopts "p" opt; do
  case $opt in
    p)
      print_to_printer=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

output=""

for i in {1..5} ;
do
  for j in {1..3} ;
  do
    output+="$(printf "%10s - %s = " "$((1 + $RANDOM % 10))0$((1 + $RANDOM % 10))" "$((1 + $RANDOM % 10))")"
  done
  output+="\n\n\n\n\n\n\n"
done


if $print_to_printer ; then
  (figlet Subtracting ; echo ; figlet "Bridging 100s"; echo -e "$output") | paps | lpr
else
  figlet Subtracting
  echo
  figlet "Bridging 100s"
  echo -e "$output"
fi
