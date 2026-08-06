#include "tingle/types.h"

/* Recovered record, transform, and presentation-angle setup for an orientation-driven tracked-resource actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02005058(void *vector);
extern s32 func_02005070(const void *vector);
extern void func_020050a4(void *destination, const void *source);
extern void func_020066a4(void *destination, u32 argument, const void *position);
extern void func_020328d0(void *vector, s32 angle);
extern void func_02050b34(void *vector, s32 length);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are an oriented actor, its record, a transform-related argument, and
 * an unused fourth value. Stores the record at 0x1FC, derives a vector at 0x38,
 * clamps its recovered length to at least 4, and rotates it by signed record
 * halfword 0x0A shifted four bits. It copies that same halfword to presentation
 * offset 0x36, sets actor flag 0x800000, and replaces the low half of field
 * 0x5C with 8. Returns nothing; transform and presentation state change without
 * direct hardware access. The halfword is treated as an angle only by inference.
 */
void func_0205232c(void *actor, const void *record, u32 argument, u32 unused)
{
    u8 vector[16];
    s32 length;
    s16 angle;
    (void)unused;
    FIELD(const void *, actor, 0x1fc) = record;
    func_020066a4(vector, argument, (u8 *)actor + 0x18);
    func_020050a4((u8 *)actor + 0x38, vector);
    func_02005058(vector);
    length = func_02005070((u8 *)actor + 0x38);
    if (length < 4)
        length = 4;
    func_02050b34((u8 *)actor + 0x38, length);
    angle = FIELD(s16, record, 0x0a);
    func_020328d0((u8 *)actor + 0x38, (s32)angle << 4);
    FIELD(s16, FIELD(void *, actor, 0x54), 0x36) = angle;
    FIELD(u32, actor, 0x14) |= 0x800000;
    FIELD(u32, actor, 0x5c) = (FIELD(u32, actor, 0x5c) & 0xffff0000) | 8;
}
