library(StatsBombR)
source("get_played_minutes.R")
source("Draw_Pitch.R")
# played minutes by each player 

# get all the free competitions 
competitions = FreeCompetitions()
glimpse(competitions)

# choose a specific competition and season to pull all of their matches "La Liga 2005/2006"
laliga_2005_2006 = competitions %>%
  filter(competition_id == 11, season_name == "2005/2006")

# grab the matches of the competition 
Matches = FreeMatches(laliga_2005_2006)
glimpse(Matches)

# grab the events of the La Liga matches
Events = StatsBombFreeEvents(Matches, Parallel = T)



############################################### Barcelona Analytics #################################################

# filter for only Barcelona 
Barcelona_Evetns = Events %>% filter(team.name == "Barcelona")

################################### players played minutes and shots stats

# get unique players ids
player_ids = unique(Barcelona_Evetns$player.id)
player_ids = player_ids[!is.na(player_ids)]

# initialize played minutes vector with zeros 
played_minutes = rep(0L, length((player_ids)))

# create the players data frame 
players_df = data.frame(player_ids, played_minutes)

# add the played minutes by each player to the data frame 
# here I send the whole matches because Barcelona played all of them 
# otherwise I would have filter for only matches played by a certain team t
players_df = get_played_minutes(players_df, Matches)

# get the players names 
players_names = Barcelona_Evetns %>% group_by(player.id) %>% select(player.id, player.name) %>% unique()

# join the two dfs so that we have the players names and played minutes
players_data = players_df %>% inner_join(players_names, by = c("player_ids" = "player.id"))

# order the columns 
col_order <- c("player_ids", "player.name", "played_minutes")
players_data = players_data[,col_order]

# create new variable ninties = no. of matches played by every player from total of 17 games
players_data = players_data %>%
                  mutate(ninties = round(played_minutes / 90, 2))
# get shots by every player
players_shots = Barcelona_Evetns %>%
                    group_by(player.id) %>%
                    summarize(shots = sum(type.name == "Shot", na.rm = T))
players_shots = players_shots[-nrow(players_shots),]

# add the players shots to the players data
players_data = players_data %>% inner_join(players_shots, by = c("player_ids" = "player.id"))

# add shots per ninties = no. of shots per game
players_data = players_data %>% 
                  mutate(shots_per_90 = ifelse(shots > 0, round(shots / ninties, 2), 0))

# rename the first and second columns for naming consistency
names(players_data)[1] = "player_id"
names(players_data)[2] = "player_name"

formattable::formattable(players_data[,-1])


################################### Barcelona vs Real Madrid shots 
Barca_vs_Madrid = Matches %>%
                      filter((home_team.home_team_name == "Barcelona" & away_team.away_team_name == "Real Madrid") |
                               home_team.home_team_name == "Real Madrid" & away_team.away_team_name == "Barcelona")
Barca_vs_Madrid_Events = StatsBombFreeEvents(Barca_vs_Madrid, Parallel = T)

Barca_vs_Madrid_Shots = Barca_vs_Madrid_Events %>% 
                            filter(type.name == "Shot")
x = sapply(Barca_vs_Madrid_Shots$location, "[[", 1) 
y = sapply(Barca_vs_Madrid_Shots$location, "[[", 2)

Barca_vs_Madrid_Shots = Barca_vs_Madrid_Shots %>% 
      mutate(shots_x = case_when(team.name == "Real Madrid" ~ 120 - x,
                                 TRUE ~ x) ,
             shots_y = y)

hori5 + geom_point(data = Barca_vs_Madrid_Shots, aes(shots_x, shots_y, color = team.name, alpha = shot.statsbomb_xg , shape = shot.outcome.name == "Goal"), size = 5) + scale_color_manual(values=c("#00008B", "#FFFAFA"))



################################### Messi passes 
Messi_passes = Barca_vs_Madrid_Events %>% filter(type.name == "Pass", player.name == "Lionel Andrés Messi Cuccittini")

x = sapply(Messi_passes$location, "[[", 1) 
y = sapply(Messi_passes$location, "[[", 2)

Messi_passes = Messi_passes %>% 
                  mutate(pass_start_x = x,
                         pass_start_y = 80 - y)

x = sapply(Messi_passes$pass.end_location, "[[", 1) 
y = sapply(Messi_passes$pass.end_location, "[[", 2)

Messi_passes = Messi_passes %>% 
  mutate(pass_end_x = x,
         pass_end_y = 80 - y)

hori5 + geom_segment(data=Messi_passes, aes(x=pass_start_x,xend=pass_end_x,
                                                  y=pass_start_y,yend=pass_end_y),size=1.5,color = "#00008B", arrow=arrow(length = unit(0.03, "npc")))

