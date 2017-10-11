## Team Name: Data Creatives  
## Team Project: Medicare Spending per Beneficiary  
## Members: -  
Nikesh  
Pooja  
Runhua  

## Data description
The data displayed here show average spending levels during hospitals. An MSPB episode includes all Medicare Part A and Part B claims paid during the period from 3 days prior to a hospital admission through 30 days after discharge. These average Medicare payment amounts have been price-standardized to remove the effect of geographic payment differences and add-on payments for indirect medical education (IME) and disproportionate share hospitals (DSH). Centers for Medicare & Medicaid Services uses the information on this webpage to calculate a hospital, which is reported on Hospital Compare. The data can be downloaded from the following [link](https://github.com/vnikesh/ISQA-8086-Assignment/blob/master/Assignment-1/2%20-%20Medicare_Hospital_Spending_by_Claim.csv). The data contain 14 Columns and 70000 rows.  The headers are as follows:

| Hospital Name | Provider ID |	State |	Period | Claim Type | Avg Spending Per Episode Hospital | Avg Spending Per Episode State |	Avg Spending Per Episode Nation |Percent of Spending Hospital|Percent of Spending State|Percent of Spending Nation|	Start Date|	End Date|

**References**

“Medicare Hospital Spending by Claim.” Medicare Hospital Spending by Claim Data, Publisher Centers for Medicare &Amp; Medicaid Services, 14 July 2017, https://catalog.data.gov/dataset/medicare-hospital-spending-by-claim-61b57

## Access & Use Information

This information is provided 'as is', and this site makes no warranties on the information provided. Any damages resulting from its use are disclaimed. We encourage the use of our open data commons licenses but we cannot give any warranty that they will work in the way expected or should be used for any specific purpose.   

## Data clean up procedure by Microsoft Excel  2016.
* The start date and end Date were removed because they are the same across all the rows (start date =1012015; end date = 12312015)
* To make analysis easier, the percentage values were formatted as number with two decimal, which is annotate by the variable (The value of all column with percentage header is percentage (%)).
* To make analysis easier, the cost or spending were formatted as number, which all the cost or spending was with $ as units
* Period  
 **The periods were re-annotated as follows:**     
 1- During Index Hospital Admission  
 2- 1 through 30 days After Discharge from Index Hospital Admission  
 3- 1 to 3 days Prior to Index Hospital Admission  
 4 - Complete Episode  

## Data were verified by R as follows:

```{r hospital spending data cleaned verfication}
setwd("C:\\Users\\leirhyh\\Documents\\Leipersonallife\\Lei private life\\UNOclass\\ISQA8086-002\\groupproject")
list.files()
HospitalSpending <- read.csv ("medicare_hospital_data_cleaned.csv", stringsAsFactors = FALSE)  
head(HospitalSpending)
ncol(HospitalSpending)
nrow(HospitalSpending)
```
After cleaning up the data, there were 11 columns and 69630 rows.
