//Kevin Lourenço Tomé 1355065
//Algoritmo e Estrutura de Dados II - 2/2021
//Prof. Luis Augusto
//Judge 06 - HeapSort

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define MAX 21

void troca(char *a, char *b) {
    char vetAux[MAX];
  
    strcpy(vetAux, a);
    strcpy(a, b);
    strcpy(b, vetAux);
}

void heapify(char vet[][MAX], int n, int i) {
    int esquerda = 2 * i + 1;
    int direita = 2 * i + 2;
    int maior = i;

    if (esquerda < n && strcmp(vet[esquerda], vet[maior]) > 0){
        maior = esquerda;   
    } 
    if (direita < n && strcmp(vet[direita], vet[maior]) > 0){
        maior = direita;
    }
    
    if (maior != i) {
        troca(vet[i], vet[maior]);
        heapify(vet, n, maior);
    }
}

void heapSort(char vet[][MAX], int n) {
    int i;
    
    printf("build_heap: ");
    for (i = (n/2) - 1; i >= 0; i--) {
        heapify(vet, n, i);
    }
    for (i = 0; i < n; i++){
        printf("%s ", vet[i]);  
    }
    printf("\n");
    for (i = n - 1; i > 0; i--) {
        troca(vet[0], vet[i]);
        heapify(vet, i, 0);
    }
}

int palavraInvalida(char vet[][MAX], int n){
    int i, j;
    
    
}

void printJudge(char vet[][MAX], int n){
    int i;
    printf("palavras: ");
    
    for (i = 0; i < n; i++) {
        printf("%s ", vet[i]);
    }
    
}

int main() {
    int n, m, i, aux, j;
    char temp[MAX];
  
    scanf("%d", &n);                            
    char vetFrase[n][MAX];
  
    for (i = 0; i < n; i++) {
        scanf("%s", &temp);
        strcpy(vetFrase[i], temp);
    }
    
    scanf("%d", &m);
    char vetFinal[m][MAX];                  
    
    for (i = 0; i < m; i++) {
        scanf("%d", &aux);
        strcpy(vetFinal[i], vetFrase[aux]);
    }
    
    for (i = 0; i < n; i++) {
        for (j = 0; j < strlen(vetFrase[i]); j++) {
            if (vetFrase[i][j] < 'a' || vetFrase[i][j] > 'z') {
                printf("a palavra %s eh invalida", vetFrase[i]);
                return 0;
            }
        }
    }
    
    heapSort(vetFinal, m);
    printJudge(vetFinal, m);
    
    return 0;
}