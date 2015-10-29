-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

CREATE TABLE IF NOT EXISTS player (
	id INTEGER PRIMARY KEY ASC, name TEXT);

CREATE TABLE IF NOT EXISTS tournament (
	id INTEGER PRIMARY KEY ASC, 
	name TEXT,
	player INTEGER references player (id)
	champion INTEGER references player (id)
	);

CREATE TABLE IF NOT EXISTS match (
	id INTEGER PRIMARY KEY ASC,
	tournament INTEGER references tournament (id), 
	player_one INTEGER references player (id),
	player_two INTEGER references player (id),
	score_player_one INTEGER,
	score_player_two INTEGER,
	name TEXT,
	);

