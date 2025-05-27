set.seed(123)
n <- 15
x <- sample(n, replace = T)
x

## Medie Analitiche ----

mean(x); 
#1. 
mean(x) > min(x) & mean(x) < max(x)

#2.
x-mean(x)
sum(x-mean(x))

#3.
mean((x-mean(x))^2)
a <- sort(c(seq(min(x),max(x),0.5),mean(x)))

varTest <- sapply(a, function(a) mean((x-a)^2))

min.a <- which.min(varTest)
a[min.a]

plot(a, varTest, type = "b")
points(a[min.a], varTest[min.a], pch = 20, col = "red")

# Altre medie analitiche
mean(x)*length(x); sum(x)     #media aritmetica
exp(mean(log(x)))^n; prod(x)  #media geometrica
1/mean(1/x)/n; 1/sum(1/x)     #media armonica

library(DescTools)

Gmean(x); exp(mean(log(x)))
Hmean(x); 1/mean(1/x)


# Medie di potenze r-esima (con r intero)
# funzione monotona non decrescente di r
# r = -1; media armonica
# r -> 0; media geometrica
# r = 1; media aritmetica
# media armonica < media geometrica < media aritmetica

## Quantili e indici di posizione ----

# quantile empirico x_p: #(x_i<=x_p)/n = p
sort(x)
cbind(sort(x), 1:n/n) # quantili empirici e loro ordine
cbind(sort(x), (0:(n-1))/n) # quantili empirici e loro ordine
# per convenzione: p = (i-.5)/n
cbind(sort(x), .5:(n-.5)/n) 

# mediana 
# n dispari: x[(n+1)/2]; n pari: (x[(n)/2]+x[n/2+1])/2
sort(x)[(n+1)/2]
quantile(x,0.5)

?quantile

sapply(a, function(a) sum(abs(x-a)))
a[which.min(sapply(a, function(a) sum(abs(x-a))))]

# media o mediana?
library(insuranceData)
data(AutoBi)

median(AutoBi$LOSS); mean(AutoBi$LOSS)

fivenum(AutoBi$LOSS)
summary(AutoBi$LOSS)

# calcoliamo la media sfrondata al 5% per la variabile LOSS
mean(AutoBi$LOSS, na.rm=TRUE, trim=0.05)
mean(AutoBi$LOSS, na.rm=TRUE)


## Misure di dispersione ----
var(AutoBi$LOSS)
sd(AutoBi$LOSS)

# calcoliamo la varianza e la deviazione standard per la variabile LOSS 
# per i maschi e per le femmine
#"Maschi"
var(AutoBi$LOSS[AutoBi$CLMSEX==1], na.rm=TRUE)
sd(AutoBi$LOSS[AutoBi$CLMSEX==1], na.rm=TRUE)
#"Femmine"
var(AutoBi$LOSS[AutoBi$CLMSEX==2], na.rm=TRUE) 
sd(AutoBi$LOSS[AutoBi$CLMSEX==2], na.rm=TRUE) ##

# la comparazione è più agevole se le medie nei due gruppi sono simili
mean(AutoBi$LOSS[AutoBi$CLMSEX==1], na.rm=TRUE)
mean(AutoBi$LOSS[AutoBi$CLMSEX==2], na.rm=TRUE)

# notiamo la presenza di valori molto elevati per le donne...
summary(AutoBi$LOSS[AutoBi$CLMSEX==1]) 
summary(AutoBi$LOSS[AutoBi$CLMSEX==2])


### Altre misure di dispersione ----
# calcoliamo la varianza e il MAD per la variabile LOSS per i maschi e per le femmine
#"varianza"
var(AutoBi$LOSS[AutoBi$CLMSEX==1], na.rm=TRUE) 
var(AutoBi$LOSS[AutoBi$CLMSEX==2], na.rm=TRUE)
#"MAD": median absolute deviation
mad(AutoBi$LOSS[AutoBi$CLMSEX==1], na.rm=TRUE) 
mad(AutoBi$LOSS[AutoBi$CLMSEX==2], na.rm=TRUE) 
# IQR: scarto interquartile
quantile(AutoBi$LOSS[AutoBi$CLMSEX==1],0.75, na.rm=TRUE) - quantile(AutoBi$LOSS[AutoBi$CLMSEX==1], 0.25, na.rm=TRUE)
quantile(AutoBi$LOSS[AutoBi$CLMSEX==2],0.75, na.rm=TRUE) - quantile(AutoBi$LOSS[AutoBi$CLMSEX==2], 0.25, na.rm=TRUE)


## Asimmetria ----

# Osserviamo i decili delle variabili LOSS e CLMAGE
#"LOSS"
quantile(AutoBi$LOSS, probs = seq(0,1,0.1), na.rm=T, digits=2)
#"CLMAGE"
quantile(AutoBi$CLMAGE, probs = seq(0,1,0.1), na.rm=T)

## Confronto di quartili
# assenza di asimmetria: (Q3 − Q2) = (Q2 − Q1)
# asimmetria positiva (coda a destra lunga): (Q3 − Q2) > (Q2 − Q1)
# asimmetria negativa (coda a sinistra lunga): (Q3 − Q2) < (Q2 − Q1)


# Indice di Galton: G = (Q3+Q1−2*Q2)/(Q3−Q1)
Qloss<-fivenum(AutoBi$LOSS, na.rm=T) 
g<-(Qloss[4]+Qloss[2]-2*Qloss[3])/(Qloss[4]-Qloss[2])
# Indici basati sul confronto fra media e mediana, eg. 
# coefficiente di asimmetria = 3(M - Me)/sd

# Indice di asimmetria: γ = mean (xi - M)^3/sd^3
# positivo se asimmetria positiva (coda destra lunga) e viceversa

library(moments)
skewness(AutoBi$LOSS)

# Curtosi: δ = mean (xi - M)^4/sd^4
# δ<3 distribuzione leptocurtica/ δ>3 distribuzione pletocurtica
kurtosis(AutoBi$CLMAGE, na.rm=TRUE)


## Boxplot ----

fivenum(AutoBi$CLMAGE)
par(mfrow=c(2,1))
hist(AutoBi$CLMAGE)
boxplot(AutoBi$CLMAGE, horizontal=TRUE)

# 1. la larghezza della scatola ci dà un’indicazione della dispersione
# 2. la sua posizione ci da un'indicazione di dove si trova il 50% dei valori centrali della variabile e assieme
#alla linea in corrispondenza della mediana ci dà indicazione dei valori centrali
# 3. la posizione della mediana nella scatola ci informa sulla simmetria
# 4. i baffi ci danno indicazione del comportamento sulle code.

boxplot(AutoBi$LOSS, horizontal=TRUE)
boxplot(log(AutoBi$LOSS), horizontal=TRUE)
