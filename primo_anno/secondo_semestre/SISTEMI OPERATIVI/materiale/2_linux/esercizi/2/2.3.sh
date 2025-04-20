nano Scrivania/prova                     # crea un file .txt sul desktop e si apre l'editor
# scriviamo una stringa, salviamo e chiudiamo l'editor
ln -s Scrivania/prova Scrivania/Slink    # soft link
rm Scrivania/prova                       # cancelliamo il file
cat Scrivania/Slink                      # cat: link: File o directory non esistente (quello a cui punta non esiste più)
nano Scrivania/prova
ln Scrivania/prova Scrivania/Hlink       # hard link
rm Scrivania/prova
cat Scrivania/Hlink                      # funziona perché hardlink non è un puntatore ma è una "copia" del file
                 