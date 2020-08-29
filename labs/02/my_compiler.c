//Rocha Avila Hugo Masharelli
//A01633090
//Compilers
 
#include <stdio.h>
#include <stdbool.h> 
#include <string.h>
#include <stdlib.h>

int topX=-1;
int topY=-1;
int posFisrtStack[1000],posSecondStack[1000];
char firstStack[1000],secondStack[1000];
int posicionCom=-1;
bool comentarioL=false;
bool errores=false;
bool com=false;

void checkLine(char *line, int size, int nline){
    for(int i=0;i<size;i++){
        

        // Detectar si en el codigo se encuentra algun comentario para revisar 

        if(line[i]=='/' && line[i+1]=='/'){
            break;
        }else if(line[i]=='/' && line[i+1]=='*'){
            comentarioL=true;
            continue;
        }else if(line[i]=='*' && line[i+1]=='/'){
            comentarioL=false;
            continue;
        }
        if(comentarioL){
            continue;
        }

        // Verifica si tenemos algun error en alguna comilla
        if(line[i]=='"' ||line[i]=='\'' ){
            if(com){
                com=false;
                posicionCom=-1;
            }else{
                com=true;
                posicionCom=nline;
            }
        }
        if(com){
            continue;
        }

        //Verificar si hay errores en los brackets corchetes parentesis
        if(line[i]=='('){
            firstStack[++topX]='(';
            posFisrtStack[topX]=nline;
        }else if(line[i]==')' && firstStack[topX]=='('){
            topX--;
        }else if(line[i]==')' && topX==-1){
            printf("Extra closing parentesis ) at line %d\n", nline);
            errores=true;
        }else if(line[i]=='{'){
            secondStack[++topY]='{';
            posSecondStack[topY]=nline;
        }else if(line[i]=='}' && secondStack[topY]=='{'){
            topY--;
        }else if(line[i]=='}' && topY ==-1){
            printf("Extra closing corchete  } at line %d\n", nline);
            errores=true;
        }
    }
}

//Leemoes el archivo y lanzamos los comentarios en dado caso de que todo este bien o encontremos un error

void leerArchivo(char *nombreArchivo){
    FILE * fp;
    char * line = NULL;
    size_t len = 0;
    ssize_t read;
    fp = fopen(nombreArchivo, "r");
    if (fp == NULL)
        exit(EXIT_FAILURE);
    int nline=1;
    while ((read = getline(&line, &len, fp)) != -1) {
        checkLine(line, strlen(line), nline);
        nline++;
    }   
    if(posicionCom!=-1){
        errores=true;
        printf("Wrong comilla at line: %d\n", posicionCom);
    }
    for(int i=0;i<=topX;i++){
        if(i>posicionCom && posicionCom!=-1)
            break;
        errores=true;
        if(posFisrtStack[i]==0){
            continue;
        }
        printf("Unclosed parentesis at line: %d\n", posFisrtStack[i]);
    }
    for(int i=0;i<=topY;i++){
        if(i>posicionCom && posicionCom!=-1)
            break;
        errores=true;
        if(posSecondStack[i]==0){
            continue;
        }
        printf("Unclosed brace at line: %d\n", posSecondStack[i]);
    }
    if(!errores){
        printf("There is no errors\n");
    }
    fclose(fp);
    if (line)
        free(line);
    exit(EXIT_SUCCESS);
}

int main(int argc, char **argv){
    char *file=argv[1];
    leerArchivo(file);
}