# Funzioni ------

# In R è possibile creare proprie funzioni ed organizzarle in pacchetti.
# I pacchetti possono essere pubblicati sul CRAN per renderli disponibili

# Le funzioni vengono salvate all'interno di oggetti nel workspace.
# La sintassi per scrivere una funzione è la seguente:

# function.name <- function(arg1, arg2, ...){ }

cube<-function(x)
{
  y<-x^3
  return(y)
} 
b <- cube(3)

# equivalentemente
cube<-function(x)
{
  return(x^3)
}

cube(2)

# senza return la funzione restituisce in output l'ultima istruzione eseguita
power <- function(x, exp){  
  x^exp
}
power(2,2)
a <- power(2,2); a

power <- function(x, exp=1){ # valore di default
  y<-x^exp
  return(y) 
}
a <- power(2,2); a

# se vogliamo in output più oggetti, vanno organizzati in un unico oggetto

power <- function(x, exp = 1){
  y<-x^exp
  return(c(result = y, input = x, exp = exp))
  
}

power(2,2)
a <- power(2,2); a

# scriviamo una funzione per calcolare la media di un vettore




## Esercizio -----
# Scrivere una funzione che restituisca la varianza di un insieme di n osservazioni
# e confrontare il risultato con quello ottenuto dalla funzione presente in R: var()
