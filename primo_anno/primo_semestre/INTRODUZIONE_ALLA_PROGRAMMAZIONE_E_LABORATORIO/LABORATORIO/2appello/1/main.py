# Definizione di una eccezione personalizzata richiesta dalla traccia
class ExamException(Exception):
    pass


# Classe per la lettura e gestione dei dati dal file CSV
class CSVTimeSeriesFile:
    def __init__(self, name):
        # Salva il nome del file
        self.name = name

        # Controlla se il file esiste ed è leggibile, altrimenti solleva un'eccezione
        try:
            with open(self.name, 'r') as file:
                lines = file.readlines()
                if not lines or all(line.strip() == '' for line in lines):
                    raise ExamException("Errore: il file è vuoto o non contiene dati validi")
        except Exception:
            raise ExamException("Errore: impossibile aprire il file")

    # Metodo per estrarre i dati relativi ad un singolo paese
    def get_data(self, country):
        result = []
        country_found = False

        # Legge il file riga per riga
        try:
            with open(self.name, 'r') as file:
                for line in file:
                    elements = line.strip().split(',')

                    # Salta righe malformate o l'intestazione
                    if len(elements) < 3 or elements[0] == 'dt':  
                        continue

                    date = elements[0]
                    temp_str = elements[1]
                    record_country = elements[2]

                    # Se il paese non corrisponde a quello richiesto, salta la riga
                    if record_country != country:
                        continue

                    country_found = True

                    # Tenta la conversione della temperatura a float, scartando errori
                    try:
                        temperature = float(temp_str)
                    except:
                        continue

                    result.append([date, temperature])
        except:
            raise ExamException("Errore: impossibile aprire il file")

        # Se il paese non è mai stato trovato nel file, solleva un'eccezione
        if not country_found:
            raise ExamException("Errore: il nome del paese non è presente nel file")

        return result


# Funzione per calcolare le variazioni tra due serie temporali annuali
def compute_variations(time_series_1, time_series_2, first_year, last_year):
    # Controlli sull'intervallo degli anni
    if not isinstance(first_year, int) or not isinstance(last_year, int):
        raise ExamException("Errore: almeno uno degli anni inseriti non è un intero")
    try:
        first_year = int(first_year)
        last_year = int(last_year)
        if first_year > last_year:
            raise ExamException("Errore: intervallo non valido")
    except:
        raise ExamException("Errore: intervallo non valido")

    # Funzione interna per calcolare le medie annuali per una serie temporale
    def calcolo_medie_annuali(serie):
        dati = {}
        for date, temp in serie:
            try:
                anno = int(date[:4])
                if first_year <= anno <= last_year:
                    if anno not in dati:
                        dati[anno] = []
                    dati[anno].append(temp)
            except:
                continue
        medie = {}
        for anno, temps in dati.items():
            if temps:
                medie[anno] = sum(temps) / len(temps)
        return medie

    # Calcolo delle medie annuali per le due serie
    media_1 = calcolo_medie_annuali(time_series_1)
    media_2 = calcolo_medie_annuali(time_series_2)

    risultato = {}
    valori_validi = 0

    # Calcolo della variazione (media2 - media1) solo per gli anni comuni
    for anno in range(first_year, last_year + 1):
        if anno in media_1 and anno in media_2:
            diff = media_2[anno] - media_1[anno]
            risultato[anno] = diff
            valori_validi += 1

    # Se nessun anno è stato elaborato, solleva un'eccezione
    if valori_validi == 0:
        raise ExamException("Errore: l'intervallo selezionato non contiene valori validi")

    return risultato


# Parte eseguibile per testare il programma
if __name__ == "__main__":
    # Istanzia l'oggetto con il nome del file
    time_series_file = CSVTimeSeriesFile(name="GlobalLandTemperaturesByCountry.csv")

    # Estrae i dati per due paesi
    time_series_italy = time_series_file.get_data(country="Italy")
    time_series_slovenia = time_series_file.get_data(country="Slovenia")

    # Calcola e stampa le variazioni tra le due serie temporali
    try:
        variazioni = compute_variations(time_series_italy, time_series_slovenia, 1900, 1950)
        for anno, valore in variazioni.items():
            print(f"{anno}: {valore:.2f}")
    except ExamException as e:
        print("Errore:", e)
