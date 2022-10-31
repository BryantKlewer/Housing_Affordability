# Housing Affordability
Contributors: Laura Ross, Bryant Klewer, Matt Watts, Veena Puvvada, and Annika Alicardi

[Presentation Link](https://docs.google.com/presentation/d/10ihHbhPH5w8b3enussh1Tu3RalZYbiRg6_Voe1-td5E/edit?usp=sharing)

## Purpose
This project will be assessing US housing costs trends between 2011 and 2021 for single family homes and apartments in 71 of the most populated cities compared to median incomes. Additionally, we will be using machine learning in an attempt to determine when housing in these cities became unaffordable, [more than 1/3 of median monthly income](https://www.huduser.gov/portal/pdredge/pdr-edge-featd-article-081417.html), as well as give these locations an afordability score. A machine learning neural network will be the best method to determine the affordability score trends as there are a high number of variables. This method can rank each variables contribution to the affordability, and it can work well over a large data set. Housing affordability has become a hot button topic over the last few years across America and determining housing affordability can be utilized to help individuals make a determination on where to live and still be able to afford a higher quality of life.

## Resources

### Software
Various software was utilized during the collection, cleaning, analysis, and presentation stages of this project which include:
Tableau Prep 2022.2, Jupyter Notebook 3.1, Python 3.9.12, PostgreSQL 11.16, Microsoft Excel, Amazon AWS/S3

### About our Data
For this project, we compiled data from various sources to generate our final database. These sources include the following:

#### U.S. Census Bureau, American Community Surveys 2011 - 2021
Each year, the U.S. Census Bureau releases American Community Survey data in the form of estimates, tables, tools and analytical reports. We pulled data from ACS 1-Year Estimates Subject Tables and ACS 5-Year Estimates Subject Tables from years 2011 to 2021 for the cities of interest. The following metrics in our database are primarily from these tables:
* Select Housing Characteristics
* Select Population Characteristics
* Financial Characteristics for Housing with Mortgage
* Age and Sex Data
* Median Household Income

Additional information on survey questions, data quality measures and sample size can be found on the American Community Survey [website](https://www.census.gov/programs-surveys/acs/about/top-questions-about-the-survey.html). 

#### U.S. Census Bureau, Small Area Income and Poverty Estimates (SAIPE) Program
There is missing median household income data for some years for a few of our cities of interest. We supplemented by pulling median household income from the Small Income and Poverty Estimates (SAIPE) Program. This program produces single-year estimates of income and poverty for all U.S. states and counties. Median Household Income estimates are based on statistical models that use household survey, administrative data, population estimates, and decennial census data. 

#### Zillow Single Family Home Index (ZVHI)
We determined a median home value for each year in each of the cities of interest by using data from the ZVHI. This dataset provided a seasonally adjusted measure of the typical home value across a given region for each month. We took the median value from each month in the year to determine an overall median home value for each respective year.  

#### Freddie Mac
We obtained 15 and 30-year fixed interest rate data from Freddie Mac. Freddie Mac surveys lenders across the nation on a weekly basis to determine an average 15-year fixed, and 30-year fixed-mortgage rate. This survey is called the Primary Mortgage Market Survey. Additional information on survey metrics and how results are weighted can be found on the Freddie Mac [PMMS website](https://www.freddiemac.com/pmms). 

## Analysis

### Machine Learning

A neural network was created to determine the affordability of housing in each city. A neural network was chosen due to a high number of features and the ability to add dense layers to improve accuracy scores. Initially a linear regression model was going to be pursued but affordability was better expressed through classification, so logistic testing was used.

Data Preprocessing:

* A list of target values was created from the affordability metrics
* Each value in the target columns was converted to a 0 or 1
* Each city was encoded using OneHotEncoder
* The year was pulled from the observation date
* The data was split into two datasets: 
* 2011 through 2020 for creating the model  
* 2021 for testing the model
* The data was scaled using StandardScaler

Feature Selection:

Features were chosen by plotting a correlation matrix and determining which features had the most significant effect on the chosen target of affordability score. The data was split into a training set of 2011 to 2020 data. An evaluation dataset was created from the 2021 data. The training set was initially split 75/25 in a test/train split to analyze feature selection and dense layer design. After completing this step, the entire training set was used to build a model for each target in the list below:

* 'affordability_rent'
* 'affordability_home_15yr_Payment_10_Perc_Down'
* 'affordability_home_15yr_Payment_20_Perc_Down'
* 'affordability_home_30yr_Payment_10_Perc_Down'
* 'affordability_home_30yr_Payment_20_Perc_Down'
* 'affordability_1br_15yr_Payment_10_Perc_Down'
* 'affordability_1br_15yr_Payment_20_Perc_Down'
* 'affordability_1br_30yr_Payment_10_Perc_Down'
* 'affordability_1br_30yr_Payment_20_Perc_Down'
* 'affordability_2br_15yr_Payment_10_Perc_Down'
* 'affordability_2br_15yr_Payment_20_Perc_Down'
* 'affordability_2br_30yr_Payment_10_Perc_Down'
* 'affordability_2br_30yr_Payment_20_Perc_Down'
* 'affordability_3br_15yr_Payment_10_Perc_Down'
* 'affordability_3br_15yr_Payment_20_Perc_Down'
* 'affordability_3br_30yr_Payment_10_Perc_Down'
* 'affordability_3br_30yr_Payment_20_Perc_Down'
* 'affordability_4br_15yr_Payment_10_Perc_Down'
* 'affordability_4br_15yr_Payment_20_Perc_Down'
* 'affordability_4br_30yr_Payment_10_Perc_Down'
* 'affordability_4br_30yr_Payment_20_Perc_Down'
* 'affordability_5_plus_br_15yr_Payment_10_Perc_Down'
* 'affordability_5_plus_br_15yr_Payment_20_Perc_Down'
* 'affordability_5_plus_br_30yr_Payment_10_Perc_Down'
* 'affordability_5_plus_br_30yr_Payment_20_Perc_Down'

Neural Network Design:

* Input layer with 84 dimensions, 100 perceptrons, and using ReLu activation
* 2 hidden layers using ReLu activation and decreasing the perceptrons by half with each layer
* 1 sigmoid layer to give a binary output
* Each model was created using 25 epochs

Neural Network Results:

The scatter plot of affordability predictions by city

![y_eval](https://user-images.githubusercontent.com/106288785/199114379-c2d89cfe-ac58-4977-9b56-c0093b9b3500.png)

The confusion matrix for 'affordability_home_30yr_Payment_20_Perc_Down' and the predicted corresponding affordability showing 100% accuracy.

![confusion_matrix](https://user-images.githubusercontent.com/106288785/199114394-044766a7-0da9-489c-bfd0-dae55a4c6f5c.png)

## Summary
