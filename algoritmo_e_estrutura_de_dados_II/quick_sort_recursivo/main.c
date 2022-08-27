#include <stdio.h>
#include <stdlib.h>

void troca(int *a, int *b) {
    int t = *a;
    *a = *b;
    *b = t;
}

int partition(int *vet, int primeiro, int ultimo) {

    int i, j, x, aux;
    x = vet[ultimo];
    i = primeiro-1;

    for(j = primeiro; j < ultimo; j++){
        if(vet[j] <= x){
            i++;
            troca(&vet[j],&vet[i]);
        }
    }
    
    troca(&vet[i+1],&vet[ultimo]);
    return (i+1);
}

void quickSort(int *vet, int primeiro, int ultimo, int indice) {

    int pivo;

    if(primeiro < ultimo){
        pivo = partition(vet, primeiro, ultimo);
        if(pivo == indice){
            return;
        }else if(indice < pivo){
            quickSort(vet, primeiro, pivo-1, indice);
        }else{
            quickSort(vet, pivo+1, ultimo, indice);
        }
    }
}

void printJudge(int *vet, int k, int n){
    int i = 0;
    
    printf("%io menor elemento eh o %i\n", k, vet[k-1]);

    for(i = 0; i < n; i++){
        printf("%d ", vet[i]);
    }
}

int main() {

    int k, n, i, primeiro = 0, ultimo, indice;

    scanf("%i", &k);
    scanf("%i", &n);
    indice = k-1;
    
    int vet[n];

    for(i = 0; i < n; i++){
        scanf("%i", &vet[i]);
    }
    
    quickSort(vet, 0, n-1, indice);
    printJudge(vet, k, n);
    
    return 0;
}