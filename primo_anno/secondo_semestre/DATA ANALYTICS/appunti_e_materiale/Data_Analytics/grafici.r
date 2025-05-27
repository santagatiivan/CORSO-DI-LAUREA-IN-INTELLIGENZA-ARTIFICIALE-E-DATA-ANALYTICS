# Data Analysis - Graphics -----

library(insuranceData)
data("AutoBi")
table(AutoBi$LOSS)

AutoBi$LOSSclass<-cut(AutoBi$LOSS,breaks=c(0,0.5,2,4,8,1100))
rbind(table(AutoBi$LOSSclass), prop.table(table(AutoBi$LOSSclass)))

library(MASS)
data("Cars93")
str(Cars93)

tabtipo<-table(Cars93$Type)
tabtipo

# Variabili qualitative ----
# diagramma a torta
pie(tabtipo)
?pie

# diagramma a barre: opportuno per variabili qualitative e...
maritab<-table(AutoBi$MARITAL)
barplot(maritab)

par(mfrow=c(1,2)) ## imposta alcuni parametri della finestra grafica
barplot(maritab)      
barplot(maritab, main="stato civile", 
        names.arg=c("sposato", "single", "vedovo", "divorziato"), col=2)

par(mfrow=c(1,1)) ## reset parametri impostati

# quantitative discrete con un numero limitato di valori
barplot(table(Cars93$Cylinders))

# esempio con stato civile
par(mfrow=c(1,2))
freq<-matrix(prop.table(table(AutoBi$MARITAL)),
             nrow=length(table(AutoBi$MARITAL)), ncol=1)
barplot(freq, xlim=c(0,4), col=(2:5))
# esempio con auto
nrig=length(table(Cars93$Type))
autof<-matrix(table(Cars93$Type), nrig, ncol=1)
colr=(2:(nrig+1))
barplot(autof, xlim=c(0,4), col=(2:(nrig+1)))
legend(x="top", legend=levels(Cars93$Type), fill=colr)

par(mfrow=c(1,1)) ## reset parametri impostati

# Variabili quantitative ----

# Diagramma ramo e foglie
# ramo|foglie
# la lunghezza della foglia rappresenta la freq assoluta

Cars93$Length
stem(Cars93$Length)

# indicato per piccoli insiemi di dati e per dati poco dispersi
stem(AutoBi$CLMAGE)

# Diagramma a punti 
stripchart(Cars93$Length, pch=19, method="stack", cex=0.2, ylim=c(0,2))
dotchart(Cars93$Length) #
plot(Cars93$Length) #equivalente a dotchart

# Istogramma

par(mfrow=c(1,2))
hist(Cars93$Length)

hist(Cars93$Length, freq = F)
hist(Cars93$Length, breaks = c(139,160,170,180,190,220))

par(mfrow=c(2,2))
hist(Cars93$Length, main="istogramma ottenuto usando parametri di default")
hist(Cars93$Length, prob=TRUE, main="istogramma con le densità")
hist(Cars93$Length, prob=TRUE, breaks=12, main="istogramma 12 intervalli")
hist(Cars93$Length, prob=TRUE, breaks=c(140,160,170,180,190,200,220), 
     main = "istrogramma con classi di diversa ampiezza")

