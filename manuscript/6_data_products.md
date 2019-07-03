# Creating Data Products {#dataproducts}
The purpose of data science is to create value from data by creating useful, sound and aesthetic data products. Analysing data is a rewarding activity, but creating value requires you to communicate the results. 

The generic term for the result of a data science project is a 'data product'. A data product can be a report, presentation, application, infographic or anything else that communicates the results of the analysis. The purpose of data products is to change reality positively. This change can be either by changing the way we understand our profession or by enabling somebody to implement change.

This section explains how to share the fruits of your labour with colleagues and other interested parties by generating reports that combine text and analysis through [literate programming](https://en.wikipedia.org/wiki/Literate_programming). Before we explain how to create reproducible reports, we delve into the data science workflow, with an excerpt from the book *Strategic Data Science*.

## Data Science Workflow
The workflow for analytical projects starts with defining a problem that needs solving (Figure 6.1). The next step involves loading and transforming the data into a format that is suitable for the required analysis. The data science workflow contains a loop, the data vortex, that consists of exploration, modelling and reflection that is repeated until the problem is solved or is shown to be unsolvable.

{width: 80%}
![Figure 6.1: Data science workflow.](resources/session6/workflow.png)

### Define
The first step of a data science project is to define the problem. This first step describes the problem under consideration and the desired future state. The problem definition should not make specific reference to available data or possible methods but be limited to the issue at hand. An organisation could seek to optimise production facilities, reduce energy consumption, monitor effectiveness, understand customers, and so on. A concise problem definition is necessary to ensure that a project does not deviate from its original purpose or is cancelled when it becomes apparent that the problem cannot be solved.

The problem definition opens with a description of the current situation and clearly identifies which aspect needs improvement or more profound understanding. The problem statement concludes with a summary of the ideal situation. For example:

> The regulator for water quality has released a new guideline that lowers the maximum guideline value for trihalomethanes at the customer tap to 0.15 mg/l. This report assesses the historical performance of the Gormsey water system to evaluate the risk of non-compliance, assuming no operational changes are implemented.

### Prepare
The available data needs to be loaded and wrangled into the required format before any analysis can take place. Influential data scientist Hadley Wickham refers to this process as tidying data, as discussed in the [previous chapter](#casestudy2). Anecdotally, this phase project could consume up to eighty per cent of the work effort, depending on the difference between the available data and the required data.

Best practice in data science is to record every data set that is considered for the project. A data book records every field extracted from a source to ensure the context in which the data was created is understood.

For the problem statement above, we have the Gormsey data that was discussed previously. Our report would open with a description of this data and how it was collected to ensure we relate the data to the reality from which it was extracted.

### Understand
Once the data is available in a tidy format, the process of understanding the data can commence. The analytical phase consists of a three-stage loop, the data vortex, that is repeated until the required results are achieved or evidence becomes available that the objectives cannot be met. These three stages are: explore, model and reflect.

For our example case study, the analysis is a straightforward description of the distribution of the results. We don't have chlorine residuals for the Gormsey data, but if we did, we could investigate the relationship between chlorine and THM.

#### Explore
The best method to start analysing data is to explore the data to understand its relationship to reality. Generating descriptive statistics such as averages, ranges, correlations, and so on provides a quick insight into the data. Relying on numerical analysis alone can, however, deceive because very different sets of data can result in the same values. 

Justin Matejka and George Fitzmaurice from *AutoDesk* demonstrated how very different sets of data can have almost the same [summary statistics](https://doi.org/10.1145/3025453.3025912) (Figure 6.2). Each of these six visualisations shows that these sets of data have very different patterns. When, however, analysing this data without visualising it, the mean values of `x` and `y`, and their correlations are almost precisely the same for all six subsets. In their paper, they presented an algorithm that generates every possible pattern with the same summary values, six of which are shown in the illustration.

{width: 80%}
![Figure 6.2: Six patterns with very similar summary statistics.](resources/session6/datasaurus.png)

Another reason to use visualisations to explore data is to reveal anomalies, such as unnatural spikes or outliers. A sudden increase and decrease in physical measurements are often caused by issues with measurement or data transmission instead of actual changes in reality. These spikes need to be removed to ensure the analysis is reliable. Anomalies in social data such as surveys could be subjects that provide the same question to all answers, discussed in the previous chapter.

Detecting outliers and anomalies and removing these from a data set increases the reliability of the analysis. Not all anomalies in a collection of data are necessarily suspicious, and care should be taken before removing data. The reasons for excluding any anomalous data should be documented so that the analysis remains reproducible.

The exploratory analysis in the case study involves, as a minimum, generating time series charts for all relevant data and understand their statistical distributions. What are the maximum and minimum values? The variability of the observations and other essential statistics provide insight into the shape of the data.

#### Model
After the analyst has a good grasp of the variables under consideration, the actual analysis can commence. Modelling involves transforming the problem statement into mathematics and code.

Every model of the world is bounded by the assumptions contained within it. Statistician George Box is famous for stating that "all models of reality are wrong, but some are useful". Since data science is not a science in the sense that we are seeking the truth, a useful model is all we need.

When modelling the data, the original research question always needs to be kept in mind. Exploring and analysing data without a specific purpose can quickly lead to wrong conclusions. Just because two variables correlate does not imply that there is a logical relationship. A clearly defined problem statement and method prevent data dredging. The availability of data and the ease of extracting this information makes it easy for anyone to find relationships between different sources of information.

A good general rule when analysing data is to distrust your method when you can confirm your hypothesis easily. If this is the case, using triangulation through a different process helps to verify the results.

The modelling in this case study involves descriptive statistics and assessing the likelihood of exceeding the new limit if operational conditions don't change.

#### Reflect
Before the results of an analysis can be communicated, domain experts need to review the outcomes to ensure they make sense and indeed solve the problem stated in the definition. The reflection phase should also include the customer to ensure that the problem statement is being solved to their satisfaction.

Visualisation is a quick method to establish whether the outcomes make sense by revealing apparent patterns. Another powerful technique to reflect on the results is sensitivity analysis. This technique involves changing some of the assumptions to test the model responds as expected. Mathematical models are often complex where the relationship between variables is not clearly understood. Sensitivity analysis helps to understand these relationships by using extreme for specific variables and then observe the effect on the model.

Concerning the case study, the modelling required a lot of reflection on the chosen model and required many iterations of the data vortex. Developing a performance index is a balancing act to ensure each parameter is appropriately weighted. The purpose of the index was to provide the board with salient information so they can ask targeted questions during meetings. The reflection phase always needs to reflect on the purpose and ensure it is achieved.

### Communicate
The last, and arguably, the hardest phase of a data science project is to communicate the results to the users. In most cases, the users of a data product are not specialists with a deep understanding of data and mathematics. The difference in skills between the data scientist and the user of their products requires careful communication of the results.

Detailed reports and visualisations need to not only provide an accurate description of the outcomes, but they also need to be able to convince the reader. The most critical aspect of successfully communicating the solution to the problem is to ensure that the consumers of the results understand them and are willing to use them to solve the problem. As much as data science is a systematic process, it is also a cultural process that involves managing the internal change in the organisation.

## Reproducible Research
The most effective method to achieve full reproducibility is to use literate programming. This method combines computer code with text so that the analysis becomes fully transparent. Although many systems exist that at first instance might seem more user-friendly than writing code, point-and-click systems have severe limitations, and the results are often difficult to verify.

Several methods are available in the R language to ensure analysis is reproducible. The most basic one is adding comments to the code. A comment is a statement that is not evaluated when running the code. In the R language comments are indicated with one or more pound signs, also known as a number sign, hash or hashtag, at the start. For example:

{format: r, line-numbers: false}
```
# Raw data from Qualtrics
rawdata <- read_csv("casestudy2/Customer_Perception_USA.csv")
customers <- rawdata[-1, ] # First row is redundant
```

Just like in natural language, we use conventions to make a text readable, so do software developers. The developers of the Tidyverse have developed a [style guide](https://style.tidyverse.org/) to assist data scientists with writing code that is easy to read and follow. In developer's parlance, this is called elegant code.

However, most consumers of data products are not interested in the code and only want to see the results. In the [visualisation](#tidyverse) chapter, we saw how to save high-quality graphics to share with others. The next section explains how you can use RStudio to produce output in various other formats, such as Word, Powerpoint, PDF, HTML, and so on.

## RMarkdown
R-Markdown is a versatile tool within RStudio that allows you to combine a narrative with the results of the analysis. An R-Markdown file consists, as the name suggests, of R and Markdown code. You know what R is, so now we need to explore Markdown.

Word processors use the WYSIWYG approach. This means that what you see on the screen is what you get when you print the document (What You See is What You Get). While this is a seductive way to write text, it is not the most productive method because people can spend ages getting the formatting right.

Underneath the glitz and glamour of the software, all information is stored in a markup language, such as XML. This language indicates when text is bold, a heading, includes images and so on. Many developers write their text directly in a markup language, instead of using a WYSIWYG. Markdown is, paradoxically, a markup language, known for its simplicity, which is the reason for the play of words.

This course and all my other published works are written in a markup language such as LaTeX, Markdown or Org-Mode (using the Emacs editor). The advantage of this approach is that you focus on content instead of design. Anything written in a markup language can be easily exported to almost any format imaginable using style templates. You can find all the text, images and other resources used to create this course in the `manuscript` folder.

Lets put this theory int practice. Go to the *File* menu and create a new R Markdown file. You will see a popup menu where you can add the document title, author name and select the output type. Select Word as the output and enter a title related to the problem statement at the start of this chapter. When you click OK, RStudio will create a template document that explains the basic principles.

When you save the file and then click the *Knit* button, RStudio generates a document that includes any content, the code and the output of any embedded R code within the document.

When you hit the *Knit* button, you might receive a message that specific packages need to be installed. Follow the prompts to let that happen.

The document consists of three elements. The content between the three-dash lines is the header that specifies necessary information about the title, author, date and the output format (Figure 6.3).

{width: 100%}
![Figure 6.3: Template R Markdown document](resources/session6/rmarkdown-example.png)

All R code is written in a 'chunk'. The three grave accents indicate the start and end of the code chunk. The text between curly braces indicates the computer language and options, in this case, R. By default the code is included in the output. When you add the `echo = FALSE` option, the code is excluded. If you like not to show any code in the final document, then change the option in the first chunk, which sets the defaults. Many other options are available.

You can add additional chunk with the insert button. When you click it, you will notice that RStudio can also process other data science languages such as SQL or Python.

The third part of the document is the Markdown text. In Markdown, headers start with one or more has symbols, lists start with asterisks, and so on. Markdown uses these non-alphanumeric symbols to instruct the computer what the output should look like. The basic principles of R Markdown are explained in detail R Markdown [cheat sheet](https://www.rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf).

An R-Markdown file can be exported to many standard formats. To create a PDF, you need to have the LaTeX software installed on your computer. This software is a powerful markup language mainly used for scientific publications.

X> Familiarise yourself with R Markdown using the RStudio website.

This chapter closes with an assignment using the data from the first or second case study.

X> Create a short report in Word that assesses the Gormsey data following the problem statement at the start of this chapter.

A possible solution is provided in the `casestudy1` folder in the course materials.

In the last [case study](#casestudy3), we start using the Tidyverse to analyse data using data from smart meters.
