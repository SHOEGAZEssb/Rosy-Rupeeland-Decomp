#ifndef TINGLE_RANDOM_H
#define TINGLE_RANDOM_H

#include "tingle/types.h"

void init_genrand(u32 seed);
void init_by_array(const u32 *initKey, int keyLength);
u32 genrand_int32(void);

void InitRandom(void);

#endif
