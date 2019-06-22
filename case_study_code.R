library(sqldf)
library(ggplot2)

setwd("F:/SMU/DS6306/Case_Study")

beers <- read.csv("Beers.csv")
breweries <- read.csv("Breweries.csv")

a <- data.frame(sqldf("SELECT State, COUNT(*) FROM breweries GROUP BY State"))  # count of breweries by state


b <- data.frame(sqldf("SELECT * FROM breweries a INNER JOIN beers b ON a.Brew_ID = b.Brewery_ID"))  # merge the two files

head(b,6)  # list the first 6 obs in merged file
tail(b,6)  # list the last 6 obs in the merged file

c <- colSums(is.na(b))  # count the number of NAs in each column
                                  
d <- data.frame(sqldf("SELECT State, MEDIAN(ABV), MEDIAN(IBU) FROM b GROUP BY State"))  # Median alcoholo content and IBU for each state

data.frame(sqldf("SELECT State, ABV, IBU FROM b WHERE State Like '%SD%'"))  # double check state with NA for IBU

# create the graph - Median ABV
ggplot(d, aes(x = reorder(State, MEDIAN.ABV.), y = MEDIAN.ABV., fill = -MEDIAN.ABV.)) + 
  geom_bar(stat = "identity", position="dodge",  na.rm = TRUE) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position = "none") + 
  ggtitle("Median Alcohol Content by Volume (ABV) by State") + theme(plot.title = element_text(hjust = 0.5)) + 
  labs(x = "State (U.S.)", y = "Alcohol Content by Volume") +
  coord_flip() # flips the chart

# create the graph - Median IBU
ggplot(d, aes(x = reorder(State, MEDIAN.IBU.), y = MEDIAN.IBU., fill = -MEDIAN.IBU.)) + 
  geom_bar(stat = "identity", position="dodge",  na.rm = TRUE) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position = "none") + 
  ggtitle("Median International Business Unit (IBU) by State") + theme(plot.title = element_text(hjust = 0.5)) + 
  labs(x = "State (U.S.)", y = "International Business Unit (IBU)") +
  coord_flip() # flips the chart

e <- data.frame(sqldf("SELECT State, MAX(ABV) FROM b GROUP BY State ORDER BY ABV DESC"))  # rank order by state and ABV to check
e <- data.frame(sqldf("SELECT State, MAX(ABV) FROM b where ABV = (SELECT MAX(ABV) FROM B) GROUP BY State"))  # state with the highest ABV

f <- data.frame(sqldf("SELECT State, MAX(IBU) FROM b GROUP BY State ORDER BY IBU DESC"))  # rank order by state and IBU to check
f <- data.frame(sqldf("SELECT State, MAX(IBU) FROM b where IBU = (SELECT MAX(IBU) FROM B) GROUP BY State"))  # state with the highest IBU

summary(b$ABV)  # summary stats for ABV
summary(b$IBU)  # summary stats for IBU

#  plot ABV vs. IBU - there does appear to be a linear relationship between ABV and IBU
ggplot(b, aes(x=ABV, y=IBU, color = factor(b$Ounces))) + 
  geom_point(na.rm = TRUE) +
  ggtitle("Alcohol Content by Volume (ABV) vs. International Bitterness Unit (IBU)") + theme(plot.title = element_text(hjust = 0.5)) + 
  labs(x = "Alcohol Content by Volume (ABV)", y = "International Bitterness Unit (IBU)", color = "Ounces")
  