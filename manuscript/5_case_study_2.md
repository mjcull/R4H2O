# Case Study 2: Understanding Customer Perception {#casestudy2}
This second case study uses data from a dissertation on [water utility marketing](http://hdl.handle.net/1959.9/561679). This research includes a survey of American tap water consumers to measure their perception of tap water services. The survey included questions to measure consumers' involvement with tap water services and their perception of service quality.

The data from the previous studies was an example of a perfect world without missing data and other issues. Many practitioners will tell you that cleaning data can be 80% of the work. Cleaning data is extremely important because even the most advanced algorithm can't create value from rubbish. As the old adagio goes: "Rubbish in is rubbish out". 

This first case study revolves around cleaning the customer survey data set to a format that we can easily visualise and analyse.

## Consumer Involvement
Consumer involvement is an essential marketing metric that describes the relevance a product or service has in somebody's life. People who own a car will most likely be highly involved with purchasing and owning the car due to a large amount of money involved and the social role it plays in developing their public self. Consumers will most likely have a much lower level of involvement with the instant coffee they drink than with the clothes they wear. More formally, consumer involvement can be defined as a person's perceived relevance of the object based on inherent needs, values, and interests.

Consumer involvement is vital because it is causally related to willingness to pay and perceptions of quality. Consumers with a higher level of involvement are willing to pay more for a service and have a more favourable perception of quality.

Understanding involvement in the context of urban water supply is also important because sustainably managing water as a common pool resource requires the active involvement of all users. The level of consumer involvement depends on a complex array of factors, which are related to psychology, situational factors and the marketing mix of the service provider. The lowest level of involvement is considered a state of inertia, which occurs when people habitually purchase a product without comparing alternatives.

Cult products have the highest possible level of involvement because customers are devoted to the product or brand. Commercial organisations use this knowledge to their advantage by maximising the level of consumer involvement through branding and advertising. This strategy is used effectively by the bottled water industry. Manufacturers focus on enhancing the emotional aspects of their product rather than on enhancing the cognitive aspects. Water utilities tend to use a reversed strategy and emphasise the cognitive aspects of tap water, the pipes, plants and pumps, rather than trying to create an emotional relationship with their consumers.

## Problem Statement
The fact that water is essential to life suggests that consumers of tap water have a high level of involvement with the service. Contrary to this common-sense intuition, practitioner experience and literature state that tap water is a low-involvement service. However, the level of consumer involvement with [tap water services](https://www.researchgate.net/publication/326533830_We_Care_About_Water_Even_If_You_Don%27t_Water_As_a_Low_Involvement_Service) has not been empirically verified. 

Determine the level of consumer involvement, using the data from the American tap water consumers.

## Methodology
A commercial survey service provider recruited the respondents, who were paid for their participation. The questionnaire consisted of [four pages](resources/session5/customer_survey.pdf), which respondents accessed through a website. 

The first page introduced the research and asked respondents to provide their consent to participate. Respondents who did not provide consent were exited from the survey. Due to the broad geographical spread of potential respondents on the American survey panel, respondents were also required to complete two screening questions. The first question related to their place of residence and the second question asked whether they had tap water at home. Only customers located in Los Angeles, Denver or Boston and those with tap water connections continued to the next page of the questionnaire. Other respondents were excluded from the survey.

The second page consisted of questions about the level of involvement respondents have with tap water. These questions use the Personal Involvement Inventory developed by Judity Zaichkowsky ([1994](https://www.sfu.ca/~zaichkow/JA%252094.pdf)). The involvement items close with an open text item asking customers: "If you have any additional comments about your views on tap water, please enter them below". 

The Personal Involvement Inventory consists of two dimensions:  cognitive involvement (importance, relevance, meaning, value and need) and affective involvement 
(involvement, fascination, appeal, excitement and interest).

The involvement part of the survey uses a semantic differential scale. This method requires respondents to choose on a scale between two antonyms (figure 3.1). This type of survey measures the meaning that people attach to a concept, such as a product or service. The items were presented in a random order to each respondent. The words on the right indicate a high level of involvement. Fiver questions have a reversed polarity, which means that the left side indicates a high level of involvement (Figure 3.1).

{width: 60%}
![Figure 3.1: Personal Involvement Inventory questionnaire](resources/session5/involvement-index.png)

The penultimate page started with two items related to the customer's relationship with their service provider. Customers were asked to indicate whether they struggle to pay their water bills when they fall due, using a seven-point Likert scale from "Strongly Disagree" to "Strongly Agree". 

The second question asked customers to indicate the frequency at which they contact their utility for support, also using a seven-point Likert scale: 
* Never
* Less than Once a Month
* Once a Month
* 2-3 Times a Month
* Once a Week
* 2-3 Times a Week
* Daily

One of the problems with using paid survey subjects is that they are motivated to complete many surveys, without having much regard for the content. American respondents were therefore also subjected to an attention filter: "If you live in the U.S. select Strongly Agree". The survey was only sent to people within the United States, so everybody should respond equally. Any respondent not answering "Strongly Agree" is excluded from the survey. This approach was used to remove inattentive respondents and assure the reliability of the results. 

The survey closed with eighteen service quality questions, which were measured using a seven-point Likert scale from "Strongly Disagree" to "Strongly Agree". The items were presented in random order. The final item of the questionnaire consisted of an open question which invited customers to provide additional comments about their tap water supplier.

If you are interested reading more about a scientific view of customer experience in water utilities, then you can read *Customer Experience Management for Water Utilities* by Peter Prevos, available from [IWA Publishing](https://www.iwapublishing.com/books/9781780408668/customer-experience-management-water-utilities-marketing-urban-water-supply).

## Analysing the Case Study
The `Customer_Perception_USA.csv` file provided in the `casestudy2` folder is the raw data exported from the [Qualtrics](https://qualtrics.com/) survey platform. This session explains how to clean and visualise the data using the Tidyverse. The code in this section is available in the `casestudy2.R` script. You start the analyses by loading the Tidyverse packages using `library(tidyverse)`.

### Load the data
The readr package of the Tidyverse has an alternative function to read and write CSV files. This function looks almost the same, except for the underscore. One of the advantages of this function is that it is faster and better able to guess the correct data format than the base R function.

{format: r, line-numbers: false}
```
rawdata <- read_csv("casestudy2/Customer_Perception_USA.csv")
names(rawdata)
```

We use the `rawdata` variable name because we want to keep this data intact as we process it, in case we need to use it again.

In Tidyverse, rectangular data is not a data frame, as in base R code, but a 'tibble'. This odd term is a pun on how the word table sounds in a New Zealand accent. Tibbles have the same properties as a data frame, but have some extended capabilities to make life easier.

The first 19 columns contain metadata about the data collections, such as a unique response ID, IP addresses, start and end times, and so on. The next 35 columns contain the actual data. Columns 5 and 56 contain the latitude and longitude of the respondent, based on their IP address. The last field provides information on the accuracy of the location.

X> View the data in the console.

When you ask to display it in the console, the text does not scroll away like in the standard version but R shows only the first set of columns that fits horizontally and only displays the first ten rows. The text below this summary informs us about the data that is not displayed.

Q> How many rows and columns of data does this data have?

### Clean the data
Looking at the data, we also see that the first two rows contain header information. A tidy data set should only have one header row. Because of the double headers, R thinks that all columns are text. We need to remove the first row and re-assess the data types to create a clean table.

{format: r, line-numbers: false}
```
customers <- rawdata[-1, ]
customers <- type_convert(customers)
str(customers)
```

The first line of code creates the new `customers` variable by removing the first line of the raw data. The `type_convert()` function re-assesses the data to ensure it has the correct types. Using the `str()` function, we can see that most columns are now numerical values, which is what we want them to be.

X> Inspect the structure of the `customers` variable. How many observations does it contain?

The next step is to remove any respondents that either:
* Failed the attention filter
* Did not consent
* Does not have tap water
* Does not live in one of the three nominated cities
* Quit the survey before completion

The Qualtrics survey software stores this information in the `term` field. To summarise the content of this field, we can use the basic `table()` function. This function creates a table of all the elements in a vector and gives the number of occurrences.

{format: r, line-numbers: false}
```
table(customers$term)
```

You might notice that the total number of items in the table does not match the number of rows (observations). When you view the content of this field (`customers$term`), you see many entries with `NA` in them. These are empty values (Not Available). R uses this code to better manage missing values.

After reviewing the data, we can conclude that we only want those rows of data that have an `NA` value in the `term` field.

In the dplyr package of Tidyverse, the `filter()` function conditionally chooses rows of a data frame. For example, using `filter(customers, term == "attention")` results in a data frame with only those entries that failed the attention filter. In the filter function, we don't have to repeat the data frame name and can specify the variable name, as we did in the `subset()` function.

In our case we want all values with `NA`. To find these we need to use a special function. The `is.na()` function results in a logical variable (TRUE or FALSE) that shows whether the field is not available. Try `is.na(customers$term)` to see the result.

{format: r, line-numbers: false}
```
customers <- filter(customers, is.na(term))
```

The Qualtrics data contains metadata that we don't need for further analysis. The first 19 columns contain information about when the survey was taken and so on and the last two columns are irrelevant. The next step is to filter the data, so we only use the first column as a unique ID and columns 20 to 56.

Q> How would you remove the unnecessary columns using base R code?

In the dplyr package, the `select()` function works just like the filter function, but for columns. You can use numbers or names to indicate the required columns. In this case we like to keep the first row, which is the unique id for each response, and the rows 20 to 56.

{format: r, line-numbers: false}
```
customers <- select(customers, c(1, 20:56))
```

We are close to a clean data set. The first column has the `city` variable, which at the moment is just the integer 1, 2, or 3. These numbers correspond to the order in the drop-down box in the survey. The options were:

1. Los Angeles
2. Denver
3. Boston. 

First, we create a new tibble to link the numbers with towns, which is then joined to the main data. 

{format: r, line-numbers: false}
```
cities <- tibble(city = 1:3,
                 city_name = c("Los Angeles", "Denver", "Boston"))
customers <- left_join(customers, cities)
```

The `left_join` function finds the matching fields in the two sets and then merges the sets. This function keeps all the values in the left data set. The Tidyverse has several other [join functions](https://dplyr.tidyverse.org/reference/join.html) that match values differently. You can also define the fields on which you want to match the data frames.

This sequence of commands creates a clean data set for further analysis. This code contains a lot of repetition because we change the `customers` variable several times in a sequence. In a spreadsheet, these steps are often merged in one formula:

{format: r, line-numbers: false}
```
left_join(select(filter(type_convert(rawdata[-1, ]), is.na(term)), c(1, 20:56)), cities)
```

While the nested approach takes less space, it is not as easy to understand because you have to read from the inside out instead of from left to right.

The Tidyverse uses a pipe (`%>%`) to simplify this process. A pipe transports the output of one process to the input of the next process. The code used to clean the customer data is now written like this:

{format: r, line-numbers: false}
```
customers <- rawdata[-1, ] %>%
    type_convert() %>%
    filter(is.na(term)) %>%
    select(c(1, 20:56)) %>%
    left_join(cities)
```

Q> Use the pipe construct to exclude the data from Los Angeles from the customer data and only retain the first twelve columns.

We have cleaned the data for the whole survey, but before we continue, we need to take one more step because we are for now only interested in the Personal Involvement Index (PII).

This code selects the `city_name` column and renames it to City. It also selects all columns that start with a lowercase p. 

The second line reverses the value of five of the items that were presented in reverse order, as explained in the introduction.

{format: r, line-numbers: false}
```
pii <- select(customers, City = city_name, starts_with("p", ignore.case = FALSE))
pii[, c(2, 3, 8, 9, 10, 11)] <- 8 - pii[, c(2, 3, 8, 9, 10, 11)]
```

### Tidy Data
A dataset is a collection of values, usually either numbers or strings. Values are organised in two ways. Every value belongs to a variable and an observation. A variable contains all values that measure the same underlying attribute (like height, temperature, duration) across units. An observation contains all values measured on the same unit (like a person, or a day, or a race) across attributes.

Most data is structured in a long format (Figure 4.2, left). The first column (the key) contains the identifier and the remaining three columns the data. 

![Figure 4.2: Schematic overview of data](resources/session5/tidy_data.png)

[Tidy data](https://www.jstatsoft.org/article/view/v059i10) is a standard way of mapping the meaning of a dataset to its structure. A dataset is messy or tidy depending on how rows, columns and tables are matched up with observations, variables and types. In tidy data:

* Each variable forms a column.
* Each observation forms a row.
* Each type of observational unit forms a table.

The table on the right of Figure 4.2 is a tidy version of the data on the left. Tidy data is much easier to analyse.

Although the data for the Personal Involvement Index is now clean, it is not yet 'tidy'.

The `gather()` function in the *tidyr* package helps to create tidy sets of data. This function takes multiple columns and collapses them in to key-value pairs. In Excel, tidy data is created by pivoting a table.

{format: r, line-numbers: false}
```
pii <- gather(pii, "Item", "Score", -id, -City)
```


In the last step we save the clean and tidy data to disk so we don't have to repeat all these steps next time.

















## Answers
Q> How many rows and columns of data does this data have?

The raw data has 691 rows and 57 columns.

{format: r, line-numbers: false}
```
dim(rawdata)
```

Q> How would you remove the unnecessary columns using base R code? columns.

Use the square brackets to indicate the columns you want to retain.

{format: r, line-numbers: false}
```
customer <- customers[, 20:56]
```

Q> Use the pipe construct to exclude the data from Los Angeles from the customer data and only retain the first 11 columns.

In the sequential version you would write:

{format: r, line-numbers: false}
```
la <- filter(customers, city_name == "Los Angeles")
la <- select(la, 1:12)
```

Using the pipe, it looks something like this:

{format: r, line-numbers: false}
```
la <- filter(customers, city_name == "Los Angeles") %>%
    select(1:12)
```



## Quiz 2: Customer Perception
The data also contains information about the customer's ability to pay their bills, how often they contact their utility and their perception of service quality.

