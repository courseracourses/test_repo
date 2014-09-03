#leer el fichero en formato csv

household <- read.csv("C:\\Users\\jose\\Desktop\\R-trabajo\\semana1\\household_power_consumption.txt",
sep=";",na.strings="?",header=TRUE,colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
str(household)


#You may find it useful to convert the Date and Time 
#variables to Date/Time classes in R 
#using the strptime() and as.Date() functions.

household$Date <- as.Date(household$Date, "%d/%m/%Y")
str(household)
head(household,n=5)

#Identificar un subset solamente con los valores que van de 2007-02-01 a 2007-02-02
householdsubset<-household[(household$Date=="2007-02-01" | household$Date=="2007-02-02"),]
str(householdsubset)
head(householdsubset,n=5)
names(householdsubset)

#Unir fecha y hora en una variable
householdsubset$day<-paste(householdsubset$Date,householdsubset$Time)

#Transformar la variable de fecha y hora unida en tipo factor
householdsubset$factor<-factor(householdsubset$day)

#Dibujar la grafica con todos los puntos que aparecen
plot(householdsubset$factor,householdsubset$Global_active_power,type="l",pch=1,ylab="Global Active Power (kilowatts)")

#Dibujar una linea que cubre todos los puntos que aparecen
lines(householdsubset$factor,householdsubset$Global_active_power)

#Copiar la grafica que esta en screen a formato png
dev.copy(png,file="C:\\Users\\jose\\Desktop\\R-trabajo\\semana1\\plot1.png")
dev.off()
dev.off()


