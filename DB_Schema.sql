CREATE TABLE "Median_Household_Income" (
    "City" varchar   NOT NULL,
    "State" varchar   NOT NULL,
    "Median_Income" int   NOT NULL,
    "Households" int   NOT NULL,
    "Families" int   NOT NULL,
    "Married_Couple_Families" int   NOT NULL,
    "Nonfamily_Households" int   NOT NULL,
    CONSTRAINT "pk_Median_Household_Income" PRIMARY KEY (
        "City"
     )
);

CREATE TABLE "Financial_Characteristics_For_Housing_With_Mortgage" (
    "City" varchar   NOT NULL,
    "State" varchar   NOT NULL,
    "Owner-Occupied_Housing_Units_With_A_Mortgage" int   NOT NULL,
    "Median_Household_Income" int   NOT NULL,
    "Median_Monthly_Housing_Cost" int   NOT NULL,
    "Median_Real_Estate_Taxes" int   NOT NULL,
    CONSTRAINT "pk_Financial_Characteristics_For_Housing_With_Mortgage" PRIMARY KEY (
        "City"
     )
);

CREATE TABLE "Age_And_Sex_Data" (
    "City" varchar   NOT NULL,
    "State" varchar   NOT NULL,
    "Total_Population" int   NOT NULL,
    "Male" int   NOT NULL,
    "Female" int   NOT NULL,
    CONSTRAINT "pk_Age_And_Sex_Data" PRIMARY KEY (
        "City"
     )
);

CREATE TABLE "Select_Housing_Characteristics" (
    "City" varchar   NOT NULL,
    "State" varchar   NOT NULL,
    "Total_Housing_Units" int   NOT NULL,
    "Occupied_Housing_Units" int   NOT NULL,
    "Vacant_Housing_Units" int   NOT NULL,
    "Owner_Occupied" int   NOT NULL,
    "Renter-Occupied" int   NOT NULL,
    "Owner_Occupied_Median_Value" int   NOT NULL,
    "Housing_Units_With_A_Mortgage" int   NOT NULL,
    "Median_Mortgage" int   NOT NULL,
    "SMOCAPI" int   NOT NULL,
    "Occupied_Units_Paying_Rent" int   NOT NULL,
    "Median_Rent" int   NOT NULL,
    "GRAPI" int   NOT NULL,
    CONSTRAINT "pk_Select_Housing_Characteristics" PRIMARY KEY (
        "City"
     )
);

CREATE TABLE "Select_Population_Characteristics" (
    "City" varchar   NOT NULL,
    "State" varchar   NOT NULL,
    "Households" int   NOT NULL,
    "Households_With_Income" int   NOT NULL,
    "Households_Social_Security" int   NOT NULL,
    "Households_Supplemental_Security" int   NOT NULL,
    "Households_Cash_Public_Assistance" int   NOT NULL,
    "Households_Retirement_Income" int   NOT NULL,
    "Median_Household_Income" int   NOT NULL,
    "Median_Family_Income" int   NOT NULL,
    "Male_Employment" int   NOT NULL,
    "Female_Employement" int   NOT NULL,
    "Male_Employment_Percentage" float   NOT NULL,
    "Female_Employment_Percentage" float   NOT NULL,
    "Employed_Male_Median_Income" int   NOT NULL,
    "Employed_Female_Median_Income" int   NOT NULL,
    "Poverty_Rate" float   NOT NULL,
    "Median_Home_Value" int   NOT NULL,
    "Median_Mortgage" int   NOT NULL,
    "Median_Gross_Rent" int   NOT NULL,
    CONSTRAINT "pk_Select_Population_Characteristics" PRIMARY KEY (
        "City"
     )
);

ALTER TABLE "Median_Household_Income" ADD CONSTRAINT "fk_Median_Household_Income_City" FOREIGN KEY("City")
REFERENCES "Age_And_Sex_Data" ("City");

ALTER TABLE "Financial_Characteristics_For_Housing_With_Mortgage" ADD CONSTRAINT "fk_Financial_Characteristics_For_Housing_With_Mortgage_City" FOREIGN KEY("City")
REFERENCES "Median_Household_Income" ("City");

ALTER TABLE "Select_Housing_Characteristics" ADD CONSTRAINT "fk_Select_Housing_Characteristics_City" FOREIGN KEY("City")
REFERENCES "Select_Population_Characteristics" ("City");

ALTER TABLE "Select_Population_Characteristics" ADD CONSTRAINT "fk_Select_Population_Characteristics_City" FOREIGN KEY("City")
REFERENCES "Financial_Characteristics_For_Housing_With_Mortgage" ("City");

