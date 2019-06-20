# Introduction to the R Language: Water Quality Regulations

**THIS IS A WORK IN PROGRESS**

This first practical session introduces the principles of working with the R language, using a case study about water quality regulations. The objective of this session is to introduce the basic syntax and functionality of the R language. In this session, participants learn to load and explore water quality data and derive descriptive statistics from the data.

## The R Language
R is a programming language for statistical computing and visualisation. This language is developed and maintained through the [R Foundation for Statistical Computing](https://www.r-project.org/foundation/). The R software is open source, which means that anyone can freely download, use, modify and share the software. The open source model relies on communities of developers that continuously improve the software.

Open source software is free. Not free as in free beer, but free as in [freedom](https://www.gnu.org/philosophy/free-sw.html). The people developing open source software also need to be paid and most projects are not-for-profit organisations funded by organisations that use the software commercially. If your organisation uses R, then I highly recommend considering financially supporting the R Foundation.

The R language is one of the most common tools for analysing data. This language includes a lot of advanced mathematical functionality that is missing by default from other languages. This language also has extensive built-in visualisation capabilities. Furthermore, R can be integrated with many other data science software systems, such as *Power BI*, *Tableau*, *Mathematica*, *MATLAB* and do so on.

This session only gives a cursory overview of the R language with just enough theory to solve the case study. This course is only a teaser to motivate water professionals to ditch their spreadsheets and start to write code. For a more systematic introduction to this language, I recommend following one of the many courses available on the internet or read a book. Two recommended sources to systematically learn the basics of the R language in detail are:

* [DataCamp](https://www.datacamp.com/): Free introduction courses and paid advanced courses.
* [R for Dummies](http://rfordummies.com/): Introduction from the well-known *For Dummies* series.

### Using RStudio
The best way is to use R in combination with an *Integrated Development Environment* (IDE). The most popular IDE for the R language is [RStudio](https://rstudio.com/). This software is also an open source project, with free and paid versions.

W> Before you continue, make sure you have access to R and RStudio and have downloaded the course files from GitHub.

When you open RStudio for the first time, the window is divided in three panes, each with various tabs. The left pane is the console. The top right pane shows the system environment and the one below that shows a list of files and folders (Figure 2.1).

You can change the default fonts and colours in the *Tools > Global Options > Appearance* menu. Most developers prefer a dark theme with light text because it is easier on the eyes. You can also set default font size and magnification to your liking.

X> Open the appearance menu and change the settings to your personal preferences.

{width: 100%}
![Figure 2.1: RStudio default screen layout](resources/session2/rstudio.png)

Now we are ready to write some code. Move your cursor to the console and type the code examples show below. Don't copy and paste them because typing the code will develop your muscle memory for the R syntax and you will see some of the special features of the text editor.

{format: r, line-numbers: false}
```
3 - 3 * 6 + 2

x <- -10:10
y <- x^2

plot(x, y, type = "l")

a <- c(12, 3, 23, 45, 2, 99, 1, 0)
mean(a)
```

This code demonstrates some basic features of the language. The first line is a simple arithmetic problem. R displays the answer below the line.

The next two lines defines the variables `x` and `y`. The values -10 to + 10 are assigned (`<-`) to variable `x`. The `y` variable is given the value of `x^2`$.

The third part plots the variables `x` and `y` as a line, showing the parabola in the plot window.

The variable `a` is assigned a vector of eight numbers using the `c()` function. The `mean()` function shows the arithmetic mean of the vector `a`.

You will notice a few things when you start typing:

* When you hit enter, the result of the expressions without the `<-` symbol are shown in the console
* When you type plot and mean, R gives you suggestions on how to continue
* When typing brackets or quotation marks, RStudio includes the closing bracket or quotation mark
* The variables you declared (`x`, `y` and `a`) are shown in the Environment window
* The plot appears in a tab of the bottom-right window.

Now retype the plot command, but only type the first two letters and then hit the TAB key. R now gives you suggested functions that start with "pl". You can use the cursor keys to select the plot function. You can continue this way and R will guide you through the function. This is great functionality if you are forget some of the specific syntax when writing code.

Anther trick in the console is to use the arrow keys to repeat or modify previous commands.

{type: video, align: middle, poster: "https://www.youtube.com/watch?v=roTCgjxpMEg/mqdefault.jpg"}
![Introduction to RStudio](https://youtu.be/roTCgjxpMEg)

Now it is your turn to play with the basic syntax of R and functionality of RStudio.

W> Produce a plot of the function `y=-x^2-2x+3`$ in the R console.

The formula for determining where the parabola intersects with the x-axis is:

```$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
```

When:  `ax^2 + bx + c = 0`$.

X> Calculate intersects using the quadratic formula in the R console

The console provides a running record of the actions taken by R. While this is great, using the console makes it hard to reconstruct what steps you have taken to get to your result. To create reproducible code you need to write your code 

Create a new R script by going to *File > New File > R Script* or by simply hitting Control-Shift N.

Q> Add the same code as above in the script file. What is the difference?

{type: video, align: middle}
![Introducing RStudio.](resources/session2/rstudio-script.mp4)

One last feature you need to know before we continue are projects in RStudio. A project is a set of files that relate to each other. RStudio projects divide your work into multiple contexts, each with their own working directory, workspace, history, and source documents. Every time you open a project file, it will be the same where you left it when you last closed the program. There are several ways to open a project:

* Using the Open Project command (available from both the Projects menu and the Projects toolbar) to browse for and select an existing project file (e.g. `r4h2o.Rproj`).
* Selecting a project from the list of most recently opened projects (also available from both the Projects menu and toolbar).
* Double-clicking on the project file within the system shell (e.g. Windows Explorer, OSX Finder, etc.).

X> Open the project file for this course.

After you open this file, you will see the relevant files in the bottom-left window. When you close the project after this session, all variables, the history of your commands and open files are stored for use in a later session.

This is only a very short introduction into the basics of the R language and RStudio. The remainder of the workshop introduces further concepts as needed by the case studies.

## Case Study: Water Quality Regulations
The case study for this first session is about assessing compliance with water quality regulations. The data for this case study is a set of turbidity measurements for the [Laanecoorie water network](https://www.coliban.com.au/site/root/your_town/loddon/laanecoorie.html), situated just over 100 km North of Melbourne in Victoria, Australia. The plant extracts water from the Laanecoorie reservoir, situated on the Loddon river.

The water network is divided in four zones, each of which has a set of sample points installed at customer taps in the front of the house. Each of these sample points has a unique identifier that consists of three digits (090 for the Laanecoorie system), a letter to indicate the zone, and two digits to indicate the number of the sample point.

The laboratory service provider regularly samples these taps and tests the water for a range of parameters, including turbidity. All turbidity measurements are recorded for a specific sample point at a certain date. The data set is already cleaned and is ready for analysis.

### Turbidity
Turbidity is a measurement of the cloudiness of the water. In drinking water, the higher the turbidity level, the higher the risk that consumers develop gastrointestinal diseases. Particles in the water scatter light, which is used to measure turbidity with a nephelometer (from the Greek nephéla, "cloud"). Turbidity is expressed in dimensionless Nephelometric Turbidity Units (NTU). The video below gives a detailed overview of how to measure turbidity in liquids.

{type: video, align: middle, poster: "https://www.youtube.com/watch?v=qz8xHQJw6qY/mqdefault.jpg"}
![Determination of Turbidity of water: Calibration and Measurement](https://www.youtube.com/watch?v=qz8xHQJw6qY)

### Water Quality Regulations
The states of Australia each have their own water quality regulations. The state regulations all refer to the federal [Australian Drinking Water Quality Guidelines](https://www.nhmrc.gov.au/about-us/publications/australian-drinking-water-guidelines). 

The Victorian regulations for water quality, the [Safe Drinking Water Regulations](https://www2.health.vic.gov.au/public-health/water/drinking-water-in-victoria/drinking-water-legislation) 2015, specify that "the 95^th^ percentile of results for samples in any 12 month period must be less than or equal to 5.0 Nephelometric Turbidity Units". The regulations also specify that each water quality zone needs to be sampled at lest once per week.

In a separate [guidance document](https://www2.health.vic.gov.au/Api/downloadmedia/%7BA1F6D255-D5C7-4B7E-AAE5-8B7451EDE81A%7D), the Victorian regulator also specifies that the percentil for turbidity should be calculated with the 'Weibull Method'.

### Problem Statement
You are writing the annual report to the regulator about the Laanecoorie system. Provide an answer to the following two questions:

1. Did the laboratory take at least one sample per week for each water quality zone?
2. What was the 95^th^ percentile of turbidity for each of the water zones in the system? 

### Methodology
The guidance note from the regulator raises two questions: What is the Weibull method? How do you implement this requirement in R?

The basic process to determine a percentile is a three-step process (McBride, [2005](http://amzn.to/2k8shr8)):

1. The data are ranked into ascending order (`X_1, X_2, \ldots , X_n`$).
2. Determine the rank (`r`$) of the required percentile.
3. The percentile is the value in position `r`$. When the rank is not an integer, interpolate between two values `X_{r-1}`$ and `X_{r+1}`$.

With 52 ranked weekly turbidity samples, the 95^th^ percentile is between sample 49 and 50 (`0.95 \times 52`$). However, this method is only valid for uniformly distributed samples. Statisticians have defined several method to determine the rank of the required percentile. The difference between these methods is in the way the ranked numbers are interpolated. Hyndman & Fan ([1996](https://www.researchgate.net/publication/222105754_Sample_Quantiles_in_Statistical_Packages)) give a detailed overview of nine methods of calculating percentiles or quantiles. This paper assigns the Weibull method the less poetic name `\hat{Q}_6(p)`$. 

Waloddi Weibull, a Swedish engineer famous for his statistical distribution, was one of the first to describe this method. The rank of a percentile `p`$ is given by:

```$
r_{weibull} = p(n+1)
```

For a sample of 52 turbidity tests, the percentile thus lies between ranked result number 50 and 51. This method is suitable for samples that are highly skweded, as is often the case with water quality data. Please note that there is no correct way to calculate percentiles. The most suitable method depends on the distribution of the population. In this case study, the method is prescribed by the regulator.

Q> You have 99 turbidity results. The first 94 are 0.1 NTU and the last five are 5 NTU. What is the 95^th^ percentile using the Weibull method?

Answer:

1. Rank the results in ascending order: `0.1, 0.1, \ldots , 5, 5, 5`$.
2. Determine the percentile rank: `0.95 \times (99 + 1) = 95`$.
3. The 95^th^ percentile is the 95^th^ result, which is 5 NTU.

### Exploration
This section explains how to analyse an example data set with turbidity data for compliance with the Victorian Safe Drinking Water Regulations. The data and the code is available in the [GitHub](https://github.com/pprevos/r4h2o/) repository.

#### Load data
The data is stored in a csv file, which the `read.csv` file can read. The text between quotation marks is the path to the file. The path is relative to the working folder, so in this case we need to add the folder and the file name. Note that R uses the forward slash, common in Unix systems, and not the Windows backslash (`\`) to form a path.

{format: r, line-numbers: false}
```
turbidity <- read.csv("CaseStudies/turbidity_laanecoorie.csv")
```

The turbidity data now visible in the *Environment* tab. The turbidity data is a 'data frame', which is a tabular set of data with rows and columns, very much like a spreadsheet.

R can read many types of data. Some specialised extensions can be used to connect R to Excel spreadsheets, SQL databases, scrape websites and so on. The `extract_data.R` file in the case study folder shows how the turbidity data was extracted from an SQL server. The data has the following fields:

* `Date_Sampled`: The data the sample was taken.
* `Sample_No`: Reference number of the sample.
* `System`: name of the water system.
* `Zone`: The zone within the water system.
* `Sample_Point`: The reference number of eh sample point.
* `Result`: The result of the laboratory test.
* `Units`: The units of the result (NTU).

#### Inspect the data
The next step is to see what is in the data. When you type the name of the variable, R will display all data in the console. This is not a practical way to inspect large sets because the data quickly across across the screen. 

The `head` function only shows the first half dozen rows of the data, which prevents the screen from scrolling away. R also knows the `tail` function, that shows the last rows of a data frame.

The `View` function (note the capital V) opens the data in a separate read-only window. This is the most convenient way to inspect the data. You can also view the data this way by clicking on the variable name in the Environment tab. You cannot edit the data, but you can sort the information by column by clicking o the variable name.

The `names` function only shows the names of the columns. You can also use this function to rename variables in a data frame.

The `dim` function shows the number of rows and columns.

X> Use the `nrow` and `ncol` functions to determine the size of the data frame.

Lastly, the `str` function provides a succinct overview of the fields in the data set, including the data types. 

You can also obtain this information by clicking on the triangle next to the variable name in the Environment tab. The functions are useful when you need to use them in calculations or change the properties of the data.



The `as.Date` function changes the factor into a proper date field that can be sorted chronologically and create a time series. R has many other functions to change the type of a variable, all of which start with `as.`.

### Explore data

### Plotting data

In the next case study we will explore the plotting functionality of the Tidyverse extension to the R language.

## Assignment
The project folder for this case study also contains a file named `gormsey.csv`. This file contains fictitious turbidity data. The names of the towns were [randomly generated](https://www.fantasynamegenerators.com/town_names.php). The lab results have been manipulated to provide some intersting results.

Q> Using the Gormsey data, answer the following questions using R code.

{quiz, id: quiz-1, attempts: 0}

? How many samples were taken in the Gormsey system in 2018?

a) 1400
B) 572
c) 508
d) 6

Review the code snippet below:

{format: r, line-numbers: false}
```
test <- 0
```
? Without running the code, what is the result of this line?

a)
b)
C)
d)

? Which zone(s) did not comply with the Victorian Water Quality regulations?
a) Wakefield
b) Tarnstead
C) Blancathey
d) Swadlincote

{/quiz}

You can find the answers to these questions at the end of the course.

