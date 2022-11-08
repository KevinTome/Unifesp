# Bancos de import
import random
import csv
import math

# Classe Dados onde todo o algoritmo vai rodar
class Dados:
    # (1)
    def __init__(self, treino, testes):
        self.treino = treino
        self.testes = testes
        self.numero_acertos = 0
    # (2)
    def KNN(self):
        # (3)
        i = 0
        while i < len(self.testes):
            distancia = []
            j = 0
            while j < len(self.treino):
                # (4)
                k = 1
                soma = 0
                while k < 5:
                    soma = soma + (float(self.treino[j][k]) - float(self.testes[i][k]))**2
                    k += 1
                distancia.append([math.sqrt(soma), self.treino[j][k], self.treino[j][0]])
                j += 1
            melhores = []
            # (5)
            for linha in sorted(distancia, key=lambda x: x[0])[:3]:
                melhores.append(linha[1])
            # (6)
            if self.testes[i][5] == max(set(melhores), key=melhores.count):
                self.numero_acertos += 1
            i += 1
        # (7)
        precisao = float("{:.2f}".format(100 * self.numero_acertos / len(self.testes)))
        print("O algoritmo acertou: ", str(self.numero_acertos), " de ", str(len(self.testes)), " testes. Precisão: ", precisao, "%.")
        
# Função para importar os arquivos
def Importar():
    # (8)
    arquivo = open("Iris.csv")
    data_set = csv.reader(arquivo)
    
    lista_data_set = list(data_set)
    lista_data_set.pop(0) # Retirando cabeçalho
    tamanho_data_set = len(lista_data_set)
    
    lista_treino = []
    lista_testes = []
    
    i = 1
    while i < int(tamanho_data_set * 70 / 100):
        index = lista_data_set.index(random.choice(lista_data_set))
        lista_treino.append(lista_data_set[index])
        lista_data_set.pop(index)
        i += 1

    i = 0
    while i <= int(tamanho_data_set * 30 / 100):
        index = lista_data_set.index(random.choice(lista_data_set))
        lista_testes.append(lista_data_set[index])
        lista_data_set.pop(index)
        i += 1
    d = Dados(lista_treino, lista_testes)
    
    # (9)
    d.KNN()

# Conferir o arquivo para importar
if __name__ == '__main__':
    Importar()