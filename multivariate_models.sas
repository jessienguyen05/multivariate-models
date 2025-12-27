/* Generated Code (IMPORT) */
/* Source File: premierplayer.csv */
/* Source Path: /home/u64129924 */
/* Code generated on: 12/27/25, 10:54 AM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/u64129924/premierplayer.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=premierplayer;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=premierplayer; RUN;


%web_open_table(WORK.IMPORT);

proc print;

run;

*Checking For assumptions and discriptive Statistics. This section of the code tells us;

*how each variable is and explains the variables;

*Main Idea in this Section is to just exaplain the varibales and the assumptions and;

*We are not making any claims or judgement;

proc means data= premierplayer maxdec=2;

var GA_90 Min xG xAG PrgC PrgP ;

run;


proc univariate data=premierplayer noprint;

var GA_90 Min xG xAG PrgC PrgP ;

histogram Min xG xAG PrgC PrgP GA_90/ normal;

run;


proc reg data=premierplayer;

model GA_90 = Min xG xAG PrgC PrgP/ VIF;

run;


*In this section we are going to do Explanotory Data Analysis where we check the;

*relationships between the response and each predictor variable and still make not claims yet;

*we shall run the SLR of all predictor varibales and the multilinear regression;

*We shall talk about the significant and R sqaured and Adjusted R-squre;


*Summary----The estimated intercept (b₀) was [value], and the slope (b₁) was [value].

The model had an R-squared value of [value], indicating that approximately [value]% of

the variance in [dependent variable] was associated with the linear relationship with

[independent variable].The F-statistic was [value] with a p-value of [value]. The residual

standard error was [value] on [df] degrees of freedom.;

proc reg data= premierplayer;

model GA_90 = Min;

model GA_90 = xG;

model GA_90 = xAG;

model GA_90 = PrgC;

model GA_90 = PrgP;

run;


*summary----The model R-squared was [value], and the adjusted R-squared was [value].

The F-statistic for the overall regression was [value] with a p-value of [value].

The residual standard error was [value], based on [df] degrees of freedom.;

proc reg data=premierplayer;

model GA_90 = Min xG xAG PrgC PrgP/ clb clm cli alpha = 0.05;

run;


*In this section make sure that the results in both the SLR and MLR make the same conclusion;

*However checking the proc corr will shows us that sometimes adding some predictor variables;

*to the model may not be significant anymore but we do not have a relationship between the;

*predictor variable that is 0;

*Meaning there are no explanatory variables that affect the relationship with the other explanatory;

*variables and the response.;

proc sgscatter data=premierplayer;

matrix GA_90 Min xG xAG PrgC PrgP;

run;


proc corr data= premierplayer noprob;

var GA_90 Min xG xAG PrgC PrgP;

run;


*In this section this is where we are goin to answer the main

*We shall run a multi linear regression and talk about the P-values and confidence interval

*The null hypothesis and the Alternative Hypothesis

*Degree of freedoms

*F-value and F-statistics (If F-value>F-statistics) we reject Ho

*make a conlusion that at least one is important in predicting the response variable. GA_90;

*Check type I--tests each predictor after accounting for all other predictors in order

*type III added last.;

proc reg data= premierplayer;

model GA_90 = Min xG xAG PrgC PrgP/ clb clm cli alpha = 0.05 VIF;

run;


proc reg data=premierplayer;

model GA_90 = Min xG xAG PrgC PrgP / ss1 ss2 pcorr1 pcorr2;

Run;



*Selecting the best subset model and select two models and what cretirias we used in selecting them;

proc reg data=premierplayer outest=fits;

model GA_90 = Min xG xAG PrgC PrgP

/selection=rsquare adjrsq cp aic sbc b best=2;

run;


*we used the Adjusted R-squred and C(p) in slecting models that we think are the best;

*Check the Vif of the model to see if multicolinearity and compare Adj-Rquare.and check

*the p-value of all predictor variables to see if they are all still significant;

proc reg data = premierplayer;

model GA_90 = Min xG xAG/VIF;

run;

proc reg data = premierplayer;

model GA_90 = Min xG xAG PrgP/VIF;

run;

proc reg data = premierplayer;

model GA_90 = xG xAG/VIF;

run;


*Using forward selection, Backword and stepwise

*Check if both forward and backword give us the same results, like check if forward keeps the

important variables and check of back word eliminates the useless variabels ;

*****Forward Selection;

proc reg data=premierplayer;

model GA_90 = Min xG xAG PrgC PrgP

/selection=forward slentry=0.15 ;

run;

*****Backward Selection;

proc reg data=premierplayer;

model GA_90 = Min xG xAG PrgC PrgP

/selection=backward slstay=0.15;

run;

*****Stepwise Selection;

proc reg data=premierplayer;

model GA_90 = Min xG xAG PrgC PrgP

/selection=stepwise slentry=0.15 slstay=0.15;

run;


*NOTE WHEN WE RUN THE MODEL THAT HAS Min PrgC and PrgP it shows that Min is not significant but

but if PrgC and PrgP are taken out and Min xG and xGA it becomes significant;

proc reg data=premierplayer;

model GA_90 = Min PrgC PrgP;

model GA_90 = Min xG xAG;

run;

********************************;


*After all the Analysis we found out that the predictor variables that best predicts a players

goal contribution in 90mins is mins played, expected goals and expected goals and assist.;





*In this section we are doing a predictive Analysis;

data new;

Min = 3188;

xG = 30;

xAG =13;

GA_90 = .;output;

data players;

set premierplayer new;

run;

proc print;

run;

proc reg data=premierplayer;

model GA_90 = Min xG xAG/ clb clm cli alpha=0.05;

run;