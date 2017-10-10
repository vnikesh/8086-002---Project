##Team Name: Data Creatives
##Team Project: Medicare Spending per Beneficiary
##Members: -
Nikesh  
Pooja  
Runhua  

## Data clean up procedure by Microsoft Excel  2016.
* The start date and end Date were removed because they are the same across all the rows (start date =1012015; end date = 12312015)
* To make analysis easier, the percentage values were formatted as number with two decimal, which is annotate by the variable (The value of all column with percentage header is percentage (%)).
* To make analysis easier, the cost or spending were formatted as number, which all the cost or spending was with $ as units
* Period 
1. The periods were re-annotated as follows:     
2. During Index Hospital Admission; 
3. 1 through 30 days After Discharge from Index Hospital Admission; 
4. Complete Episode

## Data were verified by R as follows:

```{r hospital spending data cleaned verfication}
setwd("C:\\Users\\leirhyh\\Documents\\Leipersonallife\\Lei private life\\UNOclass\\ISQA8086-002\\groupproject")
list.files()
HospitalSpending <- read.csv ("medicare_hospital_data_cleaned.csv", stringsAsFactors = FALSE)  
head(HospitalSpending)
```