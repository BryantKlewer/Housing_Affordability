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

Additional information for the Small Area Income and Poverty Estimates program can be found on the SAIPE [website](https://www.census.gov/programs-surveys/saipe.html)

#### Zillow Home Value Index (ZHVI)
We determined a median home value for each year in each of the cities of interest by using data from the ZHVI. These datasets provided a seasonally adjusted measure of the typical home value across a given region for each month. We took the median value from each month in the year to determine an overall median home value for each respective year.  

Additional information on the Zillow Home Value Index can be found on Zillow's [website](https://www.zillow.com/research/data/)

#### Freddie Mac
We obtained 15 and 30-year fixed interest rate data from Freddie Mac. Freddie Mac surveys lenders across the nation on a weekly basis to determine an average 15-year fixed, and 30-year fixed-mortgage rate. This survey is called the Primary Mortgage Market Survey. Additional information on survey metrics and how results are weighted can be found on the Freddie Mac [PMMS website](https://www.freddiemac.com/pmms). 

## Analysis

### Calculation
Calculations were made by combining home value, property tax, interest rate and income data to determine monthly housing cost. This was completed using the Numpy-Financial Python package. Calculations were made based on 15 and 30 year loan durations for both 10% and 20% downpayments. Initial calculations were made for single family homes. Additional calulations utilizing these same parameters were created for 1, 2, 3, 4, and 5+ bedroom home sizes. Additionally, a housing affordability score was calculated by taking 30% of the median income and dividing it by the calculated monthly housing cost. Each city was assigned a given score. 

### Machine Learning
* Targets: affordability score for each property type
* Method: Keras/TensorFlow machine learning, 75% training and 25% testing data split, 2 hidden layers, ReLu activation, 84 inputs, 100 perceptrons, 25 epochs
* Outcome: Accuracy ~98% 
![y_eval](https://user-images.githubusercontent.com/106269389/198908796-358c5e37-7c79-47e6-862c-d1a4a41b2035.png)

## Summary
* The rate at which home values have increased has outpaced incomes in all cities with the exception of St. Louis, MO and Chicago, IL. 
* San Francisco, CA remained a consistent leader in unaffordability throughout all years except 2021 where Los Angeles, CA surpassed San Francisco in unaffordability.
* Detroit, MI remained the most affordable city.
* Seattle, WA had the highest increase in median home income between 2011 and 2021 at 81%. 
* Arlington and Plano, TX had the lowest increases in median home income between 2011 and 2021, both at 18%.
* Phoenix, AZ  had the highest increase in home value between 2011 and 2021 with 220% and a 56% increase in median household income creating the largest affordability gap.
* Anchorage, AK had the lowest increase in home value over the decade with only a 24% increase and a 19% increase in median home income.

