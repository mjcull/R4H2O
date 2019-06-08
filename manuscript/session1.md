# Data Science for Water Utilities

## The water-data value chain: The Digital Water Utility
The flow of data in a utility follows the flow of the water through the value chain. The water value chain starts and ends in the natural environment. Water utilities extract water from nature, process it in their value chain, and eventually return it to the environment.

Water utilities collect data along the flow path of the water. This data describes the quantity and quality of the water, including wastewater, as it makes its way from the environment to the consumer and back. The data derived from instrumentation provides an objective view of the status of the water supply chain. Customer-centric water utilities also collect data from the perspective of the consumers of the services they supply. This data is, by definition, subjective. Data science for water utilities merges the objective measurements from the field with the subjective perspectives of customers to maximise value to the community overall.

 The term digital water utility is a distraction …

The digital water utility

The term ‘digital water utility’ is often used to describe the situation where the flow of water and
customer experience is fully captured with data. Some experts even suggest that digitisation
represents a disruption of water utilities. The term digital water utility is a distraction because data is
not a replacement for effective water management. No matter how much water utilities digitise,
electronics will not meaningfully change the service utilities provide: a reliable supply of drinking
water and sewerage services.

Digitisation also has limitations. Firstly, data cannot describe everything. Measuring physical
processes is only ever a sample of the reality we live in. Secondly, the experience of customers is
subjective, which requires human insight to understand. These limitations highlight the need for
domain expertise to complement skills in mathematics and computing. Relying on data alone,
without recognising the physical and social reality of water management does not add value to a
community.

Engineering Data

Providing reliable water services to communities is mostly an engineering challenge. Engineers build
pumps and reservoirs to hold water. They then purify it in treatment plants and distribute it through a
pressurised network of pipes. Consumers use this water to create value in their lives. After they
consumer the water, it flows back to the environment through evaporation or as sewage. An ideal
water utility balances the technical requirements with the expectations and experiences of its
customers.

Water utilities measure volume, flow and quality at many locations in the cycle. Hydrodynamics helps
to create value from this data by assisting managers in operating and improving the system. Water
management is very different for each part of the value chain. However, from a data perspective, raw
water, drinking water and sewage are just different manifestations of the same substance.

Tap water supply chain. 
The continuous value chain for water utilities.

Water volume and flow and pressure

The volume, flow and pressure of water are the two defining variables of how a water network
performs. The core problem of water utilities is therefore to ensure that sufficient water is available to
serve its customers. The two core data science tasks in managing water supplies are:

* Predicting future water consumption.
* Detecting leaks and anomalies in the network.

Water consumption of individual customers is traditionally measured sporadically. Most Australian
water utilities read their meters every three months. This means that the system can only be
balanced four times per year. New technology enables water meters to be read much more frequently
so that water utilities better understand the flow in their systems. Digital water meters, or smart
meters, are a valuable source of data for water utilities to reduce consumption and make better
investment decisions. Data science helps to create value from this data.

Hydroinformatics: diurnal curve for smart water meters 
Diurnal curve from smart water meters.

Water quality

Having enough water is a problem in many parts of the world. An equally important aspect of
managing a water supply is to prevent people from becoming ill. The Flint Michigan Water Crisis is a
recent event that shows the importance of managing water quality. 

Water quality data can be high-frequency samples from SCADA systems or less frequent laboratory
samples. Hydroinformatics, or data science for water quality, often involves finding anomalies, such
as spikes, and analysing these to prevent a recurrence. Water quality data is also regularly subjected
to regulations, which usually relates to descriptive statistics.

Analysing turbidity data in various systems. 
Analysing turbidity data in various systems.

Customers

The engineering data gives an objective image of the status of the flow path. Engineers measure flow,
pressure and quality with almost arbitrary precision. These measurements are repeatable, and most
importantly, we can model them using the laws of physics. Customer data is quite different because it
is often qualitative and always subjective.

This subjectivity is inherent to social data, which means we need different methods to analyse this
information compare to engineering data. We can never actually measure what customers feel, we
can only try to understand it by analysing. Tweets can reveal how customer feel about tap water.
Surveys are a more formal method to measure many dimensions, such as how involved customers
are with a service. The most important part of analysing customer data is to seek beyond the
numbers to understand what customers experience.


This workshop introduces water professionals into using the R language for statistical programming

## What is Data Science?









This workshop starts with an introduction to working with R and R Studio using 

. Rather than describing the basics, readers are invited to use some of the many free resources to learn the basics before reading the case study.

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


# What is Data Science?
## Data Science Workflow

This course focuses on rectangular data, which are rows and columns of information as they are commonly stored in spreadsheets and databases. Unstructured data, such as text
## What is Good Data Science?
## Data Science Tools
The last ten years have seen an explosion of available data science tools. There is no one single tool that can do everything. Just like a trades-person uses each tool for a specific job, so does a data scientist use tools for specific tasks within the workflow.
### Spreadsheets
The most common tool to solve data problems are spreadsheets. They are a great product that combines storing data, writing and executing code and displaying output. Their versatility is also their Achilles heel. Spreadsheets have limited capabilities and some intrinsic constraints. Spreadsheets are very easy to build, but they are extremely difficult to reverse-engineer. We all would have had the unpleasant experience of trying to understand how a spreadsheet made by somebody else, or one that you did ages ago, actually functions. The biggest issue with spreadsheets is reproducibility of the analysis process.
[insert 5.5 reasons]
### Business Intelligence Systems
The software market is saturated with point-and-click business intelligence systems, such as Click, Tableau or Power BI. These tools are very user-friendly portals for end-users to consume data. Business intelligence tools are, however, not very suitable to analyse data. Their main strength is to present the results of analysis in a dynamic way. Analysing data is not just about visualisations. Good analysis reviews a lot of intermediate steps that are hidden from the end-user.

Another limitation of these systems is that they are limited to visualisations, without any meaningful capacity to include a narrative. Business intelligence are almost like a 'create your own adventure'. The user can choose how the system presents the data and thus create their owns stories. While a well-designed visualisations is, as they say, worth a thousand words, the complexity of the analytical process often needs a narrative to help the reader understand the purpose, method and conclusions. Limiting a data product to visualiations can quickly become data porn; easy to swallow but a bit naughty.
## Data science code
Writing computer code has long been the domain of information technology professionals. This view is not helped by stereotypes of coders as slightly eccentric geeks that prefer to communicate with their terminal instead of with people. The main objective of this course is to dispel this false idea and promote that water professionals should ditch their spreadsheets and learn how to write code.

For those that are used to developing spreadsheets, the jump to writing code is not as large as it might seem. Every formula in a spreadsheet is in essence a part of a computer program. Writing code is an essential component of 

There are almost as many computer languages as their are human ones. Many of these languages are suitable to analyse data and the list in this section only includes the most common ones. Some languages, such as Python, C or Java are general programming languages that can be used for any type of software. Other languages are developed specifically to manipulate and analyse data. 

The Structured Query Language (SQL, pronounced seequel) is a language to access and manipulate databases. Many varieties of SQL exist, but they all have great similarities. The main strength of SQL is its ability extract, transform and load data. The first version of this language was released in 1986 and it is a robust data interface. This language is not very good at actually analysing data because it does not include any higher-order mathematics.

Python is a general-purpose programming language that developers use to develop many types of applications. Python has many extensions with specialised data science functions. 

There are many other less common languages specialised such as Julia, Haskell, Fortran, Mathematica and so on.

This workshop uses the R language because it is designed to analyse data. The basic functionality of R includes many higher-order functions to undertake statistical analysis. R is not as fast as some other languages. This book is about the R langauge because the way it is structured is close to the way subject-matter-experts think about analysis, instead of the way computer scientists structure software. 



## Principles of Strategic Data Science
This section is an extract of the book /Principles of Strategic Data Science/ by Peter Prevos. If you like to find out more about strategic data science, then please consider reading [this book](https://leanpub.com/strategic_data_science). Participants of the workshop will get access to a free copy. 

![Prevos, P. (2019) Principles of Strategic Data Science](images/StrategicDataScience.jpg)



