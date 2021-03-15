library(StatsBombR)

# this function takes a df of players ids and Matches and adds the played minutes of each player to the players df
get_played_minutes = function(players_df, Matches){
  library(parallel)
  
  for(i in 1:nrow(players_df)){
    
    for (j in 1:nrow(Matches)){
      
      events = StatsBombFreeEvents(Matches[j,], Parallel = T) 
      
      if(!is.null(events)){
        
        starting_eleven = events %>% filter(type.name == "Starting XI")
        
        substitution =  events %>% filter(type.name == "Substitution")
        
        player_out = events %>% filter(type.name == "Substitution" | foul_committed.card.name=="Red Card" | foul_committed.card.name=="Second Yellow")
        
        if(players_df[i,]$player_ids %in% do.call(rbind, starting_eleven$tactics.lineup)$player.id){
          
          if(!(players_df[i,]$player_ids %in% player_out$player.id)){
            
            players_df[i,]$played_minutes = players_df[i,]$played_minutes + 90
            
          }
          
          else{
            
            players_df[i,]$played_minutes = players_df[i,]$played_minutes + player_out[player_out$player.id == players_df[i, "player_ids"],]$minute
            
          }
          
        }
        
        else if(players_df[i,]$player_ids %in% substitution$substitution.replacement.id){
          
          players_df[i,]$played_minutes = players_df[i,]$played_minutes + 90 - substitution[substitution$substitution.replacement.id == players_df[i, "player_ids"],]$minute
          
        }
      }
    }
  }
  return(players_df)
}