#include <stdio.h>
#include <stdlib.h>
#define NIL NULL

typedef struct Celula{
    struct Celula *Ant;
    int chave;
    struct Celula *Prox;
} TipoCelula;

typedef struct Lista{
    int tam;
    TipoCelula *Prim;
    TipoCelula *Ult;
} TipoLista;

typedef struct{
    TipoLista *Lista;
    int max, qtdElementos;
} TipoHash;

void Insercao(TipoLista *Lista, int chave){
    TipoCelula* aux = (TipoCelula*)malloc(sizeof(TipoCelula));
    aux->chave = chave;

    if (Lista->tam != 0){

        aux->Prox = NIL;
        aux->Ant = Lista->Ult;
        Lista->Ult->Prox = aux;
        Lista->Ult = aux;
    } else {

        aux->Prox = NIL;
        aux->Ant = NIL;
        Lista->Prim = aux;
        Lista->Ult = aux;
    }
    Lista->tam++;
}


int Pesquisa(TipoHash *Hash, int chave){
    int i = 0, indice;
    indice = chave % Hash->max;

    TipoCelula* aux = Hash->Lista[indice].Prim;

    for(i = 0; i < Hash->Lista[indice].tam; i++){
        if (aux->chave == chave){
            return 1;
        } else if (aux->Prox != NIL) {
            aux = aux->Prox;
        }
    }

    return 0;
}

void Remover(TipoHash *Hash, int chave){
    int i = 0, indice;
    indice = chave % Hash->max;

    TipoCelula* aux = Hash->Lista[indice].Prim;

    for(i = 0; i < Hash->Lista[indice].tam; i++) {
        if (aux->chave == chave) {
            if (aux->Ant == NIL && aux->Prox == NIL) {

                Hash->Lista[indice].Prim = aux;
                Hash->Lista[indice].Prim = aux;
                Hash->Lista[indice].tam = 0;
                return;
            } else if(Hash->Lista[indice].Prim->chave == aux->chave) {

                Hash->Lista[indice].Prim = aux->Prox;
                Hash->Lista[indice].Prim->Ant = NIL;
                Hash->Lista[indice].tam--;
                return;
            } else if(Hash->Lista[indice].Ult->chave == aux->chave) {

                Hash->Lista[indice].Ult = aux->Ant;
                Hash->Lista[indice].Ult->Prox = NIL;
                Hash->Lista[indice].tam--;
                return;
            }

            TipoCelula *Aux1, *Aux2;
            Aux1 = aux->Ant;
            Aux2 = aux->Prox;
            Aux1->Prox = Aux2;
            Aux2->Ant = Aux1;
            Hash->Lista[indice].tam--;
            return;
        } else if (aux->Prox != NIL) {
            aux = aux->Prox;
        }
    }
}

int main() {

    int i, j, n, ch;
    int chave, indiceLista;
    TipoHash* Hash;
    Hash = (TipoHash *) malloc(sizeof(Hash));

    scanf("%d", &Hash->max);
    Hash->Lista = (TipoLista *) malloc((Hash->max) * sizeof(TipoLista));

    for(i = 0; i < Hash->max; i++){

        Hash->Lista[i].tam = 0;
        Hash->Lista[i].Prim = NIL;
        Hash->Lista[i].Ult = NIL;
    }
    
    scanf("%d", &n);
    while(n >= 0){
        indiceLista = n % Hash->max;
        Insercao(&Hash->Lista[indiceLista], n);
        
        scanf("%d", &n);
    }

    scanf("%d", &chave);
    if (Pesquisa(Hash, chave) == 0) {
        printf("Valor nao encontrado\n");
    } else {
        Remover(Hash, chave);
    }

    scanf("%d", &ch);

    printf("[%d]", ch);
    if (Hash->Lista[ch].tam > 0) {
        for (j = 0; j<Hash->Lista[ch].tam; j++) {
            if(Hash->Lista[ch].Prim != NIL) {
                printf(" %d", Hash->Lista[ch].Prim->chave);
                Hash->Lista[ch].Prim = Hash->Lista[ch].Prim->Prox;
            }else{
                break;
            }
        }
    }
}
