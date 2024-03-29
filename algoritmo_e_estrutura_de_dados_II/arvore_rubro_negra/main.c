#include <stdlib.h>
#include <stdio.h>

typedef struct Cell *Pointer;

typedef struct Cell{
  int Id;
  Pointer Left, Right, Father;
  int Colour;
} Node;

typedef struct {
  Pointer Root;
} Tree;

//==================================================================================================

void Tree_Initialize(Tree *Queue){
	Queue->Root=NULL;
	return;
}

int BlackHeight(Node *No){
	int BH=0;
	Node *CurrentNode=No;

	while(CurrentNode!=NULL){
		if (CurrentNode->Colour==0){
			BH++;
		}
		CurrentNode=CurrentNode->Right;
	}

	return BH;
}

int Tree_Height(Node *No) {
    if (No == NULL) 
        return 0;
    else {
        int left_height = Tree_Height(No->Left);
        int right_height = Tree_Height(No->Right);
        
        if (left_height > right_height)
            return (left_height + 1);
        else
            return (right_height + 1);
    }
}

void SwapColours(Node *No){
	if (No->Colour==0){
		No->Colour=1;
		if (No->Right!=NULL)
			No->Right->Colour=0;
		if (No->Left!=NULL)
			No->Left->Colour=0;
	} else {
		No->Colour=0;
		if (No->Right!=NULL)
			No->Right->Colour=1;
		if (No->Left!=NULL)
			No->Left->Colour=1;
	}
}

void Rotate_Right(Tree *Queue,Node **No){
	Node *pB;

	pB = (*No)->Left;

	(*No)->Left = pB->Right;
	if (pB->Right != NULL)
		pB->Right->Father=(*No);
	pB->Father=(*No)->Father;
	if ((*No)->Father==NULL)
		Queue->Root=pB;
	else
		if ((*No)==(*No)->Father->Right)
			(*No)->Father->Right=pB;
		else
			(*No)->Father->Left=pB;
	pB->Right = *No;
	(*No)->Father = pB;

	return;
}

void Rotate_Left(Tree *Queue,Node **No){
	Node *pB;

	pB = (*No)->Right;

	(*No)->Right = pB->Left;
	if (pB->Left != NULL)
		pB->Left->Father=(*No);
	pB->Father=(*No)->Father;
	if ((*No)->Father==NULL)
		Queue->Root=pB;
	else
		if ((*No)==(*No)->Father->Left)
			(*No)->Father->Left=pB;
		else
			(*No)->Father->Right=pB;
	pB->Left = *No;
	(*No)->Father = pB;

	return;
}

void RecInsertion(Node *CurrentNode,Node *Item){
	if (Item->Id<=CurrentNode->Id){
		if (CurrentNode->Left==NULL){
			Item->Father=CurrentNode;
			CurrentNode->Left=Item;
		} else {
			RecInsertion(CurrentNode->Left,Item);
		}
	} else {
		if (CurrentNode->Right==NULL){
			Item->Father=CurrentNode;
			CurrentNode->Right=Item;
		} else {
			RecInsertion(CurrentNode->Right,Item);
		}
	}
	return;
}

Node *Tree_Search(Tree *Queue, int Item){
	Node *CurrentNode, *CurrentFather, *SearchFather=NULL;

	if (Queue->Root==NULL){
		return SearchFather;
	}

	CurrentFather = Queue->Root;

	if (Item==CurrentFather->Id){
		return CurrentFather;
	}

	CurrentNode = Queue->Root->Left;

	while (CurrentNode!=NULL){
		if (Item==CurrentNode->Id){
			return CurrentNode;
		} else {
			if (Item<CurrentNode->Id){
				CurrentFather=CurrentNode;
				CurrentNode=CurrentNode->Left;
			} else {
				CurrentFather=CurrentNode;
				CurrentNode=CurrentNode->Right;
			}
		}
	}

	CurrentFather = Queue->Root;
	CurrentNode = Queue->Root->Right;

	while (CurrentNode!=NULL && SearchFather==NULL){
		if (Item==CurrentNode->Id){
			return CurrentNode;
		} else {
			if (Item<CurrentNode->Id){
				CurrentFather=CurrentNode;
				CurrentNode=CurrentNode->Left;
			} else {
				CurrentFather=CurrentNode;
				CurrentNode=CurrentNode->Right;
			}
		}
	}

	return NULL;
}

void Tree_Print(Node *Root){
	char Colour;

	if (Root==NULL){
        printf("()");
		return;
  	}

  	if (Root->Colour==0){
  		Colour='N';
  	} else {
  		Colour='R';
  	}

  	printf("(%c%d",Colour,Root->Id);
  	Tree_Print(Root->Left);
  	Tree_Print(Root->Right);
  	printf(")");
}

void Tree_Height_Print(Node *No){
	int max;
    int left_height = Tree_Height(No->Left);
    int right_height = Tree_Height(No->Right);
    
    if (left_height > right_height){
        max = left_height; 
    }else {
        max = right_height;
    }
    printf("%d, %d, %d\n", max, left_height, right_height);
}

void IsRBT(Tree *Queue,Node *No){
	Node *Grand, *Uncle=NULL, *Father=No->Father;

	if (Father==NULL)
        return;

	if (Father->Father!=NULL){
		Grand=No->Father->Father;
		if (Grand->Left==Father){
			Uncle=Grand->Right;
		} else {
			Uncle=Grand->Left;
		}
	}

	if (Father->Colour==0){ //caso: nó-pai preto 
		return;
	} else if (Uncle!=NULL){
		if (Uncle->Colour==1){ 
			SwapColours(Grand);
			IsRBT(Queue,Grand);
			return;
		} else {
			if ((Grand->Left==Father)&&(Father->Left)==No){ //LL
				Rotate_Right(Queue,&Grand);
				SwapColours(Father);
				return;
			} else if ((Grand->Left==Father)&&(Father->Right)==No){ //LR
				Rotate_Left(Queue,&Father);
				Rotate_Right(Queue,&Grand);
				SwapColours(No);
				return;
			} else if ((Grand->Right==Father)&&(Father->Left)==No){ //RL
				Rotate_Right(Queue,&Father);
				Rotate_Left(Queue,&Grand);
				SwapColours(No);
				return;
			} else { //RR
				Rotate_Left(Queue,&Grand);
				SwapColours(Father);
				return;
			}
		}
	} else { //father red and uncle black
		if ((Grand->Left==Father)&&(Father->Left)==No){ //LL
			Rotate_Right(Queue,&Grand);
			SwapColours(Father);
			return;
		} else if ((Grand->Left==Father)&&(Father->Right)==No){ //LR
			Rotate_Left(Queue,&Father);
			Rotate_Right(Queue,&Grand);
			SwapColours(No);
			return;
		} else if ((Grand->Right==Father)&&(Father->Left)==No){ //RL
			Rotate_Right(Queue,&Father);
			Rotate_Left(Queue,&Grand);
			SwapColours(No);
			return;
		} else { //RR
			Rotate_Left(Queue,&Grand);
			SwapColours(Father);
			return;
		}
	}
}

void Tree_Insert(Tree *Queue, int Item){
	Node *Aux = (Node *) malloc(sizeof(Node));
	Aux->Id=Item;
	Aux->Colour=1;
	Aux->Left=NULL;
	Aux->Right=NULL;
	Aux->Father=NULL;

	if (Queue->Root==NULL){
		Queue->Root=Aux;
		Queue->Root->Colour=0;
		return;
	}

	RecInsertion(Queue->Root,Aux);

	IsRBT(Queue,Aux);

	Queue->Root->Colour=0;

	return;
}

//==================================================================================================

int main(){
	Tree *Queue = (Tree *) malloc(sizeof(Tree));
	Node *Search;
	int nElements, i, N;

	Tree_Initialize(Queue);

    scanf("%d",&N);
    while(N >= 0){
		Search = Tree_Search(Queue,N);

		if (Search==NULL){
            Tree_Insert(Queue,N);
		}
        scanf("%d",&N);
    }
    
	//Tree_Print(Queue->Root);  
	printf("\n");
	Tree_Height_Print(Queue->Root);
	
    scanf("%d",&N);
    while(N >= 0){
		Search = Tree_Search(Queue,N);

		if (Search==NULL){
            Tree_Insert(Queue,N);
        } else {
            Tree_Height_Print(Search);    
        }
        scanf("%d",&N);
    }
    
    scanf("%d",&N);
    Search = Tree_Search(Queue,N);
    if (Search==NULL){
        printf("Valor nao encontrado");
    }else {
        printf("%d\n",BlackHeight(Search)); 
    }
    //Tree_Print(Queue->Root); 
    
    
	return 0;
}

