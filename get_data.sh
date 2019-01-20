#!/bin/bash
rm -r data_results
mkdir data_results
mkdir data_results/RUN1
mkdir data_results/RUN1/AP
mkdir data_results/RUN1/P10
mkdir data_results/RUN1/RPREC
mkdir data_results/RUN1/ANOVA1
mkdir data_results/RUN2
mkdir data_results/RUN2/AP
mkdir data_results/RUN2/P10
mkdir data_results/RUN2/RPREC
mkdir data_results/RUN2/ANOVA1


./terrier-core-4.4/all_exec.sh

python parser.py ./terrier-core-4.4/var/results_BM25_SL+STEM/BM25b0.75_0.eval BM25_SL+STEM
python parser.py ./terrier-core-4.4/var/results_BM25_NO-SL+STEM/BM25b0.75_0.eval BM25_NO-SL+STEM
python parser.py ./terrier-core-4.4/var/results_TF_IDF_NO-SL+NO-STEM/TF_IDF_0.eval TF_IDF_NO-SL+NO-STEM
python parser.py ./terrier-core-4.4/var/results_TF_IDF_SL+STEM/TF_IDF_0.eval TF_IDF_SL+STEM

mv AP_BM25_SL+STEM data_results/RUN1/AP/AP_BM25_SL+STEM
mv AP_BM25_NO-SL+STEM data_results/RUN1/AP/AP_BM25_NO-SL+STEM
mv AP_TF_IDF_NO-SL+NO-STEM data_results/RUN1/AP/AP_TF_IDF_NO-SL+NO-STEM
mv AP_TF_IDF_SL+STEM data_results/RUN1/AP/AP_TF_IDF_SL+STEM

mv prec_BM25_SL+STEM data_results/RUN1/RPREC/RPREC_BM25_SL+STEM
mv prec_BM25_NO-SL+STEM data_results/RUN1/RPREC/RPREC_BM25_NO-SL+STEM
mv prec_TF_IDF_NO-SL+NO-STEM data_results/RUN1/RPREC/RPREC_TF_IDF_NO-SL+NO-STEM
mv prec_TF_IDF_SL+STEM data_results/RUN1/RPREC/RPREC_TF_IDF_SL+STEM

mv p10_BM25_SL+STEM data_results/RUN1/P10/P10_BM25_SL+STEM
mv p10_BM25_NO-SL+STEM data_results/RUN1/P10/P10_BM25_NO-SL+STEM
mv p10_TF_IDF_NO-SL+NO-STEM data_results/RUN1/P10/P10_TF_IDF_NO-SL+NO-STEM
mv p10_TF_IDF_SL+STEM data_results/RUN1/P10/P10_TF_IDF_SL+STEM


./terrier-core-4.4/all_exec2.sh

python parser.py ./terrier-core-4.4/var/results_BM25_SL+STEM2/BM25b0.75_0.eval BM25_SL+STEM
python parser.py ./terrier-core-4.4/var/results_BM25_NO-SL+STEM2/BM25b0.75_0.eval BM25_NO-SL+STEM
python parser.py ./terrier-core-4.4/var/results_TF_IDF_NO-SL+NO-STEM2/TF_IDF_0.eval TF_IDF_NO-SL+NO-STEM
python parser.py ./terrier-core-4.4/var/results_TF_IDF_SL+STEM2/TF_IDF_0.eval TF_IDF_SL+STEM

mv AP_BM25_SL+STEM data_results/RUN2/AP/AP_BM25_SL+STEM
mv AP_BM25_NO-SL+STEM data_results/RUN2/AP/AP_BM25_NO-SL+STEM
mv AP_TF_IDF_NO-SL+NO-STEM data_results/RUN2/AP/AP_TF_IDF_NO-SL+NO-STEM
mv AP_TF_IDF_SL+STEM data_results/RUN2/AP/AP_TF_IDF_SL+STEM

mv prec_BM25_SL+STEM data_results/RUN2/RPREC/RPREC_BM25_SL+STEM
mv prec_BM25_NO-SL+STEM data_results/RUN2/RPREC/RPREC_BM25_NO-SL+STEM
mv prec_TF_IDF_NO-SL+NO-STEM data_results/RUN2/RPREC/RPREC_TF_IDF_NO-SL+NO-STEM
mv prec_TF_IDF_SL+STEM data_results/RUN2/RPREC/RPREC_TF_IDF_SL+STEM

mv p10_BM25_SL+STEM data_results/RUN2/P10/P10_BM25_SL+STEM
mv p10_BM25_NO-SL+STEM data_results/RUN2/P10/P10_BM25_NO-SL+STEM
mv p10_TF_IDF_NO-SL+NO-STEM data_results/RUN2/P10/P10_TF_IDF_NO-SL+NO-STEM
mv p10_TF_IDF_SL+STEM data_results/RUN2/P10/P10_TF_IDF_SL+STEM
