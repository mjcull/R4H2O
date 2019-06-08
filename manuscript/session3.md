# Welcome to the Tidyverse: Cleaning and Exploring Data

In the first session we looked at some of the basic functionality of the R language. Some of the basic functionality of R is a bit cumbersome and many people have written packages to extend and improve functionality. One of the most promising series of extensions is the Tidyverse, developed by Kiwi R guru Hadley Wickham and many others.
## The Tidyverse

The tidyverse is a collection R packages that provides additional functionality to extract, transform, visualise and analyse data.

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

# Case Study
The case study for this session is a file that contains the views of hundreds of American consumers about tap water. This data was collected to develop a model to measure the level of service quality for tap water services. A survey service provider recruited the respondents, who were paid for their participation.

The file provided in the `session1` folder is the raw data as exported from the [Qualtrics](https://qualtrics.com/) survey platform. This session explains how to clean and visualise the data using the Tidyverse functionalities. 

The questionnaire consisted of [four pages](customer_survey.pdf), which respondents accessed through a website. The first page introduced the research and asked respondents to provide their consent to participate. Respondents not providing consent were exited from the survey. Due to the broad geographical spread of potential respondents on the American survey panel, respondents were required to also complete two screening questions. The first question related to their place of residence and the second question asked whether they had tap water at home. Only customers located in Los Angeles, Denver or Boston and those with tap water connections continued to the next page of the questionnaire. Other respondents were excluded from the survey.

The second page consisted questions about the level of involvement respondents have with tap water. These questions use the Personal Involvement Inventory developed by Judity Zaichkowsky ([1994](https://www.sfu.ca/~zaichkow/JA%252094.pdf)). The involvement items close with an open text item asking customers: “If you have any additional comments about your views on tap water, please enter them below”. 

The involvement part of the survey uses a semantic differential scale. This is a method where respondents choose an answer between two antonyms.

[image]

The last page started with two items related to the customer’s relationship with their service provider. Customers were asked to indicate whether they struggle to pay their water bills when they fall due, using a seven-point Likert scale from “Strongly Disagree” to “Strongly Agree”. 

The second question asked customers to indicate the frequency at which they contact their utility for support also using a seven-point Likert scale: “Never”, “Less than Once a Month”, “Once a Month”, “2-3 Times a Month”, “Once a Week”, “2-3 Times a Week”, and “Daily”. 

One of the problems with using paid survey subjects is that they are motivated to submit a lot of responses, without having much regard for the content. American respondents were therefore also subjected to an attention filter: “If you live in the U.S. select Strongly Agree”. The survey was only sent to people within the United States, so everybody should respond equally. Any respondent not answering “Strongly Agree” is excluded from the survey. This approach was used to remove inattentive respondents and assure the accuracy of the results. 

The survey closed with eighteen service quality questions, which were measured using a seven-point Likert scale from “Strongly Disagree” to “Strongly Agree”. The items were presented in random order. The final item of the questionnaire consisted of an open question which invited customers to provide additional comments about their tap water supplier.

The next two sections provide some background information about what the data in this set means. If you are interested in the excruciating details, then you can read //, available from IWA Publishing.

## Personal Involvement Inventory
Consumer involvement is an important metric in marketing to describe the relevance a product or service has in somebody’s life. People who own a car will most likely be highly involved with purchasing and owing the car due to the large amount of money involved and the social role it plays in developing their public self. Consumers will most likely have a much lower level of involvement with the instant coffee they drink than with the clothes they wear. More formally, consumer involvement can be defined as a person's perceived relevance of the object based on inherent needs, values, and interests.

From a managerial point of view, involvement is important because it is causally related to willingness to pay and perceptions of quality. Consumers with a higher level of involvement are willing to pay more for a service and have a more favourable perception of quality.

Understanding involvement in the context of urban water supply is also important because sustainably managing water as a common pool resource requires the active involvement of all users. The level of consumer involvement depends on a complex array of factors, which are related to psychology, situational factors and the marketing mix of the service provider. The lowest level of involvement is considered a state of inertia which occurs when people habitually purchase a product without comparing alternatives.

The highest possible level of involvement are the cult products where customers are fully devoted to a particular product or brand. Commercial organisations use this knowledge to their advantage by maximising the level of consumer involvement through branding and advertising. This strategy is used effectively by the bottled water industry. Manufacturers focus on enhancing the emotional aspects of their product rather than on enhancing the cognitive aspects. Water utilities tend to use a reversed strategy and emphasise the cognitive aspects of tap water, the pipes, plants and pumps, rather than trying to create an emotional relationship with their consumers.

# Exploring and visualising data using the Tidyverse
## Loading the data
We start by loading the Tidyverse library using the `library` function. When loading the package for the first time in a session, the console displays the eight loaded packages.

Next step is to load the raw data. The tidyverse has its own functions to load and save CVS data. Instead of `read.csv` or `write.csv`, the tidyverse commands use an underscore, i.e. `read_csv` and `write_csv`. In Tidyverse, rectangular data is not a data frame, as in base R code, but a tibble. This odd term must be a an expression of the way Hadley Wickham says table in his New Zealand accent.

    rawdata <- read_csv("session2/Customer_Perception_USA.csv")
    dim(rawdata)
    names(rawdata)
    str(rawdata)

    rawdata
    View(rawdata)

The console shows an error message when loading the data, indicating that one column has no name and that it was given the poetic name X58. As in chapter one, we can use various functions to explore see the structure of the data.

When viewing a data frame in R, the systems shows far to many rows to fit on a console. When viewing a tibble in the console, the system only shows the first ten rows and summarises any columns that don't fit on the screen.

The data consists of 691 rows and 58 columns and almost all columns are imported as a character variable. The first 19 columns contain metadata about the data collections, such as a unique response ID, IP addresses, start and end times and so on. The next 35 columns contain the actual data, which is discussed below. The next two columns contain the latitude and longitude of the respondent, based on their IP address. The penultimate field indicates information of the accuracy of the location and the last field is an empty column, as was indicated by the error message.

Looking at the data, we also see that the first two rows contain header information. A tidy data set should only have one header row. Because of the double headers, R thinks that all columns are text.

## Cleaning the data
We need to remove the first row and any irrelevant columns and re-assess the data types to create a clean table. The first line of code creates a new variable by removing the first line of the raw data. It is good practice to keep raw data and processed data in separate variables. 

The `type_convert` function re-assesses the data to ensure it has the correct types. Using the `str` function, we can see that most columns are now numerical values, which is what we want them to be. 

    customers <- rawdata[-1, ]
    customers <- type_convert(customers)
	str(customers)
	
The next step is to remove any irrelevant respondent. There are 

* Failed the attention filter
* Did not consent
* Does not have tap water
* Does not live in one of the three nominated cities
* Quit the survey before completion

The Qualtrics survey software stores this information in the `term` variable. The table function summarises this variable. Most cells have the letters `NA`. *EXPLAIN NA VALUES*. 

The `useNA="always"` addition to the table function also counts the NA values. Executing this function shows that 491 responses are valid and the remaining 200 are not for various reasons.
	
    table(rawdata$term, useNA = "always")
    customers <- filter(customers, is.na(term))
	customers <- select(customers, 20:56)
	dim(customers) 
	
The `filter` function is essentially the same as the `subset` function we saw in session 1. The filter function selects a subset of rows of the tibbele. To section a tibble by column, you use the `select` function. In this case, we only kept the rows where there was no value for `term` and columns 20 to 56.

We now have a clean data set with 491 rows and 37 columns. The `city` variable needs a bit more work because it only contains the numbers 1 to 3. These numbers are the output of a dropdown list with the options Los Angeles, Denver and Boston. First we create a new tibble to link the numbers with towns, which is then joined to the main data.

The `left_join` function finds the matching fields in the two sets and then merges the sets together. This function keeps all the values in the left data set. The Tidyverse has several other join functions that match values in a different way.

    cities <- tibble(city = 1:3,
                     city_name = c("Los Angeles", "Denver", "Boston"))
    customers <- left_join(customers, cities)

When reviewing the code to clean the data we can see some repetition because we change the `customers` variable several times in a row. This approach is typical to writing code. In a spreadsheet, these steps are often merged in one complex formula, like this:

    left_join(select(filter(type_convert(rawdata[-1, ]), is.na(term)), 20:56), cities)

While the nested approach takes less space, it is not as easy to understand because you have to read from the inside out instead of from left to right.

The Tidyverse uses a pipe (`%>%`) to simplify this process. A pipe transports the output of one process to the input of the next process. The code used to clean the customer data is now written like this:

    customers <- rawdata[-1, ] %>%
        type_convert() %>%
        filter(is.na(term)) %>%
        select(20:56) %>%
        left_join(cities)
		
All other examples in this course will use this method.

## Exploring the data
The Tidyverse set of packages contains `ggplot`, one of the most powerful visualisation tools. This package implements a layered approach to visualising data, which helps building complex graphics. This session introduces the basic functionality of ggplot.

In this session we like to focus on the Personal Involvement Inventory (PII) data so only use a part of the customer data set. We use the `select` function to create a new tibble to store the data for the inventory. In this case this function selects the city column and every column with a names that starts with a lower case p.

Because we now have clean data set, we can write the result to disk so that it can be used in other sessions.

    pii <- select(customers, City = city_name, starts_with("p", ignore.case = FALSE))
    write_csv(pii, "session2/personal_involvement_index.csv")
	
The basic ggplot function starts with the name of the data set and then a range of aesthetics. The aesthetics consist of the fields that will be used to visualise the data. The second part tells ggplot which geom to use. A geom is a type of visualisation. The ggplot library has many possible geoms. The example below shows a simple bar plot for the number of respondents from each city.

    ggplot(pii, aes(City)) + geom_bar()
	
This function creates a simple greyscale plot because we only should add colour to a visualisation when it expresses data. You can force ggplot to use a colour by using `geom_bar(fill = "blue")`, or any other colour which you might fancy.

The outcomes of the survey items is best visualised with a histogram. This next code snippet also shows how to add titles. You can see the layered approach of ggplot. The first function call defines the plot canvas with the aesthetics




## Assignment
Load the turbidity data set from session one and filter it so that we only have data from 







# Assignment

Extract the quantitative service quality data (fields t1 to f13) and explore the patterns. What is the difference between the answer in the questions starting with *a /t* and those starting with an *f*?

