## Introduction
Football analytics has expanded beyond traditional metrics to include advanced statistics such as expected goals (xG) and progressive movements. Understanding how these metrics correlate with actual output like goals and assists is crucial for scouting, coaching, and player evaluation. In this project, we investigate how xG, xAG, PrgP, PrgC, and Minutes predict a player's contribution per 90 minutes (G+A_90).


* multivariate-models:
This study explores player performance in the 2023–24 Premier League season by SAS to analyses how various advanced metrics predict goal contributions per 90 minutes. we applied multiple linear regression and various model selection techniques, including Best Subsets, Forward Selection, Backward Elimination, and Stepwise Selection. 

* Data Explanation
  * xG (Expected Goals): The expected number of goals from the player's shots.
  * xAG (Expected Assists): The expected number of assists from the player's passes.
  * PrgP (Progressive Passes): Number of passes made by the player that moved the ball forward.
  * PrgC (Progressive Carries): Number of times the player carried the ball forward.
  * Pos: The player's position.
  * Min (Minutes): Total minutes played by the player.
  * Nation: The player's nationality.

## Technical Highlights
  * Exploratory Data Analysis: PROC MEANS, PROC UNIVARIATE, and PROC SGSCATTER.
  * Statistical Modeling: PROC REG with Selection=Stepwise and Selection=Forward.
  * Validation: Multicollinearity checks using Variance Inflation Factor (VIF).
  * Predictive Analysis: Generating confidence and prediction intervals (clb, clm, cli)

## Tools
* **Languages:** SAS
* **Environment:** SAS on demand for academic
## How to run our code
* Download premierplayer.csv.
* Update the proc import statement in the .sas file with your local directory path.
* Run the script in SAS Studio

## CONCLUSION
*	Final model: GA_90 ~ Min + xG + xAG
*	These three variables best explain goal contribution per 90 mins
* Progressive pass and Progressive Carries (PrgC, PrgP) not significant



## Source:
https://www.kaggle.com/datasets/orkunaktas/premier-league-all-players-stats-2324
