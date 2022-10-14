# project-one

## Purpose
This project will be assessing US housing costs trends between 2011 and 2021 for single family homes in the 75 most populated cities compared to median incomes. Additionally, we will be using machine learning will attempt to determine when housing in these cities became unaffordable, more than 1/3 of median monthly income, as well as give these locations an afordability score. A random forest classifier algorithm is most likely the best method to determine the affordability score as there are a high number of variables, it can rank each variables contribution to the affordability, and it can work well over a large data set. Housing affordability has become a hot button topic over the last few years across America and determining housing affordability can be utilized to help individuals make a determination on where to live and still be able to afford a quality life.  Data is being pulled from the US Censusus Bureau, both Census data and the American Community Survey (ACS), which includes: median housing cost, median real estate taxes, median household income, median mortgage rates, housing characteristics, populations, and miscellaneous demographical data. 

## Communication protocols
Team member contact information has been distributed via excel file with phone, email and best contact time. We are meeting 5-7 times weekly on Google Meetings or Discord to update what work has been completed and assessing next steps. In the event of a situation where an individual is stuck, slack, email, or phone calls to team members to get assistance is expected. 

## About our Data
For this project, we compiled data from various sources to generate our final database. These sources include the following:
### U.S. Census Bureau, American Community Surveys 2011 - 2021
Each year, the U.S. Census Bureau releases American Community Survey data in the form of estimates, tables, tools and analytical reports. We pulled data from ACS 1-Year Estimates Subject Tables and ACS 5-Year Estimates Subject Tables from years 2011 to 2021 for the cities of interest. The following metrics in our database are primary from these tables:
* Select Housing Characteristics
* Select Population Characteristics
* Financial Characteristics for Housing with Mortgage
* Age and Sex Data
* Median Household Income

### U.S. Census Bureau, Small Area Income and Poverty Estimates (SAIPE) Program
There was missing median household income data for some years for a few of our cities of interest. We supplemented by pulling median household income from the Small Income and Poverty Estimates (SAIPE) Program. This program produces single-year estimates of income and poverty for all U.S. states and counties. Median Household Income estimates are based on statistical models that use household survey, administrative data, population estimates, and decennial census data. 

### Zillow Single Family Home Index (ZVHI)
We determined a median home value for each year in each of the cities of interest by using data from the ZVHI. This dataset provided a seasonally adjusted measure of the typical home value across a given region for each month. We took the median value from each month in the year to determine an overall median home value for each respective year.  

### Freddie Mac
We obtained 15- and 30-year fixed interest rate data from Freddie Mac. Freddie Mac surveys lenders across the nation on a weekly basis to determine an average 15-year fixed mortgage rate, 30-year fixed-mortgage rate, and 5/1 hybrid ARMs series This survey is called the Primary Mortgage Market Survey. Additional information on survey metrics and how results are weighted can be found on the Freddie Mac PMMS website. 
