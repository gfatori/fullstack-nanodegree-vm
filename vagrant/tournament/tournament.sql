CREATE TABLE IF NOT EXISTS player (
	id SERIAL PRIMARY KEY, 
	name TEXT);

CREATE TABLE IF NOT EXISTS match (
	id SERIAL PRIMARY KEY,
	winner INTEGER references player (id),
	loser INTEGER references player (id)
	);

CREATE VIEW matches_played AS
SELECT player.id, player.name, COUNT(match.id) as played
FROM player
LEFT JOIN match
ON player.id = match.winner or player.id = match.loser
GROUP BY player.id;

CREATE VIEW player_wins AS
SELECT ply.id, ply.name, COUNT (mtc.winner) AS wins
FROM player ply
LEFT JOIN  match mtc on ply.id = mtc.winner
GROUP BY ply.id
ORDER BY wins DESC;

CREATE VIEW standings AS
SELECT matches_played.id, 
matches_played.name, 
COALESCE(player_wins.wins,0) AS wins,
matches_played.played
FROM matches_played
LEFT JOIN player_wins
ON matches_played.id = player_wins.id
ORDER BY wins DESC;