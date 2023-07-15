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
    UNIT1=$((1 + $RANDOM % 9))
    output+="$(printf "%10s + %s = " "$((1 + $RANDOM % 9))${UNIT1}" "$(( $(( 10 - ${UNIT1} )) + $(( $RANDOM % $UNIT1 )) ))")"
  done
  output+="\n\n\n\n\n\n\n"
done

if $print_to_printer ; then
  (figlet Adding ; echo ; figlet "Bridging 10s"; echo -e "$output") | paps | lpr
else
  figlet Adding
  echo
  figlet "Bridging 10s"
  echo -e "$output"
fi
