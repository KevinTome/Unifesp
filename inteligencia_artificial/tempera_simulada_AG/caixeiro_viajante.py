#-------------------------------------------------------------------------------
#Func para tratar os individuos e inputs
def crossover():
    #Recebe os valores do usuario
    n = int(input())
    linha = input()
    y = int(linha[0])
    p = float(linha[2:len(linha)])
    
    #cria os primeiros individuos 
    individuo_1 = input()
    individuo_2 = input()
    individuo_3 = input()
    
    #Gera os dois individuos filhos
    individuo_4 = individuo_1[0:y] + individuo_2[y:len(individuo_2)]
    individuo_5 = individuo_2[0:y] + individuo_1[y:len(individuo_1)]

    #Faz as probabilidade
    probabilidade1 = probabilidade(n, p, individuo_4, individuo_3)
    probabilidade2 = probabilidade(n, p, individuo_5, individuo_3)
    probabilidade_final = 1 - ((1 - probabilidade1) * (1 - probabilidade2)) 
    
    #formato da saida da func 
    return "{:.7f}".format(probabilidade_final)
    
#-------------------------------------------------------------------------------
#Func que calcula a probabilidade
def probabilidade(n, p, individuo_crossover, individuo_objetivo):
    probabilidade = 1.0000000
    #Calcula a probabilidade para cada bit
    for i in range(n):
        if individuo_crossover[i] == individuo_objetivo[i]:
            probabilidade = probabilidade * (1 - p)
        else:
            probabilidade = probabilidade * p

    return probabilidade

#-------------------------------------------------------------------------------
#Func main
t = int(input())
respostas = []

#loop para rodar enquanto receber os inputs
while t > 0:
    respostas.append(crossover())
    t -= 1

#Print para URIjudge
for resposta in respostas:
    print(resposta)