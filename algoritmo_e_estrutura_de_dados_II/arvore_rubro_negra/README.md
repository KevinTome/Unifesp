# Arvore Rubro Negra
Implemente as operacoes basicas de um algoritmo de pesquisa em Arvores Vermelho e Preta (AVP). Seu programa deve conter os seguintes procedimentos: (1) inicializacao, (2) pesquisa, (3) insercao, (4) calculo da altura do no e (5) calculo da altura-negra (altura maxima contando apenas os nos de cor preta). 

- A altura de um no x em uma AVP e a mesma ja utilizada nas atividades anterior, sobre ABB e AVL. Isto e, a distancia entre x e o seu descendente mais afastado, ou seja, a altura de x e o numero de passos no mais longo caminho que leva de x ate um no folha;
- A altura-negra de um no em uma AVP e a distancia entre o no x e o seu descendente mais afastado contando apenas os nos de cor preta, incluindo o proprio no x, se este for da cor preta.

Lembre-se que, cada insercao em uma arvore AVP requer que se verifique o fator de balanceamento e, se necessario, uma rotacao e realizada. As remocoes tambem podem demandar rotacoes para manter a arvore balanceada.