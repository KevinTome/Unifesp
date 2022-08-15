#include <stdio.h>
#include <stdlib.h>

int contador(int vales, int valorCupom){
    //printf("valor de valorCupom: %d", valorCupom);
    if (vales >= valorCupom){
        return 1 + contador(1 + vales - valorCupom, valorCupom);  
    }else{
        return 0;
    }
}

int main()
{
    int i, j, dindin, preco , valorCupom, vales;
    int numCasos = 0;

    scanf("%d", &numCasos);
    int numLivros[numCasos];
    
    for(i = 0; i<numCasos; i++){
        scanf("%d %d %d", &dindin, &preco, &valorCupom);
        
        vales = dindin/preco;
        numLivros[i] = vales + contador(vales, valorCupom);
        
    }
   
    for(j = 0; j<numCasos; j++){
        printf("%d\n", numLivros[j]);
    }
   
   return 0;
}

