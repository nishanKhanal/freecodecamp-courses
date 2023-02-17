#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"

# read username
echo "Enter your username:"
read USERNAME

# get user id from database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME';")

# if empty
if [[ -z $USER_ID ]]
then
  # display first time message
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # insert user
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME');")
  # get user id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME';")
else 
  # get games details from database
  GAME_DETAILS=$($PSQL "SELECT COUNT(*),MIN(attempts) FROM games WHERE user_id=$USER_ID")
  # parse game details
  IFS="|" read NUMBER_OF_GAMES BEST_ATTEMPT <<< $GAME_DETAILS
  # display welcome back message
  echo "Welcome back, $USERNAME! You have played $NUMBER_OF_GAMES games, and your best game took $BEST_ATTEMPT guesses." 
fi

# generate secret number
SECRET=$(($RANDOM % 1000 + 1))
# initialize number of guesses to 1
NUMBER_OF_GUESSES=1

# display guess secret number
echo "Guess the secret number between 1 and 1000:"

while :
do
  # read input
  read USER_GUESS
  # if not integer 
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    # display guess again and continue
    echo "That is not an integer, guess again:"
  else
    # check with secret
    # if equals
    if [[ $USER_GUESS -eq $SECRET ]]
    then
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET. Nice job!"
      break
    elif [[ $USER_GUESS -gt $SECRET ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
    # increase number of guesses by 1
    NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES + 1))
  fi
done

# insert game details 
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, attempts) VALUES('$USER_ID',$NUMBER_OF_GUESSES)")

