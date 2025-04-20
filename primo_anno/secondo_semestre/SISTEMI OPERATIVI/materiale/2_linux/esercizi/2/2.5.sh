sudo groupadd studenti                  # creiamo un gruppo studenti
sudo useradd -m -g studenti studente    # creo un utente (studente) e lo metto nel gruppo (studenti)
# è necessario utilizzare sudo perché per modificare utenti e gruppi del sistema richiede privilegi amministrativi
ls -ld /home/studente                   # -l long per vedere in esteso -d directory per vedere le proprietà e non il contenuto
sudo chmod a+rwx /home/studente         # chmod per cambiare permessi ed a si riferisce ad users, groups e others
ls -ld /home/studente

