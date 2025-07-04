class ExamException(Exception):
    pass

# clsse per la gestione del file csv
class CSVTimeSeriesFile:
    def __init__ (self, name):
        self.name = name

        # print(name) # solo un controllo
        try:
            with open(self.name, 'r') as f:
                lines = f.readlines()
                if not lines or all(line.strip() == '' for line in lines):
                    raise ExamException ("Il file è vuoto o non contiene dati validi")
        except:
            raise ExamException ("Errore: impossibile aprire il file")
    
    def get_data (self, city):
        result = []
        city_found = False

        try:
            with open(self.name, 'r') as f:
                for line in f:
                    elements = line.strip().split(',')

                    if len(elements) < 7 or elements[0] == 'dt':
                        pass

                    date = elements[0]
                    temp_str = elements[1]
                    record_city = elements[2]

                    if record_city != city:
                        pass

                    city_found = True

                    try:
                        temp = float(temp_str)
                        result.append([date, temp])
                    except:
                        pass

        except:
            print("apriro: ", self.name)
            raise ExamException ("Errore (controlli): impossibile aprire il file")
        
        if not city_found:
            raise ExamException ("Errore: il nome della citta' non e' presente nel file")
        
        return result
    

def compute_slope(time_series, first_year, last_year):
    # validazione del nostro imput imput
    if not isinstance(first_year, int) or not isinstance(last_year, int):
        raise ExamException ("Gli anni devono essere interi")
    
    if first_year > last_year:
        raise ExamException ("L'intervallo degli anni non è valido")
    
    # raggruppo i dati per anno
    dati_annuali = {}
    for date, temp in time_series:
        try:
            year = int(date[:4])
        except:
            pass
    
        if first_year <= year <= last_year:
            if year not in dati_annuali:
                dati_annuali[year] =[]
            dati_annuali[year].append(temp)

    # calcoliamo la media solo per anni con almeno 6 misurazioni mensili
    medie = {}
    for year, temps in dati_annuali.items():
        if len(temps) >= 6:
            medie[year]= sum(temps)/len(temps)

    if len(medie) == 0:
        raise ExamException ("Nessun anno con almeno 6 misurazioni")
    
    #
    xi = sorted(medie.keys())
    yi = [medie[year] for year in xi]

    n = len(xi)
    x_mean = sum(xi) / n
    y_mean = sum(yi) / n

    # calcolo di m
    numeratore = sum((x - x_mean) * (y - y_mean) for x, y in zip(xi, yi))
    denominatore = sum((x - x_mean) ** 2 for x in xi)

    if denominatore == 0:
        raise ExamException ("Il denominatore è pari a 0")
    
    m = numeratore / denominatore
    return m


if __name__ == "__main__":
    try:
        time_series_file = CSVTimeSeriesFile(name="GlobalLandTemperaturesByMajorCity.csv")
        dati = time_series_file.get_data(city="Rome")
        coefficiente = compute_slope(dati, 1950, 2010 )
        print("Coefficiente angolare: ", round(coefficiente, 4))
    
    except Exception as e:
        print("errore: ", e)