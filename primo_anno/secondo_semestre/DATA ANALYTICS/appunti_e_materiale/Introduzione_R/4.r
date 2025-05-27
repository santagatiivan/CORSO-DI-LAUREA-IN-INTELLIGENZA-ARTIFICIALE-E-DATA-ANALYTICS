## Importazione dati -----

# impostare la working directory
getwd()
setwd("") # o Session -> Set Working Directory or Files tab -> More 

## read.table(<name.file>, <arguments>)

## read.table("../data/mydata.dat", header=T)

## read.csv(<file path + file name>, <arguments>)

Food <- read.csv("data/food_coded1.csv")

Food <- read.csv("data/food_coded1.csv", header=TRUE, sep = ";")

# Disponibile all'indirizzo: https://www.kaggle.com/borapajo/food-choices

# E' possibile leggere i dati anche direttamente dal file xlsx
# install.packages("openxlsx") #or from Packages tab -> Install
# library(openxlsx)            #load the package to use its functions
# a <- read.xlsx("data/food_coded1.xlsx")

cigarette <- read.table("importazione dataset/cigarette.txt", 
                        header = F)
cipolle <- read.table("importazione dataset/cipolle.dat", 
                      header = T, stringsAsFactors = T)
macchine <- read.csv("importazione dataset/macchine/macchine.data",
                     header = F, na.strings = "?")
nazioni <- read.csv("importazione dataset/nazioni.csv")
windmill <- read.table("importazione dataset/windmill.txt", 
                       dec = ",", header = T)
str(windmill)

## Data frame selezione -----

dim(Food)
str(Food)
head(Food)
length(Food)
# per caricare dati con altre estensioni è possibile utilizzare le funzioni
# nel pacchetto: foreign

Food$GPA
Food[, "GPA"]
Food[, 1]

str(Food[[1]])

Food$Gender[2:7] #selezione degli elementi in una singola variabile
str(Food$Gender)

is.numeric(Food$Gender) #accedendo ad una singola colonna è possibile trattarla come vettore 
is.factor(Food$Gender)

Food$Gender <- factor(Food$Gender) #convertiamo la variabile in un factor con 2 livelli
Food$Gender
levels(Food$Gender) <- c("Female","Male") #rinominiamo i livelli
str(Food$Gender)

#quante donne ci sono nel dataset?

sum(Food$Gender=="Female")
length(Food$Gender[Food$Gender=="Female"])
table(Food$Gender)[1]

#Selezioniamo il peso dei maschi
Food$weight[Food$Gender=="Male"]

Food[Food$Gender=="Male", "weight"]
Food[Food$Gender=="Male", c("GPA", "weight")]

#selezioniamo le colonne sport e lavoro solo per le donne
#le condizioni sono specificate nel campo dedicato alle righe
Food[Food$Gender=="Female", c("sports", "employment")]

#selezioniamo il genere dei soggetti con sport==1 e vitamins==1
Food$Gender[Food$sports==1&Food$vitamins==1]

#selezioniamo i valori fruit day e veggie day per gli studenti maschi 
#che hanno dichiarato fare attività sportiva (sports==1)

Food2 <- Food[Food$Gender=="Male"&Food$sports==1, c("fruit_day","veggies_day")]
Food.subset <- subset(Food, subset = (Gender=="Male"& sports==1), 
       select = c(fruit_day, veggies_day))

#eliminiamo la variabile peso selezionando chi ha impiego ==1 o ==2
Food[Food$employment==1|Food$employment==2, -48]
Food[Food$employment<3, -48]

subset(Food, subset = (employment==1|employment==2), 
       select = -c(weight))

#creiamo un nuovo data frame con studenti maschi con reddito >3, 
#salvando nel nuovo oggetto solo le variabili da income a nutritional_check
newdata <- subset(Food, Gender=="Male" & income > 3,
                  select=c(income:nutritional_check))
str(newdata)


### Exercizi ----
# I seguenti esercizi richiedono il caricamento dei dati AutoBi su
# sinistri per lesioni personali automobilistiche nei dati assicurativi del pacchetto R.
# Ottienilo eseguendo i seguenti comandi

install.packages("insuranceData")
library("insuranceData")
data(AutoBi)

#1. Utilizzare una funzione adatta per analizzare la struttura dei dati.
# Controlla i nomi, la dimensione ed elenca le prime 8 osservazioni.


#2. Utilizzare la funzione summary() per ottenere statistiche riassuntive delle
# variabili numeriche in un frame di dati.

#3. Cosa restituiscono le seguenti righe? In cosa differiscono i due comandi per 
# il subsetting?
AutoBi$CLMAGE[AutoBi$CLMAGE<20]
subset(AutoBi, subset=CLMAGE<20, select=CLMAGE)

#4. Seleziona le variabili MARITAL e CLMINSUR ed i soggetti rappresentati da un 
#avvocato, escludi i valori mancanti utilizzando la funzione na.omit

#5. Seleziona le donne di età inferiore ai 40 anni, sposate o divorziate, e con 
# perdite superiori a cinquemila dollari.

#6. Aggiungi una nuova colonna con la variabili LOSS su scala logaritmica

## Valori mancanti - NA ------

which(is.na(Food$calories_day)) #numero di righe di valori mancanti

is.na(Food$calories_day)
mean(Food$calories_day)
mean(Food$calories_day, na.rm = TRUE)
#eliminiamo i missing su calories_day
d<im(Food[!is.na(Food$calories_day),])

na.omit(Food) #teniamo solo i casi completi
complete.cases(Food)

## Esportazione file -----

write.table(Food,file="Food.dat")
write.table(Food,file="Food.csv", sep=",", row.names = FALSE)
#write.csv(...)
save(Food,file="Food.RData")
save(file="Food.RData")
#save.image()

#load("Food.RData")


### Exercizi ----
#  Il set di dati `feeling` riguarda l'atteggiamento degli elettori americani 
# nei confronti di diverse categorie di individui. Ogni variabile esprime un 
# punteggio da 0 a 100, indicando un atteggiamento sfavorevole, indifferente 
# o favorevole nei confronti dei gruppi di persone oggetto della domanda

load("data/feeling.Rdata")

#1. Definisci una variabile categoriale dalla variabile `ft_immig_2016`
# con le seguenti classi: strongly unfavorable (0-25), 
# unfavorable/indifferent (26-50), lightly favorable (51-75),favorable (76-100).
# Aggiungi la nuova variabile ai dati.
# Utilizza la funzione 'cut()'

#2. Rimuovi i valori mancanti ed esporta il dataframe in  file .csv. 