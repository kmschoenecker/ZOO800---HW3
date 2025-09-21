#HW Week 3 -----
#Kristine Schoenecker & Elizabeth Braatz

#load libraries
library(tidyverse)

#Part 1 Basic Syntax and Variables ----

temp_C <- 18.5 #save variable

temp_F <- temp_C * (9/5) + 32 #convert temperature to Fahrenheit

print(paste("The water temperature is", temp_C, "C (",temp_F, "F)"))

#Part 2 Vectors and Arrays  ----

counts <- c(12, 7, 21, 3)
species <- c("Bluegill", "Bass", "Sunfish","Carp")

species_counts_df <- data.frame(species, counts) #I first saved it as a dataframe

#saves as a vector
species_counts <- c(Bluegill = 12, Bass = 7, Sunfish = 21, Carp = 3)
species_counts #double check to see if it worked

#Total number of fish counted
sum(species_counts)

#Find the species with the highest count
max(species_counts) #that just returns the highest value 

species_counts[which.max(species_counts)] #returns what it is indexed as

#create a matrix
chlorophyll_concentrations = matrix(
  c(10, 30, 35, 5, 42, 38, 27, 2, 50), 
  nrow = 3,   
  ncol = 3,         
  byrow = TRUE          
)

rownames(chlorophyll_concentrations) = c("Day 1", "Day 2", "Day 3")
colnames(chlorophyll_concentrations) = c("Surface", "Middle", "Bottom")

cat("The 3x3 matrix:\n")
print(chlorophyll_concentrations)

rowMeans(chlorophyll_concentrations) #thank you rstat101 website

#Part 3 Data Frames ----

#Create data frame

#create vectors for each of your variables

Lake <- c("Mendota", "Wingra", "Monona", "Waubesa", "Kegonsa")
Temp_C <- c(22.4, 25.1, 23.7, 24.6, 26.0)
DO_mgL <- c(8.3, 6.7, 7.5, 7.9, 6.2)

#merge these three variables into one dataframe

lakes <- data.frame(Lake, Temp_C, DO_mgL)

#now take the mean temperature and mean DO across all lakes

mean(lakes$Temp_C)
mean(lakes$DO_mgL)

#add a column converting the temperature in C to temperature in F

#convert temperatures in C to Fahrenheit

Temp_F <- lakes$Temp_C * (9/5) + 32 #creates a new vector with your temp C column converted

lakes$Temp_F <- Temp_F #not sure why the dollar sign works, but it does

install.packages("LakeMetabolizer")
library("LakeMetabolizer")

equil_sat_oxy <- o2.at.sat(lakes) #when I try to run this chunk of code, I get thrown errors
#one of those errors is that I need datetime and water temp in C
#is there a spot where we were supposed to plug in date-time info?


#Part 4: For Loops ---- 

#Write a for loop that prints the square of each number from 1 to 10.

#create a vector containing your list of numbers

number_vec <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

#create the loop 

squared_vec <- vector()

for (number in number_vec) {
  squared_vec <- number^2
  print(squared_vec)
}

#Part 2 
#Suppose you want to model exponential population growth with Nt=N0*e^rt
#Let N0=10, r=0.3, and simulate 10 time steps.Use a for loop to calculate population size at each time step and store results in a vector called pop

#Setting up our starting values 
N0 = 10 
r = 0.3 
t = seq(1:10) 

#save the equation

Nt <- N0*exp(r*t)

Nt

#Create an empty vector to store population values

pop <- vector()

#Create for loop for population

for (time in t) { 
  pop <- Nt
}

print(pop) #when we leave print(pop) inside the for loop, we get our results repeated 10 times in a matrix. Not sure why

#Part 4 Phosphorus Concentration Question

#Create a list called phosphorus with 5 elements (one per lake), each containing 4numeric values. Use made-up numbers, but keep them realistic (e.g., 5–40 μg/L)

lakes = list(lakes = c("Lake1","Lake2","Lake3","Lake4","Lake5"), phosphorus = c(list(runif(4,5,40)),list(runif(4,5,40)), list(runif(4,5,40)), list(runif(4,5,40)), list(runif(4,5,40)))) 
#Thank you Statology and R.Doc.org! 

       
