#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

bool T();
bool E();
char letra;




bool esEntero(){
	if(isdigit(letra)){
		letra = getchar();
		while(esEntero())
		return true;
	}else{
		return false;
	}
}

bool comparacionChar(char t) {
    if (letra == t) {
        letra = getchar();
		return true;
    }
    else
		return false;
}

bool E(){
	if (T()){
		if (comparacionChar('+')){
			if (E()){
				return true;
			}
			return false;
		}
		return true;
	} else{
		return false;
	}
}

bool T(){
	if (esEntero()){
		if (comparacionChar('*')){
			if (T()){
				return true;
			}
			return false;
		}
		return true;
	} else if (comparacionChar('(')){
		if (E()){
			if (comparacionChar(')')){
				return true;
			}
			return false;
		}
		return false;
	}
	return false;
}



int main(int argc, char** argv) {
	letra = getchar();
	bool result;
    do {
	    result = E();
    } while (letra != '\n' && letra != EOF && result);
	
	if (result){
		printf("Parsing Successful\n");
	} else{
		printf("Error\n");
	}
        
}