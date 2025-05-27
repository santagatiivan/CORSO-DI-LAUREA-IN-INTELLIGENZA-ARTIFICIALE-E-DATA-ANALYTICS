#' ---
#' title: "Homework 2 - Data Analytics"
#' author: "Ivan Santagati"
#' ---

# PUNTO 1: 
# Si svolga l’analisi univariata di ciascuna variabile, proponendo visualizzazioni dei dati adeguate.

# Importazione dati
dati_fev <- read.csv("fev.csv")

# Panoramica statistica
summary(dati_fev)

# Grafici per variabili continue
numerici <- c("AGE", "FEV", "HEIGHT")
for (var in numerici) {
  hist(dati_fev[[var]],
       main=paste("Distribuzione di", var),
       xlab=var, col="skyblue", border="white")
}

# Grafici per variabili categoriche
barplot(table(dati_fev$SEX), main="Sesso (conteggio)", col=c("mistyrose", "lightsteelblue"))
barplot(table(dati_fev$SMOKE), main="Fumo (conteggio)", col="khaki")

# PUNTO 2: 
# Si usi uno strumento grafico per evidenziare le eventuali differenze nella capacità polmonare per i maschi e le femmine.

boxplot(FEV ~ SEX, data=dati_fev,
        main="Capacità polmonare per genere",
        col=c("mistyrose", "lightsteelblue"),
        ylab="Litri", xlab="Genere")

# PUNTO 3: 
# Si conduca una analisi di regressione per prevedere la capacità polmonare utlizzando come predittore la statura e si fornisca la rappresentazione grafica e gli indici per valutare la qualità di tale rappresentazione. Cosa succede se la statura viene trasformata in centimetri?

mod_lineare <- lm(FEV ~ HEIGHT, data=dati_fev)
summary(mod_lineare)

plot(dati_fev$HEIGHT, dati_fev$FEV,
     main="Modello lineare: FEV vs Altezza",
     xlab="Altezza (inches)", ylab="FEV",
     pch=20, col="grey40")
abline(mod_lineare, col="darkblue", lwd=2)

# PUNTO 4:
# Si calcolino i residui della regressione di cui al punto 3 e si produca un grafico con sull’asse orizzontale il valore della variabile dipendente e su quello verticale i residui. Si aggiunga al grafico due linee orizzontali in corrispondenza di più o meno la radice quadrata della varianza dei residui.

dati_fev$ALT_CM <- dati_fev$HEIGHT * 2.54
mod_cm <- lm(FEV ~ ALT_CM, data=dati_fev)
summary(mod_cm)

plot(dati_fev$ALT_CM, dati_fev$FEV,
     main="FEV vs Altezza (in cm)",
     xlab="Altezza (cm)", ylab="FEV",
     pch=20, col="tomato")
abline(mod_cm, col="darkred", lwd=2)

# PUNTO 5: 
# Si ipotizzi che la relazione fra le due variabili non sia lineare, ma lineare a tratti. Cioè si immagini che vi sia una relazione lineare per le stature fino a 63 pollici e un’altra per le stature oltre 63. Si svolga l’analisi e si rappresenti questa su un grafico.

residui <- residuals(mod_lineare)
sigma <- sd(residui)

plot(dati_fev$FEV, residui,
     main="Analisi dei residui",
     xlab="Valore osservato (FEV)",
     ylab="Residui", pch=19, col="seagreen")
abline(h=0, lty=2)
abline(h=sigma, col="red", lty=3)
abline(h=-sigma, col="red", lty=3)

# PUNTO 6: 
# Si valuti la qualità della regressione a tratti con un opportuno misura in cui la qualità dipende dalla distanza del valore osservato da quello previsto al quadrato. Si confronti con quanto ottenuto al punto 3 e si commenti.

parte1 <- subset(dati_fev, HEIGHT <= 63)
parte2 <- subset(dati_fev, HEIGHT > 63)

mod1 <- lm(FEV ~ HEIGHT, data=parte1)
mod2 <- lm(FEV ~ HEIGHT, data=parte2)

plot(dati_fev$HEIGHT, dati_fev$FEV,
     main="Segmentazione lineare (altezza 63)",
     xlab="Altezza", ylab="FEV",
     col="grey70", pch=16)

abline(mod1, col="navy", lwd=2)
abline(mod2, col="forestgreen", lwd=2)

# MSE
pred1 <- predict(mod1, newdata=parte1)
pred2 <- predict(mod2, newdata=parte2)
mse_tratti <- mean(c((parte1$FEV - pred1)^2, (parte2$FEV - pred2)^2))
mse_tratti

# PUNTO 7: 
# Si svolga una analisi come al punto 5 ma imponendo che fra la seconda retta di regressione (quella per i soggetti più alti) e la prima (per i soggetti bassi non vi sia discontinuità). Ovvero la retta di regressione fino a 63 ha in quel punto lo stesso valore della retta che parte da 63 in poi. Anche in questo caso si misuri la qualità della analisi e si confronti.

dati_fev$diff63 <- ifelse(dati_fev$HEIGHT > 63, dati_fev$HEIGHT - 63, 0)
mod_cont <- lm(FEV ~ HEIGHT + diff63, data=dati_fev)

summary(mod_cont)

# Predizione e grafico
df_sorted <- dati_fev[order(dati_fev$HEIGHT), ]
pred_c <- predict(mod_cont, newdata=df_sorted)

plot(dati_fev$HEIGHT, dati_fev$FEV,
     main="Segmentazione continua a 63",
     xlab="Altezza", ylab="FEV",
     pch=16, col="gray60")
lines(df_sorted$HEIGHT, pred_c, col="orange", lwd=2)

# MSE
mse_cont <- mean((df_sorted$FEV - pred_c)^2)
mse_cont

