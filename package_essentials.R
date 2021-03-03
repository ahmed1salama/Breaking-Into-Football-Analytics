library(StatsBombR)

Competitions = FreeCompetitions() # This function returns all competitions that are released as free data from StatsBomb.com.

Matches = FreeMatches(Competitions)	# This function returns all free matches that are released as free data from StatsBomb.com.

Events = statsBombFreeEvents(Matches, Parallel = T)	# This function returns all events for the matches requested, or all matches available. This is for use with the freely released data from StatsBomb.com.


allclean(Events)	# Returns a data frame with all of the original data frame all cleaned for R with extra information added.



StatsBombFreeLineups(Mtaches)	# This function returns all lineups for the matches requested, or all matches available. This is for use with the freely released data from StatsBomb.com.
