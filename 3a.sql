CREATE TABLE athlete (
  athlete_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INTEGER NOT NULL
);

CREATE TABLE event (
  event_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  date DATE NOT NULL,
  is_team_event BOOLEAN NOT NULL,
  athlete_id INTEGER REFERENCES athlete(athlete_id) ON DELETE SET NULL,
  team_id INTEGER REFERENCES team(team_id) ON DELETE SET NULL
);

CREATE TABLE team (
  team_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  nation_id INTEGER REFERENCES nation(nation_id) ON DELETE SET NULL
);

CREATE TABLE nation (
  nation_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  flag VARCHAR(255) NOT NULL
);

CREATE TABLE participates1 (
  athlete_id INTEGER REFERENCES athlete(athlete_id) ON DELETE CASCADE,
  event_id INTEGER REFERENCES event(event_id) ON DELETE CASCADE,
  rank INTEGER NOT NULL,
  PRIMARY KEY (athlete_id, event_id)
);

CREATE TABLE participates2 (
  team_id INTEGER REFERENCES team(team_id) ON DELETE CASCADE,
  event_id INTEGER REFERENCES event(event_id) ON DELETE CASCADE,
  rank INTEGER NOT NULL,
  PRIMARY KEY (team_id, event_id)
);



