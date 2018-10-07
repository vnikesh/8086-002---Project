# Medicare Spending Trend Analysis for all the hospitals in USA

### About the Set:  

1) We are using the Dataset showing the Medicare Spending per beneficiary in the year 2015(CMS.gov).  
2) An MSPB episode includes all Medicare Part A and Part B claims paid during the period from 3 days prior to a hospital admission through 30 days after discharge.  
3) These average Medicare payment amounts have been price-standardized to remove the effect of geographic payment differences and add-on payments for indirect medical education (IME) and disproportionate share hospitals (DSH).  

### Tools and Packages Used:
1) R
2) R-Studio
3) ggplot

### Questions Addressed:  

1) On which claim type did all the hospitals across the US have spent more and also for which period type?  
2) What is the amount spent in each state and who are the highest and lowest claim states?  
3) Which is the leading hospital in terms of spending based on the US zones and what are the differences in spending by hospital on zone level?  

### Why is it important?  
1) Patterns of hospital spending across the country affect the medicare policies.  
2) Information of hospital spending across the country is related to health insurance and optimizing it can improve the quality of healthcare.  
3) Understanding the reasons for geographical variation in Medicare Spending could provide an opportunity for reducing overall health care spending.  

### Limitations of the Dataset  
1) The data is secondary data from averaging hospital spending.   
2) The data is limited to the average of hospital spending for the year of 2015.  
3) The supplementary data for supporting our finding, for example population density.  

### Data Manipulation  
1) Start date and end date were removed because they are same across all the rows.  
2) Symbols like $ and % were changed to numbers.  
3) Abbreviated column names like period data, claim type and hospital for better representation on the graph.  
4) Removed unnecessary rows with the value 0.  
5) R packages and Rstudio was used to analyse and generate plots.  

