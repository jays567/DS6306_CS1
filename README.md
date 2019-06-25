We’ve Got Data – Data Analytics Corporation providing useful data analytics to clients so that they can make business decisions in distributions of breweries.

Team Members

William Hinton

Jayson Barker

Jeremy Simpson

Introduction

We gather data from two data sources (beers.csv and breweries.csv). Our data analysis was done to give our client the abilities to make decision about what/which target area in the US to move into. Our plots and graphs hopefully will help shed some light on this information.

The analysis below consists of draft beer information per brewery in each state in the USA. We report on contains level of alcohol and how bitter each beer.

This section lists the datasets descriptions:

1. We list the counts of brewery per state.

2. We took two files and merged them together so that we can create comparable analysis with beer and brewery per brew_id. We have one combine dataset.

3. We list the top 6 states with high ABV levels and the bottom 6 with IBU.

4. We show that there are no missing/empty values ‘NAs’ in any columns.

5. We display a graph which outlines the states that has median level of ABV, and they are (KY and DC).

6. We also display a graph that displays a graph of median bitterness IBU per state.

7. The last graph is a plot of alcohol content and bitterness verse the internationally per ounces of a bottle of beer.

We hope these analysis has shed some light into your company as to what target area in which states you want to start with building your distributor company.

Data files

We used two data files for this analysis:

1. Beers.csv - which contains the name of the beer, the beer ID, the associated ABV and IBU ratings, style, ounces, and brewery identifiers where these beers are served.

2. Breweries.csv - which contains a listing of the brewery name, city, and state, and brewery ID which allows us to join these two files together.

Within the R Code

1. b_beers - contains the Beers.csv data

2. a_breweries - contains the Breweries.csv data

3. a1_breweries  - contains the count of breweries by state

4. b1_beers - contains the merged data file between the beers and breweries data set

5. c_na - contains the count of NA values from the merged beers and breweries data set

6. d_median - contains the median ABV and IBU values by state

7. e - contains the max ABV for each state

8. f - contains the max IBU for each state
