#include "tingle/types.h"

/* Overlay 25 saved-record choice-controller animation and visibility helpers. */

#ifdef __cplusplus
extern "C" {
#endif
extern void SpriteMotionController_Hide(void *);
extern void SpriteMotionController_SetAnimation(void *, s32);
#ifdef __cplusplus
}
#endif

/* Selects animations 0x21, 0x23, and 0x25 on controllers at scene +0x2F4. */
extern "C" void func_ov025_02200534(void *scene)
{
    for (s32 i = 0; i < 3; ++i)
        SpriteMotionController_SetAnimation((u8 *)scene + 0x2f4 + i * 0xac, i * 2 + 0x21);
}

/* Hides the three 0xAC-byte controllers beginning at scene offset +0x2F4. */
extern "C" void func_ov025_02200564(void *scene)
{
    for (s32 i = 0; i < 3; ++i)
        SpriteMotionController_Hide((u8 *)scene + 0x2f4 + i * 0xac);
}
