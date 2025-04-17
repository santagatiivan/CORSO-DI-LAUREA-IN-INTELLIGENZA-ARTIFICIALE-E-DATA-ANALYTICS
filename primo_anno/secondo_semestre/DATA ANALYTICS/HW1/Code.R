#' ---
#' title: "Homework 1 - Data Analytics"
#' author: "Ivan Santagati"
#' output: html_document
#' ---

# PUNTO 1:
# a) Mostra a schermo la sequenza di numeri naturali da 20 a 50
20:50

# b) Mostra a schermo la sequenza di numeri razionali da 20 a 50 intervallati 
# con distanza 0.01
seq(20, 50, by = 0.01)

# c) Salva in un vettore chiamato somma la somma dei numeri trovati al punto 
# b ed in media la loro media
numeri <- seq(20, 50, by = 0.01)
somma <- sum(numeri)
media <- mean(numeri)
somma
media


# PUNTO 2:
# Crea una funzione che calcola i primi n numeri di Fibonacci
fibonacci <- function(n) {
  if (n <= 0) return(numeric(0))
  if (n == 1) return(0)
  if (n == 2) return(c(0, 1))
  
  fib <- numeric(n)
  fib[1] <- 0
  fib[2] <- 1
  for (i in 3:n) {
    fib[i] <- fib[i - 1] + fib[i - 2]
  }
  return(fib)
}

# a) Output con anche somma e media dei primi n numeri
fibonacci_info <- function(n) {
  fib <- fibonacci(n)
  list(
    sequenza = fib,
    somma = sum(fib),
    media = mean(fib)
  )
}

# Esempio di utilizzo
fibonacci_info(10) # 10 numero di prova



# PUNTO 3:
# Crea una lista che contenga al suo interno un vettore di numeri casuali fra 
# 1 e 10, una matrice ed una lista di 3 cantanti. Poi assegna un nome per ogni 
# elemento della lista (ad esempio "Numeri","Matrice", "Cantanti")
numeri_casuali <- sample(1:10, size = 10, replace = TRUE)
matrice <- matrix(1:6, nrow = 2, ncol = 3)
cantanti <- list("Katy Perry", "Kesha", "Lady Gaga")

mia_lista <- list(
  Numeri = numeri_casuali,
  Matrice = matrice,
  Cantanti = cantanti
)

print(mia_lista)


# PUNTO 4:
# Considera il dataframe Life.csv caricato su Moodle. Importa il dataset 
# e svolgi i seguenti punti importiamo il dataset Life.csv || skip = 1 per 
# saltare la prima riga visto che contiene un commento
life <- read.csv("Life.csv", skip = 1, header = FALSE, na.strings = "9999", stringsAsFactors = FALSE)

# Rinomino le colonne per maggiore chiarezza
colnames(life) <- c("Codice", "Stato", "Anno", "AspettativaVita")

# a) Di che tipo sono le variabili? Alcune di esse possono essere 
# considerate come dei fattori?
str(life)  # Visualizzo i tipi di dati
# Convertiamo Stato e Anno in fattori, perché sono variabili categoriali
life$Stato <- as.factor(life$Stato)
life$Anno <- as.factor(life$Anno)

# b) Ci sono delle osservazioni mancanti? Cosa faresti per risolvere 
# il problema?
# I valori mancanti sono codificati con 9999 quindi li convertiamo in NA
life$AspettativaVita[life$AspettativaVita == 9999] <- NA

# Verifichiamo la presenza di NA
colSums(is.na(life))

# Rimuoviamoli delle righe con valori mancanti
life <- na.omit(life)

# c) Quante osservazioni ci sono per ogni stato? E per ogni anno?
table(life$Stato)  # Numero di osservazioni per Stato
table(life$Anno)   # Numero di osservazioni per Anno

# d) Calcola la media dell’aspettativa di vita per l’Australia. Come si 
# potrebbe confrontarla con quella degli altri Stati?
mean_aus <- mean(life$AspettativaVita[life$Stato == "Australia"])
mean_aus

# Calcolo della media dell’aspettativa di vita per ogni Stato
media_per_stato <- aggregate(AspettativaVita ~ Stato, data = life, mean)
head(media_per_stato)


# PUNTO 5:
# Costruisci una matrice 2 × 3 composta da multipli di 2
matrice_2x3 <- matrix(seq(2, 12, by = 2), nrow = 2, ncol = 3)
matrice_2x3

# a) Che cosa succede usando il comando is.matrix? E is.array?
is.matrix(matrice_2x3)  # TRUE: l'oggetto è una matrice
is.array(matrice_2x3)   # TRUE: ogni matrice in R è anche un array

# b) Estrai la terza colonna da questa matrice, chiamando l’oggetto estratto b. 
# Che tipo di oggetto è?
b <- matrice_2x3[, 3]
b

class(b)  # numeric, perché è un vettore

# c) Converti b in matrice
b_matrice <- matrix(b, ncol = 1)
b_matrice
is.matrix(b_matrice)


# PUNTO 6:
# Il file ‘nazioni.csv’ contiene informazioni su 105 Nazioni e per ognuna di 
# esse riporta: areaGeo: la regione geografica, reddito: il reddito pro capite 
# in dollari, infmort: il tasso di mortalità infantile (morti ogni 100 nascite), 
# oil: se il paese esporta petrolio (1: no; 2: sì)

# 6.1) Caricare i dati nello spazio di lavoro in un data frame chiamato 
# “nazioni”, stampare il numero di righe dell’oggetto importato ed il nome 
# delle variabili.
nazioni <- read.csv("nazioni.csv", stringsAsFactors = FALSE)
nrow(nazioni)       
names(nazioni)

# 6.2) Stampare il vettore con il numero di valori mancanti presenti in ogni 
# variabile.
colSums(is.na(nazioni))

# 6.3) Ottenere il nome dei Paesi in cui sono presenti valori mancanti.
nazioni[!complete.cases(nazioni), "nome"]

# 6.4) Eliminare i valori mancanti dal data set.
nazioni <- na.omit(nazioni)

# 6.5) Ottenere la distribuzione delle frequenze percentuali della variabile 
# ‘areaGeo’ ed ordinarle in ordine decrescente.
frequenze_percentuali <- prop.table(table(nazioni$areaGeo)) * 100
sort(frequenze_percentuali, decreasing = TRUE)

# 6.6) Convertire la variabile areaGeo in factor ordinando i livelli secondo 
# l’ordine ottenuto al punto precedente. Salvare il factor come nuova variabile 
# del data frame chiamata areaGeofact ed eliminare la variabile areaGeo.
# Ordine dei livelli secondo le frequenze decrescenti
ordine <- names(sort(frequenze_percentuali, decreasing = TRUE))

# Creiamo il factor ordinato
nazioni$areaGeofact <- factor(nazioni$areaGeo, levels = ordine, ordered = TRUE)

# Rimuoviamo la variabile areaGeo originale
nazioni$areaGeo <- NULL
str(nazioni$areaGeofact)  # Mostriamo i livelli ordinati del nuovo fattore

# 6.7) Convertire la variabile oil in factor utilizzando i livelli: “no” e 
# “yes”. Sovrascrivere la variabile oil già presente nel data.frame.
nazioni$oil <- factor(nazioni$oil, levels = c(1, 2), labels = c("no", "yes"))

# Controlliamo i livelli della nuova variabile
levels(nazioni$oil)

# Controllo generale della struttura per conferma
str(nazioni$oil)

# 6.8) Quali Paesi esportano petrolio e in quali regioni si trovano? Stampare 
# il risultato in due colonne.
petrol_exporters <- nazioni[nazioni$oil == "yes", c("nome", "areaGeofact")]

# Stampiamo le due colonne richieste: nome del Paese e regione geografica
print(petrol_exporters)

# 6.9) Calcolare il tasso di mortalità infantile medio in ogni area geografica.
# Usiamo aggregate() per raggruppare per areaGeofact e calcolare la media di infmort
media_infmort_per_area <- aggregate(infmort ~ areaGeofact, data = nazioni, FUN = mean)

# Stampiamo il risultato
print(media_infmort_per_area)

# 6.10) Quante nazioni hanno un tasso di mortalità infantile superiore 
# o uguale a 300?
nazioni_altissima_mortalita <- nazioni[nazioni$infmort >= 300, ]

# Stampiamo quante sono
nrow(nazioni_altissima_mortalita)

# Se vogliamo vedere anche i nomi dei Paesi:
nazioni_altissima_mortalita$nome

# 6.11) Quante delle nazioni identificate al punto 10 esportano petrolio?
nazioni_petrolio_e_mortalita <- nazioni_altissima_mortalita[nazioni_altissima_mortalita$oil == "yes", ]

nrow(nazioni_petrolio_e_mortalita) # numero

nazioni_petrolio_e_mortalita$nome # nomi

# 6.12) Dividere la finestra grafica in 2 righe e 2 colonne. In ogni spazio, 
# rappresentare con un boxplot la distribuzione della mortalità infantile 
# condizionata alla regione geografica. Impostare lo stesso range sull’asse y 
# ed il titolo del grafico.
par(mfrow = c(2, 2))
y_range <- range(nazioni$infmort, na.rm = TRUE)
livelli_area <- levels(nazioni$areaGeofact)

for (area in livelli_area) {
  boxplot(infmort ~ areaGeofact,
          data = subset(nazioni, areaGeofact == area),
          ylim = y_range,
          main = paste("Mortalità infantile -", area),
          ylab = "Tasso di mortalità")
}

# 6.13) Rappresentare con un istogramma la distribuzione del reddito. 
# Modificare l’etichetta dell’asse x con il nome della variabile ed eliminare 
# il titolo.
hist(nazioni$reddito, xlab = "Reddito pro capite (USD)", main = "", col = "lightblue", border = "white")


# 6.14) Aggiungere al grafico precedente le mediane del reddito per area 
# geografica utilizzando dei punti di colore diverso.
mediane <- tapply(nazioni$reddito, nazioni$areaGeofact, median)
points(mediane, rep(5, length(mediane)), col = 2:5, pch = 19, cex = 1.5)
legend("topright", legend = names(mediane), col = 2:5, pch = 19)


# 6.15) Dividere la variabile reddito in classi utilizzando le seguenti 
# categorie: “fino a 500”, “(500, 1500]”, “(1500, 4000]”, “4000 e più”. 
# Salvare la nuova variabile in un oggetto chiamato redditoCat.
nazioni$redditoCat <- cut(nazioni$reddito,
                          breaks = c(-Inf, 500, 1500, 4000, Inf),
                          labels = c("fino a 500", "(500, 1500]", "(1500, 4000]", "4000 e più"))


# 6.16)  Quante nazioni sono nella categoria “4000 e più”? E qual è la loro 
# distribuzione per area geografica?
sum(nazioni$redditoCat == "4000 e più")
table(nazioni$areaGeofact[nazioni$redditoCat == "4000 e più"])


# 6.17) Stampare le distribuzioni condizionate della variabile redditoCat 
# rispetto all’esportazione di petrolio approssimandole a 2 cifre decimali.
round(prop.table(table(nazioni$redditoCat, nazioni$oil), margin = 2) * 100, 2)




