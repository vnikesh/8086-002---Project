## R Script - 8086-002 - Data to Decisions

We have addressed all our research questions.

1) Finding out on which claim type did all the hospital across USA has spent more and also for which period?  
2) Finding the amount spent in each state and grouping it under highest and lowest claim states?  
3) Finding the leading hospital in terms of spending based on the US zones and also finding the differences in spending by hospital on zone level?  

---------------------------------------------------------------------------------

1) Finding out on which claim type did all the hospital across USA has spent more and also for which period?

##1.1 Finding out on which claim type did all the hospital across USA has spent more 

##setting the path to the folder of the date set, loading the data and checking the data
setwd("C:\\Users\\leirhyh\\Documents\\Leipersonallife\\UNOclass\\ISQA8086-002\\groupproject\\dataset")
list.files()
HospitalSpending <- read.csv ("Medicare_Hospital_Spending_by_Claim_Cleaned.csv", stringsAsFactors = FALSE)  
head(HospitalSpending) # check the first six rows of the data
View(HospitalSpending) # view the data
nrow(HospitalSpending) # check how many rows
ncol(HospitalSpending) # check how many columns
HospitalSpending[!complete.cases(HospitalSpending),] #check wheather there is missing data
#Since there is no missing data for current dataset, we won't consider missing data in our following analyses.

##loading the libray
```{r packages}
library(doBy)
library(DT)
library(xtable)
library(ggplot2)
library(reshape2)
library(GGally)
```

## subset the data
### select three columns of Claim_type, ASPE_Hospital, POS_Hospital for the folowing analyses
claimtype <- HospitalSpending[, c("Claim_type" , "ASPE_Hospital", "POS_Hospital")]
head(claimtype)

### Select only two column of "Claim_type" , "ASPE_Hospital" and omitting the Total type 
###because we compare the relationships between each claim type
claimtype1 <- HospitalSpending[HospitalSpending$Claim_type != "Total", c("Claim_type" , "ASPE_Hospital")]
head(claimtype1)
# split the data into different columns based on Claim_type
claimtype2 <- dcast(claimtype1, ASPE_Hospital ~ Claim_type) 
head(claimtype2)

### subset the proper pair for  the following t test
claimCarrierDME <- HospitalSpending[HospitalSpending$Claim_type == "Carrier" | HospitalSpending$Claim_type == "DME", c("Claim_type" , "ASPE_Hospital")]
claimCarrierHHA <- HospitalSpending[HospitalSpending$Claim_type == "Carrier" | HospitalSpending$Claim_type == "HHA", c("Claim_type" , "ASPE_Hospital")]
claimCarrierHospice <- HospitalSpending[HospitalSpending$Claim_type == "Carrier" | HospitalSpending$Claim_type == "Hospice", c("Claim_type" , "ASPE_Hospital")]
claimCarrierInpatient <- HospitalSpending[HospitalSpending$Claim_type == "Carrier" | HospitalSpending$Claim_type == "Inpatient", c("Claim_type" , "ASPE_Hospital")]
claimCarrierOutpatient <- HospitalSpending[HospitalSpending$Claim_type == "Carrier" | HospitalSpending$Claim_type == "Outpatient", c("Claim_type" , "ASPE_Hospital")]
claimCarrierSNF <- HospitalSpending[HospitalSpending$Claim_type == "Carrier" | HospitalSpending$Claim_type == "SNF", c("Claim_type" , "ASPE_Hospital")]
claimDMEHHA <- HospitalSpending[HospitalSpending$Claim_type == "DME" | HospitalSpending$Claim_type == "HHA", c("Claim_type" , "ASPE_Hospital")]
claimDMEHospice <- HospitalSpending[HospitalSpending$Claim_type == "DME" | HospitalSpending$Claim_type == "Hospice", c("Claim_type" , "ASPE_Hospital")]
claimDMEInpatient <- HospitalSpending[HospitalSpending$Claim_type == "DME" | HospitalSpending$Claim_type == "Inpatient", c("Claim_type" , "ASPE_Hospital")]
claimDMEOutpatient <- HospitalSpending[HospitalSpending$Claim_type == "DME" | HospitalSpending$Claim_type == "Outpatient", c("Claim_type" , "ASPE_Hospital")]
claimDMESNF <- HospitalSpending[HospitalSpending$Claim_type == "DME" | HospitalSpending$Claim_type == "SNF", c("Claim_type" , "ASPE_Hospital")]
claimHHAHospice <- HospitalSpending[HospitalSpending$Claim_type == "HHA" | HospitalSpending$Claim_type == "Hospice", c("Claim_type" , "ASPE_Hospital")]
claimHHAInpatient <- HospitalSpending[HospitalSpending$Claim_type == "HHA" | HospitalSpending$Claim_type == "Inpatient", c("Claim_type" , "ASPE_Hospital")]
claimHHAOutpatient <- HospitalSpending[HospitalSpending$Claim_type == "HHA" | HospitalSpending$Claim_type == "Outpatient", c("Claim_type" , "ASPE_Hospital")]
claimHHASNF <- HospitalSpending[HospitalSpending$Claim_type == "HHA" | HospitalSpending$Claim_type == "SNF", c("Claim_type" , "ASPE_Hospital")]
claimHospiceInpatient <- HospitalSpending[HospitalSpending$Claim_type == "Hospice" | HospitalSpending$Claim_type == "Inpatient", c("Claim_type" , "ASPE_Hospital")]
claimHospiceOutpatient <- HospitalSpending[HospitalSpending$Claim_type == "Hospice" | HospitalSpending$Claim_type == "Outpatient", c("Claim_type" , "ASPE_Hospital")]
claimHospiceSNF <- HospitalSpending[HospitalSpending$Claim_type == "Hospice" | HospitalSpending$Claim_type == "SNF", c("Claim_type" , "ASPE_Hospital")]
claimInpatientOutpatient <- HospitalSpending[HospitalSpending$Claim_type == "Inpatient" | HospitalSpending$Claim_type == "Outpatient", c("Claim_type" , "ASPE_Hospital")]
claimInpatientSNF <- HospitalSpending[HospitalSpending$Claim_type == "Inpatient" | HospitalSpending$Claim_type == "SNF", c("Claim_type" , "ASPE_Hospital")]
claimOutpatientSNF <- HospitalSpending[HospitalSpending$Claim_type == "Outpatient" | HospitalSpending$Claim_type == "SNF", c("Claim_type" , "ASPE_Hospital")]


claimHHAHospice <- HospitalSpending[HospitalSpending$Claim_type == "HHA" | HospitalSpending$Claim_type == "Hospice", c("Claim_type" , "ASPE_Hospital")]
head(claimHHAHospice)
claimHHAHospice <- HospitalSpending[HospitalSpending$Claim_type == "HHA" | HospitalSpending$Claim_type == "Hospice", c("Claim_type" , "ASPE_Hospital")]
head(claimHHAHospice)

#change claim_type to full name for analyses
claimtype$Claim_type <- factor(claimtype$Claim_type, levels=c("Carrier","DME", "HHA", "Hospice", "Inpatient", "Outpatient", "SNF","Total"), labels=c("Carrier", "Durable Medical Equipment","Home Health Agency","Hospice","Inpatient","Outpatient", "Skilled Nursing Facility", "Total"))
head(claimtype)

# produce the sumary table for the subsets
# sumary table for the hospital spencid nationally by claim types ($).
claimTable <- do.call(cbind.data.frame, aggregate(ASPE_Hospital ~ Claim_type, data=claimtype, FUN = function(x) {
  c("Number"=format(round(length(x), 0), nsmall = 0), M=format(round(mean(x), 2), nsmall = 2), min=min(x),max=max(x), 
    SD=format(round(sd(x), 2), nsmall = 2),format(round(quantile(x,c(0.05, 0.25, 0.50, 0.75, 0.95)), 2), nsmall = 2), iqr=IQR(x)) })); names(claimTable) <- c("Claim Type", "Number", "Mean", "Minimum", "Maximum", "Stanard deviation", "5% Quantile","25% Quantile","Median","75% Quantile", "95% Quantile", "IQR")
View(claimTable)  


# sumary table for the hospital spending perentage nationally by claim types (%).
claimTableP <- do.call(cbind.data.frame, aggregate(POS_Hospital ~ Claim_type, data=claimtype, FUN = function(x) {
  c("Number"=format(round(length(x), 0), nsmall = 0), M=format(round(mean(x), 5), nsmall = 5), min=min(x),max=max(x), 
    SD=format(round(sd(x), 2), nsmall = 2),quantile(x,c(0.05, 0.25, 0.50, 0.75, 0.95)), iqr=IQR(x)) })); names(claimTableP) <- c("Claim Type", "Number", "Mean", "Minimum", "Maximum", "Stanard deviation", "5% Quantile","25% Quantile","Median","75% Quantile", "95% Quantile", "IQR")
View(claimTableP)  

#Histogram of the spending based on different claim types
ggplot(data = claimtype, aes(x=ASPE_Hospital)) + geom_histogram(aes(fill=Claim_type)) + facet_wrap(~Claim_type, scales="free")
ggplot(data = claimtype, aes(x=POS_Hospital)) + geom_histogram(aes(fill=Claim_type)) + facet_wrap(~Claim_type, scales="free")

#boxplot of the spending based on different claim types
ggplot(data = claimtype, aes(y=ASPE_Hospital, x=Claim_type)) + geom_boxplot(aes(fill=Claim_type)) + facet_wrap(~Claim_type, scales="free")
ggplot(data = claimtype, aes(y=POS_Hospital, x=Claim_type)) + geom_boxplot(aes(fill=Claim_type)) + facet_wrap(~Claim_type, scales="free")

## ANOVA analysis of the spending based on different claim types
fit = lm(formula = claimtype$ASPE_Hospital ~ claimtype$Claim_type)
anova (fit)


## t test to check which pair are significantly from each other
with(claimCarrierDME, t.test(ASPE_Hospital[Claim_type=="Carrier"],ASPE_Hospital[Claim_type=="DME"]))
t.test(ASPE_Hospital~ Claim_type, data = claimCarrierDME)
with(claimCarrierHHA, t.test(ASPE_Hospital[Claim_type=="Carrier"],ASPE_Hospital[Claim_type=="HHA"]))
t.test(ASPE_Hospital~ Claim_type, data = claimCarrierHHA)
with(claimCarrierHospice , t.test(ASPE_Hospital[Claim_type=="Carrier"],ASPE_Hospital[Claim_type=="Hospice"]))
t.test(ASPE_Hospital~ Claim_type, data = claimCarrierHospice )
with(claimCarrierInpatient, t.test(ASPE_Hospital[Claim_type=="Carrier"],ASPE_Hospital[Claim_type=="Inpatient"]))
t.test(ASPE_Hospital~ Claim_type, data = claimCarrierInpatient)
with(claimCarrierOutpatient, t.test(ASPE_Hospital[Claim_type=="Carrier"],ASPE_Hospital[Claim_type=="Outpatient"]))
t.test(ASPE_Hospital~ Claim_type, data = claimCarrierOutpatient)
with(claimCarrierSNF, t.test(ASPE_Hospital[Claim_type=="Carrier"],ASPE_Hospital[Claim_type=="SNF"]))
t.test(ASPE_Hospital~ Claim_type, data = claimCarrierSNF)
with(claimDMEHHA, t.test(ASPE_Hospital[Claim_type=="DME"],ASPE_Hospital[Claim_type=="HHA"]))
t.test(ASPE_Hospital~ Claim_type, data = claimDMEHHA)
with(claimDMEHospice, t.test(ASPE_Hospital[Claim_type=="DME"],ASPE_Hospital[Claim_type=="Hospice"]))
t.test(ASPE_Hospital~ Claim_type, data = claimDMEHospice)
with(claimDMEInpatient, t.test(ASPE_Hospital[Claim_type=="DME"],ASPE_Hospital[Claim_type=="Inpatient"]))
t.test(ASPE_Hospital~ Claim_type, data = claimDMEInpatient)
with(claimDMEOutpatient, t.test(ASPE_Hospital[Claim_type=="DME"],ASPE_Hospital[Claim_type=="Outpatient"]))
t.test(ASPE_Hospital~ Claim_type, data = claimDMEOutpatient)
with(claimDMESNF, t.test(ASPE_Hospital[Claim_type=="DME"],ASPE_Hospital[Claim_type=="SNF"]))
t.test(ASPE_Hospital~ Claim_type, data = claimDMESNF)
with(claimHHAHospice, t.test(ASPE_Hospital[Claim_type=="HHA"],ASPE_Hospital[Claim_type=="Hospice"]))
t.test(ASPE_Hospital~ Claim_type, data = claimHHAHospice)
with(claimHHAInpatient, t.test(ASPE_Hospital[Claim_type=="HHA"],ASPE_Hospital[Claim_type=="Inpatient"]))
t.test(ASPE_Hospital~ Claim_type, data = claimHHAInpatient)
with(claimHHASNF, t.test(ASPE_Hospital[Claim_type=="HHA"],ASPE_Hospital[Claim_type=="SNF"]))
t.test(ASPE_Hospital~ Claim_type, data = claimHHASNF)
with(claimHospiceInpatient, t.test(ASPE_Hospital[Claim_type=="Hospice"],ASPE_Hospital[Claim_type=="Inpatient"]))
t.test(ASPE_Hospital~ Claim_type, data = claimHospiceInpatient)
with(claimHospiceOutpatient, t.test(ASPE_Hospital[Claim_type=="Hospice"],ASPE_Hospital[Claim_type=="Outpatient"]))
t.test(ASPE_Hospital~ Claim_type, data = claimHospiceOutpatient)
with(claimHospiceSNF, t.test(ASPE_Hospital[Claim_type=="Hospice"],ASPE_Hospital[Claim_type=="SNF"]))
t.test(ASPE_Hospital~ Claim_type, data = claimHospiceSNF)
with(claimInpatientOutpatient, t.test(ASPE_Hospital[Claim_type=="Inpatient"],ASPE_Hospital[Claim_type=="Outpatient"]))
t.test(ASPE_Hospital~ Claim_type, data = claimInpatientOutpatient)
with(claimInpatientSNF, t.test(ASPE_Hospital[Claim_type=="Inpatient"],ASPE_Hospital[Claim_type=="SNF"]))
t.test(ASPE_Hospital~ Claim_type, data = claimInpatientSNF)
with(claimOutpatientSNF, t.test(ASPE_Hospital[Claim_type=="Outpatient"],ASPE_Hospital[Claim_type=="SNF"]))
t.test(ASPE_Hospital~ Claim_type, data = claimOutpatientSNF)



##1.2 Finding out on which period did all the hospital across USA has spent more 

## subset the data
### select three columns of Period, ASPE_Hospital, POS_Hospital for the folowing analyses
head(HospitalSpending)
periodIHA <- HospitalSpending[, c("Period" , "ASPE_Hospital", "POS_Hospital")]
head(periodIHA,20)

### Select only two column of Peirod , ASPE_Hospital and omitting the Total type 
###because we compare the relationships between each claim type
periodIHA1 <- HospitalSpending[HospitalSpending$Period !="ComEpisode", c("Period" , "ASPE_Hospital")]
head(periodIHA1)
### subset the proper pair for  the following t test
periodAB <- HospitalSpending[HospitalSpending$Period == "AfterIHA" | HospitalSpending$Period == "BeforeIHA", c("Period" , "ASPE_Hospital")]
head(periodAB)
periodAD <- HospitalSpending[HospitalSpending$Period == "AfterIHA" | HospitalSpending$Period == "DuringIHA", c("Period" , "ASPE_Hospital")]
head(periodAD)
periodBD <- HospitalSpending[HospitalSpending$Period == "BeforeIHA" | HospitalSpending$Period == "DuringIHA", c("Period" , "ASPE_Hospital")]
head(periodBD)

# split the data into different columns based on Claim_type
periodIHA2 <- dcast(periodIHA1, ASPE_Hospital ~ Period) 
head(periodIHA2)
str(periodIHA2) # check the type of the variable
periodIHA2$AfterIHA <- as.numeric(periodIHA2$AfterIHA)
periodIHA2$BeforeIHA <- as.numeric(periodIHA2$BeforeIHA)
periodIHA2$DuringIHA <- as.numeric(periodIHA2$DuringIHA)
str(periodIHA2)




# produce the sumary table for the subsets
# sumary table for the hospital spending nationally by periods ($).
periodTable <- do.call(cbind.data.frame, aggregate(ASPE_Hospital ~ Period, data=periodIHA, FUN = function(x) {
  c("Number"=format(round(length(x), 0), nsmall = 0), M=format(round(mean(x), 2), nsmall = 2), min=min(x),max=max(x), 
    SD=format(round(sd(x), 2), nsmall = 2),format(round(quantile(x,c(0.05, 0.25, 0.50, 0.75, 0.95)), 2), nsmall = 2), iqr=IQR(x)) })); names(periodTable) <- c("Periods", "Number", "Mean", "Minimum", "Maximum", "Stanard deviation", "5% Quantile","25% Quantile","Median","75% Quantile", "95% Quantile", "IQR")
View(periodTable)  

# sumary table for the hospital spending perentage nationally by periods (%).
periodTableP <- do.call(cbind.data.frame, aggregate(POS_Hospital ~ Period, data=periodIHA, FUN = function(x) {
  c("Number"=format(round(length(x), 0), nsmall = 0), M=format(round(mean(x), 5), nsmall = 5), min=min(x),max=max(x), 
    SD=format(round(sd(x), 2), nsmall = 2),quantile(x,c(0.05, 0.25, 0.50, 0.75, 0.95)), iqr=IQR(x)) })); names(periodTableP) <- c("Claim Type", "Number", "Mean", "Minimum", "Maximum", "Stanard deviation", "5% Quantile","25% Quantile","Median","75% Quantile", "95% Quantile", "IQR")
View(periodTableP)  

#Histogram of the spending based on different periods ($)

ggplot(data = periodIHA, aes(x=ASPE_Hospital)) + geom_histogram(aes(fill=Period)) + facet_wrap(~Period, scales="free")
ggplot(data = periodIHA, aes(x=POS_Hospital)) + geom_histogram(aes(fill=Period)) + facet_wrap(~Period, scales="free")

#boxplot of the spending based on different periods
ggplot(data = periodIHA, aes(y=ASPE_Hospital, x=Period)) + geom_boxplot(aes(fill=Period)) + facet_wrap(~Period, scales="free")
ggplot(data = periodIHA, aes(y=POS_Hospital, x=Period)) + geom_boxplot(aes(fill=Period)) + facet_wrap(~Period, scales="free")

## ANOVA analysis of the spending based on different periods
fit1 = lm(formula = periodIHA1$ASPE_Hospital ~ periodIHA1$Period)
anova (fit1)

## t test to check which pair are significantly from each other
head(periodAB)
with(periodAB, t.test(ASPE_Hospital[Period=="AfterIHA"],ASPE_Hospital[Period=="BeforeIHA"]))
t.test(ASPE_Hospital~ Period, data = periodAB)


head(periodAD)
with(periodAD, t.test(ASPE_Hospital[Period=="AfterIHA"],ASPE_Hospital[Period=="DuringIHA"]))
t.test(ASPE_Hospital~ Period, data = periodAD)


head(periodBD)
with(periodBD, t.test(ASPE_Hospital[Period=="BeforeIHA"],ASPE_Hospital[Period=="DuringIHA"]))
t.test(ASPE_Hospital~ Period, data = periodBD)


-----------------------------------------------------------------------------------------------------

2) Finding the amount spent in each state and grouping it under highest and lowest claim states? 



-----------------------------------------------------------------------------------------------------

3) Finding the leading hospital in terms of spending based on the US zones and also finding the differences in spending by hospital on zone level?

# Creating the data frame.
hosp <- read.csv("Medicare_Hospital_Spending_by_Claim_Cleaned.csv")

#Removing "NA" values
hosp[is.na(hosp)] <- 0

# Creating the subset by filtering the values based on the column "Period"
hosp <- subset(hosp, Period == "ComEpisode")

# Grouping the state into Region
# North East Region
hosp_northeast <- subset(hosp, State %in% c("CT", "ME", "MA", "NH", "RI", "VT", "NJ", "PA", "NY"))
View(hosp_northeast)

#Midwest Region
hosp_midwest <- subset(hosp, State %in% c("IN", "IL", "MI", "OH", "WI", "IA", "KS", "MN", "MO", "NE", "ND", "SD"))

#South Region
hosp_south <- subset(hosp, State %in% c("DE", "DC", "FL", "GA", "MD", "NC", "SC", "VA", "WV", "AL", "KY", "MS", "TN", "AR", "LA", "OK", "TX"))


#West Region
hosp_west <- subset(hosp, State %in% c("AZ", "CO", "ID", "NM", "MT", "UT", "NV", "WY", "AK", "CA", "HI", "OR", "WA"))



'''
# State wise Plotting
gplot(hosp_northeast, aes(x=State, y = ASPE_Hospital, color = State))+
+ geom_histogram(stat = "identity")+
+ xlab("Hospital Name")+
+ ylab("Average Spending Per Episode Hospital")+
+ ggtitle("Graph for highest spending per hospital in North East Region")
'''

#Function for converting exponential to numeric
library(scales)
fancy_scientific <- function(l) {
  # turn in to character string in scientific notation
  l <- format(l, scientific = TRUE)
  # quote the part before the exponent to keep all the digits
  l <- gsub("^(.*)e", "'\\1'e", l)
  # turn the 'e+' into plotmath format
  l <- gsub("e", "%*%10^", l)
  # return this as an expression
  parse(text=l)
}

#Reploting the graph after changing the expontential to numbers
ggplot(hosp_northeast, aes(x=State, y = ASPE_Hospital, color = State))+
  + geom_histogram(stat = "identity")+
  + xlab("Hospital Name")+
  + ylab("Average Spending Per Episode Hospital")+
  + scale_y_continuous(labels=fancy_scientific)+
  + ggtitle("Graph for highest spending per hospital in North East Region")

ggplot(hosp_midwest, aes(x=State, y = ASPE_Hospital, color = State))+
  geom_histogram(stat = "Identity")+
  xlab("Hospital Name")+
  ylab("Average Spending Per Episode Hospital")+
  scale_y_continuous(labels=fancy_scientific)
ggtitle("Graph for highest spending per hospital in Midwest Region")

ggplot(hosp_south, aes(x=State, y = ASPE_Hospital, color = State))+
  geom_histogram(stat = "Identity")+
  xlab("Hospital Name")+
  ylab("Average Spending Per Episode Hospital")+
  scale_y_continuous(labels=fancy_scientific)
ggtitle("Graph for highest spending per hospital in South Region")

ggplot(hosp_west, aes(x=State, y = ASPE_Hospital, color = State))+
  geom_histogram(stat = "Identity")+
  xlab("Hospital Name")+
  ylab("Average Spending Per Episode Hospital")+
  scale_y_continuous(labels=fancy_scientific)
ggtitle("Graph for highest spending per hospital in West Region")



#Assigning the dataframes to new dataframes.
NE <- hosp_northeast
MW <- hosp_midwest
S <- hosp_south
W <- hosp_west

#Add an additonal col called Region for all the subset data frame
NE$Region <- "North East"
MW$Region <- "Mid West"
S$Region <- "South"
W$Region <- "West"


# Sorting the column ASPE_Hospital in the asending order
NE_sort <- NE[order(NE$ASPE_Hospital, decreasing = TRUE),]
head(NE_sort)

MW_sort <- MW[order(MW$ASPE_Hospital, decreasing = TRUE),]
head(MW_sort)

S_sort <- S[order(S$ASPE_Hospital, decreasing = TRUE),]
head(S_sort)

W_sort <- W[order(W$ASPE_Hospital, decreasing = TRUE),]
head(W_sort)

# Assigning the values for comparision
NE_Firstrow <- head(NE_sort,1)
MW_Firstrow <- head(MW_sort,1)
S_Firstrow <- head(S_sort,1)
W_Firstrow <- head(W_sort,1)

#Bind the rows from multiple dataframes into single data frame
Region <- rbind(NE_Firstrow,MW_Firstrow,S_Firstrow,W_Firstrow)
View(Region)

#Select only the required columns
Region <- Region[,c(1,3,6,13)]

#Combining the Column State and Region to a new Column.
Region$Zone <- paste(Region$State, "\n", Region$Region)

#Combinging Hospital Name and Zone.
Region$Hospital <- paste(Region$Hospital_Name, "\n", Region$Zone)

#Plotting the Graph
p <- ggplot(Region, aes(x=Hospital, y= ASPE_Hospital,fill=Hospital))+
  geom_histogram(stat="Identity")

p + theme(axis.text.x = element_blank())+
  xlab("Hospital Name and Zones")+
  ylab("Average Spending Per Episode Hospital")+
  ggtitle("Highest spending hospital in USA")

----------------------------------------------------------------------------------------------------
