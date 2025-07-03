
# ##########
# FUNZIONE #
############
funzione <- function(Y, X) {
  if (!is.numeric(Y)) stop("Y deve essere numerica")
  if (!is.factor(X)) X <- as.factor(X)
  
  complete <- complete.cases(Y, X)
  Y <- Y[complete]
  X <- X[complete]
  
  livelli <- levels(X)
  output <- matrix(nrow = length(livelli), ncol = 3)
  rownames(output) <- livelli
  colnames(output) <- c("Media", "Mediana", "SD")
  
  for (i in seq_along(livelli)) {
    valori <- Y[X == livelli[i]]
    output[i, ] <- c(mean(valori), median(valori), sd(valori))
  }
  
  return(output)
}


####################
# ANALISI DEI DATI #
####################
df <- read.csv("fev.csv")
df <- na.omit(df)

# 1. Devianza della variabile FEV
dev.tot <- sum((df$FEV - mean(df$FEV))^2)
print(dev.tot)

# 2. Correlazioni tra variabili quantitative
print(cor(df$AGE, df$FEV))
print(cor(df$AGE, df$HEIGHT))
print(cor(df$FEV, df$HEIGHT))

# 3. Differenza tra 80° e 20° percentile di FEV
print(diff(quantile(df$FEV, probs = c(0.2, 0.8))))

# 4. Odds ratio tra SMOKE e SEX
tab <- table(df$SMOKE, df$SEX)
odds_ratio <- (tab[2,2] * tab[1,1]) / (tab[2,1] * tab[1,2])
print(odds_ratio)

# 5. Media FEV per combinazione SEX + SMOKE
df$group <- paste0(substr(df$SEX, 1, 1), " e ", df$SMOKE)
print(tapply(df$FEV, df$group, mean))

# 6. Regressione multipla: FEV ~ HEIGHT + SEX
df$SEX_binary <- ifelse(df$SEX == "Male", 1, 0)
mod <- lm(FEV ~ HEIGHT + SEX_binary, data = df)
summary(mod)

dev.tot <- sum((df$FEV - mean(df$FEV))^2)
dev.spe <- summary(mod)$r.squared * dev.tot
dev.res <- dev.tot - dev.spe

percentuale_spiegata <- dev.spe / dev.tot * 100
percentuale_residua <- 100 - percentuale_spiegata

print(dev.spe)
print(percentuale_residua)
