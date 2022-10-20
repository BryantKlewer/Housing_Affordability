-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/bpVyqk
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "interest_rate" (
    "Observation_Date" date   NOT NULL,
    "15_Year_Annual_Average_Rate" float   NOT NULL,
    "15_Year_Annual_Average_Points" float   NOT NULL,
    "30_Year_Annual_Average_Rate" float   NOT NULL,
    "30_Year_Annual_Average_Points" float   NOT NULL,
    "Data_Source_Link" varchar   NOT NULL,
    CONSTRAINT "pk_interest_rate" PRIMARY KEY (
        "Observation_Date"
     )
);

CREATE TABLE "zillow_home_index" (
    "Identifier" int   NOT NULL,
    "City_Rank_by_Population(2021)" int   NOT NULL,
    "State" varchar   NOT NULL,
    "State_abbreviation" varchar(2)   NOT NULL,
    "City" varchar   NOT NULL,
    "Observation_Date" date   NOT NULL,
    "Single_Family_Median_Typical_Home_Value" float   NOT NULL,
    "One_Bedroom_Median_Typical_Home_Value" float   NOT NULL,
    "Two_Bedroom_Median_Typical_Home_Value" float   NOT NULL,
    "Three_Bedroom_Median_Typical_Home_Value" float   NOT NULL,
    "Four_Bedroom_Median_Typical_Home_Value" float   NOT NULL,
    "Five_Plus_Bedroom_Median_Typical_Home_Value" float   NOT NULL,
    "Data_Source_Link" varchar   NOT NULL,
    CONSTRAINT "pk_zillow_home_index" PRIMARY KEY (
        "Identifier"
     )
);

CREATE TABLE "median_tax_and_monthly_cost" (
    "Indentifier" int   NOT NULL,
    "Observation_Date" date   NOT NULL,
    "Median_Taxes" float   NOT NULL,
    "Median_Monthly_Housing_Cost" float   NOT NULL,
    "Data_Source_Link" varchar   NOT NULL,
    CONSTRAINT "pk_median_tax_and_monthly_cost" PRIMARY KEY (
        "Indentifier"
     )
);

CREATE TABLE "median_income" (
    "Identifier" int   NOT NULL,
    "Observation_Date" date   NOT NULL,
    "Estimated_Median_Household_Income" float   NOT NULL,
    "2021_estimated_population" int   NOT NULL,
    "2020_census" int   NOT NULL,
    "Note" varchar   NOT NULL,
    "Link_to_Survey" varchar   NOT NULL,
    CONSTRAINT "pk_median_income" PRIMARY KEY (
        "Identifier"
     )
);

CREATE TABLE "acs_rental_index" (
    "Identifier" int   NOT NULL,
    "Median_Rent" float   NOT NULL,
    "Observation_Date" date   NOT NULL,
    "Data_Source_Link" varchar   NOT NULL,
    CONSTRAINT "pk_acs_rental_index" PRIMARY KEY (
        "Identifier"
     )
);

CREATE TABLE "payments_dataframe" (
    "Identifier" int   NOT NULL,
    "Observation_Date" date   NOT NULL,
    "home_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "home_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "home_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "home_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "1br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "1br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "1br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "1br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "2br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "2br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "2br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "2br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "3br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "3br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "3br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "3br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "4br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "4br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "4br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "4br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "5_plus_br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "5_plus_br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "5_plus_br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "5_plus_br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    CONSTRAINT "pk_payments_dataframe" PRIMARY KEY (
        "Identifier"
     )
);

CREATE TABLE "affordability_scores" (
    "Identifier" int   NOT NULL,
    "Observation_Date" date   NOT NULL,
    "Median_Monthly_Income" float   NOT NULL,
    "Monthly_Affordability_Limit" float   NOT NULL,
    "affordability_rent" float   NOT NULL,
    "affordability_home_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_home_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_home_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_home_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_1br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_1br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_1br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_1br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_2br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_2br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_2br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_2br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_3br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_3br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_3br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_3br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_4br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_4br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_4br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_4br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_5_plus_br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_5_plus_br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_5_plus_br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_5_plus_br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    CONSTRAINT "pk_affordability_scores" PRIMARY KEY (
        "Identifier"
     )
);

CREATE TABLE "master_data_set" (
    "Identifier" int   NOT NULL,
    "City_Rank_by_Population(2021)" int   NOT NULL,
    "State" varchar   NOT NULL,
    "State_abbreviation" varchar(2)   NOT NULL,
    "City" varchar   NOT NULL,
    "Observation_Date" date   NOT NULL,
    "Single_Family_Median_Typical_Home_Value" float   NOT NULL,
    "One_Bedroom_Median_Typical_Home_Value" float   NOT NULL,
    "Two_Bedroom_Median_Typical_Home_Value" float   NOT NULL,
    "Three_Bedroom_Median_Typical_Home_Value" float   NOT NULL,
    "Four_Bedroom_Median_Typical_Home_Value" float   NOT NULL,
    "Five_Plus_Bedroom_Median_Typical_Home_Value" float   NOT NULL,
    "Estimated_Median_Household_Income" float   NOT NULL,
    "2021_estimated_population" int   NOT NULL,
    "2020_census" int   NOT NULL,
    "Median_Taxes" float   NOT NULL,
    "Median_Rent" float   NOT NULL,
    "AnnualAverageRate15Year" float   NOT NULL,
    "AnnualAverageRate30Year" float   NOT NULL,
    "home_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "home_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "home_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "home_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "1br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "1br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "1br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "1br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "2br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "2br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "2br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "2br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "3br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "3br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "3br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "3br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "4br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "4br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "4br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "4br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "5_plus_br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "5_plus_br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "5_plus_br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "5_plus_br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "Median_Monthly_Income" float   NOT NULL,
    "Monthly_Affordability_Limit" float   NOT NULL,
    "affordability_rent" float   NOT NULL,
    "affordability_home_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_home_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_home_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_home_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_1br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_1br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_1br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_1br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_2br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_2br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_2br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_2br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_3br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_3br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_3br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_3br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_4br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_4br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_4br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_4br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_5_plus_br_15yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_5_plus_br_15yr_Payment_20_Perc_Down" float   NOT NULL,
    "affordability_5_plus_br_30yr_Payment_10_Perc_Down" float   NOT NULL,
    "affordability_5_plus_br_30yr_Payment_20_Perc_Down" float   NOT NULL,
    CONSTRAINT "pk_master_data_set" PRIMARY KEY (
        "Identifier"
     )
);

ALTER TABLE "interest_rate" ADD CONSTRAINT "fk_interest_rate_Observation_Date" FOREIGN KEY("Observation_Date")
REFERENCES "zillow_home_index" ("Observation_Date");

ALTER TABLE "zillow_home_index" ADD CONSTRAINT "fk_zillow_home_index_Identifier" FOREIGN KEY("Identifier")
REFERENCES "median_tax_and_monthly_cost" ("Indentifier");

ALTER TABLE "median_tax_and_monthly_cost" ADD CONSTRAINT "fk_median_tax_and_monthly_cost_Indentifier" FOREIGN KEY("Indentifier")
REFERENCES "median_income" ("Identifier");

ALTER TABLE "median_income" ADD CONSTRAINT "fk_median_income_Identifier" FOREIGN KEY("Identifier")
REFERENCES "acs_rental_index" ("Identifier");

ALTER TABLE "acs_rental_index" ADD CONSTRAINT "fk_acs_rental_index_Identifier" FOREIGN KEY("Identifier")
REFERENCES "master_data_set" ("Identifier");

ALTER TABLE "affordability_scores" ADD CONSTRAINT "fk_affordability_scores_Identifier" FOREIGN KEY("Identifier")
REFERENCES "payments_dataframe" ("Identifier");

ALTER TABLE "master_data_set" ADD CONSTRAINT "fk_master_data_set_Identifier" FOREIGN KEY("Identifier")
REFERENCES "affordability_scores" ("Identifier");

