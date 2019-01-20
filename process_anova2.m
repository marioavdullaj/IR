fileID = fopen('data_results/RUN2/AP/AP_BM25_NO-SL+STEM','r');
m_bny = fscanf(fileID,'%f');

fileID = fopen('data_results/RUN2/AP/AP_BM25_SL+STEM','r');
m_byy = fscanf(fileID,'%f');

fileID = fopen('data_results/RUN2/AP/AP_TF_IDF_NO-SL+NO-STEM','r');
m_tnn = fscanf(fileID,'%f');

fileID = fopen('data_results/RUN2/AP/AP_TF_IDF_SL+STEM','r');
m_tyy = fscanf(fileID,'%f');

%%%%%%%%

fileID = fopen('data_results/RUN2/RPREC/RPREC_BM25_NO-SL+STEM','r');
r_bny = fscanf(fileID,'%f');

fileID = fopen('data_results/RUN2/RPREC/RPREC_BM25_SL+STEM','r');
r_byy = fscanf(fileID,'%f');

fileID = fopen('data_results/RUN2/RPREC/RPREC_TF_IDF_NO-SL+NO-STEM','r');
r_tnn = fscanf(fileID,'%f');

fileID = fopen('data_results/RUN2/RPREC/RPREC_TF_IDF_SL+STEM','r');
r_tyy = fscanf(fileID,'%f');

%%%%%%%%%%%%
fileID = fopen('data_results/RUN2/P10/P10_BM25_NO-SL+STEM','r');
p_bny = fscanf(fileID,'%f');

fileID = fopen('data_results/RUN2/P10/P10_BM25_SL+STEM','r');
p_byy = fscanf(fileID,'%f');

fileID = fopen('data_results/RUN2/P10/P10_TF_IDF_NO-SL+NO-STEM','r');
p_tnn = fscanf(fileID,'%f');

fileID = fopen('data_results/RUN2/P10/P10_TF_IDF_SL+STEM','r');
p_tyy = fscanf(fileID,'%f');

%%%%%%%%%%%%

measure = [m_byy m_bny m_tyy m_tnn]
nome = 'Average Precision (AP)'
sn = 'ap'
ir_anova

measure = [r_byy r_bny r_tyy r_tnn]
nome = 'Rprec'
sn = 'rprec'
ir_anova

measure = [p_byy p_bny p_tyy p_tnn]
nome = 'P@10'
sn = 'p10'
ir_anova
