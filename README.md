Swiss Pairing Tournament Project
=============

This project is a system for making a Swiss Pairing Tournament.
To run it, use the vagrant vm provided, by running the commands
 - 1. vagrant up
 - 2. vagrant ssh
 - 3. go to the vagrant folder.
 - 4. In postgres, create the "tournament" database.
 - 5. In postgres, connect to the "tournament" database.
 - 6. In postgres, import my tournament.sql file using "\i tournament.sql" command.
 - 7. Now run the tournament_test.py file.