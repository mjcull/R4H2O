# Introduction to Writing Data Science Code

# What is Data Science?

## Data Science Workflow

## What is Good Data Science?

## Data Science Tools
The last ten years have seen an explosion of available data science tools. There is no one single tool that can do everything. Just like a trades-person uses each tool for a specific job, so does a data scientist use tools for specific tasks within the workflow.

### Spreadsheets
The most common tool to solve data problems are spreadsheets. They are a great product that combines storing data, writing and executing code and displaying output. Their versatility is also their Achilles heel. Spreadsheets have limited capabilities and some intrinsic constraints. Spreadsheets are very easy to build, but they are extremely difficult to reverse-engineer. We all would have had the unpleasant experience of trying to understand how a spreadsheet made by somebody else, or one that you did ages ago, actually functions. The biggest issue with spreadsheets is reproducibility of the analysis process.

### Business Intelligence Systems
The software market is saturated with point-and-click business intelligence systems, such as Click, Tableau or Power BI. These tools are very user-friendly portals for end-users to consume data. Business intelligence tools are, however, not very suitable to analyse data. Their main strength is to present the results of analysis in a dynamic way. Analysing data is not just about visualisations. Good analysis reviews a lot of intermediate steps that are hidden from the end-user.

Another limitation of these systems is that they are limited to visualisations, without any meaningful capacity to include a narrative. When writing a report, the user has too copy visualisations from the dashboard and then describe them in the report. Well-designed visualisations are, as they say, worth a thousand words, but the complexity of the anaytical process often needs a narrative to help the reader understand the purpose, method and conclusions.

## Data science code
Writing computer code has long been the domain of information technology professionals. This view is not helped by stereotypes of coders as slightly eccentric geeks that prefer to communicate with their terminal instead of with people. The main objective of this course is to dispel this false idea and to promote that water professionals should all ditch the spreadsheet and learn how to write code.

For those that are used to developing spreadsheets, the jump to writing R code is not as large as it might seem. Every formula in a spreadsheet is in essence a part of a computer program. 

A large range of data science languages is available, each with their own strengths and weaknesses.

The Structured Query Language (SQL, pronounced seequel) is a language to access and manipulate databases. Many varieties of SQL exist, but they all have great similarities. The main strength of SQL is its ability extract, transform and load data. The first version of this language was released in 1986 and it is a robust data interface. This language is not very good at actually analysing data because it does not include any higher-order mathematics.

Python is a general-purpose programming language. Developers use Python to develop many types of applications. Python has many extensions with specialised data science functions. 

There are many other less popular languages such as Julia, Haskell, Fortran, Mathematica and so on.

This workshop uses the R language because it is designed to analyse data. The basic functionality of R includes many higher-order functions to undertake statistical analysis. R is not as fast as some other languages. This book is about the R langauge because the way it is structured is close to the way subject-matter-experts think about analysis, instead of the way computer scientists structure software. 



## Principles of Strategic Data Science
This section is an extract of the book /Principles of Strategic Data Science/ by Peter Prevos. If you like to find out more about strategic data science, then please consider reading [this book](https://leanpub.com/strategic_data_science). Participants of the workshop will get access to a free copy. 

![Prevos, P. (2019) Principles of Strategic Data Science](images/StrategicDataScience.jpg)



# The R Language
This workshop starts with an introduction to working with R and R Studio. Rather than describing the basics, readers are invited to use some of the many free resources to learn the basics before reading the case study.

* DataCamp

## Prerequisites
To follow participate in this workshop, you need to have some understanding of the issues surrounding water management and experience with analysing data. Experience with writing computer code is helpful, but not required. 
### R and R Studio
You will also need access to a recent version of the R language and RStudio.

The best way to access the R language is by downloading the latest version from the website of the [R Project for Statistical Computing](https://www.r-project.org/). RStudio is an IDE (Integrated Development Environment) that simplifies working with R and data. You can download a free version of this software from the [RStudio](https://www.rstudio.com/) website. Follow the instructions on these websites to complete the installation. You will need to install the R language before you install the IDE.

Alternatively, you can sign-up for a free account to access the [cloud version](https://rstudio.cloud/) of R Studio. This account will give you full access to R Studio and R in your browser without the need to install software. The cloud version is fully functional but not very fast. Installing R and RStudio on your own laptop is the preferred method.

### Downloading the workshop material
If you are participating in the workshop, you can download the documents by clicking on the 'clone or download' button and unzip the files to your computer. You can open the RStudio project file to begin the workshop and start playing with the data and code.

For those using the cloud version of RStudio, click on the arrow next to the 'New Project' button and select 'New Project from GitHub Repo'. Copy the URL of this repository in the text field and hit enter. After a little while, RStudio will open the project.

If you understand how to use Git, then feel free to fork and clone the repository. Feel free to create an issue or pull request if you find errors or like to provide additional content.

##

## Packages

One of the most exciting aspects of this language is that other developers can write their own extensions, the so-called packages or libraries. There are thousands of specialised packages that undertake a vast range of specialised tasks. You can use R as a GIS and analyse spatial data, other packages help you to access data from various sources, such as SQL databases, specialised analysis, machine learning, and so on.

The majority of R packages are stored on CRAN (Comprehensive R Archive Network). You can easily install packages in R with the `install.packages` function. Within RStudio you can install packages in the *Tools* menu.

### Water R packages

    The CRAN library contains many packages with specialised functions to analyse water. This workshop does not cover any of these packages. This list is for information only.

* [agriwater](https://cran.r-project.org/web/packages/agriwater/index.html): Evapotranspiration and Energy Fluxes Spatial Analysis
* [ambhasGW](https://cran.r-project.org/web/packages/ambhasGW/index.html): Ground Water Modelling
* [baytrends](https://cran.r-project.org/web/packages/baytrends/index.html): Long Term Water Quality Trend Analysis
    -   [biotic](https://cran.r-project.org/web/packages/biotic/index.html): Calculation of Freshwater Biotic Indices
    -   [boussinesq](https://cran.r-project.org/web/packages/boussinesq/index.html): Analytic Solutions for (ground-water) Boussinesq Equation
    -   [CityWaterBalance](https://cran.r-project.org/web/packages/CityWaterBalance/index.html): Track Flows of Water Through an Urban System
    -   [dataRetrieval](https://cran.r-project.org/web/packages/dataRetrieval/index.html): Retrieval Functions for USGS and EPA Hydrologic and Water Quality Data
    -   [dbhydroR](https://cran.r-project.org/web/packages/dbhydroR/index.html): 'DBHYDRO' Hydrologic and Water Quality Data
    -   [driftR](https://cran.r-project.org/web/packages/driftR/index.html): Drift Correcting Water Quality Data
    -   [ecoval](https://cran.r-project.org/web/packages/ecoval/index.html): Procedures for Ecological Assessment of Surface Waters
    -   [EmiStatR](https://cran.r-project.org/web/packages/EmiStatR/index.html): Emissions and Statistics in R for Wastewater and Pollutants in Combined Sewer Systems
    -   [gsw](https://cran.r-project.org/web/packages/gsw/index.html): Gibbs Sea Water Functions
    -   [GWSDAT](https://cran.r-project.org/web/packages/GWSDAT/index.html): GroundWater Spatiotemporal Data Analysis Tool (GWSDAT)
    -   [humidity](https://cran.r-project.org/web/packages/humidity/index.html): Calculate Water Vapor Measures from Temperature and Dew Point
    -   EXPAND



# Case Study
The case study for this first session is a set of water turbidity measurement for  number of suburbs in the same water network. The Laanecoorie water network is situated approximately 100 km North of Melbourne in Victoria, Australia. The plant extracts water from the  reservoir, which  and treated with sand filtration.

The water network is divided in * water quality zones, each of which has a set of sample points installed at customer taps in the front of the house. The laboratory contractor regularly samples these taps and tests the water for a range of parameters, including turbidity.

All turbidity measurements in NTU are recorded at a specific sample point at a certain point in time. The data set is already cleaned and is ready for analysis.

## Turbidity

-   What is 

The individual states of Australia each have their own water quality regulations. These regulations all rely on the federal Australian Drinking Water Quality Guidelines. 

The Victorian regulations for water quality specify that the 95th percentile of turbidity 

# Examples
This section explains how to analyse an example data set with turbidity data for compliance with the Victorian Safe Drinking Water Regulations. All the code is available in the [session1.R](../session1/session1.R "Session 1 code file") file. 

The first step is to open the RStudio project file in the workshop folder. This file contains the basic settings for this project and sets the working folder.

## Load data
The data is stored in a csv file, which the `read.csv` file can read. The text between quotation marks is the path to the file. The path is relative to the working folder, so in this case we need to add the folder and the file name. Note that R uses the forward slash, common in Unix systems, and not the Windows backslash to form a path.

	turbidity <- read.csv("CaseStudies/turbidity_laanecoorie.csv")

If there is no error, the turbidity data is no loaded and visible in the Environment tab. The turbidity data is a 'data frame', which is a tabular set of data with rows and columns, very much like a spreadsheet.
## Inspect data
The next step is to see what is in the data. When you type the name of the variable, R will display all data in the console. This is not a practical way to inspect large sets. The `head` function only shows the first half dozen rows of the data, which prevents the screen from scrolling away. By the way, R also has the `tail` function, that shows the last rows of a data frame.

The `View` function (note the capital V) opens the data in a separate read-only window. This is the most convenient way to inspect the data. You can also view the data this way by clicking on the variable name in the Environment tab.

The `names` function only shows the names of the columns. You can also use this function to rename variables in a data frame. 

The `dim` function shows the number of rows and columns.

Lastly, the `str` function provides a succinct overview of the fields in the data set, including the data types. 

You can also obtain this information by clicking on the triangle next to the variable name in the Environment tab. The functions are useful when you need to use them in calculations or change the properties of the data.
## Convert data
When using the `str` function, you will note that the `Date_Sampled` field is a factor instead of a date field. A factor is a type of character variable that can be used in calculations, which falls outside the scope of this introduction to R. Using factors as a date is problematic because data cannot be ordered chronologically.

The `as.Date` function changes the factor into a proper date field that can be sorted chronologically and create a time series. R has many other functions to change the type of a variable, all of which start with `as.`.
## Explore data
Now we are ready to explore the data.

## Descriptive statistics

## Analysing the data

# Assignment
Using the functions described above, answer the following questions:

* How many samples were taken at each sample point?
* How many sample points are in the database?
* 



If you are stuck, you can view a possible solution in the [assignment1.R](../session1/assignment1.R "First assignment")file. Best to leave the cheating until you have tried everything to get the answer.

# Further study
After you have followed Session 2, apply the Tidyverse approach to this data and produce the visualisation shown below.

