#!/bin/bash

print_to_printer=false
results=false

while getopts "pr" opt; do
  case $opt in
    p)
      print_to_printer=true
      ;;
    r)
      results=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

output="\n\n"

for i in {1..6}; do
  if (( RANDOM % 2 )); then
    # Multiplication problem
    #int_part1=$((1 + RANDOM % 99))
    int_part1=0
    dec_part1=$((RANDOM % 10))
    num1=$(printf "%d.%d" "$int_part1" "$dec_part1")
    
    #int_part2=$((1 + RANDOM % 99))
    int_part2=0
    dec_part2=$((RANDOM % 10))
    num2=$(printf "%d.%d" "$int_part2" "$dec_part2")
    
    # Compute result
    result=$(echo "scale=2; $num1 * $num2" | bc -l)
    
    # Format the output for multiplication
    output+="$(printf "%10s\n" "$num1")"
    output+="$(printf "  x  %s\n" "$num2")"
    #output+="$(printf "%10s\n\n" "______")"
    #output+="$(printf "%10s\n" "______")"
    output+="\n\n\n\n\n\n\n\n\n"
    
    if $results ; then
      # Collect the result
      results_output+="$(printf "%10s x %s = %s\n" "$num1" "$num2" "$result")"
    fi
  else
    # Division problem
    #int_part_divisor=$((1 + RANDOM % 9))  # Single-digit integer part
    int_part_divisor=0
    dec_part_divisor=$((1 + RANDOM % 9))     # Decimal part from 1 to 9
    divisor=$(printf "%d.%d" "$int_part_divisor" "$dec_part_divisor")
    
    quotient=$((1 + RANDOM % 99))
    
    dividend=$(echo "scale=2; $divisor * $quotient" | bc -l)
    
    # Format the output for division
    output+="$(printf "%10s\n" "$dividend")"
    output+="$(printf "  ÷  %s\n" "$divisor")"
    #output+="$(printf "%10s\n\n" "______")"
    #output+="$(printf "%10s\n" "______")"
    output+="\n\n\n\n\n\n\n\n\n"
    
    if $results ; then
      # Collect the result
      results_output+="$(printf "%10s ÷ %s = %s\n" "$dividend" "$divisor" "$quotient")"
    fi
  fi
done

# Print the results at the bottom
if $results ; then
  output+="Answers:\n$results_output"
fi

if $print_to_printer ; then
  #(figlet "Decimal Multiplication and Division" ; echo -e "$output") | paps | lpr
  (echo "Decimal Multiplication and Division" ; echo -e "$output") | paps | lpr
else
  #figlet "Decimal Multiplication and Division"
  echo "Decimal Multiplication and Division"
  echo -e "$output"
fi

