#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
data("Titanic")
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))
titanic_df <- as.data.frame(Titanic)
#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(titanic_df, 10)
#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")
library(dplyr)
#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)
titanic_df %>%
  select(Survived, Sex)
#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
sex_survived_df <- titanic_df %>%
  select(Survived, Sex)

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
survived <- sex_survived_df %>% 
  select(-Sex)

#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'
sex_survived_df <- sex_survived_df %>%
  rename(Gender = Sex)
#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
gender_survived_df <- sex_survived_df %>%
  select(Gender, Survived)
#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
male_survived_df <- gender_survived_df %>%
  filter(Gender == "male")
#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())
gender_survived_df <- gender_survived_df %>%
  group_by(Gender) %>%
  arrange(Gender)
#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
total_examined <- sum(titanic_df$Freq)
#TASK: After you run it, write the total here:____ 2201
total_examined
#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
female_survived_df <- gender_survived_df %>%
  filter(Gender == "female")
#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
combined_survived_df <- bind_rows(male_survived_df, female_survived_df)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
# Creating a new column called 'AgeRange'
# Calculating the overall survival rate
survival_rate <- titanic_df %>%
  summarise(total_passengers = sum(Freq),
            total_survived = sum(Survived * Freq),
            survival_rate = round(total_survived / total_passengers, 3))
titanic_df
