
#ifndef IIR_H
#define IIR_H

#include "common.h"

DSPfract first_order_IIR(DSPfract input, DSPfract* coefficients, DSPfract* z_x, DSPfract* z_y);

#endif