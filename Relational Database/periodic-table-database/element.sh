#! /bin/bash

# Run sql command through bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $# -ne 1 ]];
then
  echo "Please provide an element as an argument."
  exit
# check if the input is a number
elif [[ $1 =~ ^[0-9]+$ ]]
then
  # get element by atomic_number
  ELEMENT_RESULT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1;")
else
  # get element by symbol or name
  ELEMENT_RESULT=$($PSQL "SELECT * FROM elements WHERE symbol='$1' OR name='$1';")
fi

# if the result is empty
if [[ -z $ELEMENT_RESULT ]]
then
  # display couldn't find element
  echo "I could not find that element in the database."
  exit
else
  # get atomic number, symbol and name from result
  IFS="|" read ATOMIC_NUMBER SYMBOL NAME <<< $ELEMENT_RESULT
  # get element properties from atomic number
  PROPERTY_RESULT=$($PSQL "SELECT * FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
  # parse the property result
  IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE_ID <<< $PROPERTY_RESULT
  # get type from type_id
  TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
fi
