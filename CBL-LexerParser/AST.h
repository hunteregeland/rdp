
//Abstract Syntax Tree Implementation
#include <string.h>

struct AST{
	char nodeType[50];
	char LHS[50];
	char RHS[50];
	
	struct AST * left;
	struct AST * right;
	// review pointers to structs in C 
	// complete the tree struct with pointers
};



struct AST * AST_assignment(char nodeType[50], char LHS[50], char RHS[50]){
	

	struct AST* ASTassign = malloc(sizeof(struct AST));
	strcpy(ASTassign->nodeType, nodeType);
	strcpy(ASTassign->LHS, LHS);
	strcpy(ASTassign->RHS, RHS);
	

/*
       =
	 /   \
	x     y

*/	
	return ASTassign;
	
}
struct AST * AST_BinaryExpression(char nodeType[50], char LHS[50], char RHS[50]){

	struct AST* ASTBinExp = malloc(sizeof(struct AST));
	strcpy(ASTBinExp->nodeType, nodeType);
	strcpy(ASTBinExp->LHS, LHS);
	strcpy(ASTBinExp->RHS, RHS);
	return ASTBinExp;
	
}
struct AST * AST_Type(char nodeType[50], char LHS[50], char RHS[50]){

	struct AST* ASTtype = malloc(sizeof(struct AST));
	strcpy(ASTtype->nodeType, nodeType);
	strcpy(ASTtype->LHS, LHS);
	strcpy(ASTtype->RHS, RHS);
		
	return ASTtype;
	
}

struct AST * AST_Func(char nodeType[50], char LHS[50], char RHS[50]){
	
	struct AST* ASTtype = malloc(sizeof(struct AST));
	strcpy(ASTtype->nodeType, nodeType);
	strcpy(ASTtype->LHS, LHS);
	strcpy(ASTtype->RHS, RHS);
		
	return ASTtype;
	
}

struct AST * AST_Write(char nodeType[50], char LHS[50], char RHS[50]){
	
	struct AST* ASTtype = malloc(sizeof(struct AST));
	strcpy(ASTtype->nodeType, nodeType);
	strcpy(ASTtype->LHS, LHS);
	strcpy(ASTtype->LHS, RHS);
		
	return ASTtype;
	
}

void printDots(int num)
{
	for (int i = 0; i < num; i++)
		printf("      ");
}


void printASTtest(struct AST* tree, int level){
	if (tree == NULL) return;
	printDots(level);
	printf("%s\n", tree->nodeType);
	printDots(level);
	printf("%s %s\n", tree->LHS, tree->RHS);
	if(tree->left != NULL) printAST(tree->left, level+1); else return;
	if(tree->right != NULL) printAST(tree->right, level+1); else return;
	
}


void manualAST(struct AST* tree){
	printf(tree->nodeType);
	printf("1: %s \n",tree->left->LHS);
	printf("2: %s \n",tree->left->RHS);
	printf("3: %s \n",tree->right->LHS);
	printf("4: %s \n",tree->right->RHS);
}


void printAST(struct AST* tree, int level){

	
	if(strcmp(tree->nodeType, "STOP") == 0){
		printDots(level);
		printf(tree->nodeType);
		printf("\n------------End of AST------------\n");
		exit(0);
	}
	

	if (tree == NULL) {printf("\nEmpty Tree\n"); return;}
	
	printDots(level);
	printf("%s   ==    %d\n ", tree->nodeType, strlen(tree->nodeType));
	
	printDots(level);
	printf("%s   ==    %d %s   ==    %d\n", tree->LHS, strlen(tree->LHS) ,tree->RHS,strlen(tree->RHS));
	
	FILE *ptr;
	ptr = fopen("exampleoutput.txt","w");
	fprintf(ptr, "%s %s\n", tree->LHS, tree->RHS);
	


	if(tree->left != NULL) {
		printAST(tree->left, level+1);} 

	if(tree->right != NULL) {
		printAST(tree->right, level+1);
	} 

	
}