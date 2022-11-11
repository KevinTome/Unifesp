import pandas as pd
import numpy as np
import nltk                                                                                  
import re
from IPython.display import display

#(1). Preparar arquivos
arquivo1 = open("soc.religion.christian.txt")
arquivo2 = open("comp.sys.ibm.pc.hardware.txt")

texto1 = arquivo1.read().replace("\n", " ")
texto2 = arquivo2.read().replace("\n", " ")

arquivo1.close()
arquivo2.close()

#(2). Stop words
with open("stopwords.txt") as f:
    stop_word = f.readlines()
stop_word = [x.strip() for x in stop_word]

#(3). Datasets 
dataset1 = nltk.sent_tokenize(texto1)
dataset2 = nltk.sent_tokenize(texto2)

for i in range(len(dataset1)):
    dataset1[i] = dataset1[i].lower()
    
for i in range(len(dataset2)):
    dataset2[i] = dataset2[i].lower()

#(4). Dicionarios
dicionario_palavras1 = {}
dicionario_palavras2 = {}
dicionario_palavras_geral = {}

for dados in dataset1:
    palavras = nltk.word_tokenize(dados)
    for palavra in palavras:
        if palavra not in dicionario_palavras1.keys():
            dicionario_palavras1[palavra] = 1
            dicionario_palavras_geral[palavra] = 0
        else:
            dicionario_palavras1[palavra] += 1

for dados in dataset2:
    palavras = nltk.word_tokenize(dados)
    for palavra in palavras:
        if palavra not in dicionario_palavras2.keys():
            dicionario_palavras2[palavra] = 1
        else:
            dicionario_palavras2[palavra] += 1
        if palavra not in dicionario_palavras_geral.keys():
            dicionario_palavras_geral[palavra] = 0

#(5). Dataframe 
df = pd.DataFrame([dicionario_palavras_geral],
columns=dicionario_palavras_geral.keys())

df['texto'] = 1

#(6). Frequência das palavras 
data_frame = pd.DataFrame(np.repeat(df.values,2,axis=0))
data_frame.columns = df.columns

for palavra in dicionario_palavras1:
    data_frame.at[0, palavra] = dicionario_palavras1[palavra]
for palavra in dicionario_palavras2:
    data_frame.at[1, palavra] = dicionario_palavras2[palavra]

data_frame.at[1, 'texto'] = 2

#(7). Tratamento: Caracteres especiais 
caractere_especial = re.compile('[@_!#$%^&*()<>?/\|}{~:]')

for palavra in dicionario_palavras_geral:
    if (caractere_especial.search(palavra) != None) or "." in palavra or "-" in palavra
or palavra.isalpha() == False:
        del data_frame[palavra]

for palavra in dicionario_palavras_geral:
    for stopword in stop_word:
        if palavra == stopword:
            del data_frame[palavra]

#(8). Saída
display(data_frame)