
#include "common.h"
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <stdio.h>
/**************************************
* IIR filtar prvog reda
*
* input - ulazni odbirak
* coefficients - koeficijenti [a0 a1 b0 b1]
* z_x - memorija za ulazne odbirke (niz duzine 2)
* z_y - memorija za izlazne odbirke (niz duzine 2)
*
* povratna vrednost - izlazni odbirak
*
**************************************/

DSPfract first_order_IIR(DSPfract input, DSPfract* coefficients, DSPfract* z_x, DSPfract* z_y)
{
	DSPfract temp;
	
	*z_x = input; /* Copy input to x[0] */
//	printf("z_x %fl   %fl\n", *z_x);
	temp = (*coefficients * *z_x);   /* B0 * x(n)     */
//	printf("temp %fl   %fl\n", temp);
//	printf("z_x+1 %fl   %fl\n", *(z_x+1));
	temp += (*(coefficients+1) * *(z_x +1));    /* B1 * x(n-1) */
//	printf("temp %fl   %fl\n", temp);
//printf("z_y+1 %fl   %fl\n", *(z_y + 1));
	temp -= (*(coefficients + 3) * *(z_y + 1));    /* A1 * y(n-1) */
//	printf("temp %fl   %fl\n", temp);
//	printf("z_y %fl   %fl\n", *(z_y));
	*z_y = (temp);

	/* Shuffle values along one place for next time */

	*(z_y + 1) = *(z_y);   /* y(n-1) = y(n)   */
	*(z_x + 1) = *z_x;   /* x(n-1) = x(n)   */

	return (temp);
}

