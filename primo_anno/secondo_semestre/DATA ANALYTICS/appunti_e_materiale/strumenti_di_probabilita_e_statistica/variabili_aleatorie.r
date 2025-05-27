# Distribuzioni di probabilità discrete ----

## Binomial distribution ----

# X ~ Binom(20,0.5); 
choose(20,5)*0.5^5*(1-0.5)^15 #P(X=5)

#definiamo una sequenza di interi da 0 a 20
x <- c(0:20)

#valutiamo ed assegnamo al vettore 'pbin' la P(X=x) per x:0,...,20
pbin <- choose(20,x)*.50^x*(1-.50)^(20-x)
pbin

# come valutiamo che si tratta di una distribuzione di probabilità?

plot(0:20, pbin, type="h")

# definiamo la funzione binomiale
#binomiale <- 

binomiale(5,20,0.5)
choose(20,5)*0.5^5*(1-0.5)^15 #P(X=5)

# Calcola la probabilità di ottenere due volte 6 lanciando 15 volte un dado regolare a 6 facce
# X ~ Binom(...,...)


# Le funzioni definite in R solitamente contengono il nome della famiglia di 
# variabili aleatorie preceduto da 4 diversi prefissi che indicano il tipo di 
# funzione. 
# Quando il nome della famiglia è preceduto da:
# - "d" viene calcolata la probabilità (o la densità)
# - "p" la funzione di ripartizione
# - "q" la funzione quantile
# - "r" genera valori casuali

dbinom(5,20,0.5)

?Distributions  

# Generiamo valori casuali da un dato modello aleatorio:
# simuliamo una sequenza di 100 lanci di una moneta ('testa' o 'croce') 
# generando una realizzazione di Bernoulli con $p=0.5$ 

prova <- rbinom(100,1,.5)
prova  

### Esercizio ----

# Replicare quanto fatto per la distribuzione Binomiale per la distribuzione di Poisson:
# - scrivere una funzione che valuti la funzione di probabilità di una Poisson
# - rappresentare graficamente la funzione di probabilità
# Extra: - dimostrare che una distribuzione Binomiale con $n$ grande e $p$ (o $1-p$) 
# può essere ben approssimata da una Poisson con media $np$. 
# Si utilizzi ad esempio  $n=100$ e $p=0.02$ e si confrontino i risultati graficamente.

# Distribuzioni di probabilità continue ----

xx <- seq(-5,5,.01)
plot(xx,dnorm(xx,-2,1), type="l", xlim=c(-6,6))
points(xx,dnorm(xx,0,1), type="l", lty=2, col=2, lwd=3)
points(xx,dnorm(xx,2,1), type="l", lty=3, col=3, lwd=3)

#in alternativa
curve(dnorm(x,-1,1.5),col=4, lwd=3, lty=4, add=T)

# funzione di ripartizione
curve(pnorm(x,-1,1.5), col=4, lwd=3, lty=4, xlim = c(-4,4))

### Esercizio ----
# Calcolare le sequenti quantità per X ~ N(170,100):
# - Pr(X <= 185)

# - Pr(165 <= X <= 190)

# - 99-esimo percentile di X

# - scarto interquartile di X

## Generazione di numeri (pseudo) casuali ----

### Uniforme ----
# Generiamo numeri casuali da una distribuzione uniforme in 0,1 e verifichiamo 
# la proporzione dei valori che si trovano al di sotto del valore 0.4

# Ci aspettiamo che circa il ... % dei valori sia inferiore a 0.4
set.seed(14)
simu <- runif(500,0,1)
sum(simu<.4)/length(simu)

### Poisson ----
# Generiamo numeri casuali da una Poisson con media 5 e confrontiamo i risultati
# con la distribuzione teorica di una Poisson con stessa media

set.seed(3)
n <- 500
dati.pois <- rpois(n,5)
tab <- table(dati.pois) # distribuzione di frequenze
tab

tabo <- as.data.frame(tab)
# convertiamo i valori in 'numeric' 
punti <- as.numeric(levels(tabo$dati.pois))
freq <- as.numeric(tab/n)
# rappresentiamo graficamente le frequenze
plot(punti, freq, type="h", ylab="probability", xlab="x", 
     xlim=c(0,13))

#aggiungiamo la funzione di probabilità per una Poisson con media 5 solo per 
# i punti osservati
points(punti+.1,dpois(punti,5),type="h",col=2, lwd=3) 

### Normale ----

# Generiamo 800 valori casuali da una Gaussiana con media 10 e varianza 25
# Confrontiamo l'istogramma dei valori ottenuti con la funzione di densità 
# teorica della Normale.