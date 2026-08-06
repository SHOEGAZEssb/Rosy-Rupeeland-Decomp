#include "tingle/types.h"

/* Recovered transform and state setup for a projectile-like tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_02005058(void *vector);
extern void func_020050a4(void *destination, const void *source);
extern void func_02008378(void *destination, u32 transform, const void *vector);
extern void func_0200b2c0(void *vector, s32 x, s32 y, s32 z);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are a projectile-like actor, its record, a transform argument, and an
 * unused fourth value. Stores the record at 0x1FC, transforms vector
 * (0, 0, 0x100000) through func_02008378 and copies the result to actor offset
 * 0x18, destroys both temporary vectors, and zeroes the vector at 0x38. It then
 * sets flag 0x2000 at 0xD0 and replaces the low half of 0x5C with 8. Returns
 * nothing; vector helpers can mutate engine state but hardware is not accessed.
 */
void func_020513ac(void *actor, const void *record, u32 transform, u32 unused)
{
    u8 position[16];
    u8 source[16];
    (void)unused;
    FIELD(const void *, actor, 0x1fc) = record;
    func_0200500c(source, 0, 0, 0x100000);
    func_02008378(position, transform, source);
    func_020050a4((u8 *)actor + 0x18, position);
    func_02005058(position);
    func_02005058(source);
    func_0200b2c0((u8 *)actor + 0x38, 0, 0, 0);
    FIELD(u32, actor, 0xd0) |= 0x2000;
    FIELD(u32, actor, 0x5c) = (FIELD(u32, actor, 0x5c) & 0xffff0000) | 8;
}
