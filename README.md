# Information Retrieval: homework 1
Autore: Mario Avdullaj

## Risultati

In questa repository è possibile visionare la relazione del primo homework di IR in /Relazione_Mario_Avdullaj.pdf. Inoltre, è possibile visionare i risultati delle varie run eseguite per l'homework , oltre ai vari script utilizzati per parsare ed automatizzare il processo di Retrieval, Evaluation e test statistico ANOVA. In particolare, i risultati sono ispezionabili nella cartella terrier-core-4.4/var/results, ove si possono trovare i file di properties ed eval; i risultati parsati ed i grafici derivanti dal test ANOVA invece sono visionabili all'interno della cartella /data_results.

## Ambiente di lavoro

Per effettuare l'esperimento sulla collezione TREC7, sono stati creati tre indici diversi, settando opportunamente il file in etc/terrier.properties. In seguito, sono stati creati i segueti script per l'automatismo del resto delle fasi:
  - terrier-core-4.4/all_exec.sh
  - terrier-core-4.4/all_exec2.sh

Questi due semplici shell script hanno la funzione di eseguire le varie fasi si retrieval ed evaluation, variando i parametri di linea di comando impostati per il programma terrier-core-4.4/bin/trec_terrier.sh.

Inoltre è stato creato uno script in Python, /parser.py, per il parsing dei risultati, in modo da utilizzarli in seguito negli script Matlab forniti dal Professor. Nicola Ferro per il test ANOVA.

Lo script /get_data.sh si occupa di eseguire i due script sopracitati, utilizzare lo script di parsing per parsare i vari risultati ed infine organizzarli in cartelle strutturate.

Infine, sono stati creati due script Matlab /process_anova1.m e /process_anova2.m per il caricamento automatico nello stack delle matrici di valori utilizzati poi per effettuare i test statistici con lo script /ir_anova.m
