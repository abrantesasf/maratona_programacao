/*
 ============================================================================
 Name        : aula1.c
 Author      : Abrantes Araújo Silva Filho
 Version     :
 Copyright   :
 Description : MIT OCW: Practical Programming in C
               Lecture 1
               Primeiro programa em C: Hello World!
 ============================================================================
 */

/* Includes: */
#include <stdio.h>
#include <stdlib.h>

int main(void) {
	/* Array de caracteres: */
	const char msg[] = "Hello, World!!!";

	/* Imprime no console */
	puts(msg);

	/* Retorna: */
	return EXIT_SUCCESS;
}
