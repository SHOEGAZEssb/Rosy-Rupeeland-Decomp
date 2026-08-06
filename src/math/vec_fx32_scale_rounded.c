#include "tingle/types.h"

/*
 * Scale the three recovered components of a 16-byte fixed-point value using
 * signed 20.12 multiplication with half-up rounding.
 */
typedef struct VecFx32Value { u32 field00;s32 x04,y08,z0c; } VecFx32Value;
#ifdef __cplusplus
extern "C" { extern void func_02004fe0(void *); }
#endif

/* Initialize destination, multiply source X/Y/Z by scale with +0x800 before >>12, and return no value. */
void func_020233c8(VecFx32Value *destination,const VecFx32Value *source,s32 scale)
{
    func_02004fe0(destination);
    destination->x04=(s32)(((s64)source->x04*scale+0x800)>>12);
    destination->y08=(s32)(((s64)source->y08*scale+0x800)>>12);
    destination->z0c=(s32)(((s64)source->z0c*scale+0x800)>>12);
}
