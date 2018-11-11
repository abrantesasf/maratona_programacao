/*
=============================================================================
= Name        : passpar.c
= Author      : Abrantes Araújo Silva Filho
= Version     :
= Copyright   :
= Description : Teste de passagem de argumentos para parâmetros de métodos
 ============================================================================
*/

// Includes:
#include <stdio.h>
#include <stdlib.h>


/* Main: */
int main(void) {
  
  /* Variáveis: */
  int ano = 1974;
  int *ponteiro;
  ponteiro = &ano;

  /* Mostra endereços: */
  printf("\n            Endereço de Memória da Variável \"ano\" = &ano = %p", &ano);
  printf("\nConteúdo do Endereço de Memória da Variável \"ano\" = ano = %d", ano);
  printf("\n            Endereço de Memória do Ponteiro \"*ponteiro\" = &ponteiro = %p", (void *)&ponteiro);
  printf("\nConteúdo do Endereço de Memória do Ponteiro \"*ponteiro\" =  ponteiro = %p", (void *)ponteiro);
  printf("\nConteúdo do Endereço de Memória da Variável \"ano\" acessada através do Ponteiro \"*ponteiro\" = *ponteiro = %d", *ponteiro);
  printf("\n");

  /* Altera diretamente a variável: */
  ano = 2005;

  /* Mostra endereços: */
  printf("\n            Endereço de Memória da Variável \"ano\" = &ano = %p", &ano);
  printf("\nConteúdo do Endereço de Memória da Variável \"ano\" = ano = %d", ano);
  printf("\n            Endereço de Memória do Ponteiro \"*ponteiro\" = &ponteiro = %p", (void *)&ponteiro);
  printf("\nConteúdo do Endereço de Memória do Ponteiro \"*ponteiro\" =  ponteiro = %p", (void *)ponteiro);
  printf("\nConteúdo do Endereço de Memória da Variável \"ano\" acessada através do Ponteiro \"*ponteiro\" = *ponteiro = %d", *ponteiro);
  printf("\n");

  /* Altera a variável via ponteiro: */
  *ponteiro = 2010;

  /* Mostra endereços: */
  printf("\n            Endereço de Memória da Variável \"ano\" = &ano = %p", &ano);
  printf("\nConteúdo do Endereço de Memória da Variável \"ano\" = ano = %d", ano);
  printf("\n            Endereço de Memória do Ponteiro \"*ponteiro\" = &ponteiro = %p", (void *)&ponteiro);
  printf("\nConteúdo do Endereço de Memória do Ponteiro \"*ponteiro\" =  ponteiro = %p", (void *)ponteiro);
  printf("\nConteúdo do Endereço de Memória da Variável \"ano\" acessada através do Ponteiro \"*ponteiro\" = *ponteiro = %d", *ponteiro);
  printf("\n");

  /* Retorna: */
  return EXIT_SUCCESS;

}
