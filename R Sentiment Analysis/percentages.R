#Positive Percentage

#Renaming
posSc = table_final$Positive
negSc = table_final$Negative


#Adding column
table_final$Pospercent = posSc/(posSc+negSc)

#replacing Nan with zero

pp=table_final$Pospercent
pp[is.nan(pp)] <-0
table_final$Pospercent =pp

#Negative Percentage

#Adding column
table_final$Negpercent = negSc/(posSc+negSc)

#replacing Nan with zero

nn=table_final$Pospercent
nn[is.nan(nn)] <-0
table_final$Pospercent =nn



