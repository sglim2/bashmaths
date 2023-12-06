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

for i in {1..4}; do
  num1=$((100 + $RANDOM % 900))  # Generate a 3-digit number for num1
  num2=$((100 + $RANDOM % 900))  # Generate a 3-digit number for num2
  result=$((num1 * num2))

  # Create a grid for long multiplication
  output+="$(printf "%5s\\\n" "$num1")"
  output+="$(printf "x%4s\\\n" "$num2")"
  output+="$(printf "%6s\\\n\\\n" "______")"
  output+="$(printf "%6s\\\n" "______")"
  output+="\n\n\n\n"

  if $results ; then
    # Collect the result
    results_output+="$(printf "%10s\n" "$result")"
  fi
done


# Print the results at the bottom
if $results ; then
  output+="\n\n\n\n\n\n\n\n\nAnswers: $results_output"
fi

if $print_to_printer ; then
  (figlet "Multiplication
HxH" ; echo -e "$output") | paps | lpr
else
  figlet "Multiplication
HxH"
  echo -e "$output"
fi

