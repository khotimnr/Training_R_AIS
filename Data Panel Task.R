#Regresi Panel
View(Data_Panel_Task)
str(Data_Panel_Task)
summary(Data_Panel_Task)

#Library yang disiapkan
library(plm)
library(lmtest) 
# membuat model regresi panel
fixed=plm(Indonesian_Rank~Bounce_Rate_Mobile+Page_Mobile+Visit_Duration_Mobile+Speed+Keyword_Branded+Page_Search+Direct+Email+Refferals+Social+Organic_Search+Paid_Search+Display_ads, data=Data_Panel_Task,model="within",index = c("NGO","Bulan"))
summary(fixed)
random=plm(Indonesian_Rank~Bounce_Rate_Mobile+Page_Mobile+Visit_Duration_Mobile+Speed+Keyword_Branded+Page_Search+Direct+Email+Refferals+Social+Organic_Search+Paid_Search+Display_ads, data=Data_Panel_Task,model="random",index = c("NGO","Bulan"))
summary(random)
# Menguji Hausmaan
phtest(fixed,random)
# Uji Breusch-Pagan
m=plm(Indonesian_Rank~Bounce_Rate_Mobile+Page_Mobile+Visit_Duration_Mobile+Speed+Keyword_Branded+Page_Search+Direct+Email+Refferals+Social+Organic_Search+Paid_Search+Display_ads, data=Data_Panel_Task,model="within",index = c("NGO","Bulan"))
plmtest(m,effect = "twoways",type = "bp") # uji efek individu maupun waktu
plmtest(m,effect = "individual",type = "bp") # uji efek individu
plmtest(m,effect = "time",type = "bp") # uji efek waktu
m1=plm(Indonesian_Rank~Bounce_Rate_Mobile+Page_Mobile+Visit_Duration_Mobile+Speed+Keyword_Branded+Page_Search+Direct+Email+Refferals+Social+Organic_Search+Paid_Search+Display_ads,data = Data_Panel_Task,model = "within",effect ="individual",index = c("NGO","Bulan"))
summary(m1)
# Uji Korelasi Serial
pbgtest(m1)
# Uji Heteroscedasticity
bptest(m1)