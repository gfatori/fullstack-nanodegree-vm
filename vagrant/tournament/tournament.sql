CREATE TABLE IF NOT EXISTS player (
	id SERIAL PRIMARY KEY, 
	name TEXT);

CREATE TABLE IF NOT EXISTS match (
	id SERIAL PRIMARY KEY,
	winner INTEGER references player (id),
	loser INTEGER references player (id)
	);
