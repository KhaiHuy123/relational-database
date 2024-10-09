#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Clear data from tables
echo "$($PSQL "TRUNCATE TABLE games, teams")"

cat games.csv | 
while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; do
  if [[ $YEAR != "year" ]]; then

    # check winner's information. if not exist then insert into teams table
    CHECK_WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $CHECK_WINNER_ID ]]; then
      INSERT_NEW_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_NEW_WINNER = "INSERT 0 1" ]]; then
        printf "Table [teams] - Insert new winner : $WINNER\n"
      fi
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    # check opponent's information. if not exist then insert into teams table
    CHECK_OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $CHECK_OPPONENT_ID ]]; then
      INSERT_NEW_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_NEW_OPPONENT = "INSERT 0 1" ]]; then
        printf "Table [teams] - Insert new opponent : $OPPONENT\n"
      fi
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    # insert data into games table
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
    VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAME = "INSERT 0 1" ]]; then
      printf "Table [games] - Insert $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS\n\n"
    fi
  fi
done

# hint :
# when inserting data, we should insert data into child table before inserting data into parent table 
# in this database, games is parent table, teams is child table
