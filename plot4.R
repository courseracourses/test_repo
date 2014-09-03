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

par(mfrow=c(2,2), mar=c(4,4,2,1))

#Dibujar la grafica con todos los puntos que aparecen
plot(householdsubset$factor,householdsubset$Global_active_power,type="l",pch=1,ylab="Global Active Power")

#Dibujar una linea que cubre todos los puntos que aparecen
lines(householdsubset$factor,householdsubset$Global_active_power)

#Dibujar la grafica con todos los puntos que aparecen
plot(householdsubset$factor,householdsubset$Voltage,type="l",pch=1,ylab="Voltage",xlab="Datatime")

#Dibujar una linea que cubre todos los puntos que aparecen
lines(householdsubset$factor,householdsubset$Voltage)

#Dibujar varias variables (eje y) en un mismo grafico (eje x igual)
plot(householdsubset$factor,householdsubset$Sub_metering_1,type="l",pch=1)
lines(householdsubset$factor,householdsubset$Sub_metering_1,col="black")
lines(householdsubset$factor,householdsubset$Sub_metering_2,col="red")
lines(householdsubset$factor,householdsubset$Sub_metering_3,col="blue")
legend("topright",pch=1,col=c("black","red","blue"),legend=c("Sub_metering_1",
"Sub_metering_2","Sub_metering_3"))


#Dibujar la grafica con todos los puntos que aparecen
plot(householdsubset$factor,householdsubset$Global_reactive_power,type="l",pch=1,ylab="Global Reactive Power",xlab="Datatime")

#Dibujar una linea que cubre todos los puntos que aparecen
lines(householdsubset$factor,householdsubset$Global_reactive_power)

dev.copy(png,file="C:\\Users\\jose\\Desktop\\R-trabajo\\semana1\\plot4.png")
dev.off()
dev.off()

