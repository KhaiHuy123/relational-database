#!/bin/bash

PSQL="psql -U freecodecamp -d number_guessing_game --no-align --tuples-only -c"

echo -n "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USERNAME'")

# check if user_id exist or not
if [[ -n $USER_ID ]]; then
  GAMES_PLAYED=$($PSQL "SELECT num_of_attemps FROM users WHERE user_id = '$USER_ID'")
  GAMES_BEST=$($PSQL "SELECT MIN(NULLIF(best_record, 0)) FROM games WHERE user_id ='$USER_ID'")
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $GAMES_BEST guesses."
else # if not, insert new user into users table
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(user_name) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USERNAME'")
  printf "Welcome, $USERNAME! It looks like this is your first time here."
fi

echo -n "Guess the secret number between 1 and 1000:"

ATTEMP=1 # counter_variable
RANDOM_NUM=$(($RANDOM % 1000 + 1))

while read GUESS_NUM; do
  # check if guessing num is a number
  if [[ $(expr "$GUESS_NUM" : "^[0-9]*$") -gt 0 ]]; then
    # if guessing num match our secret num, game end
    # break the while loop and save best record & num of attemps
    if [[ $GUESS_NUM -eq $RANDOM_NUM ]]; then
      break
    # give user a hint for next attemp
    else
      if [[ $GUESS_NUM -gt $RANDOM_NUM ]]; then
        echo -n "It's lower than that, guess again:" # if you want to quit, press Ctrl + C
      else
        echo -n "It's higher than that, guess again:" # if you want to quit, press Ctrl + C
      fi
    fi
  # if guessing num is not a number, try again 
  else
    echo -n "That is not an integer, guess again:" # if you want to quit, press Ctrl + C
  fi
  ATTEMP=$(($ATTEMP + 1)) # increment counter each loop
done

if [ "$ATTEMP" -eq "1" ]; then
  echo -e "You guessed it in $ATTEMP tries. The secret number was $RANDOM_NUM. Nice job!"
else
  echo -e "You guessed it in $ATTEMP tries. The secret number was $RANDOM_NUM. Nice job!"
fi

# insert new best score into games table
INSERT_NEW_BEST_RECORD=$($PSQL "INSERT INTO games(user_id, best_record) VALUES($USER_ID, $ATTEMP)")
GAMES_PLAYED_PLUS=$(($GAMES_PLAYED + 1))
UPDATE_USER_INFO=$($PSQL "UPDATE users SET num_of_attemps='$GAMES_PLAYED_PLUS' WHERE user_id = '$USER_ID'")

# hint :
# if you want to quit, press Ctrl + C