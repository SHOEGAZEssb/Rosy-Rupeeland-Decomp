#include "tingle/types.h"

/* Overlay 17 fixed-point 9x9 deformation-grid initialization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020add34(void *, void *);
#ifdef __cplusplus
}
#endif

/*
 * Initialize a 9x9 grid using caller scale shifted left four bits. For each
 * cell at state +0x144 with 0x0C-byte stride and 0x6C-byte row stride, clear
 * fields +4, +0x798, and +0x7A0, set +0x79C to fixed-point 0xFFF, and clear the
 * parallel 9x9 word table at state +0. Coordinates are centered on index 4 at
 * twice the signed quotient of (index-4)*scale by 8. Points outside the radius
 * are normalized in-place as a three-word (X,0,Z) vector by 0x020ADD34 and then
 * rescaled with 12-bit fixed-point rounding. Store X/Z at cell +0/+8 and return
 * state. Only caller-owned grid memory changes; the math helper has no known
 * hardware effects.
 */
extern "C" void *Overlay017_Grid_Init(void *state, s32 scale)
{
    s32 fixedScale = scale << 4;
    s32 radiusSquared = fixedScale * fixedScale;
    s32 row;

    for (row = 0; row <= 8; row++) {
        s32 z = (((row - 4) * fixedScale) / 8) * 2;
        s32 column;

        for (column = 0; column <= 8; column++) {
            void *cell = (u8 *)state + 0x144 + row * 0x6c + column * 0xc;
            s32 vector[3];
            s32 magnitudeSquared;

            FIELD(s32, cell, 4) = 0;
            FIELD(s32, cell, 0x798) = 0;
            FIELD(s32, cell, 0x7a0) = 0;
            FIELD(s32, state, row * 0x24 + column * 4) = 0;
            FIELD(s32, cell, 0x79c) = 0xfff;

            vector[0] = (((column - 4) * fixedScale) / 8) * 2;
            vector[1] = 0;
            vector[2] = z;
            magnitudeSquared = vector[0] * vector[0] +
                               (z < 0 ? -z : z) * (z < 0 ? -z : z);
            if (magnitudeSquared > radiusSquared) {
                func_020add34(vector, vector);
                vector[0] = (s32)(((s64)fixedScale * vector[0] + 0x800) >> 12);
                vector[2] = (s32)(((s64)fixedScale * vector[2] + 0x800) >> 12);
            }
            FIELD(s32, cell, 0) = vector[0];
            FIELD(s32, cell, 8) = vector[2];
        }
    }
    return state;
}
