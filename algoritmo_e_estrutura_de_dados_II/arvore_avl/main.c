//Kevin Lourenço Tomé - 135065
//Algoritmo e Estrutura de Dados II - 1/2022
//Judge 09 - Arvore AVL

#include <stdio.h>
#include <stdlib.h>

// (TAD). definição da estrutura.
struct No {
    int chave;
    struct No *esq;
    struct No *dir;
    int altura;
};

//  (5). calcular altura do nó.
int alturaNo(struct No *N) {
    if (N == NULL){ //tratamento para nós nulos
        return 0;
    }
    
    return N->altura;
}

// (extra). calcula o maior entre dois inteiros.
int maiorInt(int a, int b) {
    if (a > b) {
        return a;
    }
    
    return b;
}

//  (1). inicializacão,
struct No *novoNo(int chave) {
    struct No *arv = (struct No *)malloc(sizeof(struct No));
    arv->chave = chave;
    arv->esq = NULL;
    arv->dir = NULL;
    arv->altura = 1;
    return (arv);
}

//  (TAD). rotaciona para a direita
struct No *rotacaoDireita(struct No *aux) {
    struct No *auxEsq = aux->esq;
    struct No *T2 = auxEsq->dir;

    auxEsq->dir = aux;
    aux->esq = T2;

    aux->altura = maiorInt(alturaNo(aux->esq), alturaNo(aux->dir)) + 1;
    auxEsq->altura = maiorInt(alturaNo(auxEsq->esq), alturaNo(auxEsq->dir)) + 1;

    return auxEsq;
}

//  (TAD). rotaciona para a esquerda
struct No *rotacaoEsquerda(struct No *aux) {
    struct No *auxDir = aux->dir;
    struct No *T2 = auxDir->esq;

    auxDir->esq = aux;
    aux->dir = T2;

    aux->altura = maiorInt(alturaNo(aux->esq), alturaNo(aux->dir)) + 1;
    auxDir->altura = maiorInt(alturaNo(auxDir->esq), alturaNo(auxDir->dir)) + 1;

    return auxDir;
}

//  (TAD). balancea atravez do nó
int balanceaNo(struct No *N) {
    if (N == NULL){ //tratamento para nós nulos
        return 0;
    }
        
    return alturaNo(N->esq) - alturaNo(N->dir);
}

//  (3). Insercão
struct No *inserirNo(struct No *arv, int chave) {
    if (arv == NULL){ //tratamento para o nó arvore nulo
        return (novoNo(chave));   
    }

    if (chave < arv->chave){
        arv->esq = inserirNo(arv->esq, chave);
    } else if (chave > arv->chave){
        arv->dir = inserirNo(arv->dir, chave);
    } else{
        return arv;
    }
        
    arv->altura = 1 + maiorInt(alturaNo(arv->esq), alturaNo(arv->dir));
    int balance = balanceaNo(arv);

    if (balance > 1 && chave < arv->esq->chave){
        return rotacaoDireita(arv);
    }
        
    if (balance < -1 && chave > arv->dir->chave){
        return rotacaoEsquerda(arv);
    }
        
    if (balance > 1 && chave > arv->esq->chave) {
        arv->esq = rotacaoEsquerda(arv->esq);
        return rotacaoDireita(arv);
    }

    if (balance < -1 && chave < arv->dir->chave) {
        arv->dir = rotacaoDireita(arv->dir);
        return rotacaoEsquerda(arv);
    }

    return arv;
}

//  (TAD). encontra o menor nó
struct No *menorNo(struct No *arv) {
    struct No *aux = arv;

    while (aux->esq != NULL){
        aux = aux->esq;  
    }
    
    return aux;
}

//  (4). Remocão
struct No *removeNo(struct No *arv, int chave) {

    if (arv == NULL){
        return arv;  
    }
    
    if (chave < arv->chave){
        arv->esq = removeNo(arv->esq, chave);    
    } else if (chave > arv->chave){
        arv->dir = removeNo(arv->dir, chave);    
    } else {
        if ((arv->esq == NULL) || (arv->dir == NULL)) {
            struct No *temp = arv->esq ? arv->esq : arv->dir;

            if (temp == NULL) {
                temp = arv;
                arv = NULL;
            } else{
                *arv = *temp;
            }
            free(temp);
        } else {
            struct No *temp = menorNo(arv->dir);

            arv->chave = temp->chave;
            arv->dir = removeNo(arv->dir, temp->chave);
        }
    }

    if (arv == NULL){
        return arv;
    }
    
    arv->altura = 1 + maiorInt(alturaNo(arv->esq),alturaNo(arv->dir));

    int balance = balanceaNo(arv);

    if (balance > 1 && balanceaNo(arv->esq) >= 0){
        return rotacaoDireita(arv);
    }
        
    if (balance > 1 && balanceaNo(arv->esq) < 0) {
        arv->esq = rotacaoEsquerda(arv->esq);
        return rotacaoDireita(arv);
    }

    if (balance < -1 && balanceaNo(arv->dir) <= 0){
        return rotacaoEsquerda(arv);
    }
        

    if (balance < -1 && balanceaNo(arv->dir) > 0) {
        arv->dir = rotacaoDireita(arv->dir);
        return rotacaoEsquerda(arv);
    }

    return arv;
}

//  (2). Pesquisa
struct No *pesquisaNo(struct No *arv, int chave) {
    if (arv == NULL || chave == arv->chave){
        return arv;
    }
        
    if (chave < arv->chave){
        return pesquisaNo(arv->esq, chave);
    } else{
        return pesquisaNo(arv->dir, chave);
    }
        
    return NULL;
}

//  (Judge). Printa do formato que o judge quer
void printJudge(struct No *aux) {
    if (aux->esq == NULL && aux->dir != NULL){
       printf("%d, 0, %d\n", aux->altura - 1, aux->dir->altura); 
    } else if (aux->dir == NULL && aux->esq != NULL){
        printf("%d, %d, 0\n", aux->altura - 1, aux->esq->altura);
    } else if (aux->dir == NULL && aux->esq == NULL){
        printf("%d, 0, 0\n", aux->altura - 1);
    } else {
        printf("%d, %d, %d\n", aux->altura - 1, aux->esq->altura, aux->dir->altura);
    }
}

int main() {
    struct No *raiz = NULL;
    struct No *aux = NULL;
    int chave;

    while (chave >= 0) {
        scanf("%d", &chave);
        if (chave < 0)
            break;
        raiz = inserirNo(raiz, chave);
    }
    printJudge(raiz);
    
    scanf("%d", &chave);
    while (chave > 0) {
        aux = pesquisaNo(raiz, chave);
        if (aux != NULL) {
            raiz = removeNo(raiz, chave);
        } else {
            raiz = inserirNo(raiz, chave);
        }
        scanf("%d", &chave);
    }

    scanf("%d", &chave);
    if (pesquisaNo(raiz, chave) != NULL) {
        aux = pesquisaNo(raiz, chave);
        printJudge(aux);
    } else {
        printf("Valor nao encontrado\n");
    }
    
    return 0;
}