#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void callCobolToCobol(char* str[]){
	FILE * f;
	f = fopen("outputFiles/inputToTranslator.txt", "w");
	fprintf(f, str);
	fclose(f);
	system("python3 cobolToCobol.py");

}

void clear_Java_Output_File(){
	FILE * f;
	f = fopen("outputFiles/outputJavaTranslation.txt", "w");
	fclose(f);
}