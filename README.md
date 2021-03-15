# Breaking-Into-Football-Analytics
* This repo is a start to break into football analytics
* Data Credit: all data in this repo is used from the StatsBomb Open Data and extracted through their "StatsBombR" package

![alt text](https://i1.wp.com/statsbomb.com/wp-content/uploads/2020/06/Screenshot-2020-06-25-at-15.49.54.png?resize=300%2C147&ssl=1 "StatsBomb logo")


## Barca_2005_2006_stats
	1. "Barca_stats.R" contains code snippets to generate some statistics about Barcelona team in 2005/2006 season in the La Liga
	2. Some statistics pictures

## Barcelona 2005/2006 statistics - These findings are based on only the available 17 matches from statsBomb
* Players statistics - played minutes and shots per ninties

	| player_name							| played_minutes		| ninties			| shots			| shots_per_90     |
	| :---------							| :---------		   	| :---------			| :---------		| :---------       |
	| Henrik Larsson						| 459				| 5.10				| 23			| 4.51 		   |
	| Andrés Iniesta Luján						| 724				| 8.04				| 12			| 1.49 		   |
	| Ronaldo de Assis Moreira					| 1346				| 14.96				| 59			| 3.94 		   |
	| Carles Puyol i Saforcada					| 1524				| 16.93				| 4			| 0.24 	           |
	| Rafael Márquez Álvarez					| 1194				| 13.27				| 12			| 0.90 		   |
	| Oleguer Presas Renom						| 1315				| 14.61				| 4			| 0.27 		   |
	| José Edmílson Gomes de Moraes					| 1219				| 13.54				| 11			| 0.81 		   |
	| Ludovic Giuly							| 535				| 5.94				| 23			| 3.87 		   |
	| Mark van Bommel						| 595				| 6.61				| 17			| 2.57 		   |
	| Sylvio Mendes Campos Junior					| 1080				| 12.00				| 5			| 0.42 		   |
	| Víctor Valdés Arribas						| 1530				| 17.00				| 0			| 0.00 		   |
	| Lionel Andrés Messi Cuccittini				| 911				| 10.12				| 38			| 3.75 		   |
	| Juliano Haus Belletti						| 531				| 5.90				| 5			| 0.85 		   |
	| Maximiliano Gastón López					| 6				| 0.07				| 0			| 0.00 		   |
	| Samuel Eto"o Fils						| 1230				| 13.67				| 59			| 4.32		   |
	| Anderson Luís de Souza					| 1094				| 12.16				| 18			| 1.48 		   |
	| Thiago Motta							| 336				| 3.73				| 9			| 2.41 		   |
	| Giovanni van Bronckhorst					| 508				| 5.64				| 5			| 0.89 		   |
	| Gabriel Francisco García de la Torre				| 200				| 2.22				| 2			| 0.90 		   |
	| Xavier Hernández Creus					| 436				| 4.84				| 9			| 1.86 		   |
	| Santiago Ezquerro Marín					| 54				| 0.60				| 1			| 1.67 		   |

* Barca vs Real Madrid 3/0 - shots and goals showing the XG using transparency 
	<img src="https://github.com/ahmed1salama/Breaking-Into-Football-Analytics/blob/main/Barca_2005_2006_stats/Barca_vs_Madrid_2005_2006_3_0_shots.png" alt="Shots and Goals" width="1500" height = "550"/>

* Barca vs Real Madrid 3/0 - Messi passes summary
	<img src="https://github.com/ahmed1salama/Breaking-Into-Football-Analytics/blob/main/Barca_2005_2006_stats/Messi_passes.png" alt="Messi Passes" width="1500" height = "550"/>


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



