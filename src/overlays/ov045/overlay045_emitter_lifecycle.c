#include "tingle/types.h"

/*
 * Overlay 45 emitter lifecycle and configuration. This recovered subsystem
 * owns two timing tracks, a resource owner, and an embedded transient-effect
 * list used by the following update routine.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u8 data_ov045_0220d570[];
extern "C" u8 data_ov045_0220d4e8[];
extern "C" u8 data_ov045_0220d4f8[];
extern "C" void *gDebugFont;
extern "C" void *data_020f4e18;
extern "C" void PresentationList_DeleteAll(void *object);
extern "C" void PresentationList_UpdateAndDeleteCompleted(void *object);
extern "C" void AnimationResourceState_InitEmbedded(void *owner);
extern "C" void AnimationResourceState_Destroy(void *owner);
extern "C" void func_02091b6c(void *track);
extern "C" u32 genrand_int32(void);
extern "C" void *GraphicsSpriteGroupOwner_CreateGroup(void *font);
extern "C" void AnimationResourceState_ReplaceResources(void *owner, void *archive, s32 first,
                               s32 second, s32 third);
extern "C" void GraphicsSpriteGroup_Destroy(void *resource);
extern "C" void GraphicsSpriteGroup_AdvanceAnimations(void *resource);
extern "C" s32 Presentation_InterpolateLinear(s32 minimum, s32 maximum, s32 seed, s32 span);
extern "C" void func_02091bac(void *track, s32 mode, s32 start, s32 end,
                               s32 duration);
extern "C" void func_02091b98(void *track, s32 value);

/*
 * Initialize the embedded effect-list head and return its storage. Install
 * the overlay vtable and clear links/metadata at +4, +8, and +0x0C. No SDK or
 * hardware state changes.
 */
extern "C" void *func_ov045_0220b7fc(void *object)
{
    FIELD(void *, object, 0) = data_ov045_0220d570;
    FIELD(s32, object, 8) = 0;
    FIELD(s32, object, 4) = 0;
    FIELD(s32, object, 0xc) = 0;
    return object;
}

/*
 * Restore the list vtable, release its shared base state through
 * PresentationList_DeleteAll, and return the unchanged list pointer. Owned base state may
 * be released; the caller retains the storage.
 */
extern "C" void *func_ov045_0220b81c(void *object)
{
    FIELD(void *, object, 0) = data_ov045_0220d570;
    PresentationList_DeleteAll(object);
    return object;
}

/*
 * Construct an emitter and return its storage. Initialize resource owner +4,
 * timing tracks +0x10/+0x2C, and effect list +0x48; seed +0x64 from the shared
 * PRNG; acquire debug-font state at +0; load resource IDs 0x1714..0x1716; and
 * clear accumulated timing fields +0x58/+0x5C. Resource and PRNG state change.
 */
extern "C" void *func_ov045_0220b83c(void *object)
{
    AnimationResourceState_InitEmbedded((u8 *)object + 4);
    func_02091b6c((u8 *)object + 0x10);
    func_02091b6c((u8 *)object + 0x2c);
    func_ov045_0220b7fc((u8 *)object + 0x48);
    FIELD(u32, object, 0x64) = 0;
    FIELD(u32, object, 0x64) = genrand_int32();
    FIELD(void *, object, 0) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    AnimationResourceState_ReplaceResources((u8 *)object + 4, data_020f4e18,
                   0x1714, 0x1715, 0x1716);
    FIELD(s32, object, 0x58) = 0;
    FIELD(s32, object, 0x5c) = 0;
    return object;
}

/*
 * Tear down an emitter and return its unchanged storage. Release the embedded
 * list, font resource, list base state after restoring its vtable, and owner
 * +4 in the original order. Resource and owned-list state change.
 */
extern "C" void *func_ov045_0220b8cc(void *object)
{
    PresentationList_DeleteAll((u8 *)object + 0x48);
    GraphicsSpriteGroup_Destroy(FIELD(void *, object, 0));
    FIELD(void *, object, 0x48) = data_ov045_0220d570;
    PresentationList_DeleteAll((u8 *)object + 0x48);
    AnimationResourceState_Destroy((u8 *)object + 4);
    return object;
}

/*
 * Update the embedded effect list and font resource. This advances their
 * shared runtime/display state and returns no value.
 */
extern "C" void func_ov045_0220b908(void *object)
{
    PresentationList_UpdateAndDeleteCompleted((u8 *)object + 0x48);
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, object, 0));
}

/*
 * Configure an emitter timing run and return its selected duration. Inputs are
 * a randomization seed/value, span/count, and orientation variant. Clamp the
 * duration from Presentation_InterpolateLinear to four times the span, configure track +0x10,
 * clear elapsed fields, select the two confirmed coordinate tables at
 * +0x68/+0x6C according to the variant stored at +0x60, and prime track +0x2C
 * with ten. Timing/PRNG helper state changes; no direct hardware access occurs.
 */
extern "C" s32 func_ov045_0220b924(void *object, s32 value, s32 span,
                                    s32 variant)
{
    s32 duration = Presentation_InterpolateLinear(0x14, 0xc8, value, span);
    if (duration > span * 4)
        duration = span * 4;
    func_02091bac((u8 *)object + 0x10, 1, 0, span, duration);
    FIELD(s32, object, 0x58) = 0;
    FIELD(s32, object, 0x5c) = 0;
    FIELD(s32, object, 0x60) = variant;
    if (variant == 0) {
        FIELD(void *, object, 0x68) = data_ov045_0220d4e8;
        FIELD(void *, object, 0x6c) = data_ov045_0220d4f8;
    } else {
        FIELD(void *, object, 0x68) = data_ov045_0220d4f8;
        FIELD(void *, object, 0x6c) = data_ov045_0220d4e8;
    }
    func_02091b98((u8 *)object + 0x2c, 10);
    return duration;
}
