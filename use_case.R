library(StatsBombR)

# shots and goals for each team in a specific competition 

# get all the free competitions 
competitions = FreeCompetitions()
glimpse(competitions)

# choose a specific competition and season to pull all of their matches "La Liga 2005/2006"
laliga_2005_2006 = competitions %>%
                      filter(competition_id == 11, season_name == "2005/2006")

# grab the matches of the competition 
Matches = FreeMatches(laliga_2005_2006)
glimpse(Matches)

# grab the events of the laliga matches
Events = StatsBombFreeEvents(Matches, Parallel = T)

# count the shots and the goals for each team 
shots_goals = Events %>%
                  group_by(team.name) %>%
                  summarize(shots = sum(type.name == "Shot", na.rm = T),
                            goals = sum(shot.outcome.name == "Goal", na.rm = T))
shots_goals




