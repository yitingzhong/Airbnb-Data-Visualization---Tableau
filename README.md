# Airbnb Data Visualization - Tableau

## Overview 
<br>The data is downloaded from Inside Airbnb website http://insideairbnb.com/get-the-data.html, which collected publicly information of certain large cities from the Airbnb site. Among available data, I concentrated seven representative cities from seven states – Seattle WA, San Francisco CA, Austin TX, Chicago IL, New York City NY, Boston MA and Broward County FL. In this analysis report, I used information and metrics of listings (listings.csv) from March 2019, as well as raw reviews (reviews.csv.gz) from year of 2019. The listing files contain summary information for a specific Airbnb house, such as Room Type, Price, Home Location, Number of Reviews, etc. The reviews files contain paragraphs of consumer reviews for a specific Airbnb house. 

## Methodology - Data Cleaning

For seven listing files, they were combined into one, with an additional column created for State. 

For raw reviews files, keywords were extracted from consumer reviews. Top 15 most frequent keywords were kept in the final csv file used for Tableau analysis. The following process was adopted step by step to get the final file: 
1) Observations with reviews containing “automatically generated” were deleted, as these reviews were automatically filled by Airbnb not by consumers; (This step done in Excel, step 2 - 6 done in R) 
2) Separated words from reviews by blanks; 
3) Used Regular expressions to keep only letters and numerals with other punctuations replaced by blank; 
4) Removed extra blanks and null values; 
5) Filtered meaningless common words, such as 'a', 'the', etc., using the stop-word list (Silva 1662); 
6) Obtained final words and their frequencies and kept top 100 frequent keywords. 

<br>Notice that not all top 100 frequent words were helpful in judging user experience. For example, ‘place' is the most frequent word, but it cannot necessarily tell how a consumer feel. Among the keywords obtained, I further validated meaningful words based on common sense of related terms concerning either home external environment or internal amenities or host relationship. Finally, kept the most frequent 15 words, calculated whether a keyword appeared for a specific home, and coded them as 0/1 dummy variables.


## Conclusion 

· Guests: Personalized Recommendation System on The Buyer Side 

Reviews data can be used as a good source to recommend best homes for users. Based on user’s past reviews, machine leaning models can be applied to do sentiment analysis and find out the important factors that matter to a user. Weights for different aspects of factors could be assigned to reflect relative importance. Besides from reviews, home type and price are also important factors that influence user’s pick. Historical data on what kind of home type and what range of price a user usually picks can reveal his/her preferences. Finally, also include demographic features of a user, such as gender, age and profession, in the recommendation model. 

· Hosts: Try to Be Nice and Friendly 

For hosts who provide shared room/private room, it is crucial to be nice and friendly, establishing a healthy relationship with prospective guests. In order to provide a good user experience, hosts should be welcoming from start to the end and address questions in a quick manner. 

· Limitations 

The listing data only contains very few features of an Airbnb house, but misses other important features, such as cleaning fee, # of bedrooms, # of bathrooms, # of maximum guests, etc. A price prediction model could be constructed if more housing information is provided. Also notice that the generalization of this price prediction model to different cities/states could be a problem, as shown in the comparison analysis of different cities, price distribution vary a lot among different states.
