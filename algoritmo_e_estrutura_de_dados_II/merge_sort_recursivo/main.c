#include <stdio.h>
#include <stdlib.h>

void intercalaMerge(int vetor[], int inicio, int meio, int fim) {
    int *vetorAux, tamanho, i, j, k = inicio;
    int p1 = inicio, p2 = meio + 1, fim1 = 0, fim2 = 0;;
 
    tamanho = fim - inicio + 1;
    vetorAux = (int *) malloc (tamanho*sizeof(int));
 
    for(i = 0; i < tamanho; i++) {
        if(fim1 == 0 && fim2 == 0) {
            if(vetor[p1] < vetor[p2])
                vetorAux[i] = vetor[p1++];
            else
                vetorAux[i] = vetor[p2++];

            if(p1 > meio)
                fim1 = 1;
            if(p2 > fim)
                fim2 = 1;
        } else{
            if(fim1 == 0)
                vetorAux[i] = vetor[p1++];
            else
                vetorAux[i] = vetor[p2++];
        }
    }
 
    for(j = 0; j < tamanho; j++) {
        vetor[k] = vetorAux[j];
        k++;
    }

    free(vetorAux);
}
 
void ordenaMerge(int vetor[], int inicio, int fim, int qtdElementos) {
    
    int meio, i;
    if(inicio < fim) {
        meio = (inicio + fim)/2;
 
        ordenaMerge(vetor, inicio, meio, qtdElementos);
        ordenaMerge(vetor, meio+1, fim, qtdElementos);

        intercalaMerge(vetor, inicio, meio, fim);
    }
}
 
int main() {
    
    int qtdElementos, i;
    scanf("%d", &qtdElementos);
 
    int vetor[qtdElementos];
 
    for(i = 0; i < qtdElementos; i++)
        scanf("%d", &vetor[i]);
 
    ordenaMerge(vetor, 0, qtdElementos-1, qtdElementos);
    
    for(i = 0; i < qtdElementos; i++)
        printf("%d ", vetor[i]);
}
