// Kevin Lourenço Tomé -135065
// Universidade Federal de São Paulo - SJC
// Algoritmo e Estrutura de Dados - 1/2022
// Judge 01 - Busca Binaria Recursiva
 
#include <stdio.h>
#include <stdlib.h>
 
int bb_recursive(int vet[], int init, int end, int searching, int recursivelvl){
    int middle = (init+end)/2;
    
    if(init>end){
        // item procurado não foi encontrado
        return -1;  
    } 
    if(vet[middle] == searching){
        // item procurado é encontrado
        return recursivelvl;
    }
    
    //laço da recursividade
    if(vet[middle] < searching){
        return bb_recursive(vet, ++middle, end, searching, ++recursivelvl);
    } else {
        return bb_recursive(vet, init, --middle, searching, ++recursivelvl);
    }
    
}
 
int main(){
    int *vet, vet_tam, i, j, vet_search, vet_recursivelvl; 
    
    //Recebendo a quantidade de elementos no vetor e alocando
    //dinamicamente o vetor.
    scanf("%d", &vet_tam);
    vet =(int *) malloc(vet_tam * sizeof(int));
 
    //Preencher o vetor com os valores da segunda linha de 
    //comando
    for(i = 0; i<vet_tam; i++){
        scanf("%d", &vet[i]);
    }
    
    //Recebendo o valor a ser procurado
    scanf("%d", &vet_search);
    
    //variavel recebe o nível de recursao caso o item procurado
    //foi achado, caso contrario, variavel recebe -1
    vet_recursivelvl = bb_recursive(vet, 0, vet_tam-1, vet_search, 0);
    
    //print para responder ao judge
    if(vet_recursivelvl != -1){
        printf("%d", vet_recursivelvl);    
    } else {
        printf("%d nao foi encontrado", vet_search);
    }
    
    free(vet);
    //TESTE - Conferir o vetor
    /*
    for(j = 0; j<vet_tam; j++){
        printf("%d ", vet[j]);
    }
    */
    
    return 0;
}