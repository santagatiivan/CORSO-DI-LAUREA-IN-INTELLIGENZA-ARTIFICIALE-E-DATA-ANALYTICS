# Strutture di controllo in R -----
#
# - if/else
# - while e repeat
# - cicli for
# - break e next
# - apply
## 

## if/ifelse -----
# Se la condizione è vera il codice viene eseguito. La sintassi è:

# if (cond)  code

x <- 2
x <- c(2,3)
if (x<3) print("x is less than 3")
x <- 4
if (x<3) print("x is less than 3")

# Possiamo specificare anche un'istruzione da eseguire se la condizione è falsa
 
x <- 2
if (x<3) print("x is less than 3") else print("x is no less than 3")
x <- 4
if (x<3) print("x is less than 3") else print("x is no less than 3")


# if else restituisce in output l'ultima istruzione eseguita, che può essere salvata in un oggetto

x <- 4
a <- if (x<3) "x less than 3" else "x no less than 3"
a

b <- if (x<3) "x less than 3" #return NULL
b

x <- 2
c <- if (x<3){
  print(x)
  "x less than 3"
  } else {
    "x no less than 3"
    }
c

# equivalentemente 
if (x<3) a <- "x is less than 3" else a <- "x no less than 3"
a <- if( ...) ...

#ifelse

b <- ifelse(x<3, "x is less than 3", "x no less than 3")
b

### if-else annidati -----
x <- 6
if (x<3) {
  print("x is less than 3")
} else if (x==3) {
  print("x is equal to 3")
} else {
  print("x is greater than 3")
}

## while e repeat -----

# il comando while esegue le istruzioni finchè la condizione è vera. La sintassi è

# while (cond) code

i=0
while (i<6)  {
  i<- i+1
  print(i)
  }

# Il comando repeat esegue le istruzioni finchè non incontra l'istruzione break. 
# La sintassi è

# repeat {
#   code
#     if (cond) break
# }

# Notare che l'istruzione repeat non ha una condizione di stop, 
# l'istruzione break deve quindi essere inserita per interromperne l'esecuzione 

i=0
repeat {
  i<- i+1
  print(i)
  if (i>5) break
}

## Cicli for ----

# Il codice del ciclo for viene eseguito finchè ci sono elementi in <vector> e 
# l'indice <varname> scorre ad ogni iterazione su un elemento di <vector>

# for (<varname> in <vector>) {
#   code to be executed
# }

for (i in 1:5) {
  print(i)
}

# <vector> può essere di qualunque tipo 

xval <- c("a","b","c","d","e")
for (i in xval) print(i)

# Con la funzione get() possiamo costruire un ciclo for anche su diversi oggetti

square <- function(x) x^2
cube <- function (x) x^3
doublesquare <- function(x) x^4

for (name in c("square","cube","doublesquare", "mean")){
  f <- get(name)
  print(f(2))
}

# La funzione get() prende in input una stringa e restituisce l'oggetto con quel nome
# (o un errore)

### Cicli for annidati -----

xval <- c("a","b","c","d","e")
for (i in 1:5)
  for (j in xval) print(paste(i,j))


## Modificatori: `break` e `next` -----
# Abbiamo già incontrato break con il comando repeat ma può essere utilizzato anche 
# con while e for
i=0
while (TRUE) {
  i<- i+1
  print(i)
  if (i>5) break
}
 
for (i in 1:10) {
  print(i)
  if (i>5) break
}

# next permette di interropere l'iterazione attuale e andare all'iterazione successiva

# lo stesso output può essere ottenuto con le tre istruzioni cicliche:
i=0
repeat {
  i<- i+1
  if (i==3) next
  print(i)
  if (i>5) break
}
 

# la famiglia delle funzioni apply come alternativa ai cicli for

# apply
# lapply / vapply / sapply / mapply
# tapply

# `apply` è utilizzato come un ciclo su uno o più indici di un array

z <- matrix(1:50,nrow=10,ncol=5)
v1 <- apply(z,2,mean) ; v1
v1 <- apply(z,2,sd) ; v1

z[1,1] <- NA
v1 <- apply(z,2,mean) ; v1
v1 <- apply(z,2,mean, na.rm = T) 
v2 <- c()
for (i in 1:ncol(z)) v2[i] <- mean(z[,i], na.rm =T)
v1
v2

system.time({
  for (i in 1:ncol(z)) v2[i] <- mean(z[,i])
})

system.time({
  v1 <- apply(z,2,mean)
})

# alcuni esempi
apply(z,1,sum, na.rm=T)
apply(z, 2, FUN = function(x) x^2)

apply(z, 2, FUN = function(x) x-min(x))
apply(z, 2, FUN = function(x) (x-mean(x))/sd(x))
apply(z, 2, scale)

# `lapply` è utilizzato come un ciclo sugli elementi di una lista e 
# restuisce una lista con lo stesso numero di elementi della lista originale
# in cui ogni elemento è il risultato della funzione (`FUN`) valutata su ogni 
# elemento della lista originale
 
# `apply(X,FUN=...)`

x <- as.list(1:5)
v1 <- lapply(x, log)
v2 <- list()
for (i in seq_along(x)) v2[[i]] <- log(x[[i]])
v1;v2

# sapply è analoga ad lapply ma restituisce in 
# output un vettore/matrice/array (quando possibile)

sapply(x, log); 
sapply(3:9, seq) 

mapply(rep, 1:4,  4:1)


## Esercizio ----

#1. Scrivere una funzione che prenda in input un dataset e restituisca un data
# frame con colonne il minimo,  il massimo, la media e i tre quartili di ogni 
# variabile numerica
#2. Verifica il funzionamento della funzione sul dataset Insurance disponibile 
# nel pacchetto MASS
#3. Creare un unico livello per i distretti 1 e 2 
#4. senza utilizzare cicli for, creare una variabile binaria che indica se i 
# Claims sono maggiori di 10 ed aggiungerla al dataframe