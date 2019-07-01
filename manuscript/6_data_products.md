# Creating Data Products
The purpose of data science is to create value from data by creating useful, sound and aesthetic data products. This section explains how to communicate the fruits of your labour to colleagues and other interested people. A data product can be a report, a presentation, an application or anything else that communicates the results of analysis.

The purpose of data products is to positively change reality. This change can be either through changing the way we understand our profession or, even better, taking action to change reality.

Sound data science requires that research is reproducible, this means that any data product is potentially open to peer review.

This chapter discusses the data science workflow and how to create reproducible research.

## Data Science Workflow
The defining difference between data science and common business analysis is the methodical approach to solving business problems. Using code instead of spreadsheets or other 'point-and-click' systems creates a reproducible 

![Data science workflow](resources/session6/workflow.png)

The workflow starts with defining a problem that needs solving (Figure 15). The next step involves loading and transforming the data into a format that is suitable for the required analysis. The data science workflow contains a loop that consists of exploration, modelling and reflection that is repeated until the problem is solved or is shown to be unsolvable.

### Define
The first step of a data science project is to define the problem. This first step describes the problem under consideration and the desired future state. The problem definition should not make specific reference to available data or possible methods but be limited to the issue at hand. An organisation could seek to optimise production facilities, reduce energy consumption, monitor effectiveness, understand customers and so on. A concise problem definition is necessary to ensure that a project does not deviate from its original purpose or is cancelled when it becomes apparent that the problem cannot be solved.

The outcome of a data science project can be either actionable intelligence or improved understanding of a business process, as discussed in [section 2.2](#useful).

The problem definition opens with a description of the current situation and clearly identifies which aspect needs improvement or more profound understanding. The problem statement concludes with a summary of the ideal situation. For example:

>A water utility reports water quality results to the board of directors every month. The report contains a lot of tables with results of laboratory testing. The members of the board are not technical experts and don't fully understand what they mean. Another section of the report shows water quality complaints, without indicating how they relate to water quality results. The board has asked for a visualisation to report water quality performance that combines the available data in one succinct overview.

The definition of the project concludes with a description of a possible method to solve the problem and the data sources needed to implement the solution. Assuming all the required sources of data are available, the analytical process can commence.

For the case study, the analyst decided to use a performance index for each of the different aspects of the water supply system. A water quality index is a dimensionless number that reflects the level of performance compared to an ideal situation.

### Prepare
The available data needs to be loaded and wrangled into the required format before any analysis can take place. Influential data scientist Hadley Wickham refers to this process as tidying data.[^wickham] Anecdotally, this phase of the project could consume up to eighty per cent of the work effort, depending on the difference between the available data and the required data.

[^wickham]: Wickham and Grolemund (2016).

Best practice in data science is to record every data set that is considered for the project. A data book records every field extracted from a source to ensure the context in which the data was created is understood.

{title="Table 1: Data science case study: available data."}
| Source              | Source          | Availability |
|---------------------|-----------------|--------------|
| Catchment           | Paper records   | Intermittent |
| Treatment plant     | SCADA           | Continuous   |
| Network             | Laboratory      | Weekly       |
| Customer experience | Complaints      | Daily        |
| Regulation          | Issues register | Intermittent |

For the water utility case study, several data sources are available as shown in the table. The data scientist needs to decide which of these sources solves the problem. In this example, the data from the catchments is only available on paper, which makes it difficult to analyse it algorithmically. A separate project would be required to convert this source to electronic data. Other data sources are available electronically and can be used for the project.

### Understand
Once the data is available in a tidy format, the process of understanding the data can commence. The analytical phase consists of a three-stage loop, the data vortex, that is repeated until the required results are achieved or evidence becomes available that the objectives cannot be met. These three stages are explore, model and reflect.

#### Explore
The best method to start analysing data is to explore the data to understand its relationship to reality. Generating descriptive statistics such as averages, ranges, correlations and so on provides a quick insight into the data. Relying on numerical analysis alone can, however, deceive because very different sets of data can result in the same values. 

Justin Matejka and George Fitzmaurice from AutoDesk demonstrated how very different sets of data can have almost the same summary statistics (Figure 16). Each of these six visualisations shows that these sets of data have very different patterns. When, however, analysing this data without visualising it, the mean values of _x_ and _y_, and their correlations, are almost exactly the same for all six subsets. In their paper, they presented an algorithm that generates every possible pattern with the same summary values, six of which are shown in the illustration.[^saurus]

[^saurus]: Matejka, J., & Fitzmaurice, G. (2017). Same Stats, Different Graphs: Generating Datasets with Varied Appearance and Identical Statistics through Simulated Annealing. In _Proceedings of the 2017 CHI Conference on Human Factors in Computing Systems  - CHI ’17_ (pp. 1290–1294). Denver, Colorado, USA: ACM Press. [DOI 10.1145/3025453.3025912](https://doi.org/10.1145/3025453.3025912).

![Figure 16: Six patterns with very similar summary statistics.](images/figure16_Datasuarus.png)

Another reason to use visualisations to explore data is to reveal anomalies, such as unnatural spikes or outliers. A sudden increase and decrease in physical measurements are often caused by issues with measurement or data transmission instead of actual changes in reality. These spikes need to be removed to ensure the analysis is reliable. Anomalies in social data such as surveys could be subjects that provide the same question to all answers, discussed in the previous chapter.

Detecting outliers and anomalies and removing these from a data set increases the reliability of the analysis. Not all anomalies in a set of data are necessarily suspicious, and care should be taken before removing data. The reasons for removing any anomalous data should be documented so that the analyses remains reproducible.

The exploratory analysis in the case study involved generating time series charts for all relevant data to understand the statistical distributions. What are the maximum and minimum values? How variable are these observations, and other basic statistics provide insight into the shape of the used data.

#### Model
After the analyst has a good grasp of the variables under consideration, the actual analysis can commence. Modelling involves transforming the problem statement into mathematics and code, as described in the [previous chapter](#diagnose). 

Every model of the world is bounded by the assumptions contained within it. Statistician George Box is famous for stating that "all models of reality are wrong, but some are useful". Since data science is not a science in the sense that we are seeking the truth, a useful model is all we need.

When modelling the data, the original research question always needs to be kept in mind. Exploring and analysing data without a specific purpose can quickly lead to wrong conclusions. Just because two variables correlate does not imply that there is a logical relationship. A clearly defined problem statement and method prevent data dredging. The availability of data and the ease of extracting this information makes it easy for anyone to find relationships between different sources of information.

A good general rule when analysing data is to distrust your method when you are able to confirm your hypothesis easily. If this is the case, using triangulation through a different method helps to verify the results.

The modelling in this case study involved developing a demerit point system. Perfect water quality is almost always defined by lower and upper limits for a particular parameter. Perfect water has no colour, has a minimum level of chlorine, and so on. This information forms the basis of a points system. When, for example, water has a measurable colour, the index is reduced by a certain amount of points. A decision rule was designed for each parameter in the model.

#### Reflect
Before the results of an analysis can be communicated, domain experts need to review the outcomes to ensure they make sense and indeed solve the problem stated in the definition. The reflection phase should also include the customer to ensure that the problem statement is being solved to their satisfaction.

Visualisation is a quick method to establish whether the outcomes make sense by revealing apparent patterns. Another powerful technique to reflect on the results is sensitivity analysis. This technique involves changing some of the assumptions to test the model responds as expected. Mathematical models are often complex where the relationship between variables is not clearly understood. Sensitivity analysis helps to understand these relationships by using extreme for certain variables and then observe the effect on the model.

Concerning the case study, the modelling required a lot of reflection on the chosen model and required many iterations of the data vortex. Developing a performance index is a balancing act to ensure each parameter is appropriately weighted. The purpose of the index was to provide the board with salient information so they can ask targeted questions during meetings. The reflection phase always needs to reflect on the purpose and ensure it is achieved.

### Communicate
The last, and arguably the hardest phase of a data science project is to communicate the results to the users. In most cases, the users of the data product are not specialists with a deep understanding of data and mathematics. The difference in skills between the data scientist and the user of their products requires careful communication of the results.

![Water System Index visualisation](images/figure17_Water_Index.png)

Detailed reports and visualisations need to not only provide an accurate description of the outcomes, but they also need to be able to convince the reader. The most critical aspect of successfully communicating the solution to the problem is to ensure that the consumers of the results understand them and are willing to use them to solve the problem. As much as data science is a systematic process, it is also a cultural process that involves managing the internal change in the organisation, discussed in [section 4.3.1](#culture).

The final result of this case study is a spatial visualisation of all the water treatment plants within the service region of the water utility. Each of the circles on the chart visualises the result of the index using a diverging scheme from red to green. The size of the circle is proportionate to the logarithm of the number of customers in each town to emphasise the greater importance of larger systems. To enable reproducibility, clicking on the circles provides the user with all the internal workings and original data so that the root cause of non-performance can be identified.

## The Limitations of Data Science
The problems that data science can solve seem to be limitless when reading some of the articles on the web and in literature. There are, however, theoretical and practical limitations to what a computational analysis can achieve. Besides limits to what we are capable of doing, there are also ethical limits to what we should be doing. This final section reflects on some of the boundaries of data science.



## Reproducible Research
Reproducibility is on of the most important requirements for good data science. 

Replication is the gold standard for science to ensure the quality of previous results. Replication involves repeating the experiments, which is a costly and complicated activity. The past few years, some areas of science have suffered from a replication crisis. Famous experiments in psychology and sociology are under a cloud of doubt because current researchers fail to replicate the findings. Some scientists were clearly fraudulent in their approach, changing data and manipulating the analytical process to obtain the desired results. Other scientists either used unrepresentative samples or misinterpreted the data and published wrong results. The peer review process did not identify these issues because the authors only provided the outcomes of their research, and the papers were published and accepted as truthful.

This crisis in some of the sciences has moved some journals to require authors to submit not only the written text but also the data and analytical code that was used to draw the conclusions. Releasing the data and the code strengthens peer review. These principles of reproducibility also apply to business analysis and ensure sound data science. Every study needs to be undertaken in such a way that a colleague or auditor can recreate the steps of the recipe that was followed to reach a conclusion.

The most effective method to achieve full reproducibility is to use literate programming. This method combines computer code with text so that the analysis becomes fully transparent. Although many systems exist that at first instance might seem more user-friendly than writing code, point-and-click systems have severe limitations, and the results are often difficult to verify.

## RMarkdown
Several methods are available to implement literate programming in the R language. 

Markdown is a versatile method.

This whole course was written in a version of Markdown (using the Emacs editor). The benefit of using plain text over traditional word processors is that 

R Markdown combines text and images with code. Using this approach you can create a script that produces a PDF, Word or HTML file. To see a demonstration, go to the *File* menu and create a new R Markdown file.

You will see a popup menu where you can add the document title, author name and select the output type. Select Word as the output and enter a random document title. When you click OK, RStudio will create a template document that explains the basic principles. 



When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

The basic principles of R Markdown are very well explained on the RStudio [website](http://rmarkdown.rstudio.com). 



