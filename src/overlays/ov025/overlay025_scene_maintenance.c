#include "tingle/types.h"

/* Overlay 25 per-frame presentation maintenance and record-widget redraws. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void PresentationList_UpdateAndDeleteCompleted(void *);
extern void SpriteMotionController_Update(void *);
extern void func_ov025_021fdc60(void *, s32);
extern void func_ov094_022196e8(void *);
#ifdef __cplusplus
}
#endif

/*
 * Advance overlay-94 state +0x5C0, callback holder +0x4F8, the six title
 * controllers, both sprite groups, and the optional name-entry sprite group.
 * The pointed presentation state advances in retail order; this function has
 * no return value and does not allocate or release ownership.
 */
extern "C" void func_ov025_02200178(void *scene)
{
    func_ov094_022196e8(FIELD(void *, scene, 0x5c0));
    PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x4f8);
    SpriteMotionController_Update((u8 *)scene + 0xf0);
    SpriteMotionController_Update((u8 *)scene + 0x19c);
    SpriteMotionController_Update((u8 *)scene + 0x248);
    for (s32 i = 0; i < 3; ++i)
        SpriteMotionController_Update((u8 *)scene + 0x2f4 + i * 0xac);
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, scene, 0xb0));
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, scene, 0xb4));
    if (FIELD(void *, scene, 0x598))
        GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, FIELD(void *, scene, 0x598), 0));
}

/*
 * Redraw each of the three record widgets stored at +0xE4/+0xE8/+0xEC with
 * offset zero. Widget rendering state changes; the function returns no value.
 */
extern "C" void func_ov025_022001f4(void *scene)
{
    for (s32 i = 0; i < 3; ++i) {
        u8 *entry = (u8 *)scene + i * 4;
        func_ov025_021fdc60(FIELD(void *, entry, 0xe4), 0);
    }
}
