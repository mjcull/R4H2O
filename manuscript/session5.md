# Capstone Project: Reporting Water Quality Performance

This capstone project sets a challenge to help you develop further R coding sills. This document does not explain any further R functionality, as their are various methods to solve this problem. Participants need to use self study to develop the additional skills needed to provide an complete this capstone project. The end of this document contains suggestions where to find help and resources for further study.

## Problem Statement
The Board of Directors of your water utility receives monthly updates about water quality performance. This report consists of a large table with water quality results. None of the members of the board are technical experts. The Board struggles to understand the significance of these numbers and always asks a lot of detailed questions about the results, instead of a strategic discussion about water quality.

[add table from the data]

Another section of the report informs the Board about customer complaints, including negative experiences that customers have with water quality. This data is also shown in a table and the relationship between this data and the water quality report is unclear.

[add complaints table]

The Board has tasked the data science team to provide an integrated overview of water quality that they can understand. Your task is to create a static dashboard for the monthly performance report using R markdown.

### Objectives
Your task is to create a static dashboard that visualises water quality performance for the members of the Board. This dashboard should give the user an aesthetic summary of the performance of each system. The report should avoid jargon and allow the Board to 

## Available Data Sets
The data was extracted from six actual water systems and covers one financial year (July -- June). The data has been manipulated to create more variety in the data. The names of the towns have been changed to prevent confusion with the actual data. The `simulation.R` file contains the code used to create the data. Five csv files are available in the `Capstone` folder:

* `network.csv`: Various water quality parameters measured in six networks.
* `complaints.csv`: Complaints about water quality from the same six networks.
* `sample_points.csv`: List of sample point locations.
* `suburbs.csv`: Relationship between suburbs and water supply networks.
* `limits.csv`: Regulatory limits for several water quality parameters

### Networks
The networks file contains twelve months of laboratory data for various parameters. The data is structured in the same way as in the first case study. Any values that were found to be below the detection limit of the equipment are indicated with a lesser than symbol. Common practice in water management is to divide this value by two to convert the reported value  as a numerical field.

### Complaints
The complaints data contains feedback from customers about water quality. Each complained is categorised in either taste, odour or colour. The data contains the unique customer number, the date and nature of the complaint and the suburb in which it occurs.

### Suburbs
The suburb file contains a list of water systems and their respective suburbs.

### Limits
This last file shows the operational and regulatory limits for each of the measured laboratory parameters.

## Approach 
Water quality is a difficult concept to communicate. Firstly, water quality is a multidimensional construct that cannot be expressed in a single number. Water resources can be expressed with a single number, but the quality of water is measured with hundreds of parameters. A quantity of water is simply an volume measured in cubic meters, water quality consists of a large range of microbial and chemical measurements, such as coliforms or

Secondly, the quality of water is dependent on its purpose. Water quality for environmentalists means something different to farmers, water utility engineers or to consumers of water. This course focuses on water utilities and the main concern for professionals in these organisations is risk to public health. The consumers of this water have a different perspective and are mostly concerned about aesthetics. These different perspectives are often the cause of tension between how a water utility and its consumers view the quality of water. For a detailed discussion on this tension you can read *Customer Experiecne Management for Watr Utilities* by Peter Prevos.

When communicating the quality of water to an audience who are not experts in the fields, such as most members of utility boards, we need to consider these two dimensions. One of the methods to express the complexity of the quality of water is to user a water quality index. These indices summarise water quality with a single number. These indices are often used in environmental contexts, such as a swimming water quality to the inform the public of any risks. Water quality indices are rarely used in water utilities but the same principles can easily apply to this context (Abassi and Aassi, ).

To develop a water quality index you need to follow four steps:

1. Select the parameters
2. Transform the parameters to a dimensionless score
3. Assign weights to all parameters
4. Aggregate the scores

#### Select the parameters
Selecting the parameters depends on the purpose of the index. In this capstone, the available data determined the parameters. Each parameter forms a subindex of the total index.

#### Transform the parameters
The chosen parameters will be available in different units and different scales. Most water quality parameters are in milligrams er litre or equivalent units and customer complaints are counts. Also the scale of the parameters is different, which makes them impossible to compare.

The next step involves transforming the parameters to a dimensionless parameter. Several methods are available to transform a set of parameters to a dimensionless number. The only requirement is that all numbers have the same scaling, for example from 1 to 100. The four methods are:

1. Linear
2. Non-linear
3. Segmented linear
4. Segmented non-linear



#### Assign weights
Each sub-index has a different level of contribution to overall water quality. 

#### Aggregate scores


### Visualise the index
Once you complete the number crunching you need to decide how to best visualise the data. If you decide to use the ggplot library to visualise the results you should consider using the GridExtra 

T> Explore using the gridExtra package to create a dashboard with multiple ggplot visualisations.

You 

T> 


### Submit your solution

https://community.leanpub.com/c/r4h2o

## R Markdown
You can upload your solution to [RPubs](https://rpubs.com/), using the functionality in RStudio. Please note the that results on projects on RPubs are publicly visible. The data in this case study is simulated to prevent any privacy breaches.

You will need to install various packages to enable to publishing functionality in RStudio. The software will automatically prompt you to install these when you first try to publish

1. In RStudio, create a new R Markdown document.
2. Develop the dashboard
3. Click the Knit HTML button in the doc toolbar to preview your document. 
4. In the preview window, click the Publish button.

You will need to create a free account with RPubs before you can publish any documents.

## Getting Help
The internet is full of valuable resources to expand your skills in creating value with R. The main problem with getting help is to know where to start and how to ask the right question.

### The Help Function
The R language has a built-in help function for every function. For example, type `help(mean)` to learn everything about the mean function. One of the weaknesses of R is that the help files can be quite cryptic to beginning users.

The first section describes the function in words. The second section shows how to use the function. The arguments of the function are listed in the third section.

The following sections provide background information and links to other similar functions. Most help entries also show examples that help you to reverse-engineer the functionality.

### Searching for answers
If the help entry is not very helpful you can try searching your problem in your favourite search engine. You will quickly find that there will be very few problems that have not already been experienced and solved by somebody else.

### Forums
Last option is to post your question to a forum such as [StackOverflow](https://stackoverflow.com/questions/tagged/r) or [Reddit](https://www.reddit.com/r/rstats/). You can also try the forum for this course. On Twitter, use the #RStats hashtag to connect with fellow data scientists.

When you ask a question on a forum, be as specific as possible. Add an example of your code that does not work and include a sample data set. Providing this information will make it much easier for others to answer your question.

[R for Data Science](https://r4ds.had.co.nz/)

### Systematic Study
This course only provides a cursor overview of the R language with as objective to motivate water professionals to ditch the spreadsheet and start writing code. A great place to systematically learn about R is [DataCamp](https://www.datacamp.com/). This website provides free introduction courses and paid advanced courses. DataCamp also provides courses about other languages, such as Python, SQL and even spreadsheets. For a thorough in-depth course on data science with the R language, I recommend the [Data Science Specialisation](https://www.coursera.org/specializations/jhu-data-science) by John Hopkins University on the Coursera platform.
