# Capstone Project: Reporting Water Quality Performance

**THIS IS A WORK IN PROGRESS**

This capstone project sets a challenge to help you develop further R coding sills. The capstone does not explain any further R functionality, as their are various methods to solve this problem. Participants need to use self study to develop the additional skills needed to provide an complete this capstone project.

If you like feedback on your solution, then submit a link to the [community forum](https://community.leanpub.com/c/r4h2o) of this course.

## Further Study
This course only provides a cursor overview of the R language with as objective to motivate water professionals to ditch the spreadsheet and start writing code. A great place to systematically learn about R is [DataCamp](https://www.datacamp.com/). This website provides free introduction courses and paid advanced courses. DataCamp also provides courses about other languages, such as Python, SQL and even spreadsheets. For a thorough in-depth course on data science with the R language, I recommend the [Data Science Specialisation](https://www.coursera.org/specializations/jhu-data-science) by John Hopkins University on the Coursera platform.

## Problem Statement
The Board of Directors of your water utility receives monthly updates about water quality performance. This report consists of a large table with water quality results. None of the members of the board are technical experts. The Board struggles to understand the significance of these numbers and always asks a lot of detailed questions about the results, instead of a strategic discussion about water quality.

[add table from the data]

Another section of the report informs the Board about customer complaints, including negative experiences that customers have with water quality. This data is also shown in a table and the relationship between this data and the water quality report is unclear.

[add complaints table]

The Board has tasked the data science team to provide an integrated overview of water quality that they can understand. Your task is to create a static dashboard for the monthly performance report using R markdown.

## Available Data Sets
Two csv files are available in the `Capstone` folder.

* `network.csv`: Various water quality parameters measured in six networks.
* `complaints.csv`: Complaints about water quality from the same six networks.
* `sample_points.csv`: List of sample point locations.

The data was extracted from six different water systems and covers one financial year (July -- June). The data has been manipulated to create more variety in the data. The names of the towns have been changed to prevent confusion with the actual data.

## Assignment
Your assignment is to create a new dashboard that visualises water quality performance 

You can upload your solution to [RPubs](https://rpubs.com/), using the functionality in RStudio. Please not the that results on projects on RPubs are publicly visible. The data in this case study is simulated to prevent any privacy breaches.

You will need to install various packages to enable to publishing functionality in RStudio. The software will automatically prompt you to install these when you first try to publish

1. In RStudio, create a new R Markdown document.
2. Click the Knit HTML button in the doc toolbar to preview your document. 
3. In the preview window, click the Publish button.

You will need to create a free account with RPubs before you can publish any documents.

## References
{begin-hanging-paragraphs}
Abbasi, T., & Abbasi, S. A. (2012). Water Quality Indices. Amsterdam: Elsevier.

Bai, R., Bouwmeester, R., & Mohan, S. (2009). Fuzzy Logic Water Quality Index and Importance of Water Quality Parameters. Air, Soil and Water Research, (2), 51–59.

Coletti, C., Testezlaf, R., Ribeiro, T. A. P., Souza, R. T. G. de, & Pereira, D. de A. (2010). Water quality index using multivariate factorial analysis. Revista Brasileira de Engenharia Agrícola e Ambiental, 14(5). https://doi.org/10.1590/S1415-43662010000500009

Hamlat, A., Tidjani, A. E.-B., Yebdri, D., Errih, M., & Guidoum, A. (2014). Water quality analysis of reservoirs within Western Algeria catchment areas using water quality index CCME WQI. Journal of Water Supply: Research and Technology—AQUA, 63(4), 311. https://doi.org/10.2166/aqua.2013.226

Horton, R. K. (1965). An index number system for rating water quality. Journal of Water Pollution Control Federation, 37(3), 300–306.

Ionuş, O. (2010). Water quality index: Assessment method of the Motru river water quality (Oltenia, Romania). Annals of the University of Craiova, 13, 74–83.

Jerome, C., & Pius, A. (2010). Evaluation of water quality index and its impact on the quality of life in an industrial area in Bangalore, South India. American Journal of Scientific and Industrial Research, 1(3), 595–603. https://doi.org/10.5251/ajsir.2010.1.3.595.603

Juwana, I., Muttil, N., & Perera, C. (2011). West Java water sustainability index – A case study on citarum catchment. In F. Chan, D. Marinova, & R. S. Anderssen (Eds.), 19th International Congress on Modelling and Simulation. Retrieved from http://mssanz.org.au/modsim2011

Landwehr, J. M., Deininger, R. A., & Harkins, R. D. (1974). An Objective Water Quality Index. Journal (Water Pollution Control Federation, 46(7), 1804–1809.

Lohani, B. N., & Mustapha, N. (1982). Stochastic water quality index. Environmental Technology Letters, 3(1–11), 521–528. https://doi.org/10.1080/09593338209384157

Molnar, W. (2005). Water Quality Index. In Laboratory investigations for AP environmental science. Saddle Brook, N.J.: Peoples Pub. Group.

Neary, B., Cash, K., Hébert, S., Khan, H., Saffran, K., Swain, L., & Williamson, D. (2001). Canadian Environmental Quality Guidelines. CCME Water Quality Index 1.0 Technical Report. Retrieved from Canadian Council of Ministers of the Environment website: http://www.ccme.ca/ourwork/water.html?category_id=102
Parmar, K. S., & Bhardwaj, R. (2013). Water quality index and fractal dimension analysis of water parameters. Int. J. Environ. Sci. Technololgy, 10, 151–164.

Prevos, P. (2015). Visualising water quality: A graphical index for drinking water system performance. OzWater. Presented at the Adelaide. Adelaide: Australian Water Association.

Rickwood, C. J., & Carr, G. M. (2009). Development and sensitivity analysis of a global drinking water quality index. Environmental Monitoring and Assessment, 156(1–4), 73–90.

Sapkal, R. S., & Valunjkar, S. S. (2013). Development and sensitivity analysis of water quality index for evaluation of surface water for drinking purpose. International Journal of Civil Engineering and Technology, 4(4), 119–134.

United Nations Environment Programme Global Environment Monitoring System/Water Programme. (2007). Global Drinking Water Quality Index Development and Sensitivity Analysis Report. Retrieved from [gemswater.org](www.gemswater.org).

Yidana, S. M., & Yidana, A. (2010). Assessing water quality using water quality index and multivariate analysis. Environmental Earth Sciences, 59(7), 1461–1473. https://doi.org/10.1007/s12665-009-0132-3

{end-hanging-paragraphs}
