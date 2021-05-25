##https://stat2labs.sites.grinnell.edu/Handouts/rtutorials/IntroTidyData.html

########################################################################
# Part One - Entry level
########################################################################

library(alr4)
library(tidyverse)
library(ggplot2)

UBSprices <- as.data.frame(UBSprices)
head(UBSprices)

#Questions to Answer
#1. What is the general trend og rice prices in all countries from 2003 to 2009, 
#  use a boxplot to illustrate your findings 

tidy_ubs <- UBSprices[,c(3,6)]

tidy_ubs2 <- gather(data = tidy_ubs, key = year, value = price, rice2003, rice2009)

head(tidy_ubs2)

tidy_ubs2$year <- parse_number(tidy_ubs2$year)
tidy_ubs2$year  <- as.factor(tidy_ubs2$year)

ggplot(data=tidy_ubs2,aes(x=year, y=price)) + 
        geom_boxplot()


#2. Subset a list of countries that have an increase of rice price from 2003 to 2009? 
#  plot the countries in a bar chart showing the differences in prices
#  subet another list of countries that have an decrease of price from 2003 to 2009

tidy_ubs

tidy_ubs$diff <- tidy_ubs$rice2009 - tidy_ubs$rice2003

increase_rice <- tidy_ubs[tidy_ubs$diff>0,]
increase_rice$countries <- as.factor(rownames(increase_rice))

ggplot(data=increase_rice,aes(x=diff,y=countries)) + 
  geom_col()

#reordering countries by differences 
increase_rice$countries <- fct_reorder(increase_rice$countries, increase_rice$diff) 

ggplot(data=increase_rice,aes(x=diff,y=countries)) + 
  geom_col()

##countries with decreased riceprice
decrease_rice <- tidy_ubs[tidy_ubs$diff<0,]
decrease_rice$countries <- as.factor(rownames(decrease_rice))

ggplot(data=decrease_rice,aes(x=diff,y=countries)) + 
  geom_col()

#reordering countries by differences 
decrease_rice$countries <- fct_reorder(decrease_rice$countries, decrease_rice$diff) 

ggplot(data=decrease_rice,aes(x=diff,y=countries)) + 
  geom_col()

########################################################################
# Part Two - Intermediate
########################################################################

#Time and date manipulation  in dataset 

library(nycflights13)
flights <- flights
str(flights)

#its not always this lucky when a dataset includes a POSIXct columns to communicate the time

#  Can you restructure the Datetime from the other columns to reconstuctre the POSTXct columns? 



########################################################################
# Part Three - Advances 
########################################################################

library(parathyroidSE)
data(parathyroidExonsSE)

cm <- assay(parathyroidExonsSE)[1:1000,1:20]

#1. This is a subset of a count matrix contain the RNA_Seq results of an experiment pertaining to Parathyrioid, 
#   using the row numbers as your gene i.e. row1 = gene1, and col1 = sample 1

#   Identify which genes have not been expressed in the dataset, 
#   Plot a heatmap of the dataset, showing a hierarchical clustering on the both the rows and columns
#     Can you identify which samples belongs to which groups each samples belongs two? 

#   Plot the same heatmap after log transforming your data in base10
#     Can you identify which samples belongs to which groups each samples belongs two? 

#   Sub-setting the data set to first of the two group as previous selected
#     calculate the average of each genes within each samples

#   Sub-setting the data set to second of the two group as previous selected
#     calculate the average of each genes within each samples

#   Calculate the difference between the two groups (this is not how you do DEG analysis)
#     Can you plot a bar plot (similar as section 1) on the top 10 genes that shows the differences between the two samples? 

#   Perform a PCA analysis on the original dataset, can you identify any sample that should no be included in the analysis you did just now? 

#   Complete the same analysis on the complete data (if you can), do you see any differences in the results? 
#   cross check your results with colData(parathyroidExonsSE), does your analysis matched the original samples? 
#   what else can you do further refine the analysis? 



