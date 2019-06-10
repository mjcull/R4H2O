# Introduction to the R Language: Water Quality Regulations
This first session introduces the principles of working with the R language using a case study about water quality monitoring. 

This session starts with a 

In this session, participants learn to load and explore water quality data. The workshop closes with some descriptive statistics.


## The R Language
R is a programming language for statistical computing and visualisation. This language is developed and maintained through the [R Foundation for Statistical Computing](https://www.r-project.org/foundation/ "The R website"). The R software is open source, which means that anyone can freely download, use, modify ad share the software. The open source model enables an activity community of developers that continuously improve the software.

Open source software is free. The word free in open source does not necessarily mean free as in free beer, but means freedom. The people developing open source software also need to be paid and most projects rely on donations from organisations that use the software commercially. If your organisation uses R, then I highly recommend considering financially supporting the R Foundation.

The R language is one of the most common tools for data science that can be integrated with many other data science software systems, such as Power BI, Tableau, Mathematica, MATLAB and do so on.

The easiest and fastest way to learn how to use R is by following one or more of the many courses available on the internet. This course is only a teaser to motivate water professionals to ditch their spreadsheets and start to write code. Two recommended resources are:

* [DataCamp](https://www.datacamp.com/): Free introduction courses.
* [Data Science Specialisation](https://www.coursera.org/specializations/jhu-data-science): Series of online courses by John Hopkins University.

The basic R software only provides a console where the analyst can issue commands to the computer or run scripts. The best way is to use R in combination with an Integrated Development Environment (IDE). The most popular IDE for the R language is RStudio. This software is also an open source project with free and paid options. This workshop introduces some of the functionality of RStudio.

When you open RStudio for the first time, the window is divided in three panes, each with various tabs. The left pane is the console. The top right pane shows the environment

![RStudio default screen layout](resources/session2/rstudio.png "RStudio default screen layout.")

X> Move your cursor to the console and type the code examples show below. Don't copy and paste them because typing them will develop your muscle memory for the R syntax.

```
3 - 3 * 6 + 2

x <- -10:10
y <- x^2

plot(x, y, type = "l")

a <- c(12, 3, 23, 45, 2, 99, 1, 0)
mean(a)
```

You will notice that when you type commands in the terminal, the result will appear immediately below the expression after hitting enter. The console is a running record of the actions taken by R.

Now hold the control and shift keys and press N. This keystroke splits

X> Type the same commands used above into the new window. What is the difference?

These examples show the basic working of R. Just like any other computing language or a spreadsheet, R consists of a range of instructions that are interpreted by the computer.

## Case Study
The case study for this first session is a set of water turbidity measurement for  number of suburbs in the same water network. The Laanecoorie water network is situated just over 100 km North of Melbourne in Victoria, Australia. The plant extracts water from the Laanecoorie reservoir, situated on the Loddon river.

The water network is divided in four water quality zones, each of which has a set of sample points installed at customer taps in the front of the house. Each of these sample points has a unique identifier that consists of three digits (090 for the Laanecoorie system), a letter to indicate the zone and two digits to indicate the number of the sample point.

The laboratory contractor regularly samples these taps and tests the water for a range of parameters, including turbidity. All turbidity measurements in NTU are recorded at a specific sample point at a certain date. The data set is already cleaned and is ready for analysis.

### Turbidity
Turbidity is a measurement of the cloudiness of the water. In drinking water, the higher the turbidity level, the higher the risk that people may develop gastrointestinal diseases. Particles in the water scatter a light, which can be used to measure turbidity with a nephelometer. The units of turbidity are dimensionless Nephelometric Turbidity Units (NTU).

{type: video}
![Determination of Turbidity of water: Calibration and Measurement](https://www.youtube.com/watch?v=9iwGuBRWUco)

The individual states of Australia each have their own water quality regulations. These regulations all rely on the federal Australian Drinking Water Quality Guidelines. 

The Victorian regulations for water quality specify that the 95th percentile of turbidity 

### Examples
This section explains how to analyse an example data set with turbidity data for compliance with the Victorian Safe Drinking Water Regulations. All the code is available in the [session1.R](../session1/session1.R "Session 1 code file") file. 

The first step is to open the RStudio project file in the workshop folder. This file contains the basic settings for this project and sets the working folder.

#### Load data
The data is stored in a csv file, which the `read.csv` file can read. The text between quotation marks is the path to the file. The path is relative to the working folder, so in this case we need to add the folder and the file name. Note that R uses the forward slash, common in Unix systems, and not the Windows backslash to form a path.

	turbidity <- read.csv("CaseStudies/turbidity_laanecoorie.csv")

If there is no error, the turbidity data is no loaded and visible in the Environment tab. The turbidity data is a 'data frame', which is a tabular set of data with rows and columns, very much like a spreadsheet.
#### Inspect data
The next step is to see what is in the data. When you type the name of the variable, R will display all data in the console. This is not a practical way to inspect large sets. The `head` function only shows the first half dozen rows of the data, which prevents the screen from scrolling away. By the way, R also has the `tail` function, that shows the last rows of a data frame.

The `View` function (note the capital V) opens the data in a separate read-only window. This is the most convenient way to inspect the data. You can also view the data this way by clicking on the variable name in the Environment tab.

The `names` function only shows the names of the columns. You can also use this function to rename variables in a data frame. 

The `dim` function shows the number of rows and columns.

Lastly, the `str` function provides a succinct overview of the fields in the data set, including the data types. 

You can also obtain this information by clicking on the triangle next to the variable name in the Environment tab. The functions are useful when you need to use them in calculations or change the properties of the data.

#### Convert data
When using the `str` function, you will note that the `Date_Sampled` field is a factor instead of a date field. A factor is a type of character variable that can be used in calculations, which falls outside the scope of this introduction to R. Using factors as a date is problematic because data cannot be ordered chronologically.

The `as.Date` function changes the factor into a proper date field that can be sorted chronologically and create a time series. R has many other functions to change the type of a variable, all of which start with `as.`.

## Explore data
Now we are ready to explore the data.

## Descriptive statistics

## Analysing the data

## Assignment
Using the functions described above, answer the following questions:

* How many samples were taken at each sample point?
* How many sample points are in the database?
* 



If you are stuck, you can view a possible solution in the [assignment1.R](../session1/assignment1.R "First assignment")file. Best to leave the cheating until you have tried everything to get the answer.

# Further study
After you have followed Session 2, apply the Tidyverse approach to this data and produce the visualisation shown below.

