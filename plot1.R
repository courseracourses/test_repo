
#leer el fichero en formato csv

household <- read.csv("C:\\Users\\jose\\Desktop\\R-trabajo\\semana1\\household_power_consumption.txt",
sep=";",na.strings="?",header=TRUE,colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
str(household)
head(household,n=3)
tail(household,n=3)

#You may find it useful to convert the Date and Time 
#variables to Date/Time classes in R 
#using the strptime() and as.Date() functions.
household$Date <- as.Date(household$Date, "%d/%m/%Y") 
household$Time<-strptime(household$Time,"%H:%M:%S")

#Identificar un subset solamente con los valores que van de 2007-02-01 a 2007-02-02
householdsubset<-household[(household$Date=="2007-02-01" | household$Date=="2007-02-02"),]
str(householdsubset)
head(householdsubset,n=3)
tail(householdsubset,n=3)

#Primera grafica
hist(householdsubset$Global_active_power,col="red",xlab="Global Active Power(Kilowatts)",main="Global Active Power")

#Copiar la grafica que esta en screen a formato png
dev.copy(png,file="C:\\Users\\jose\\Desktop\\R-trabajo\\semana1\\plot1.png")
dev.off()
dev.off()