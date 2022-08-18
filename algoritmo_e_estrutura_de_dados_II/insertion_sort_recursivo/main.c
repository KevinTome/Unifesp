//Kevin Lourenco Tome - 135065
//Algoritmo e Estrutura de Dados - 2/2022
//Universidade Federal de São Paulo - SJC
//Prof. Alvaro

#include <stdio.h>
#include <stdlib.h>

int media(int a, int b){
    int media = (a+b)/2;

    return media;
}

int buscaMenorIndex(int vetor[], int valorAtual, int menor, int maior) {
    int aux, meio;

    if(maior<=menor){
        if(valorAtual>vetor[menor]){
            menor++;
        }
        return menor;
    }

    meio = media(maior, menor);

    if(valorAtual==vetor[meio]){
        return ++meio;
    }

    if(valorAtual>vetor[meio]){
        return buscaMenorIndex(vetor, valorAtual, ++meio, maior);
    }
    return buscaMenorIndex(vetor, valorAtual, menor, --meio);
}

void insertionSortRecursivo(int vetor[], int index, int contadorRecursao) {
    int ultElemento, menorIndex, j;

    if(index<=1){
        return;
    }
    index--;
    insertionSortRecursivo(vetor, index, ++contadorRecursao);

    ultElemento = vetor[index];
    menorIndex = buscaMenorIndex(vetor, ultElemento, 0, index-1);

    printf("%d %d %d\n", contadorRecursao, ultElemento, menorIndex);
    for(j=index-1;j>=0&&vetor[j]>ultElemento;j--){
        vetor[j+1] = vetor[j];
    }
    vetor[j+1] = ultElemento;
}

void printarVetor(int vetor[], int index) {
    int i;

    for(i=0;i<index;i++){
        printf("%d ", vetor[i]);
    }
}

int main() {
    int index, i, menor;

    scanf("%d",&index);

    int vetor[index];

    for(i=0;i<index;i++){
        scanf("%d", &vetor[i]);
    }

    insertionSortRecursivo(vetor, index, 0);
    printarVetor(vetor, index);

    return 0;
}