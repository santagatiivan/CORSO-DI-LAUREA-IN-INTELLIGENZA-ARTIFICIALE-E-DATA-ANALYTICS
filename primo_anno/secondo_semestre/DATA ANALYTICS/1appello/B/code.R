
# ##########
# FUNZIONE #
############
funzione <- function(n, p) {
  if (n <= 1 || p <= 0) stop("I parametri non rispettano le condizioni")
  
  mat <- matrix(rnorm(n * p, mean = 0, sd = 1), nrow = n, ncol = p)
  medie <- colMeans(mat)
  varianze <- apply(mat, 2, var)
  correlazioni <- cor(mat)
  
  return(list(
    matrice = mat,
    medie_colonne = medie,
    varianze_colonne = varianze,
    correlazioni = correlazioni
  ))
}

funzione(2, 1)

X <- data.frame(y = factor(c("a", "b", "c", "d", "e", "b", "d")), val = 1:7)
X[X$y %in% levels(X$y)[c(2, 4)], ]


####################
# ANALISI DEI DATI #
####################
df <- read.csv("fev.csv")
df <- na.omit(df)

# 1. Devianza totale di HEIGHT
dev.tot <- sum((df$HEIGHT - mean(df$HEIGHT))^2)
print(dev.tot)

# 2. Standardizzazione e matrice di covarianza
vars <- df[, c("AGE", "FEV", "HEIGHT")]
vars_std <- scale(vars)
cov_matrix <- cov(vars_std)
print(cov_matrix)

# 3. Statistica chi-quadro tra SMOKE e SEX
Xtest <- chisq.test(table(df$SMOKE, df$SEX))
print(Xtest$statistic)

# 4. Indice di asimmetria K su FEV
q10 <- quantile(df$FEV, probs = 0.1)
q50 <- quantile(df$FEV, probs = 0.5)
q90 <- quantile(df$FEV, probs = 0.9)
K <- (q90 + q10 - 2 * q50) / (q90 - q10)
print(K)

# 5. Media FEV per gruppo combinato SEX e SMOKE
df$group <- paste0(substr(df$SEX, 1, 1), " e ", df$SMOKE)
print(tapply(df$FEV, df$group, mean))

# 6. Regressione multipla: FEV ~ AGE + SMOKE
df$SMOKE_binary <- ifelse(df$SMOKE == "Smoker", 1, 0)
mod <- lm(FEV ~ AGE + SMOKE_binary, data = df)
summary(mod)

dev.tot <- sum((df$FEV - mean(df$FEV))^2)
devianza.spiegata <- sum((fitted(mod) - mean(df$FEV))^2)
dev.res <- sum(residuals(mod)^2)

percentuale_spiegata <- devianza.spiegata / dev.tot * 100
percentuale_residua <- 100 - percentuale_spiegata

print(devianza.spiegata)
print(percentuale_residua)