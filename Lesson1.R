# Lesson 1 Excercises

#6.3.1
#1
myList <- list("Fruit")

penguins$flipper_length_mm

penguins[penguins$island == 'Dream',]


#2
# three unique values for species
unique(penguins$species)

# three unique values for island
unique(penguins$island)

#3 (I didn't want to use indexing, piping is so much easier)
newPenguins <- penguins %>%
  select("species","island","flipper_length_mm") %>%
  filter(island=='Dream')

#4
penguinAdelie <- newPenguins[newPenguins$species == "Adelie",]
mean(penguinAdelie$flipper_length_mm, na.rm = TRUE)

#6.4.2
#1