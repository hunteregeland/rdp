//Abstract Syntax Tree Implementation
#include <string.h>

/* In order to print the ast I decided to create a matrix of pointers to strings so that I could place any text in any
position at any time. The variables below define that matrix */

//defines the size of a side of the matrix
#define arraySize 1000

//defines the matrix object;
char * printArray[arraySize*arraySize];

char printArray2[arraySize*arraySize];

/*A struct that represents a node in the abstract syntax tree. The nodeValue is a string representation of the node
and left and right are pointers to the left and right nodes that branch off*/
struct AST{
	char nodeValue[50];
    int level;
	struct AST * left;
	struct AST * right;
};

//This is the definition for the base of a resizeable array which I use to deal with order of operations
typedef struct {
  struct AST **array;
  size_t used;
  size_t size;
} Array;

//This function initializes an array with some initial size which can later be expanded
void initArray(Array *a, size_t initialSize) {
  a->array = malloc(initialSize * sizeof(struct AST*));
  a->used = 0;
  a->size = initialSize;
}

//This function inserts a new element into the end of the array and allocates more memory if needed
void insertArray(Array *a, struct AST* element) { 
  if (a->used == a->size) {
    a->size *= 2;
    a->array = realloc(a->array, a->size * sizeof(struct AST*));
  }
  a->array[a->used++] = element;
}

//This function destroys the array and frees the memory it used
void freeArray(Array *a) {
  free(a->array);
  a->array = NULL;
  a->used = a->size = 0;
}

//This function makes it possible to se the left and right pointers for some base tree node
void AST_Bast_Last_Rast(struct AST* left, struct AST* base, struct AST* right){
    base->left = left;
    base->right = right;
}

//This function creates and returns a new ast node with some new value which points to two existing nodes on the left and right
struct AST * AST_Bexpr_Last_Rast(struct AST* left, char base[50], struct AST* right){
    struct AST* ASTassign = malloc(sizeof(struct AST));
	strcpy(ASTassign->nodeValue, base);
	ASTassign->left = left;
    ASTassign->right = right;
    return ASTassign;
}

//This function creates and returns a new node with some new value as well as creating and pointing to new left and right nodes with some new value
struct AST * AST_Bexpr_Lexpr_Rexpr(char left[50], char base[50], char right[50]){
    struct AST* ASTassign = malloc(sizeof(struct AST));
    struct AST* leftAST= malloc(sizeof(struct AST));
    struct AST* rightAST = malloc(sizeof(struct AST)); 
    strcpy(ASTassign->nodeValue, base);
    strcpy(leftAST->nodeValue, left);
    strcpy(rightAST->nodeValue, right);
    ASTassign->left = leftAST;
    ASTassign->right = rightAST;
    return ASTassign;
}

//This function creates and returns a new node with some new value that points to an existing left node and creates and points to a new right node
struct AST * AST_Bexpr_Last_Rexpr(struct AST* left, char base[50], char right[50]){
    struct AST* ASTassign = malloc(sizeof(struct AST));
    ASTassign->left = left;
    struct AST* rightAST= malloc(sizeof(struct AST));
    strcpy(ASTassign->nodeValue, base);
    strcpy(rightAST->nodeValue, right);
    ASTassign->right = rightAST;
    return ASTassign;
}

//This function creates and returns a new node with some new value that creates and points to a new left node creates and points to an existing right node
struct AST * AST_Bexpr_Lexpr_Rast(char left[50], char base[50], struct AST* right){
    struct AST* ASTassign = malloc(sizeof(struct AST));
    struct AST* leftAST= malloc(sizeof(struct AST));
    strcpy(ASTassign->nodeValue, base);
    strcpy(leftAST->nodeValue, left);
    ASTassign->left = leftAST;
    ASTassign->right = right;
    return ASTassign;
}

//This function creates a text based printout of the tree passed into it which is usefull for larger trees
void printSmallTrees(struct AST* tree, int level){
    if(tree == NULL) return;
    printf("at level %d the token %s has %s on its left and %s on its right\n\n",level,tree->nodeValue,(tree->left==NULL)?"Nothing":tree->left->nodeValue,(tree->right==NULL)?"Nothing":tree->right->nodeValue);
    if(tree->left != NULL){
        printf("left from previous\n");
        printSmallTrees(tree->left,level+1);
    }
    if(tree->right != NULL){
        printf("right from previous\n");
        printSmallTrees(tree->right,level+1);
    }
}

//This function prints an easily legible visual representation of the tree passed into it
void printBetterAST(struct AST* tree, int level, int xIndex, int yIndex){
    if(level == 0){
         for(int i = 0; i < arraySize*arraySize; i++){
            printArray2[i] = ' ';
        }
    }
    int currIndex = xIndex + yIndex * arraySize;
    int wordLength;
    int offset = 0;
    for(wordLength = 0; tree->nodeValue[wordLength] != '\0'; wordLength++){
        printArray2[currIndex] = tree->nodeValue[wordLength];
        currIndex++;
    }
    if(tree->left != NULL){
        printArray2[xIndex + (yIndex + 1) * arraySize] = '|';
        printBetterAST(tree->left,level+1,xIndex,yIndex+2);
    }    
    int notFound = 1;
    if(tree->right != NULL){
        while(notFound == 1){
            notFound = 0;
            int newIndex = xIndex+wordLength+(yIndex+1)*arraySize+offset;
            while(newIndex < arraySize*arraySize){
                
                if(printArray2[newIndex] != ' '){
                    currIndex++;
                    offset++;
                    printArray2[currIndex] = '-';
                    notFound = 1;
                    break;
                }
                newIndex += arraySize;
            }
        }
        printArray2[currIndex] = '-';
        currIndex++;
        offset++;
        printArray2[currIndex] = '\\';
        printArray2[xIndex + wordLength + (yIndex + 1) * arraySize + offset] = '|';
        printBetterAST(tree->right,level+1,xIndex+wordLength + offset,yIndex+2);
    }
    if(level == 0){
        int finalVal = arraySize*arraySize-1;
        while(printArray2[finalVal] == ' '){
            finalVal--;
        }
        for(int i = 0; i < finalVal+1; i++){
            if(i%arraySize == 0)
                printf("\n");
            printf("%c",printArray2[i]);
        }
        printf("\n");
    }
}

//this function takes in an AST and reverses it which is useful for solving order of operations
void reverseTree(struct AST * tree){
    struct AST * currNode = tree;
    while(currNode->right != NULL && currNode->right->right != NULL && currNode->right->right->right != NULL){
        struct AST * nextNode = currNode->right;
        struct AST * tempLeft = currNode->right;
        currNode->right = currNode->right->right;
        tempLeft->right = currNode->right->left;
        currNode->right->left = tempLeft;
    }
}

//This function takes in a tree that describes a mathimatical expression and refactors it to follow proper order of operations
void refactorAST(struct AST* tree){
    struct AST * currNode = tree;
    reverseTree(tree);
    int start = 0;
    currNode = currNode->right;
    while(currNode->left != NULL && currNode->left->left != NULL){
        struct AST * nextNode = currNode->left;
        if(start == 0 && (strcmp(currNode->nodeValue,"*") == 0 || strcmp(currNode->nodeValue,"/") == 0)){
            struct AST * tempLeft = currNode;
            tree->right = currNode->left;
            tempLeft->left = tree->right->right;
            tree->right->right = tempLeft;
            printf("test\n\n\n");
            currNode = nextNode;
        }
        else if(currNode->left->left->left != NULL && strcmp(nextNode->nodeValue,"*") == 0 || strcmp(nextNode->nodeValue,"/") == 0){
            struct AST * tempLeft = currNode->left;
            currNode->left = currNode->left->left;
            tempLeft->left = currNode->left->right;
            currNode->left->right = tempLeft;
        }else{
            currNode = nextNode;
        }
        start = 1;
    }
}

//This function takes in an organized AST and calculates the final answer for the expression;
int solveAST(struct AST* tree){
    if(!(strcmp(tree->nodeValue,"+") == 0 || strcmp(tree->nodeValue,"-") == 0 || strcmp(tree->nodeValue,"*") == 0 || strcmp(tree->nodeValue,"/") == 0)){
        return atoi(tree->nodeValue);
    }else{
        if(strcmp(tree->nodeValue,"+") == 0){
            return solveAST(tree->left) + solveAST(tree->right);
        }else if(strcmp(tree->nodeValue,"-") == 0){
            return solveAST(tree->left) - solveAST(tree->right);
        }else if(strcmp(tree->nodeValue,"*") == 0){
            return solveAST(tree->left) * solveAST(tree->right);
        }else if(strcmp(tree->nodeValue,"/") == 0){
            printf("%s / %s = %d\n",tree->left->nodeValue,tree->right->nodeValue,atoi(tree->left->nodeValue)/atoi(tree->right->nodeValue));
            return solveAST(tree->left) / solveAST(tree->right);
        }
    }
}