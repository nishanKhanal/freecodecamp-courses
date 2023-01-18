#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

TRUNCATE_RETURN="$($PSQL "TRUNCATE TABLE games, teams;")"

cat games.csv | while IFS="," read YEAR ROUND WINNER_TEAM OPPONENT_TEAM WINNER_GOALS OPPONENT_GOALS
do 
  if [[ $YEAR != "year" ]]
  then
    #get winner_id
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER_TEAM';")"
    #if not then insert and get the id
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_TEAM_RETURN="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER_TEAM');")"
      WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER_TEAM';")"
    fi

    #get opponent_id
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT_TEAM';")"
    #if not then insert and get the id
    if [[ -z $OPPONENT_ID ]]
    then

      INSERT_OPPONENT_TEAM_RETURN="$($PSQL "INSERT INTO teams(name) values('$OPPONENT_TEAM');")"
      OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT_TEAM';")"
    fi

    #insert game data
    INSERT_GAME_RETURN="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")"
  fi
done
