import random

#-------------------------------------------------------------------------------
class Grafo:

    # (1)
    def __init__(self, vertices, alpha, beta, rho, tau):
        self.vertices = vertices
        self.caminho = [[] for i in range(self.vertices)]
        self.feromonio = [[] for i in range(self.vertices)]
        self.visitados = [0 for i in range(vertices)]
        self.a = alpha
        self.b = beta
        self.r = rho
        self.t = tau

    # (2)
    def adicionar_valor_aresta(self):
        for i in range(self.vertices):
            if i != 0:
                print("Vértice ", i, ": ")
                for j in range(self.vertices):
                    if j != 0:
                        if j != i:
                            mensagem = "Aresta (" + str(i) + " " + str(j) + "), peso: "
                            valor = int(input(mensagem))
                            self.caminho[i].append([j, valor])
                            self.feromonio[i].append([j, self.t])
                        else:
                            self.caminho[i].append([j, 0])
                            self.feromonio[i].append([j, 0])

    # (3)
    def probabilidade(self, vertice_atual, i):
        normalizacao = 0
        for j in range(self.vertices - 1):
            if self.visitados[self.caminho[vertice_atual][j][0]] == 0 or j == vertice_atual:
                normalizacao += (
                            self.feromonio[vertice_atual][j][1] * self.a * self.b * 1 / self.caminho[vertice_atual][j][
                        1])

        return float("{:.2f}".format(((self.feromonio[vertice_atual][i - 1][1] * self.a * self.b * 1 /
                                       self.caminho[vertice_atual][i - 1][1]) / normalizacao)))

    # (4)
    def caminhar(self, comeco):
        # (5)
        percurso = [comeco]
        vertice_atual = comeco
        i = 0

        # (6)
        self.visitados = [0 for i in range(self.vertices)]

        # (7)
        while i < self.vertices - 1:

            # (8)
            Gbest = None

            # (9)
            if self.visitados[vertice_atual] == 0:
                self.visitados[vertice_atual] = 1

                # (10)
                for vertices in self.caminho[vertice_atual]:
                    # (11)
                    if self.visitados[vertices[0]] == 0:
                        # (12)
                        if Gbest is None:
                            Gbest = vertices[0]
                            Fbest = self.probabilidade(vertice_atual, Gbest)
                        else:  
                            if self.probabilidade(vertice_atual, vertices[0]) > Fbest:
                                Gbest = vertices[0]
                                Fbest = self.probabilidade(vertice_atual, vertices[0])

            # (13)
            if Gbest is not None:
                vertice_atual = Gbest
                percurso.append(Gbest)

            i += 1

        print("")
        print("Percurso: ", percurso)

    # (14)
    def atualizar_feromonio(self):
        # (15)
        for i in range(self.vertices):
            if i != 0:
                for j in range(self.vertices - 1):
                    if self.caminho[i][j][1] != 0:
                        self.feromonio[i][j][1] = float("{:.2f}".format(
                            (1 - self.r) * self.feromonio[i][j][1] + self.r * 1 / self.caminho[i][j][1]))

    # (16)
    def exibir_feromonio(self):
        print("")
        print("Feromônio:")
        print('  ', end=' ')
        for i in range(self.vertices):
            if i != 0:
                if i == self.vertices - 1:
                    print(i)
                else:
                    print(i, end='   ')

        for i in range(self.vertices):
            if i != 0:
                print(i, end='  ')
                for j in self.feromonio[i]:
                    print(j[1], end='   ')

                print("")

    # (17)
    def exibir_qualidade_aresta(self):
        print("")
        print("Qualidade das arestas")
        print('  ', end=' ')

        for i in range(self.vertices):
            if i != 0:
                if i == self.vertices - 1:
                    print(i)
                else:
                    print(i, end='   ')

        for i in range(self.vertices):
            if i != 0:
                print(i, end='  ')
                for j in self.caminho[i]:
                    print(j[1], end='   ')

                print("")

        print("")

    # (18)
    def executar(self):
        i = 1
        # (19)
        while i < self.vertices:
            self.caminhar(i)
            self.atualizar_feromonio()
            self.exibir_feromonio()

            i += 1

#-------------------------------------------------------------------------------
def ACO():
    # (20)
    qtd_vertices = int(input("Informe o n° de vértices: "))
    a = float(input("Informe alpha: "))
    b = float(input("Informe beta: "))
    r = float(input("Informe rho: "))
    t = float(input("Informe tau: "))

    # (21)
    g = Grafo(qtd_vertices + 1, a, b, r, t)
    g.adicionar_valor_aresta()
    g.exibir_qualidade_aresta()
    g.executar()

#-------------------------------------------------------------------------------
# reolve função eval
def f(funcao, x):
    return eval(funcao)

#-------------------------------------------------------------------------------
def PSO():
    # (1)
    funcao = input('f(x) = ')
    w = float(input('w = '))
    c1 = float(input('c1 = '))
    c2 = float(input('c2 = '))
    r1 = float(input('r1 = '))
    r2 = float(input('r2 = '))
    n = int(input('n = '))
    iteracoes = int(input('iteracoes = '))

    # (2)
    x = []
    v = []
    for i in range(n):
        x.append(float("{:.4f}".format((random.uniform(0, 1) - 0.5) * 10)))
        v.append(float("{:.4f}".format(random.uniform(0, 1) - 0.5)))

    # (3)
    Pbest = x
    Gbest = x[0]
    Fbest = float("{:.4f}".format(f(funcao, 0)))

    # (4)
    for i in x:
        if f(funcao, i) > Gbest:
            Gbest = i
            Fbest = float("{:.4f}".format(f(funcao, i)))

    # (5)
    print("Local best position: ", Pbest)
    print("Global best fitness: ", Fbest)
    print("Global best position: ", Gbest)
    print(" ")

    # (6)
    while iteracoes - 1 > 0:
        # (7)
        for i in range(n):
            # (8)
            v[i] = float("{:.4f}".format(w * v[i] + c1 * r1 * (Pbest[i] - x[i]) + c2 * r2 * (Gbest - x[i])))
            x[i] = float("{:.4f}".format(x[i] + v[i]))
            # (9)
            if f(funcao, Pbest[i]) < f(funcao, x[i]):
                Pbest = x[i]
            # (10)
            if f(funcao, Gbest) < f(funcao, x[i]):
                Gbest = x[i]
                Fbest = float("{:.4f}".format(f(funcao, x[i])))

        # (11)
        print("Local best position: ", Pbest)
        print("Global best fitness: ", Fbest)
        print("Global best position: ", Gbest)
        print(" ")

        iteracoes -= 1

#-------------------------------------------------------------------------------
#Gerenciador:
opcao = int(input("1 para AOC, 2 para SO e qualquer outro número para sair: "))

if opcao == 1:
    ACO()
elif opcao == 2:
    PSO()