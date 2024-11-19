#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <time.h>

void clearBuffer()
{
	while (getchar() != '\n');
}

bool validarEntrada(int *entrada, char *errmsg)
{
	if (scanf("%d", entrada) != 1)
	{
		clearBuffer();
		*entrada = 0;
		printf("%s\n", errmsg);
		return false;
	}
	clearBuffer();
	return true;
}

bool convertirDecimalABinario(int *decimal)
{
	char resultado[9];
	resultado[8] = '\0';
	int copiaD = *decimal;
	if (*decimal < 0)
	{
		printf("Por favor, ingrese un número positivo\n\n");
		return false;
	}
	if (*decimal > 255)
	{
		printf("Por favor, ingrese un número menor a 255\n\n");
		return false;
	}
	for (int contador = 7; contador >= 0; contador--)
	{
		if (copiaD % 2 == 1)
			resultado[contador] = '1';
		else
			resultado[contador] = '0';
		copiaD /= 2;
	}
	printf("El valor %d en binario es: %s\n", *decimal, resultado);
	printf("-------------------------------------\n\n");
	return true;
}

bool convertirBinarioADecimal(int *binario)
{
	int digito, copiaB = *binario, pot = 1, resultado = 0;
	if (*binario < 0)
	{
		printf("Por favor, ingrese un número positivo\n\n");
		return false;
	}
	if (*binario > 99999999)
	{
		printf("Por favor, ingrese un número de 8 bits\n\n");
		return false;
	}
	while (copiaB > 0)
	{
		digito = copiaB % 10;
		if (digito != 0 && digito != 1)
		{
			printf("Valor ingresado no válido\n");
			printf("Por favor, ingrese un número binario\n\n");
			return false;
		}
		copiaB /= 10;
		resultado += digito * pot;
		pot *= 2;
	}
	printf("El valor %d en decimal es: %d\n", *binario, resultado);
	printf("-------------------------------------\n\n");
	return true;
}

int generarAleatorio()
{
	srand(time(NULL));
	int aleatorio = 10 + (rand() % 41);
	return aleatorio;
}

int main()
{
	bool flagLoop = true, flagOpt;
	int opt, entrada = 0;

	while (flagLoop)
	{
		printf("------------ MENU ------------\n");
		printf("1. Convertir Decimal a Binario\n");
		printf("2. Convertir Binario a Decimal\n");
		printf("3. Generar un número aleatorio\n");
		printf("4. Salir\n\n");
		printf("Ingrese una opción: ");

		if (!validarEntrada(&opt, "Se ingresó una opción no válida.\n"))
			continue;
		switch (opt)
		{
		case 1:
			flagOpt = true;
			printf("\n-----Convertir Decimal a Binario-----\n");
			while (flagOpt)
			{
				printf("Ingrese un número en base 10: ");
				if (!validarEntrada(&entrada, "Entrada no válida. Por favor ingrese un número.\n"))
					continue;
				flagOpt = !convertirDecimalABinario(&entrada);
			}
			break;
		case 2:
			flagOpt = true;
			printf("\n-----Convertir Binario a Decimal-----\n");
			while (flagOpt)
			{
				printf("Ingrese un número en binario: ");
				if (!validarEntrada(&entrada, "Entrada no válida. Por favor ingrese un número.\n"))
					continue;
				flagOpt = !convertirBinarioADecimal(&entrada);
			}
			break;
		case 3:
			printf("\n-----Generar un Número Aleatorio-----\n");
			int aleatorio = generarAleatorio();
			printf("Número aleatorio generado: %d\n", aleatorio);
			convertirDecimalABinario(&aleatorio);
			break;
		case 4:
			printf("Saliendo del programa...\n");
			flagLoop = false;
			break;
		default:
			printf("Se ingresó una opción no válida\n");
			break;
		}
	}
	return 0;
}