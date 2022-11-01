class Estado:

#Iniciação
#Estado[Estado próprio, Nº de canibais do lado esquerdo, Nº de missionarios do lado esquerda, Index boolean 
#do lado da canoa, Guarda o estado anterior que gerou o atual]
    def __init__(self, canibais, missionarios, anterior, operacao):
        self.canibais = canibais            
        self.missionarios = missionarios    
        self.operacao = operacao            
        self.anterior = anterior            
        
#------------------------------------------------------------------------------------------------------------
#Check do estado final
    def estado_final(self):
        if (self.canibais == 0) and (self.missionarios == 0): #---Estado[0,0,1,3,3]
            return True
        else:
            return False
#-------------------------------------------------------------------------------------------------------------
#Check das restrições do sistema
#restrição 01 -> máximo de 3 canibais no sistema
#restrição 02 -> máximo de 3 missionarios no sistema
#restrição 03 -> o lado que a canoa ta não pode estar vazio
#restrição 04 -> os missionarios não podem ficar em minoria em relação aos canibais
    def confirma_restricao(self):

        if self.missionarios < 0 or self.missionarios > 3 or self.canibais < 0 or self.canibais > 3:
            return False

        if (self.missionarios == 0 or self.canibais <= self.missionarios) and (self.missionarios == 3 or
                abs(self.canibais - 3) <= abs(self.missionarios - 3)):
            return True
        else:
            return False
#------------------------------------------------------------------------------------------------------------
#Descobre o próximo estado
#lógica = usando o lado da canoa, descubro qual lado vou transportar.
#caso a operação seja True -> canoa está do lado direito em direção ao esquerdo
#caso a operação seja False -> canoa esta do lado esquerdo em direção ao direito

#POSSIVEIS MOVIMENTOS
#01. 2C-ED -> 2 canibais da esquerda para direita
#02. 2M-ED -> 2 missionarios da esquerda para direita
#03. MC-ED -> 1 missionario e 1 canibal da esquerda para direita
#04. C-ED -> 1 canibal da esquerda para direita
#05. M-ED -> 1 missionario da esquerda para direita
#06. 2C-DE -> 2 canibais da direita para esquerda
#07. 2M-DE -> 2 missionarios da direita para esquerda
#08. MC-DE -> 1 missionario e 1 canibal da direita para esquerda
#09. C-DE -> 1 canibal da direita para esquerda
#10. M-DE -> 1 missionario da direita para esquerda
def prox_estado(estado_atual):
    prox_estado = []

    if estado_atual.operacao == True:
        #Movimento 01. 2C-ED
        estado_aux = Estado(estado_atual.canibais + 2, estado_atual.missionarios, estado_atual, False)
        if estado_aux.confirma_restricao():
            prox_estado.append(estado_aux)

        #Movimento 02. 2M-ED
        estado_aux = Estado(estado_atual.canibais, estado_atual.missionarios + 2, estado_atual, False)
        if estado_aux.confirma_restricao():
            prox_estado.append(estado_aux)

        #Movimento 03. MC-ED
        estado_aux = Estado(estado_atual.canibais + 1, estado_atual.missionarios + 1, estado_atual, False)
        if estado_aux.confirma_restricao():
            prox_estado.append(estado_aux)

        #Movimento 04. C-ED
        estado_aux = Estado(estado_atual.canibais + 1, estado_atual.missionarios, estado_atual, False)
        if estado_aux.confirma_restricao():
            prox_estado.append(estado_aux)

        #Movimento 05. M-ED
        estado_aux = Estado(estado_atual.canibais, estado_atual.missionarios + 1, estado_atual, False)
        if estado_aux.confirma_restricao():
            prox_estado.append(estado_aux)

    else:
        #Movimento 06. 2C-DE
        estado_aux = Estado(estado_atual.canibais - 2, estado_atual.missionarios, estado_atual, True)
        if estado_aux.confirma_restricao():
            prox_estado.append(estado_aux)

        #Movimento 07. 2M-DE
        estado_aux = Estado(estado_atual.canibais, estado_atual.missionarios - 2, estado_atual, True)
        if estado_aux.confirma_restricao():
            prox_estado.append(estado_aux)

        #Movimento 08. MC-DE
        estado_aux = Estado(estado_atual.canibais - 1, estado_atual.missionarios - 1, estado_atual, True)
        if estado_aux.confirma_restricao():
            prox_estado.append(estado_aux)

        #Movimento 09. C-DE
        estado_aux = Estado(estado_atual.canibais - 1, estado_atual.missionarios, estado_atual, True)
        if estado_aux.confirma_restricao():
            prox_estado.append(estado_aux)

        #Movimento 10. M-DE
        estado_aux = Estado(estado_atual.canibais, estado_atual.missionarios - 1, estado_atual, True)
        if estado_aux.confirma_restricao():
            prox_estado.append(estado_aux)

    return prox_estado
#------------------------------------------------------------------------------------------------------------
#Printa o percurso do estado inicial[3,3,0,0,0] para o estado final[0,0,1,3,3]
def print_percurso(estado_atual):
    percurso = []

    #Enquanto o estado atual tiver anterior a ele
    while estado_atual.anterior != None:
        percurso.append('Estado [' + str(estado_atual.canibais) + ' , ' + str(estado_atual.missionarios) + ' , ' + str(estado_atual.operacao) +
                    ' , ' + str(abs(estado_atual.canibais - 3)) + ' , ' + str(abs(estado_atual.missionarios - 3)) + ' ]')

        #Anda para o próximo estado
        estado_atual = estado_atual.anterior

    #Por fim, o estado inicial que não tem anterior
    percurso.append('Estado [' + str(estado_atual.canibais) + ' , ' + str(estado_atual.missionarios) + ' , ' + str(estado_atual.operacao) +
                    ' , ' + str(abs(estado_atual.canibais - 3)) + ' , ' + str(abs(estado_atual.missionarios - 3)) + ' ]')

    #Laço de print da lista que registrou o percurso
    i = len(percurso) - 1
    while i >= 0:
        print(percurso[i])
        i -= 1
#------------------------------------------------------------------------------------------------------------
# Busca em profundidade sem informação
def busca_sem_info():

    estados = []
    estados.append(Estado(3, 3, None, False)) #Estado inicial[3,3,0,0,0]
    explorados = [] #Registrador dos estados já visitados para evitar laços infinitos
    
    while estados:
        #Remove da lista
        estado = estados.pop(0)

        #Check do estado final[0,0,1,3,3]
        if estado.estado_final():
            return estado

        #Adiciona o estado na lista de explorados
        explorados.append(estado)
        #Pesquisa o próximo estado do atual
        proximos = prox_estado(estado)

        #Se não tiver sido explorado, adiciona na lista de estados
        for p in proximos:
            if p not in explorados:
                estados.append(p)
#------------------------------------------------------------------------------------------------------------
# Inicia a busca pelo estado final e printa o percurso encontrado:
estado = busca_sem_info()
print_percurso(estado)