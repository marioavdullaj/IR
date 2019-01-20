#!/bin/bash

HOME_terrier=/Users/Mario/Documents/Universita/Magistrale/secondo_anno/primo_semestre/ir/HW1/terrier-core-4.4
HOME_collection=/Users/Mario/Documents/Universita/Magistrale/secondo_anno/primo_semestre/ir/HW1/collection
TOPICS=/Users/Mario/Documents/Universita/Magistrale/secondo_anno/primo_semestre/ir/HW1/collection/topics.351-400_trec7.txt
QRELS=/Users/Mario/Documents/Universita/Magistrale/secondo_anno/primo_semestre/ir/HW1/collection/qrels.trec7.txt

cd $HOME_terrier

# RETRIEVAL
# SL+STEM BM25
rm var/index
rm var/results
cd var
ln -s -v index_SL+STEM index
cd ..
./bin/trec_terrier.sh -r -Dtrec.model=BM25 -Dtermpipelines=Stopwords,PorterStemmer -DTrecQueryTags.process=TOP,NUM,TITLE,DESC -DTrecQueryTags.skip=NARR -Dtrec.topics=$TOPICS
mv var/results var/results_BM25_SL+STEM2

#NO-SL+STEM BM25
rm var/index
rm var/results
cd var
ln -s -v index_NO-SL+STEM index
cd ..
./bin/trec_terrier.sh -r -Dtrec.model=BM25 -Dtermpipelines=PorterStemmer -DTrecQueryTags.process=TOP,NUM,TITLE,DESC -DTrecQueryTags.skip=NARR -Dtrec.topics=$TOPICS
mv var/results var/results_BM25_NO-SL+STEM2

#SL+STEM TF_IDF
rm var/index
rm var/results
cd var
ln -s -v index_SL+STEM index
cd ..
./bin/trec_terrier.sh -r -Dtrec.model=TF_IDF -Dtermpipelines=Stopwords,PorterStemmer -DTrecQueryTags.process=TOP,NUM,TITLE,DESC -DTrecQueryTags.skip=NARR -Dtrec.topics=$TOPICS
mv var/results var/results_TF_IDF_SL+STEM2

#NO-SL+NO-STEM TF_IDF
rm var/index
rm var/results
cd var
ln -s -v index_NO-SL+NO_STEM index
cd ..
./bin/trec_terrier.sh -r -Dtrec.model=TF_IDF -Dtermpipelines= -DTrecQueryTags.process=TOP,NUM,TITLE,DESC -DTrecQueryTags.skip=NARR -Dtrec.topics=$TOPICS
mv var/results var/results_TF_IDF_NO-SL+NO-STEM2

rm var/index
rm var/results

#EVALUATION
rm var/results
cd var
ln -s -v results_BM25_SL+STEM2 results
cd ..
./bin/trec_terrier.sh -e -p -Dtrec.qrels=$QRELS

rm var/results
cd var
ln -s -v results_BM25_NO-SL+STEM2 results
cd ..
./bin/trec_terrier.sh -e -p -Dtrec.qrels=$QRELS

rm var/results
cd var
ln -s -v results_TF_IDF_SL+STEM2 results
cd ..
./bin/trec_terrier.sh -e -p -Dtrec.qrels=$QRELS

rm var/results
cd var
ln -s -v results_TF_IDF_NO-SL+NO-STEM2 results
cd ..
./bin/trec_terrier.sh -e -p -Dtrec.qrels=$QRELS

rm var/results
