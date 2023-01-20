#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~ The Eastern Salon ~~~\n"
echo -e "\nWhat would you like?\n"

SERVICES_RESULT=$($PSQL "SELECT * FROM services")

MAIN_MENU(){
  if [[ ! -z $1 ]]
  then
    echo -e "\n$1\n"
  fi

  echo "$SERVICES_RESULT" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  HANDLE_APPOINTMENT

}


HANDLE_APPOINTMENT(){

# check if number is read
if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
then
  MAIN_MENU "Please enter the service number."
else  
  # get service
  SERVICE_NAME=$($PSQL "SELECT name from services WHERE service_id=$SERVICE_ID_SELECTED")
  # if it does not exist
  if [[ -z $SERVICE_NAME ]]
  then
  # goto main menu
  MAIN_MENU "Sorry, we couldn't find the service. Please enter one of the service number mentioned."
  else
    SERVICE_NAME=$(sed 's/^ *//' <<< $SERVICE_NAME)
    echo -e "\nWhat's your phone number?"
    # ask customer number
    read CUSTOMER_PHONE
    # get customer info from given phone number
    CUSTOMER_INFO=$($PSQL "SELECT customer_id, name FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # if info not found
    if [[ -z $CUSTOMER_INFO ]]
    then
      # ask for customer name
      echo -e "\nWe don't have your record, What's your name?"
      read CUSTOMER_NAME
      # insert the customer record
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
      # get customer id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    else
      read CUSTOMER_ID BAR CUSTOMER_NAME <<< $CUSTOMER_INFO
    fi

    # ask appointment time
    echo -e "\nAt what time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME

    # insert appointment details
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME')")
    if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
    then
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
fi
}

MAIN_MENU
