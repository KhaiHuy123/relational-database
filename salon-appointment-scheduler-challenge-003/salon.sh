#! /bin/bash

PSQL="psql --username freecodecamp --dbname salon --tuples-only -c"

# say hello
say_hello() {
  printf "\n~~~~~ VN SALON - Give you the best services ~~~~~\n\n"
  printf "Welcome to VN Salon Services, how can I help you today?\n\n"
}

# introduce services to customer(s)
show_services() {
  AVAILABLE_SERVICES=$($PSQL "SELECT * FROM services LIMIT 10;")
  echo "$AVAILABLE_SERVICES" | 
  while read SERVICE_ID BAR NAME; do
    echo "$SERVICE_ID) $NAME"
  done
}

# serving stage
serving(){
  local NO_CUSTOMERS_APPOINTMENT=$1
  show_services
  
  echo -e "\nPlease choose your service"
  read SERVICE_ID_SELECTED

  # check if service exist
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME ]]; then
    echo -e "\nThe service you offered is not served in our salon"
    return 1
  fi
  
  printf "\nWhat is your phone number, please?\n"
  read CUSTOMER_PHONE

  # ask for customer's name if phone number not found
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]; then
    printf "Your phone number does not exist in our system, what is your name?\n"
    read CUSTOMER_NAME
    INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(customer_id, phone, name) VALUES($NO_CUSTOMERS_APPOINTMENT, '$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  # ask for the time of the appointment
  printf "What time would you like for $SERVICE_NAME, $CUSTOMER_NAME?\n"
  read SERVICE_TIME

  # arrange appointment
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, appointment_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, $NO_CUSTOMERS_APPOINTMENT, '$SERVICE_TIME')")
  printf "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
  return 0
}


NO_CUSTOMERS_APPOINTMENT=1
say_hello
while true; do
  serving "$NO_CUSTOMERS_APPOINTMENT"
  RETVAL=$?
  if [ $RETVAL -eq 0 ]; then
    break
  else
    printf "\nI could not find that service. Would you like to choose again ? (If not press Ctrl + C to quit, thank you )\n"
  fi
  ((NO_CUSTOMERS_APPOINTMENT++))
done

