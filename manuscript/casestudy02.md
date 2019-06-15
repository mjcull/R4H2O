# Processing Data --- Understanding Customer Perception
In the first session we looked at some of the basic functionality of the R language. Some of base code of the R language is a bit cumbersome and many people have written packages to extend and improve functionality. One of the most popular series of extensions is the [Tidyverse](https://www.tidyverse.org/), developed by Kiwi R guru Hadley Wickham and many others.

## R Packages
One of the most exciting aspects of this language is that developers can write their own extensions of the R language, the so-called packages or libraries. 

R has a large community of users who develop their own code and make it freely available to other users in the form of packages. 

Thousands of specialised packages are available that undertake a vast range of tasks. You can use R as a GIS and analyse spatial data, other packages help you to access data from various sources, such as SQL databases. Many R extensions undertake specialised tasks such as machine learning.

The majority of R packages are stored on [CRAN](https://cran.r-project.org/), which is the Comprehensive R Archive Network. You can install packages in R with the `install.packages` function. Within RStudio you can install packages in the *Tools* menu.

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


### The Tidyverse
The tidyverse is a collection R packages that provides additional functionality to extract, transform, visualise and analyse data. The additional functionality provided by these packages is easier to use and understand than base R code and thus ideal for 

The following packages are loaded when you start the Tidyverse:

-   ggplot2: Data visualisation
-   tibble: Rectangular data structure
-   dplyr: data manipulation
-   tidyr
-   purrr:
-   stringr
-   readr
-   forcats

In this session we will 

[R for Data Science](https://r4ds.had.co.nz/)

You can install the complete tidyverse with a single line of code:

```
install.packages("tidyverse")
```

On your own computer, type that line of code in the console, and then press enter to run it. R will download the packages from CRAN and install them on to your computer. If you have problems installing, make sure that you are connected to the internet, and that https://cloud.r-project.org/ isn’t blocked by your firewall or proxy.

You will not be able to use the functions, objects, and help files in a package until you load it with library(). Once you have installed a package, you can load it with the library() function:

```
library(tidyverse)
#> ── Attaching packages ────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 3.1.0.9000     ✔ purrr   0.2.5     
#> ✔ tibble  2.0.0          ✔ dplyr   0.7.8     
#> ✔ tidyr   0.8.2          ✔ stringr 1.3.1     
#> ✔ readr   1.3.1          ✔ forcats 0.3.0
#> ── Conflicts ───────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
```

This tells you that tidyverse is loading the ggplot2, tibble, tidyr, readr, purrr, and dplyr packages. These are considered to be the core of the tidyverse because you’ll use them in almost every analysis.

Packages in the tidyverse change fairly frequently. You can see if updates are available, and optionally install them, by running tidyverse_update()

X> Install the Tidyverse packages on your computer.


## Tidy Data
## Using Colour in Visualisations
In the era before the petrochemical revolution, colours were mostly limited to nature because artificial colouring was very expensive. The purple togas of Roman emperors were dyed with the secretion of thousands of sea snails. Seventeenth-century Dutch painter Johannes Vermeer used precious lapis lazuli to obtain the perfect blue for his paintings. The expense of creating colours in the past limited the art of choosing the right ones to artists and rich people.

In our times, we have easy access to every imaginable colour. We can buy clothes in whatever colour or desire or paint our house like Pippi Longstocking's villa. We are spoilt for choice concerning colour. The increased possibilities are also a burden because we need to choose the right colour, not just any colour. This tyranny of choice also plays a role in designing beautiful visualisations.

When buying clothing or painting a house, our choice of colours is hopefully governed by a sense of style. When designing visualisations, colour plays a more instrumental role. The colours in a graph are not decoration, but they communicate a narrative. The basic principle for good visualisation design is to minimise the number of colours.

Colours have intrinsic meaning that helps to tell the story. Red is generally recognised as a warning sign and green a calmer tone. In Western cultures, pink associates with femininity and the colour blue is often used in a corporate sense. Marketers use these associations with colour when designing brands. The psychological meaning of colour is, however, not culturally constant and can vary between countries. The Color Psychology website ([colorpsychology.org](https://www.colorpsychology.org/)) contains valuable information about how colours are interpreted.

Traffic lights are one of the most popular colour schemes in business reporting. The colour red stands for an adverse outcome, yellow for a neutral one and green is positive. This type of reporting helps managers to focus on problem areas so they can discuss actions to improve future performance. A note of caution is that this technique does not work for men with green/red colour blindness. This condition is not a problem with real traffic lights as the order of the lights is always the same. However, on a business report, the colours will all look the same to roughly eight per cent of men with this condition.

The minimum amount of colour depends on the narrative you want to convey and the type of visualisation. Cartography often uses colour to communicate its message. One of the problems that plagued mathematicians for centuries is how many colours we need as a minimum to colour every area on a map, without two bordering regions with the same colour. Cartographers know from practical experience that this number is four, but mathematical proof only came in a few decades ago.

Besides minimising the number of colours, we also need to know which colours to use. Cartographers Mark Harrower and Cynthia Brewer developed the Color Brewer system ([colorbrewer2.org](http://colorbrewer2.org/)) to help designers of visualisations select a good scheme. These colour schemes are designed for choropleth maps, but can also be used for non-spatial visualisations. [^fn_brewer] The Color Brewer system consists of three types of colour palates: sequential, diverging and qualitative (Figure 10).

[^fn_brewer]: Harrower, M., & Brewer, C.A. (2003). ColorBrewer.org: An Online Tool for Selecting Colour Schemes for Maps. _The Cartographic Journal_, 40(1), 27–37. [DOI 10.1179/000870403235002042](https://doi.org/10.1179/000870403235002042).

![Figure 10: Types of colour schemes.](resources/session3/colorbrewer.png)

Sequential schemes contain a series of colours with increasing strength. These colour schemes are most suitable to visualise magnitude from low to high, with light colours usually for low data values and dark colours for high values.

Diverging colours are used to visualise a deviation from a norm, such as droughts or floods or adherence to a budget. Green, yellow and red are the most common use of this type of palate as business reports are filled with traffic lights to report progress.

Qualitative colours are groups of colours that are aesthetically compatible but without a logical relationship between them based on the data. These palates can express qualitative values such as categories. The left graph in figure 9 is an example of a qualitative scheme to indicate categorical variables.

## Case Study: Customer Perception
The case study for this session is a file that contains the views of hundreds of American consumers about tap water. This data was collected to develop a model to measure the level of service quality for tap water services. A survey service provider recruited the respondents, who were paid for their participation.

The file provided in the `session1` folder is the raw data as exported from the [Qualtrics](https://qualtrics.com/) survey platform. This session explains how to clean and visualise the data using the Tidyverse functionalities. 

The questionnaire consisted of [four pages](resources/session3/customer_survey.pdf), which respondents accessed through a website. The first page introduced the research and asked respondents to provide their consent to participate. Respondents not providing consent were exited from the survey. Due to the broad geographical spread of potential respondents on the American survey panel, respondents were required to also complete two screening questions. The first question related to their place of residence and the second question asked whether they had tap water at home. Only customers located in Los Angeles, Denver or Boston and those with tap water connections continued to the next page of the questionnaire. Other respondents were excluded from the survey.

The second page consisted questions about the level of involvement respondents have with tap water. These questions use the Personal Involvement Inventory developed by Judity Zaichkowsky ([1994](https://www.sfu.ca/~zaichkow/JA%252094.pdf)). The involvement items close with an open text item asking customers: “If you have any additional comments about your views on tap water, please enter them below”. 

The involvement part of the survey uses a semantic differential scale. This is a method where respondents choose an answer between two antonyms (figure 3). This type of survey measures the meaning that people attach to a concept, such as a product or service. The items were presented in a random order to each respondent.

{width: 60%}
![Figure 3.1: Personal Involvement Inventory questionnaire](resources/session3/involvement-index.png)

The last page started with two items related to the customer’s relationship with their service provider. Customers were asked to indicate whether they struggle to pay their water bills when they fall due, using a seven-point Likert scale from “Strongly Disagree” to “Strongly Agree”. 

The second question asked customers to indicate the frequency at which they contact their utility for support also using a seven-point Likert scale: 

* Never
* Less than Once a Month
* Once a Month
* 2-3 Times a Month
* Once a Week
* 2-3 Times a Week
* Daily

One of the problems with using paid survey subjects is that they are motivated to submit a lot of responses, without having much regard for the content. American respondents were therefore also subjected to an attention filter: “If you live in the U.S. select Strongly Agree”. The survey was only sent to people within the United States, so everybody should respond equally. Any respondent not answering “Strongly Agree” is excluded from the survey. This approach was used to remove inattentive respondents and assure the accuracy of the results. 

The survey closed with eighteen service quality questions, which were measured using a seven-point Likert scale from “Strongly Disagree” to “Strongly Agree”. The items were presented in random order. The final item of the questionnaire consisted of an open question which invited customers to provide additional comments about their tap water supplier.

If you are interested in the details, then you can read *Customer Experience Management for Water Utilities* by Peter Prevos, available from [IWA Publishing](https://www.iwapublishing.com/books/9781780408668/customer-experience-management-water-utilities-marketing-urban-water-supply).

### Methodology
Consumer involvement is an important metric in marketing to describe the relevance a product or service has in somebody’s life. People who own a car will most likely be highly involved with purchasing and owing the car due to the large amount of money involved and the social role it plays in developing their public self. Consumers will most likely have a much lower level of involvement with the instant coffee they drink than with the clothes they wear. More formally, consumer involvement can be defined as a person's perceived relevance of the object based on inherent needs, values, and interests.

From a managerial point of view, involvement is important because it is causally related to willingness to pay and perceptions of quality. Consumers with a higher level of involvement are willing to pay more for a service and have a more favourable perception of quality.

Understanding involvement in the context of urban water supply is also important because sustainably managing water as a common pool resource requires the active involvement of all users. The level of consumer involvement depends on a complex array of factors, which are related to psychology, situational factors and the marketing mix of the service provider. The lowest level of involvement is considered a state of inertia which occurs when people habitually purchase a product without comparing alternatives.

The highest possible level of involvement are the cult products where customers are fully devoted to a particular product or brand. Commercial organisations use this knowledge to their advantage by maximising the level of consumer involvement through branding and advertising. This strategy is used effectively by the bottled water industry. Manufacturers focus on enhancing the emotional aspects of their product rather than on enhancing the cognitive aspects. Water utilities tend to use a reversed strategy and emphasise the cognitive aspects of tap water, the pipes, plants and pumps, rather than trying to create an emotional relationship with their consumers.

The Personal Involvement Index consists of two dimensions. 

Factor analysis is an advanced technique to test the outcomes of a survey for dimensionality. 

### Load the data
We start by loading the Tidyverse library using the `library` function. When loading the package for the first time in a session, the console displays the eight loaded packages.

Next step is to load the raw data. The tidyverse has its own functions to load and save CVS data. Instead of `read.csv` or `write.csv`, the tidyverse commands use an underscore, i.e. `read_csv` and `write_csv`. In Tidyverse, rectangular data is not a data frame, as in base R code, but a tibble. This odd term must be a an expression of the way Hadley Wickham says table in his New Zealand accent.

```
rawdata <- read_csv("session2/Customer_Perception_USA.csv")
```

The console shows an error message when loading the data, indicating that one column has no name and that it was given the poetic name X58. As in chapter one, we can use various functions to explore see the structure of the data.

The first 19 columns contain metadata about the data collections, such as a unique response ID, IP addresses, start and end times and so on. The next 35 columns contain the actual data, which is discussed below. The next two columns contain the latitude and longitude of the respondent, based on their IP address. The penultimate field indicates information of the accuracy of the location and the last field is an empty column, as was indicated by the error message.

When viewing a data frame in R, the systems shows far to many rows to fit on a console. When viewing a tibble in the console, the system only shows the first ten rows and summarises any columns that don't fit on the screen.

Q> How many rows and columns of data does this data have?

Q> Can this data be considered tidy?

### Cleaning the data
Looking at the data, we also see that the first two rows contain header information. A tidy data set should only have one header row. Because of the double headers, R thinks that all columns are text.

We need to remove the first row and any irrelevant columns and re-assess the data types to create a clean table. The first line of code creates the new `customers`variable by removing the first line of the raw data. It is good practice to keep raw data and processed data in separate variables.

The `type_convert` function re-assesses the data to ensure it has the correct types. Using the `str` function, we can see that most columns are now numerical values, which is what we want them to be. 

```
customers <- rawdata[-1, ]
customers <- type_convert(customers)
str(customers)
```

The ext step is to remove any respondents that either:

* Failed the attention filter
* Did not consent
* Does not have tap water
* Does not live in one of the three nominated cities
* Quit the survey before completion

The Qualtrics survey software stores this information in the `term` field. 

>Q Create a table of the data in the `term` field.

You will notice that the total number of items in the table does not match the number of rows. When you view the content of this field you will see a lot of entries with `NA` in them.

[explain NA values `is.na()`]

>Q Read the help file of the table function (`help(table)`) and add the appropriate parameter to include the NA values in the output.

After reviewing the data we can conclude that we only want those rows of data that have an `NA` value in the `term` field.

>Q How would you remove any invalid entries using base R code?

In the dplyr package of Tidyverse, the `filter()` function ...

The Qualtrics data contains a lot of meta data that we don't need for further analysis. The first 19 columns contain information about when the survey was taken and so on and the last two columns are irrelevant. The next step is to filter the data so we only use columns 20 to 56.

>Q How would you remove the unnecessary columns using base R code?

In the dplyr package, the `select()` function

We are close to a clean data set. The first column has the `city` variable, which at the moment is just the integer 1, 2, or 3. These numbers correspond to the order in the drop-down box in the survey. The options were:

1. Los Angeles
2. Denver
3. Boston. 

First we create a new tibble to link the numbers with towns, which is then joined to the main data. 

The `left_join` function finds the matching fields in the two sets and then merges the sets together. This function keeps all the values in the left data set. The Tidyverse has several other join functions that match values in a different way.

The data is now clean but not yet tidy. When reviewing the code to clean the data we can see some repetition because we change the `customers` variable several times in a row. This approach is typical to writing code. In a spreadsheet, these steps are often merged in one complex formula, like this:

```
left_join(select(filter(type_convert(rawdata[-1, ]), is.na(term)), 20:56), cities)
```

While the nested approach takes less space, it is not as easy to understand because you have to read from the inside out instead of from left to right.

The Tidyverse uses a pipe (`%>%`) to simplify this process. A pipe transports the output of one process to the input of the next process. The code used to clean the customer data is now written like this:

```
customers <- rawdata[-1, ] %>%
    type_convert() %>%
    filter(is.na(term)) %>%
    select(20:56) %>%
    left_join(cities)
```

All other examples in this course will use this method.

### Visualisation
The Tidyverse set of packages contains `ggplot`, one of the most powerful visualisation tools. This package implements a layered approach to visualising data, which helps building complex graphics. This session introduces the basic functionality of ggplot.

The basic ggplot function starts with the name of the data set and then a range of aesthetics. The aesthetics consist of the fields that will be used to visualise the data. The second part tells ggplot which geom to use. A geom is a type of visualisation. The ggplot library has many possible geoms. The example below shows a simple bar plot for the number of respondents from each city.

```
ggplot(pii, aes(City)) + geom_bar()
```

This function creates a simple greyscale plot because we only should add colour to a visualisation when it expresses data. You can force ggplot to use a colour by using `geom_bar(fill = "blue")`, or any other colour which you might fancy.


### Tidying the Data
The data is still not quite tidy because ...

In this session we like to focus on the Personal Involvement Inventory (PII) data so only use a part of the customer data set. We use the `select` function to create a new tibble to store the data for the inventory. In this case this function selects the city column and every column with a names that starts with a lower case p.




## Assignment
