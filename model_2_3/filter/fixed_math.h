#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <assert.h>

int64_t sine(uint64_t value);
int64_t cosine(uint64_t value);
int64_t float_to_fixed(double value, int scale);
int64_t clamp_overflow(int64_t value, int width);
void cordic(int theta, int *s, int *c, int n);

