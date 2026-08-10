#include "tingle/types.h"

/* Recovered record and transform setup for a tracked-resource actor subclass. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02005058(void *vector);
extern s32 func_02005070(const void *vector);
extern void func_020050a4(void *destination, const void *source);
extern void VecFx32_Subtract(void *destination, u32 argument, const void *position);
extern void func_020328d0(void *vector, s32 angle);
extern void func_02050b34(void *vector, s32 length);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are a subclass actor, its record, a transform-related argument, and
 * an unused fourth value. Stores the record at 0x1FC, derives a temporary
 * vector from the argument and actor position at 0x18, copies it to 0x38,
 * applies signed record byte 0x15 to field 0x44, clamps the recovered vector
 * length to at least 4 through func_02050b34, and rotates it by record halfword
 * 0x0A shifted four bits. It then sets actor flags 0x800040 and replaces the
 * low half of field 0x5C with 8. Returns nothing; engine transform state changes
 * but hardware is not accessed directly. Record-field semantics are inferred.
 */
void func_02050a8c(void *actor, const void *record, u32 argument, u32 unused)
{
    u8 vector[16];
    s32 length;
    (void)unused;
    FIELD(const void *, actor, 0x1fc) = record;
    VecFx32_Subtract(vector, argument, (u8 *)actor + 0x18);
    func_020050a4((u8 *)actor + 0x38, vector);
    func_02005058(vector);
    FIELD(s32, actor, 0x44) += (s32)FIELD(s8, record, 0x15) * 0x1000;
    length = func_02005070((u8 *)actor + 0x38);
    if (length < 4)
        length = 4;
    func_02050b34((u8 *)actor + 0x38, length);
    func_020328d0((u8 *)actor + 0x38,
                  (s32)FIELD(s16, record, 0x0a) << 4);
    FIELD(u32, actor, 0x14) |= 0x800040;
    FIELD(u32, actor, 0x5c) = (FIELD(u32, actor, 0x5c) & 0xffff0000) | 8;
}
