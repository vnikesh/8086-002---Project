## **Team Name: _Data Creatives_**
- **Team Project: Medicare Spending per Beneficiary**
- **Team Members:**
  - **Nikesh**
  - **Pooja**
  - **Runhua**

## Data description

The data displayed here show average spending levels during hospitals. An MSPB episode includes all Medicare Part A and Part B claims paid during the period from 3 days prior to a hospital admission through 30 days after discharge. These average Medicare payment amounts have been price-standardized to remove the effect of geographic payment differences and add-on payments for indirect medical education (IME) and disproportionate share hospitals (DSH). Centers for Medicare & Medicaid Services uses the information on this web page to calculate a hospital, which is reported on Hospital Compare. The data can be downloaded from [this link](https://catalog.data.gov/dataset/medicare-hospital-spending-by-claim-61b57).  

The data contain 13 Columns and 69631 rows, [see details in screen-shot](Needed to add link).

### The headers are as follows:
| Hospital Name | Provider ID |	State |	Period | Claim Type | Avg Spending Per Episode Hospital | Avg Spending Per Episode State |	Avg Spending Per Episode Nation |Percent of Spending Hospital|Percent of Spending State|Percent of Spending Nation| Start Date| End Date|
|:------:|:------:|:---:|:----:|:-----:|:--------:|:--------:|:--------:|:---------:|:---------:|:--------:|:------:|:-------:|

### Key Terms
* Medicare
* Hospital spending
* Episode
* Claim

### References

“Medicare Hospital Spending by Claim.” [Medicare Hospital Spending by Claim Data, Publisher Centers for Medicare & Medicaid Services, 14 July 2017]( https://catalog.data.gov/dataset/medicare-hospital-spending-by-claim-61b57)

## Access & Use Information

This information is provided 'as is', and this site makes no warranties on the information provided. Any damages resulting from its use are disclaimed. We encourage the use of our open data commons licenses but we cannot give any warranty that they will work in the way expected or should be used for any specific purpose. For more information on license, please visit the link below. License: [See here for more information](http://opendefinition.org/licenses/odc-odbl/)

## Data clean up procedure by Microsoft Excel 2016.
-  ##### The start date and end Date were removed because they are the same across all the rows (start date =1012015; end date = 12312015)
   - **Procedure**
       - Select the entire column under *start date* and *end date* by clicking the column heading and hit backpsace and delete the entire data in those columns.
- ##### To make analysis easier, the percentage values were formatted as number(removing the % symbol) with two decimal
    - **Procedure**
        - Select the entire required column and hold **CTRL+H**
        
- ##### To make analysis easier, the cost or spending were formatted as number, where all the cost or spending was accompanied with $ as units
   - **Procedure**
        - Select the entire required column and hold **CTRL+H**
        - Using Find & Replace, find all the '$' values and replace them with empty space
- ##### The Period data was re-annotated with numbers from 1 - 4
   -  **BeforeIHA** - 1 to 3 days Prior to Index Hospital Admission 
   -  **DuringIHA** - During Index Hospital Admission 
   -  **AfterIHA** - 1 through 30 days After Discharge from Index Hospital Admission
   - **ComEpisode** - Complete Episode
- ##### The claim types were re-annotated as follows:
   - Durable Medical Equipment	- **DME**
   - Carrier - **Carrier**
   - Home Health Agency - **HHA**
   - Hospice - **Hospice**
   - Inpatient - **Inpatient**
   - Outpatient - **Outpatient**
   - Skilled Nursing Facility - **SNF**
   - Total - **Total**
- Some of the hospital names were abbreviated for better viewing as follows:
   - Medical Center - **MC**
   - County Hospital - **CH**
   - Memorial Hospital - **MH**
   - Regional Hospital - **RH**
   - Community Hospital - **CMH**
     - **Procedure**
        -  In a new column write down the periods/claim types/hospital names and the respective abbreviations.
        -  Using **VLOOKUP(lookup_value, table_array, col_index_num,[range_lookup])**, replace the  periods/claim types/hospital names with their respective abbrevations.
 - Abbreviated the column names for easier viewing as follows:
   - Avg_Spending_Per_Episode_Hospital    - **ASPE_Hospital**
   - Avg_Spending_Per_Episode_State      - **ASPE_State**
   - Avg_Spending_Per_Episode_Nation     - **ASPE_Nation**
   - Percent_of_Spending_Hospital        - **POS_Hospital**
   - Percent_of_Spending_State           - **POS_State**
   - Percent_of_Spending_Nation         - **POS_Nation**
     - **Procedure**
        - Select the required column names and replace them with their abbreviations.
-  Removed the rows where the average spending is **0**, as it doesnt help us in the analysis.
-  Change the values with **percentage** to **decimal** values to help in analysis.

# Data were verified Excel:

After cleaning up the data, there were 11 columns and 55316 rows,  
[Before Cleaning the Dataset](https://github.com/vnikesh/8086-002---Project/blob/master/Deliverable/Data%20Cleaning%20Documentation/Support%20Files/Before%20Cleaning.png)  
[After Cleaning the Dataset](https://github.com/vnikesh/8086-002---Project/blob/master/Deliverable/Data%20Cleaning%20Documentation/Support%20Files/After%20Cleaning.png)  
