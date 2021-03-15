# Breaking-Into-Football-Analytics
* This repo is a start to break into football analytics
* Data Credit: all data in this repo is used from the StatsBomb Open Data and extracted through their "StatsBombR" package

![alt text](https://i1.wp.com/statsbomb.com/wp-content/uploads/2020/06/Screenshot-2020-06-25-at-15.49.54.png?resize=300%2C147&ssl=1 "StatsBomb logo")


## Barca_2005_2006_stats
	1. "Barca_stats.R" contains code snippets to generate some statistics about Barcelona team in 2005/2006 season in the La Liga
	2. Some statistics pictures

## Barcelona 2005/2006 statistics - These findings are based on only the available 17 matches from statsBomb
* Players statistics - played minutes and shots per ninties

* Barca vs Real Madrid 3/0 - shots and goals showingn the XG using transparency 
<img src="https://github.com/ahmed1salama/Breaking-Into-Football-Analytics/blob/main/Barca_2005_2006_stats/Barca_vs_Madrid_2005_2006_3_0_shots.png" alt="Shots and Goals" width="1200" height = "500"/>
* Barca vs Real Madrid 3/0 - Messi passes summary


## Draw_Pitch.R
* This file is for drawing the pitch either vertically or horizontally 


## get_played_minutes.R
* The statsBomb package version of this function had some errors so I made my own version 
* This function examins 3 things 1- if the player was in the starting eleven of the match, 2- if the player was substituted or 3- if the player took either a red card or a second yellow card
* Based on this info, I can tell the played minutes by each player in several matches 


## package_essentials.R
* Contains some essential functions of the statsBomb.R package to get the data only 
* Does not contain any ready made functions for statistics 
* Just brings the matches, competitions and events of any match for further exploration 



