#include "tingle/types.h"

/*
 * Overlay 8 per-object initialization. This recovered helper selects an object
 * mode, enables a member flag, stores three values, and resets transform data.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_SetAnimationIndex(void *member, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Ignore the first argument. Submit the sixth argument through the pointer at
 * object +0x0C, set bit 1 in that pointed member's +0x24 halfword, store the
 * third/fourth/fifth arguments at object +0x30/+0x34/+0x38, initialize the
 * +0x3C/+0x3E halfwords to 0x100, and clear +0x40. Return no value; object
 * effects are delegated and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay008_InitializeObject(void *unused, void *object, s32 field30, s32 field34,
                         s32 field38, u8 mode)
{
    void *member;

    (void)unused;
    member = FIELD(void *, object, 0x0c);
    GraphicsSpriteState_SetAnimationIndex(member, mode);
    FIELD(u16, member, 0x24) |= 2;
    FIELD(s32, object, 0x30) = field30;
    FIELD(s32, object, 0x34) = field34;
    FIELD(s32, object, 0x38) = field38;
    FIELD(u16, object, 0x3c) = 0x100;
    FIELD(u16, object, 0x3e) = 0x100;
    FIELD(u16, object, 0x40) = 0;
}
