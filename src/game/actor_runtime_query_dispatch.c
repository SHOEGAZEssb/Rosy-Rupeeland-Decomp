#include "tingle/types.h"

/* Expose actor, attachment, geometry, and resource state to numeric callers. */
#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorBounds_GetWidth(void *bounds);
extern s32 ActorBounds_GetHeight(void *bounds);
extern void VecFx32Object_InitCopy(void *temporary, const void *source);
extern void VecFx32Object_Destroy(void *temporary);
extern void *VecFx32Stepper_GetStep(void *resourceState);
#ifdef __cplusplus
}
#endif

/*
 * Return the actor property selected by index 0..46, or zero for unsupported
 * selectors. Coordinates returned by selectors 7..9 and 44..46 are converted
 * from 20.12 fixed point to integers. Selectors 10, 16, 19..24 assume the
 * attachment at actor+0x54 is present; selectors 36..38 resolve actor+0x198
 * through its resource helper. Selectors 11, 12, 18, 23, 26, 28..35, 39, 40,
 * and 43 are confirmed zero slots rather than inferred omissions. Temporary
 * vector construction/destruction for 7..9 may have SDK-side ownership effects.
 */
s32 Actor_QueryRuntimeProperty(void *self, u32 selector)
{
    u8 *actor = (u8 *)self;
    u8 *attachment = *(u8 **)(actor + 0x54);
    u8 temporary[16];
    void *resource;
    s32 value;

    switch (selector) {
    case 0:
        return ActorBounds_GetWidth(actor + 8);
    case 1:
        return ActorBounds_GetHeight(actor + 8);
    case 2:
        return ActorBounds_GetWidth(actor + 4);
    case 3:
        return ActorBounds_GetHeight(actor + 4);
    case 4:
        return *(s32 *)(actor + 0x1dc);
    case 5:
        return *(u32 *)(actor + 0x14) & 0x10;
    case 6:
        return (*(u32 *)(actor + 0x10) & 4) != 0;
    case 7:
        VecFx32Object_InitCopy(temporary, actor + 0x18);
        value = *(s32 *)(temporary + 4) >> 12;
        VecFx32Object_Destroy(temporary);
        return value;
    case 8:
        VecFx32Object_InitCopy(temporary, actor + 0x18);
        value = *(s32 *)(temporary + 8) >> 12;
        VecFx32Object_Destroy(temporary);
        return value;
    case 9:
        VecFx32Object_InitCopy(temporary, actor + 0x18);
        value = *(s32 *)(temporary + 12) >> 12;
        VecFx32Object_Destroy(temporary);
        return value;
    case 10:
        return attachment[0x38];
    case 13:
        return (*(u32 *)(actor + 0x10) & 0x4000) == 0 &&
               (*(u32 *)(actor + 0x10) & 0x2000) != 0;
    case 14:
        return (*(u32 *)(actor + 0x10) & 0x2000) != 0;
    case 15:
        return (*(u32 *)(actor + 0x10) & 0x4000) != 0 &&
               (*(u32 *)(actor + 0x10) & 0x2000) == 0;
    case 16:
        return attachment[0x3a];
    case 17:
        return *(s32 *)(actor + 0xc8);
    case 19:
        return *(s16 *)(attachment + 0x2c);
    case 20:
        return *(s16 *)(attachment + 0x2e);
    case 21:
        return *(s16 *)(attachment + 0x32);
    case 22:
        return *(s16 *)(attachment + 0x34);
    case 24:
        return *(u16 *)(attachment + 0x28);
    case 25:
        return *(s8 *)(actor + 0x5e);
    case 27:
        return *(s16 *)(actor + 0xe4);
    case 36:
        resource = VecFx32Stepper_GetStep(actor + 0x198);
        return *(s32 *)((u8 *)resource + 4);
    case 37:
        resource = VecFx32Stepper_GetStep(actor + 0x198);
        return *(s32 *)((u8 *)resource + 8);
    case 38:
        resource = VecFx32Stepper_GetStep(actor + 0x198);
        return *(s32 *)((u8 *)resource + 12);
    case 41:
        return (*(u32 *)(actor + 0x14) & 0x2000) != 0;
    case 42:
        return (*(u32 *)(actor + 0x14) & 0x10000000) == 0;
    case 44:
        return *(s32 *)(actor + 0x2c) >> 12;
    case 45:
        return *(s32 *)(actor + 0x30) >> 12;
    case 46:
        return *(s32 *)(actor + 0x34) >> 12;
    default:
        return 0;
    }
}
