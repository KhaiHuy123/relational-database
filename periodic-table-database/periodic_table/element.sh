#!/bin/env bash

PSQL="psql -U freecodecamp -d periodic_table -t --no-align -c"
INPUT_ARG=$1
SEARCH_RESULT=""

search_element() {
    QUERY_STATEMENT="atomic_number,atomic_mass,symbol,name,type,melting_point_celsius,boiling_point_celsius"
  # the input can be the atomic number or the symbol of expected element 
  if [[ $(expr "$INPUT_ARG" : "^[0-9]*$") -gt 0 ]]; then
    SEARCH_RESULT=$($PSQL "SELECT $QUERY_STATEMENT FROM elements LEFT JOIN properties USING (atomic_number) LEFT JOIN types USING (type_id) WHERE atomic_number=$INPUT_ARG")
  else
    SEARCH_RESULT=$($PSQL "SELECT $QUERY_STATEMENT FROM elements LEFT JOIN properties USING (atomic_number) LEFT JOIN types USING (type_id) WHERE symbol='$INPUT_ARG' OR name='$INPUT_ARG'")
  fi
  # if input can not be found, exit the script
  if [[ -z $SEARCH_RESULT ]]; then
    echo "I could not find that element in the database."
    exit
  fi
}

show_search_result() {
  echo $SEARCH_RESULT | 
  while IFS=" |" read ATOMIC_NUMBER ATOMIC_MASS SYMBOL NAME TYPE MELTING_POINT BOILING_POINT; do
    printf "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). "
    printf "It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting "
    printf "point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius.\n"
  done
}

# function call
if [ -z "$INPUT_ARG" ]; then
  echo "Please provide an element as an argument."
else
  search_element
  show_search_result
fi
