# Housing Affordability
Contributors: Laura Ross, Bryant Klewer, Matt Watts, Veena Puvvada, and Annika Alicardi

* [Presentation Link](https://docs.google.com/presentation/d/10ihHbhPH5w8b3enussh1Tu3RalZYbiRg6_Voe1-td5E/edit?usp=sharing)
* [Tableau Workbook](https://public.tableau.com/app/profile/laura.ross4379/viz/HousingAffordability2011-2021Draft/AffordabilityHeatMap)

## Purpose
This project assessed U.S. housing costs trends between 2011 and 2021 for single family homes and apartments in 71 of the most populated cities compared to median incomes. Housing affordability has become a hot button topic over the last few years across America and determining housing affordability can be utilized to help individuals make a determination on where to live and still be able to afford a higher quality of life. Additionally, machine learning was used to determine when housing in these cities became unaffordable, [30% of median monthly income](https://www.huduser.gov/portal/pdredge/pdr-edge-featd-article-081417.html). A machine learning neural network was the best method utilized to determine the affordability trends, as there were a high number of variables. 

## Resources

### Software
Various software was utilized during the collection, cleaning, analysis, and presentation stages of this project which include:
Tableau Prep/Tableau 2022.3, Jupyter Notebook 3.1, Python 3.9.12, PostgreSQL 11.16, Microsoft Excel, Amazon AWS/S3, Visual Studio Code 1.67.2

### About our Data
For this project, we compiled data from various sources to generate our final database. These sources include the following:

#### U.S. Census Bureau, American Community Surveys 2011 - 2021
Each year, the U.S. Census Bureau releases American Community Survey data in the form of estimates, tables, tools and analytical reports. We pulled data from ACS 1-Year Estimates Subject Tables and ACS 5-Year Estimates Subject Tables from years 2011 to 2021 for the cities of interest. The following metrics in our database are primarily from these tables:
* Select Housing Characteristics
* Financial Characteristics for Housing with Mortgage
* Median Household Income

Additional information on survey questions, data quality measures and sample size can be found on the American Community Survey [website](https://www.census.gov/programs-surveys/acs/about/top-questions-about-the-survey.html). 

#### U.S. Census Bureau, Small Area Income and Poverty Estimates (SAIPE) Program
There is missing median household income data for some years for a few of our cities of interest. We supplemented by pulling median household income from the Small Income and Poverty Estimates (SAIPE) Program. This program produces single-year estimates of income and poverty for all U.S. states and counties. Median Household Income estimates are based on statistical models that use household survey, administrative data, population estimates, and decennial census data. 

Additional information for the Small Area Income and Poverty Estimates program can be found on the SAIPE [website](https://www.census.gov/programs-surveys/saipe.html).

#### Zillow Home Value Index (ZHVI)
We determined a median home value for each year in each of the cities of interest by using data from the ZHVI. These datasets provided a seasonally adjusted measure of the typical home value across a given region for each month. We took the median value from each month in the year to determine an overall median home value for each respective year.  

Additional information on the Zillow Home Value Index can be found on Zillow's [website](https://www.zillow.com/research/data/).

#### Freddie Mac
We obtained 15 and 30-year fixed interest rate data from Freddie Mac. Freddie Mac surveys lenders across the nation on a weekly basis to determine an average 15-year fixed, and 30-year fixed-mortgage rate. This survey is called the Primary Mortgage Market Survey. Additional information on survey metrics and how results are weighted can be found on the Freddie Mac PMMS [website](https://www.freddiemac.com/pmms). 

## Analysis

### Database
All of our data needed to be centrally stored for analysis. An Amazon S3 bucket was created to store the datasets and an AWS database was created and linked to pgAdmin. Additionally, an ERD was created to structure the database in PostgreSQL. The Identifier was used as the primary key to link all of the tables with the exception of the interest_rate table (which only had the Observation_Date) as a unique value. This table was linked to the zillow_home_index table on Observation_Date.
![S3_Bucket](https://github.com/BryantKlewer/project-one/blob/main/Pictures/S3_Bucket.png)
![AWS_DB](https://github.com/BryantKlewer/project-one/blob/main/Pictures/AWS_DB.png)
![QuickDBD-Project_Schema](https://github.com/BryantKlewer/project-one/blob/main/Pictures/QuickDBD-Project_Schema.png)


### Calculation
Calculations were made by combining home value, property tax, and interest rate data to determine monthly housing cost. Joins were used on the Freddie_Mac_15_Year_30_Year_Interest_Rate, Zillow_Single_Family_Home_Index_by_Metro_US_Consolidated, and Aggregated_Median_Tax_and_Monthly_Cost dataframes in order to complete this task. All calculations were completed using the Numpy-Financial Python package. Calculations were made based on 15 and 30 year loan durations for both 10% and 20% downpayments. Initial calculations were made for single family homes. Additional calulations utilizing these same parameters were created for 1, 2, 3, 4, and 5+ bedroom home sizes. Additionally, a housing affordability score was calculated by taking 30% of the median income and dividing it by the calculated monthly housing cost. Each city was assigned a given score. 
* Merge example:
![merge](https://github.com/BryantKlewer/project-one/blob/main/Pictures/merge.png)
* Numpy-Financial calculation:
![numpy_financial](https://github.com/BryantKlewer/project-one/blob/main/Pictures/numpy_financial.png)

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

![y_eval](https://github.com/BryantKlewer/project-one/blob/main/Pictures/y_eval.png)

The confusion matrix for 'affordability_home_30yr_Payment_20_Perc_Down' and the predicted corresponding affordability showing 100% accuracy.

![matrix](https://github.com/BryantKlewer/project-one/blob/main/Pictures/matrix.png)

## Visualizations
Tableau was used to create many visual representations of the data outputs. It was used to interpret and analyze the data. Nine dashboards were created to display various aspects of the analysis and interact with the data dynamically. All visuals have filters that allow a user to select metrics such as cities, years, sort orders and other parameters. Visualization examples include:
![Affordability_by_Year_Boxplots](https://github.com/BryantKlewer/project-one/blob/main/Pictures/Affordability_by_Year_Boxplots.png)
![Affordability_Gap](https://github.com/BryantKlewer/project-one/blob/main/Pictures/Affordability_Gap.png)
![Affordability_Density_Map](https://github.com/BryantKlewer/project-one/blob/main/Pictures/Affordability_Density_Map.png)

## Summary
* The rate at which home values have increased has outpaced incomes in all cities with the exception of St. Louis, MO and Chicago, IL. 
* San Francisco, CA remained a consistent leader in unaffordability throughout all years except 2021 where Los Angeles, CA surpassed San Francisco in unaffordability.
* Detroit, MI remained the most affordable city.
* Seattle, WA had the highest increase in median home income between 2011 and 2021 at 81%. 
* Arlington and Plano, TX had the lowest increases in median home income between 2011 and 2021, both at 18%.
* Phoenix, AZ  had the highest increase in home value between 2011 and 2021 with 220% and a 56% increase in median household income creating the largest affordability gap.
* Anchorage, AK had the lowest increase in home value over the decade with only a 24% increase and a 19% increase in median home income.
