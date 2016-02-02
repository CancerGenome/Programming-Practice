Data Type:

Vectors
	a <- c(1,2,5.3,6,-2,4) # numeric vector
	b <- c("one","two","three") # character vector
	c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) #logical vector
	#Refer to elements of a vector using subscripts.
	a[c(2,4)] # 2nd and 4th elements of vector

Matrices
	#All columns in a matrix must have the same mode(numeric, character, etc.) and the same length. The general format is
	mymatrix <- matrix(vector, nrow=r, ncol=c, byrow=FALSE, 
		dimnames=list(char_vector_rownames, char_vector_colnames))
	byrow=TRUE indicates that the matrix should be filled by rows. byrow=FALSE indicates that the matrix should be filled by columns (the default). dimnames provides optional labels for the columns and rows.
	# generates 5 x 4 numeric matrix 
	y<-matrix(1:20, nrow=5,ncol=4)

# another example
	cells <- c(1,26,24,68)
	rnames <- c("R1", "R2")
	cnames <- c("C1", "C2") 
	mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE,
	  dimnames=list(rnames, cnames))
Identify rows, columns or elements using subscripts.
x[,4] # 4th column of matrix
x[3,] # 3rd row of matrix 
x[2:4,1:3] # rows 2,3,4 of columns 1,2,3

Color:
 library("colorspace")
 col_chose <- choose_palette() # choose you own

Arrays

#Arrays are similar to matrices but can have more than two dimensions. See help(array) for details.

Data Frames
#A data frame is more general than a matrix, in that different columns can have different modes (numeric, character, factor, etc.). This is similar to SAS and SPSS datasets.
	d <- c(1,2,3,4)
	e <- c("red", "white", "red", NA)
	f <- c(TRUE,TRUE,TRUE,FALSE)
	mydata <- data.frame(d,e,f)
	names(mydata) <- c("ID","Color","Passed") # variable names
	There are a variety of ways to identify the elements of a data frame .
	myframe[3:5] # columns 3,4,5 of data frame
	myframe[c("ID","Age")] # columns ID and Age from data frame
	myframe$X1 # variable x1 in the data frame

Lists

An ordered collection of objects (components). A list allows you to gather a variety of (possibly unrelated) objects under one name.
# example of a list with 4 components - 
# a string, a numeric vector, a matrix, and a scaler 
	w <- list(name="Fred", mynumbers=a, mymatrix=y, age=5.3)

# example of a list containing two lists 
v <- c(list1,list2)
Identify elements of a list using the [[]] convention.
mylist[[2]] # 2nd component of the list
mylist[["mynumbers"]] # component named mynumbers in list
Factors
Tell R that a variable is nominal by making it a factor. The factor stores the nominal values as a vector of integers in the range [ 1... k ] (where k is the number of unique values in the nominal variable), and an internal vector of character strings (the original values) mapped to these integers.
# variable gender with 20 "male" entries and 
# 30 "female" entries 
gender <- c(rep("male",20), rep("female", 30)) 
gender <- factor(gender) 
# stores gender as 20 1s and 30 2s and associates
# 1=female, 2=male internally (alphabetically)
# R now treats gender as a nominal variable 
summary(gender)
An ordered factor is used to represent an ordinal variable.
# variable rating coded as "large", "medium", "small'
rating <- ordered(rating)
# recodes rating to 1,2,3 and associates
# 1=large, 2=medium, 3=small internally
# R now treats rating as ordinal
R will treat factors as nominal variables and ordered factors as ordinal variables in statistical proceedures and graphical analyses. You can use options in the factor( ) and ordered( ) functions to control the mapping of integers to strings (overiding the alphabetical ordering). You can also use factors to create value labels. For more on factors see the UCLA page.

Useful Functions For Data Type

	length(object) # number of elements or components
	str(object)    # structure of an object 
	class(object)  # class or type of an object
	names(object)  # names

	c(object,object,...)       # combine objects into a vector
	cbind(object, object, ...) # combine objects as columns
	rbind(object, object, ...) # combine objects as rows 

	object     # prints the object

	ls()       # list current objects
	rm(object) # delete an object

	newobject <- edit(object) # edit copy and save as newobject 
	fix(object)               # edit in place

mode to call a data mode
library(foreign)
attach(): attach sth. with default
detach(): not attach sth.
merge(a,b,by="ID",all=True)
tapply,sapply,lapply():function                

Plot Function:
pie(case,main="pie chart"):Pie graph: 
pie3D
barplot(),use arrows(x1,y1,x2,y2,lowd=1.5,angle=90,length=0.1) # add a arrow with a bar
boxplot(), text(x=1:10,y=-2,labels=levels(chr),cex=0.75,srt=65)# add chr under box plot chart
dotplot():cleveland chart
plot.new(): same with frame
win.graph():by this you can set the size of screen
windows():
locator: record the axis of point
identify():get position on your plot figure
coplot(): conditions plot
          given a conditions plot at the top, then you have other plot at the bottom
          showing the based on the condition, y~x trends

Lattice Package:
histogram
densityplot()
qq
bwplot,dotplot,barplot,xyplot,splom(scatter)

R-ARGV
args <- commandArgs(trailingOnly = TRUE)
args <- as.numeric(args)
aggregate: return one statistics value aggregate(data$value,by=list(data$type),median)
by: return multiple statistics value by(data$value,data$type,dstats)

tab[[1]]["Total",]<-temp # anova result, for speciall data.frame

 hist.cum <- function(x, xlab=xlab, ylab=ylab, main=main,plot=TRUE, ...){
   h <- hist(x, plot=FALSE, ...)
   h$counts <- cumsum(h$counts)
   h$density <- cumsum(h$density)
   h$itensities <- cumsum(h$itensities)
   if(plot)
     plot(h,xlab=xlab,main=main,ylab=ylab)
   
 }

image((1:nrow(data)), (1:ncol(data)), (as.matrix(data)), col=gray((32:0)/32), ylab="Quality value", xlab="Position of read",main=paste(file[i],"qual ity distribution" )

Subset, Extract
grepl("AA",genotype$caseI) # return TRUE, FALSE, Can use ignore.case = T to ignore case
grep("AA",genotype$caseI) # return 1 2 7, Can use ignore.case = T to ignore case
full_list <- seq(1:10)
subset <- c(1,2,3,11)
subset %in% full_list # return TRUE, TRUE, TRUE, FALSE

Pass Variable to Data Frame
names <- c("ref","seq")
data <- data.frame(chr=c(1,2,3),seq=c(11,22,33),ref=c("A","C","G"))
data[, eval(names)]  # will return ref for seq and ref
data[, getl(names)]  # will return ref for seq and ref

Use varialbe as Variable name:
assign(paste(sample_id,".",cluster_num,".Input.Marker.CCF",sep=""),Input.Marker.CCF)  # name of future variable, current variable

Special Symbol in R fomulas:
~ Separates response variables on the left from the explanatory variables on the right. For example, a prediction of y from A, B, and C would be coded y ~ A + B + C.
+ Separates explanatory variables.
: Denotes an interaction between variables. A prediction of y from A, B, and the interaction between A and B would be coded y ~ A + B + A:B.
* Denotes the complete crossing variables. The code y ~ A*B*C expands to y ~ A + B + C + A:B + A:C + B:C + A:B:C.
^ Denotes crossing to a specified degree. The code y ~ (A+B+C)^2 expands to y ~ A + B + C + A:B + A:C + A:B.
. A place holder for all other variables in the data frame except the dependent variable. For example, if a data frame contained the variables y, A, B, and C, then the code y ~ .  would expand to y ~ A + B + C.
