###########################################################################
# Section 1
# Part 1
#a
heights <- c(71, 67, 66)
print(heights)

#b
names <- c("Brian", "Daisy", "Kim")
print(names)

#c
class(cbind(heights, names))

# Part 2
#a
NCBirths <- read.csv(file.choose())
#b
head(NCBirths)

# Part 3
#a
install.packages("maps")
find.package("maps")
#b
library(maps)
map("state")

# Part 4
#a
weights <- NCBirths$weight

print(weights)
#c
weights.in.pounds <- weights / 16

#d
weights.in.pounds[1:20]

###########################################################################
# Section 2
# Part 1
mean(weights.in.pounds)

#Part 2
tally(NCBirths$Habit, "percent")

###########################################################################
#Section 3
#Part 1
dotchart(weights.in.pounds, xlab = "Weight in Pounds", ylab = "Baby Counts",
         main = "Dot plot of baby weight in pounds")
find.package("graphics")

#Part 2
hist(weights.in.pounds, breaks = 3)
hist(weights.in.pounds, breaks = 20) # Best Visualization
hist(weights.in.pounds, breaks = 100)

#Part 3
boxplot(NCBirths$Mage, NCBirths$Fage, main = "Parents Ages", 
        names = c("Mothers", "Fathers"), ylab = "Age")

#Part 4
histogram(~weights|Habit, data = NCBirths, layout = c(1,2))

###########################################################################
#Section 4
summary(NCBirths)
tally(~Habit | DelivComp, data = NCBirths, format = "proportion")

###########################################################################
#Section 5
plot(NCBirths$weight ~ NCBirths$Gained)

plot(NCBirths$weight ~ NCBirths$Gained, col = "red", cex = 1.5, pch = 3,
     xlab = "Weight gained during pregnancy", ylab = "Baby weight (oz.)",
     main = "Baby weight vs. pregnancy weight gain")

# Weight vs. Mother's Age
plot(NCBirths$weight ~ NCBirths$Mage, col = "blue", ylab = "Baby weight (oz.)",
     xlab = "MotherS Age", main = "Baby weights vs. Mother's Age", pch =18,
     cex =1.25)

###########################################################################
#Section 6

a <- read.table("http://www.stat.ucla.edu/~nchristo/statistics12/ozone.txt", header=TRUE)
library(maps)

AQI_colors <- c("lightskyblue1","lightskyblue2", "lightskyblue","lightskyblue3","lightskyblue4")
AQI_levels <- cut(a$o3, c(0, 0.06, 0.075, 0.104, 0.115, 0.374))

as.numeric(AQI_levels)

plot(a$x,a$y, xlim=c(-125,-114),ylim=c(32,43), xlab="Longitude",
     ylab="Latitude", main="California ozone bubble plot", "n")

map("county", "ca",add=TRUE)
points(a$x,a$y, cex=a$o3/mean(a$o3),
       col=AQI_colors[as.numeric(AQI_levels)], pch=17)

