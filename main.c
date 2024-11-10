#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

bool esNumero(int n, char* mensaje){
	if(n != 1){
		printf("%s", mensaje);
		while (getchar() != '\n');
		return false;
	}return true;
}

int binarioADecimal(int n){
	int num;
	int digito;
	int suma = 0;
	int cont = 0;
	while(n > 0){
		cont++;
		if(cont > 8){
			printf("Número con más de 8 bits. Por favor, ingrese uno con 8 bits o menos.\n");
			return -1;
		}
                digito = n % 10;
		if(digito > 1){
			printf("Número no binario. Verifique los dígitos.\n");
			return -1;
		}else
			suma += digito * pow(2, cont-1);
                n = n / 10;
	}
        return suma;
}

int generarAleatorio(){
	time_t tiempoActual = time(NULL);
	int aleatorio = (tiempoActual % (50 - 10 + 1)) + 10;
	return aleatorio;
}

void decimalABinario(int n){
	int binario[32];
	int i = 0;
	while(n!=0){
		if(n%2 == 0){
			binario[i] = 0;
			n = n/2;
		}else{
			binario[i] = 1;
			n = floor(n/2);
		} i++;
	}
	for(int j = i-1; j >= 0; j--){
		printf("%d", binario[j]);
	}printf("\n");
}

int main()
{
	bool end = true, endin;
        int opt, optin = 0;

	printf("1. Convertir Decimal a Binario\n2. Convertir Binario a Decimal\n3. Generar un número aleatorio\n4. Salir\n");

        while(end){
		printf("Ingrese una opción: \n");
		if(!esNumero(scanf("%d", &opt), "Entrada inválida. Por favor ingrese un número.\n"))
			continue;
                switch(opt)
                {
                        case 1:
                                endin = true;
				printf("\n-----Convertir Decimal a Binario-----\n");
				while(endin){
					printf("Ingrese el número decimal: \n");
					if(!esNumero(scanf("%d", &opt), "Entrada inválida. Por favor ingrese un número.\n"))
						continue;
					else
						endin = false;
				}
				decimalABinario(optin);
                                break;
                        case 2:
                                endin = true;
				int binario;
				printf("\n-----Convertir Binario a Decimal-----\n");
				while(endin){
					printf("Ingrese el número binario: \n");
					if(!esNumero(scanf("%d", &opt), "Entrada inválida. Por favor ingrese un número.\n"))
						continue;
					binario = binarioADecimal(opt);
					if(binario == -1)
						continue;
					else
						endin = false;
				}
				printf("El número en binario es: %d .\n", binario);
                                break;
                        case 3:
                                int aleatorioD = generarAleatorio();
				printf("Número en base decimal: %d\n", aleatorioD);
				printf("Número en base binaria: ");
				decimalABinario(aleatorioD);
				printf("\n");
                                break;
                        case 4:
				printf("HASTA LUEGO\n");
				end = false;
				break;
			default:
				printf("Opciones válidas: \n");
                            	printf("\t1. Convertir Decimal a Binario\n\t2. Convertir Binario a Decimal\n\t3. Generar un número aleatorio\n\t4. Salir\n");
				break;
                }
        }

}


