# Welcome to the Tidyverse: Cleaning and Exploring Data

In the first session we looked at some of the basic functionality of the R language. Some of the basic functionality of R is a bit cumbersome and many people have written packages to extend and improve functionality. One of the most promising series of extensions is the Tidyverse, developed by Kiwi R guru Hadley Wickham and many others.
## The Tidyverse

The tidyverse is a collection 

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
The case study for this session is a file that contains the views of hundreds of American consumers about their tap water service. The provided file is the raw data as exported from the Qualtrics survey platform. This session will focus on cleaning and visually exploring the data using the Tidyverse functionalities. 

The questionnaire consisted of [four pages](customer_survey.pdf). The first page introduced the research and provided a link to the Participant Information Sheet. The first question asked respondents to provide their consent to participate. Respondents not providing consent were exited from the survey. Due to the broad geographical spread of potential respondents on the American survey panel, respondents were required to also complete two screening questions. The first question related to their place of residence and the second question asked whether they had tap water at home. Only customers located in Los Angeles, Denver or Boston and those with tap water connections continued to the next page of the questionnaire. Other respondents were excluded from the survey.

The second page consisted questions about the level of involvement respondents have with tap water. These questions use the Personal Involvement Inventory developed  by Judity Zaichkowsky ([1994](https://www.sfu.ca/~zaichkow/JA%252094.pdf)). The involvement items closed with an open text item asking customers: “If you have any additional comments about your views on tap water, please enter them below”. The involvement data was collected but not used in this dissertation to limit the scope of the dissertation. 

The last page started with two items related to the customer’s relationship with their service provider. Customers were asked to indicate whether they struggle to pay their water bills when they fall due, using a seven-point Likert scale from “Strongly Disagree” to “Strongly Agree”. The second question asked customers to indicate the frequency at which they contact their utility for support also using a seven-point Likert scale: “Never”, “Less than Once a Month”, “Once a Month”, “2-3 Times a Month”, “Once a Week”, “2-3 Times a Week”, and “Daily”. American respondents were also subjected to an attention filter: “If you live in the U.S. select Strongly Agree”. Any respondent not answering “Strongly Agree” was exited from the survey. This approach was used to remove inattentive respondents and assure the accuracy of the results. 

The survey closed with eighteen service quality questions, which were measured using a seven-point Likert scale from “Strongly Disagree” to “Strongly Agree”. All points on the scale were labelled to avoid confusion. The items were presented in random order. The final item of the questionnaire consisted of an open question which invited customers to provide additional comments about their tap water supplier.

The next two sections provide some background information about what the data in this set means. If you are interested in the excruciating details, then you can read ******\*******

## Personal Involvement Inventory
Involvement is an important metric in marketing to describe the relevance a product or service has in somebody’s life. People who own a car will most likely be highly involved with purchasing and owing the car due to the large amount of money involved and the social role it plays in developing their public self. Consumers will most likely have a much lower level of involvement with the instant coffee they drink than with the clothes they wear. More formally, consumer involvement can be defined as a person's perceived relevance of the object based on inherent needs, values, and interests.

From a managerial point of view, involvement is important because it is causally related to willingness to pay and perceptions of quality. Consumers with a higher level of involvement are willing to pay more for a service and have a more favourable perception of quality.

Understanding involvement in the context of urban water supply is also important because sustainably managing water as a common pool resource requires the active involvement of all users. The level of consumer involvement depends on a complex array of factors, which are related to psychology, situational factors and the marketing mix of the service provider. The lowest level of involvement is considered a state of inertia which occurs when people habitually purchase a product without comparing alternatives.

The highest possible level of involvement are the cult products where customers are fully devoted to a particular product or brand. Commercial organisations use this knowledge to their advantage by maximising the level of consumer involvement through branding and advertising. This strategy is used effectively by the bottled water industry. Manufacturers focus on enhancing the emotional aspects of their product rather than on enhancing the cognitive aspects. Water utilities tend to use a reversed strategy and emphasise the cognitive aspects of tap water, the pipes, plants and pumps, rather than trying to create an emotional relationship with their consumers.


<a id="orgb7e0a7b"></a>

## TODO Service Quality
# Examples
## Loading the data
Discuss dim in session 1

The tidyverse has its own functions to load and save CVS data. Instead of `load.csv` or `write.csv`, the tidyverse commands 

We start by loading the Tidyverse library and loading the data. The console will show an error message, indicating that one column has no name. The `dim` and `spec` function helps us to see the structure of the data.

Running this function shows that the data consists of 691 rows and 58 columns. All columns are imported as character

    library(tidyverse)
    spec(customers)
    dim(customers)

The next step is to view the data by clicking on it in the environment window, or by issuing the command `View(customers)`.

The first 19 columns contain metadata about the data collections, such as a unique response ID, IP addresses, start and end times and so on. The next 35 columns are the actual data, which is discussed below. The next two columns contain the latitude and longitude of the respondent. This location is based on the IP address. The penultimate field gives information on the accuracy of the location and the last field is an empty column.

Looking at the data, we also see that the first two rows contain header information. A tidy data set should only have one header row. Because of the double headers, R thinks that all columns are text. 

To clean the data, we need to change the column names, remove the first row and irrelevant columns and re-assess the data types.

    

The `names` function shows the variable names of a data frame and allows you to change them. This code snippet changes the names to the entries in the first row and the removes that row, so we only have actual data. The `type_convert` function reassesses the data and assigns new types. When 
## Exploring the data

The Tidyverse set of packages contains ggplot, one of the most powerful visualisation tools. This package implements a layered approach to visualising data, which helps building complex graphics.
# Homework

Extract the quantitative service quality data (fields t1 to f13) and explore the patterns. What is the difference between the answer in the questions starting with *a /t* and those starting with an *f*?

