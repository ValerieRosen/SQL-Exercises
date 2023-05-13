CREATE TABLE Teams (
    id PRIMARY KEY,
    name TEXT,
    city TEXT,
);

CREATE TABLE Referees (
    id PRIMARY KEY,
    name TEXT,
);

CREATE TABLE Results (
    id PRIMARY KEY,
    team_id FOREIGN KEY,
    match_id FOREIGN KEY,
    result(win, loss or draw),
);

CREATE TABLE Players (
    id PRIMARY KEY,
    name TEXT,
    birthday DATE,
    height INTEGER,
    current_team_id FOREIGN KEY,
);

CREATE TABLE Matches (
    id PRIMARY KEY,
    home_team_id FOREIGN KEY,
    away_team_id FOREIGN KEY,
    Location,
    date,
    start_time,
    season_id FOREIGN KEY,
    head_referee_id FOREIGN KEY,
    assistant_referee_1_id FOREIGN KEY,
    assistant_referee_2_id FOREIGN KEY,
);

CREATE TABLE Goals (
    id PRIMARY KEY,
    player_id FOREIGN KEY,
    match_id FOREIGN KEY,
);

CREATE TABLE Lineups (
    id PRIMARY KEY,
    player_id FOREIGN KEY,
    match_id FOREIGN KEY,
    team_id FOREIGN KEY,
);

CREATE TABLE Season (
    id PRIMARY KEY,
    start_date,
    end_date,
);

