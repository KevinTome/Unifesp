# Kevin Lourenço Tomé - 135065
# Universidade Federal de São Paulo
# Campus São José dos Campos
# Trabalho Final: Análise de Desempenho de Diferentes algoritmos Supervisionados de Machine Learning
# Dataset: healthcare-dataset-stroke-data from Kaggle

import pandas as pd
import time
import matplotlib.pyplot as plt

from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn.utils import shuffle, resample 
from sklearn.metrics import accuracy_score
from sklearn.neighbors import KNeighborsClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.ensemble import RandomForestClassifier

#(0). Variáveis globais
global SIZE = 100
global ZERO = 0
global ONE = 1

class DataSet:

    #(1). Construtor da classe
    def __init__(self, x_treino, x_teste, y_treino, y_teste):
        self.x_treino = x_treino
        self.x_teste = x_teste
        self.y_treino = y_treino
        self.y_teste = y_teste
        self.algoritmos = []
        self.precisao = []
        self.tempo_execucao = []

    #(2). Executa o algoritmo
    def executar_algoritmo(self, algoritmo):

        #(2-1). Verifica qual é o algoritmo
        if algoritmo == 'KNN':
            nome_algoritmo = 'K-Nearest Neighbours'
            execucao = KNeighborsClassifier(n_neighbors=5)
        if algoritmo == 'NB':
            nome_algoritmo = 'Naive Bayes'
            execucao = GaussianNB()
        if algoritmo == 'RF':
            nome_algoritmo = 'Random Forest'
            execucao = RandomForestClassifier()
            
        #(2-2). Inicia variáveis
        precisao = ZERO
        tempo_execucao = ZERO

        #(2-3). Executa o algoritmo 100 vezes
        for i in range(SIZE):
            #(2-3-1). Recebe o tempo antes da execução
            tempo_inicio = time.time()

            #(2-3-2). Executa o algoritmo
            execucao.fit(self.x_treino, self.y_treino)
            predict = execucao.predict(self.x_teste)

            #(2-3-3). Soma as precisões e os tempos de execução
            precisao += accuracy_score(self.y_teste, predict) * SIZE
            tempo_execucao += time.time() - tempo_inicio

        #(2-4). Printa os dados
        print(nome_algoritmo)
        #>>Tempo médio das execuções
        print("Tempo de execução: " + str(format(tempo_execucao / SIZE, ".3f")) + "s")
        #>>Média das precisões
        print("Precisão dos resultados: " + str(format(precisao / SIZE, ".3f")) + "%")
        print(" ")

        #(2-5). Guarda os dados obtidos
        self.tempo_execucao.append(float(format(tempo_execucao / SIZE, ".3f")))
        self.precisao.append(float(format(precisao / SIZE, ".3f")))
        self.algoritmos.append(algoritmo)

    #(3) Plota os gráficos
    def plotar_graficos(self):

        #(3-1). Gráfico em barra: algoritmo x precisão
        fig = plt.figure()
        ax = fig.add_axes([ZERO, ZERO, ONE, ONE])
        ax.bar(self.algoritmos, self.precisao)
        ax.set_title('Precisão dos algoritmos')
        ax.set_xlabel('Algoritmos')
        ax.set_ylabel('Precisão (%)')
        plt.show()

        #(3-2). Gráfico em barra: algoritmo x tempo de execução
        fig = plt.figure()
        ax = fig.add_axes([ZERO, ZERO, ONE, ONE])
        ax.bar(self.algoritmos, self.tempo_execucao)
        ax.set_title('Tempo de execução dos algoritmos')
        ax.set_xlabel('Algoritmos')
        ax.set_ylabel('Tempo de Execução (s)')
        plt.show()


def trata_dados():
    #(4). Importa dataset
    df = pd.read_csv('healthcare-dataset-stroke-data.csv')

    #(5). Remove valores nulos
    df.dropna(inplace=True)

    #(6). Transforma os dados categóricos em numéricos
    le = LabelEncoder()
    le.fit(df['smoking_status'])
    df['smoking_status'] = le.transform(df['smoking_status'])
    le.fit(df['work_type'])
    df['work_type'] = le.transform(df['work_type'])
    le.fit(df['Residence_type'])
    df['Residence_type'] = le.transform(df['Residence_type'])
    le.fit(df['ever_married'])
    df['ever_married'] = le.transform(df['ever_married'])
    le.fit(df['gender'])
    df['gender'] = le.transform(df['gender'])

    #(7). Remove coluna ID
    df.drop(['id'], axis=1)

    #(8). Equilibra os dados, com o método Upsampling
    no_stroke = df[df['stroke'] == ZERO]
    stroke = df[df['stroke'] == ONE]
    upsampling = resample(stroke, replace=True, n_samples=no_stroke.shape[ZERO])
    df = pd.concat([no_stroke, upsampling])
    df = shuffle(df)

    x = df.drop(['stroke'], axis = ONE)
    y = df['stroke']

    #(9). Separa 70% dos dados para treino e 30% para teste
    x_treino, x_teste, y_treino, y_teste = train_test_split(x, y, train_size=0.7, random_state=101)

    #(10). Cria classe
    d = DataSet(x_treino, x_teste, y_treino, y_teste)

    #(11). Executa o algoritmos
    d.executar_algoritmo('KNN')
    d.executar_algoritmo('NB')
    d.executar_algoritmo('RF')
    
    d.plotar_graficos()


if __name__ == '__main__':
    trata_dados()


