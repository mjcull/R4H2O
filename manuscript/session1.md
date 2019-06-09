# Data Science for Water Utilities
The activity of analysing data is as old as human culture. The earliest known form of writing is not an epic poem or religious text, but data. The Ishango bone is an engraved fibula of a baboon which was carved in central Africa 20,000 years ago. Some scholars hypothesised that the carvings represent an early number system as it lists several prime numbers, while others believe it to be a calendar. Some researchers dismiss these ideas and believe the markings merely improve grip when using the bone as a club. Whatever their purpose, the groupings of the markings are distinctly mathematical (Figure 1).[^fn1-01]

[^fn1-01]: Pletser, V. (2012). Does the Ishango Bone Indicate Knowledge of the Base 12? An Interpretation of a Prehistoric Discovery, the First Mathematical Tool of Humankind. Eprint [ArXiv:1204.1019](https://arxiv.org/abs/1204.1019).

![Figure 1: Markings on the Ishango Bone](resources/images2/figure01_Ishango.png)

The idea that data can be used to understand the world is thus almost as old as humanity itself and has gradually evolved into what we now call data science. 

The expectations of the benefits of data science are very high. Business authors position data science, and its natural partner 'big data', as a panacea for all societal problems and a means to increase business profits. In a 2012 article in _Harvard Business Review_, Davenport and Patil even proclaimed data scientist the "sexiest job of the 21st century".[^fn1-06] Who would not want to be part of a new profession with such enticing career prospects? It is not a stretch to hypothesise that their article was one of the causes of the increased search volume reported by Google.

[^fn1-06]: Davenport, T.H., & Patil, D.J. (2012). [Data scientist: The sexiest job of the 21st century](https://hbr.org/2012/10/data-scientist-the-sexiest-job-of-the-21st-century). _Harvard Business Review_, 90(10), 70–76.

For organisations that deliver physical products or non-digital services, data science is about improving how they collect, store and analyse data to extract more value from this resource. The objective of data science is not the data itself but is closely intertwined with the strategic goals of the organisation. These objectives broadly range from increasing the return to shareholders to providing benefit to society overall. Whatever the kind of organisation you are in, the purpose of data science is to assist managers to change reality into a more desirable state. A data scientist achieves this by measuring the current and past states of reality and using mathematical tools to predict a future state.

The term data science is unfortunate in the way it is now used because it is paradoxically not a science about data. A data scientist is not somebody who researches the properties of data. Other definitions see data scientists as mathematicians and computer scientists that invent new ways of analysing data. More commonly, data science is closely related to business outcomes. 

Data science is a systematic and strategic approach to using data to solve practical problems. The problems of the data scientist are practical because pure science has a different objective to business. A data scientist in an organisation is less interested in a generalised solution to a problem and focuses on improving how the organisation achieves its goals. Perhaps the combination of the words data and science should be reserved for academics.

This course looks at data science as the strategic and systematic approach to the fine art of analysing data to solve business problems. This conceptualisation of data science is not a complete definition. Computational analysis of data is also practised as a science in itself and as a scientific method for research in many areas.

## The Elements of Data Science
Now that we have defined data science within the context of managing a business, we can start describing the elements of data science. The best way to unpack the art and craft of data science is Drew Conway's often-cited Venn diagram cite (Figure 3).[^fn1-12] 

Conway defines three competencies that a data scientist, or a data science team as a collective, need to possess. The diagram positions data science as an interdisciplinary activity with three dimensions: domain knowledge, mathematics and computer science. A data scientist is somebody who understands the subject matter under consideration in mathematical terms and writes computer code to solve problems.

[^fn1-12]: Conway, D. (2010). [The data science Venn diagram.](http://drewconway.com/zia/2013/3/26/the-data-science-venn-diagram). Downloaded 27 January 2019.

![Figure 3: Conway's data science Venn Diagram.](resources/images2/figure03_Conway.png)

### Domain Knowledge
The most significant skill within a data science function is _domain knowledge_. While the results of advanced applied mathematics such as machine learning are impressive, without understanding the reality that these models describe, they are devoid of meaning and can cause more harm than good. Anyone analysing a problem needs to understand the context of the issues and the potential solutions. The subject of data science is not the data itself but the reality this data describes. Data science is about things and people in the real world, not about numbers and algorithms.

A domain expert understands the impact of any confounding variables on the outcomes. An experienced subject-matter expert can quickly perform a sanity check of the process and results of the analysis. Domain knowledge is essential because each area of expertise uses a different paradigm to understand the world. 

Each domain of human enquiry or activity has different methodologies to collect and analyse data. Analysing objective engineering data follows a different approach to subjective data about people or unstructured data in a corpus of text. The analyst needs to be familiar with the tools of the trade within the problem domain. The earlier-mentioned example of a graduate professional beating a team of machine learning experts with a linear regression shows the importance of domain knowledge.

Domain expertise can also become a source of bias and prevent innovative ways of looking at information. Solutions developed through systematic research can contradict long-held beliefs about a specific topic that are sometimes hard to shift. Implementing data science is thus as much a cultural process as it is a scientific one.

### Mathematical Knowledge
The analyst uses mathematical skills to convert data into actionable insights. Mathematics consists of pure mathematics as a science in itself and applied mathematics that helps us to solve problems. The scope of applied mathematics is broad, and data science is opportunistic in choosing the most suitable method. Various types of regression models, graph theory, k-means clustering, decision trees and so on, are some of the favourite tools of a data scientist. The creative application of complex applied mathematics is one of the two distinguishing factors between traditional business analysis and data science.

Combining subject-matter expertise with mathematical skills is the domain of traditional _research_ and analysis. The notion of conventional research is, however, evolving towards using the principles of data science by using reproducible computer code and sharing the source data through websites such as FigShare ([figshare.com](https://figshare.com/)). 

Numbers are the foundations of mathematics, and the craft of quantitative science is to describe our analogue reality into a model that we can manipulate to predict the future. Not all mathematical skills are necessarily about numbers but can also revolve around logical relationships between words and concepts. Contemporary numerical methods help us to understand relationships between people, the logical structure of a text and many other aspects beyond the realm of traditional numeric analysis.

### Computer Science
Not that long ago, most of the information collected by an organisation was stored on paper and archived in copious volumes of arch lever files. Analysing this information was an arduous task that involved many hours of transcribing information to a format that is useful for analysis.

In the twenty-first century, almost all data is an electronic resource. To create value from this resource, data engineers extract it from a database, combine it with other sources and clean the data before analysts can make sense of it. This requirement implies that a data scientist needs to have computing skills. Conway uses the term hacking skills, which many people interpret as negative. Conway is, however, not referring to a hacker in the sense of somebody who nefariously uses computers, but in the original meaning of the word of a developer with creative computing skills. The core competency of a hacker, developer, coder or whatever other term might be preferable, is algorithmic thinking and understanding the logic of data structures. These competencies are vital in extracting and cleaning data to prepare it for the next step of the data science process.

The importance of hacking skills for a data scientist implies that we should move away from point-and-click systems and spreadsheets and instead write code in a suitable programming language. The flexibility and power of a programming language far exceed the capabilities of graphical user interfaces and leads to reproducible analysis.

The mathematical interpretation of reality needs to be translated to computer code. One of the factors that spearheaded data science into popularity is that the available toolkit has grown substantially in the past ten years. Open source computing languages such as R and Python are capable of implementing complex algorithms that were previously the domain of specialised software and supercomputers. Open Source software has accelerated innovation in how we analyse data and has placed complex machine learning within reach of anyone who is willing to make an effort to learn the skills.

Conway defines the _danger zone_ as the area where domain knowledge and computing skills combine, without a good grounding in mathematics. Somebody might have sufficient computing skills to be pushing buttons on a business intelligence platform or spreadsheet. The user-friendliness of some analysis platforms can be detrimental to the outcomes of the analysis because they create the illusion of accuracy. Point-and-click analysis hides the inner workings from the user, creating a black-box result. Although the data might be perfectly structured, valid and reliable, a wrongly-applied analytical method leads to useless outcomes.

### The Unicorn Data Scientist?
Conway's diagram is often cited in the literature on data science. His simple model helped to define the craft of data science. Other data scientists have proposed more complex models but they all originate with Conway's basic idea. A quick visit on the Duckduckgo search engine will reveal several variants. 

The diagram illustrates that the difference between traditional research skills or business analytics lies in the ability to understand and write code. A data scientist understands the problem they seek to resolve, they have the mathematical expertise to analyse the problem, and they possess the computing skills to convert this knowledge into outcomes.

It could be argued that the so-called skills are missing from this picture. However, communication, managing people, facilitating change and so on, are competencies that belong to every profession who works in a complex environment, not just the data scientist.

Some critics of this idea point out that these people are unicorns. Data scientists that possess all these skills are mythical employees that don't exist in the real world. Most data scientists start from either mathematics or computer science, after which it is hard to become a domain expert. This book is written from the point of view that we can breed unicorns by teaching domain experts how to write code and, where required, enhance their mathematical skills.

## The water-data value chain: The Digital Water Utility
The flow of data in a utility follows the flow of the water through the value chain. The water value chain starts and ends in the natural environment. Water utilities extract water from nature, process it in their value chain, and eventually return it to the environment.

Water utilities collect data along the flow path of the water. This data describes the quantity and quality of the water, including wastewater, as it makes its way from the environment to the consumer and back. The data derived from instrumentation provides an objective view of the status of the water supply chain. Customer-centric water utilities also collect data from the perspective of the consumers of the services they supply. This data is, by definition, subjective. Data science for water utilities merges the objective measurements from the field with the subjective perspectives of customers to maximise value to the community overall.

The term ‘digital water utility’ is often used to describe the situation where the flow of water and customer experience is fully captured with data. Some experts even suggest that digitisation represents a disruption of water utilities. The term digital water utility is a distraction because data is not a replacement for effective water management. No matter how much water utilities digitise, electronics will not meaningfully change the service utilities provide: a reliable supply of drinking water and sewerage services.

Digitisation also has limitations. Firstly, data cannot describe everything. Measuring physical processes is only ever a sample of the reality we live in. Secondly, the experience of customers is subjective, which requires human insight to understand. These limitations highlight the need for domain expertise to complement skills in mathematics and computing. Relying on data alone, without recognising the physical and social reality of water management does not add value to a community.

## Engineering Data
Providing reliable water services to communities is mostly an engineering challenge. Engineers build pumps and reservoirs to hold water. They then purify it in treatment plants and distribute it through a pressurised network of pipes. Consumers use this water to create value in their lives. After they consumer the water, it flows back to the environment through evaporation or as sewage. An ideal water utility balances the technical requirements with the expectations and experiences of its customers.

Water utilities measure volume, flow and quality at many locations in the cycle. Hydrodynamics helps to create value from this data by assisting managers in operating and improving the system. Water management is very different for each part of the value chain. However, from a data perspective, raw water, drinking water and sewage are just different manifestations of the same substance.

![Tap water supply chain.]()

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
This section is an extract of the book *Principles of Strategic Data Science* by Peter Prevos. If you like to find out more about strategic data science, then please consider reading [this book](https://leanpub.com/strategic_data_science). Participants of the workshop will get access to a free copy. 

![Prevos, P. (2019) Principles of Strategic Data Science](images/StrategicDataScience.jpg)



