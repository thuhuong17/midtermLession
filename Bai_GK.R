# read data set
d <- read.csv("C:\\Users\\Admin\\Downloads\\film_data.csv")

#d <- read.csv("film_dataset.csv")

# show all field name in data set
colnames(d)
#replace name field
colnames(d)[2] <- "new_col2"
colnames(d)
# summary of data frame about length, class, mode
summary(d)

# show number of row, col
nrow(d)
ncol(d)
dim(d)#find the amount of rows and columns 
length(d)#find the amount of col
# text editor data
edit(d)
str(d)# # structure of the data set
#-----------------clean data-----------
# remove na - not available rows
#remove all Whitespace in each DataFrame Col
#use apply() function to apply a function to each row in a data frame.
#gsub() function, this used to replace all of a pattern from a string
# of d data, 2 is col, if 1 is row, 
# use to gsub() function to find whitespace(\s), 
# then replace by “”, this removes the whitespaces.
#We have wrapped our entire output in as.data.frame() function, 
#it is because the apply() function returns a Matrix object 
#so we need to convert it back into a dataframe.
d <- as.data.frame(apply(d, 2, function(x) gsub("\\s+", "", x)))
d[d == ""] <- NA# remove "" <- NA
tail(d)#use to get the last parts of a vector, matrix, table, data frame or function.
tail(d, 2)# 2 print output is 2 row
d <- na.omit(d) #  returns a list without any rows that contain na values
tail(d)
nrow(d)

#-------------5. question research-----------
#---------------find top 10 films by max average vote-----------
# head function read the first of dataframe,row=10
# order function use to sort from avg_vote field of d data, it's decreasing
d2 <- head(d[order(d$avg_vote, decreasing = TRUE),], 10)
d2[c(2, 9)]#display 9&2 col

#---------------find top 10 films by max duration -------------
# head function read the first of dataframe,row=10
# order function use to sort from duration field of d data, it's decreasing
head(d[order(d$duration, decreasing = TRUE),], 10)[c(2, 5)]
head(d[order(d$duration),], 10)[c(2, 5)]#display 5&2 col

#-----------find top 10 genre by max vote-----------------
# Aggregate() function which computes group mean
# aggregate(x, by, FUN, …, simplify = TRUE, drop = TRUE)
# FUN a function to compute the summary statistics
# by a list of grouping elements, by which the subsets are grouped by
l_avg <- aggregate(d$total_votes, by = list(d$genre), FUN=mean)
rs <- head(l_avg[order(l_avg$x, decreasing = TRUE),], 10)
rs
barplot(rs$x, names.arg = rs$Group.1, col = "red")

#-------------country product that the most films----------
# Aggregate() function which computes group mean
# aggregate(x, by, FUN, …, simplify = TRUE, drop = TRUE)
# FUN a function to compute the summary statistics
# by a list of grouping elements, by which the subsets are grouped by
df2 <- aggregate(d$avg_vote, by=list(d$country), FUN=length)
head(df2[order(df2$x, decreasing = TRUE),], 5)

#-----------top 10 film which vote > 9.0--------------
d[d$avg_vote >= 9.0, c(1, 2, 9)]# avg_vote >= 9.0 and display 1,2 9

#
y <- c(10,20,30,40)

# Display the pie chart and start the first pie at 90 degrees
pie(y, init.angle = 90)





