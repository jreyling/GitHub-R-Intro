# Lesson 1 Exercises

## 6.3.1
### 1 Why don’t the following lines of code work? Tweak each one so the code runs
myList <- list("Fruit")

penguins$flipper_length_mm

penguins[penguins$island == 'Dream',]


### 2 How many species are in the penguins dataset? What islands were the data collected for? (Note: the unique() function might help)
unique(penguins$species) # *three unique values for species*

unique(penguins$island) # *three unique values for species*

### 3 Use indexing to create a new data frame that has only 3 columns: species, island and flipper length columns, and subset all rows for just the ‘Dream’ island.
newPenguins <- penguins[1:344, c("species", "island", "flipper_length_mm")]
penguinDream <- newPenguins[newPenguins$island == "Dream",]

### 4 Use indexing and the mean() function to find the average flipper length for the Adelie species on Dream island. (Note: explore the mean() function and how to deal with NA values).
penguinAdelie <- newPenguins[newPenguins$species == "Adelie",]
mean(penguinAdelie$flipper_length_mm, na.rm = TRUE)

## 6.4.2
### 1 Reorder the variables in penguins so that year is the first column followed by the rest (Hint: look into the use of everything()).
penguins %>% 
  select("year",everything())

### 2 Create a new column called ‘size_group’ where individuals with body mass greater than the overall average are called ‘large’ and those smaller are called ‘small’.
bodyMassAvg <- mean(penguins$body_mass_g, na.rm=TRUE)
penguins %>% 
  mutate(size_group = if_else(body_mass_g >= bodyMassAvg,
                              paste('large'),
                              paste('small')))

### 3 Find out which year for each species were individuals on average the largest according to body mass.
penguins %>% 
  group_by(species, year) %>% 
  summarize(bodyMassAvg = mean(body_mass_g, na.rm=TRUE)) %>% 
  filter(bodyMassAvg == max(bodyMassAvg))

### 4 You want to filter data for years that are not in a vector of given years, but this code doesn’t work. Tweak it so that it does. (Yes, you could just filter year to equal 2007 in this case but there is a trouble-shooting lessons here).
penguins %>% 
  filter(!year %in% c(2008, 2009))

## 7.1
### 1 Make a barplot showing the average flipper length for each species.
penguins %>% 
  group_by(species) %>% 
  summarize(avgFlipperLen = mean(flipper_length_mm, na.rm=TRUE)) %>% 
  ggplot() +
    geom_col(mapping = aes(x=species, y=avgFlipperLen, fill=species)) +
    ylab("Average Flipper Length (mm)")

### 2 Make a scatter plot of bill length compared to bill depth but only for observations on the Dream island.
penguins %>% 
  filter(island == 'Dream') %>% 
  ggplot() +
    geom_point(mapping = aes(x=bill_depth_mm, y=bill_length_mm))
