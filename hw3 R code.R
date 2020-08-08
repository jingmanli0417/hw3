library(tidyverse)
install.packages("VIM")
library(VIM)

#Use quantmod
if (!require("quantmod")) {
  install.packages("quantmod")
  library(quantmod)
}

start <- as.Date("2020-03-01")
end <- as.Date("2020-06-02")

getSymbols("GS", src = "yahoo", from = start, to = end)
getSymbols("MRK", src = "yahoo", from = start, to = end)
getSymbols("AZN", src = "yahoo", from = start, to = end)
getSymbols("MS", src = "yahoo", from = start, to = end)
getSymbols("MSFT", src = "yahoo", from = start, to = end)
getSymbols("V", src = "yahoo", from = start, to = end)
getSymbols("PG", src = "yahoo", from = start, to = end)
getSymbols("MA", src = "yahoo", from = start, to = end)
getSymbols("INTC", src = "yahoo", from = start, to = end)
getSymbols("ZM", src = "yahoo", from = start, to = end)

data = data.frame(GS = GS$Close,MRK=MRK$Close,AZN=AZN$Close,MS=MS$Close,MSFT=MSFT$Close,
                V=V$Close,PG=PG$Close,MA=MA$Close,INTC=INTC$Close,ZM=ZM$Close)

ncol <- ncol(data)
nrow <- nrow(data)
for(i in 1:30){
  col_missing = sample(1:ncol,1)
  row_missing = sample(1:nrow,1)
  data[row_missing,col_missing]<- NA
}

data1 <- kNN(data, variable = c("GS","INTC","MA","MRK","MS","MSFT","PG","V","ZM","AZN"),k=4)
data2 <- subset(data1, select=GS:ZM)
data2