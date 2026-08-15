#include "tingle/types.h"

/* Overlay 17 2D UI sprite-group construction and staged animation updates. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern u8 data_ov017_022016e0[];
extern void *gDebugFont;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_Play(void *, s32, s32);
extern void func_02071ea4(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern s32 Presentation_InterpolateLinear(s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Initialize resource controllers +4/+0x10, store duration/current inputs at
 * +0x5C/+0x60 and clear +0x64, then create a debug-font-backed 2D renderer.
 * Register resource-ID sets 0x3293..0x3295 and 0x3294/0x3296/0x3297. Create one
 * primary sprite at +0x1C and fifteen secondary sprites at +0x20..+0x58, with
 * their recovered fixed coordinates and flags, then return group. Resource,
 * renderer, and sprite SDK state change; no direct hardware access occurs.
 */
extern "C" void *func_ov017_021fe75c(void *group, s32 duration, s32 current)
{
    s32 i;

    func_02071ea4((u8 *)group + 4);
    func_02071ea4((u8 *)group + 0x10);
    FIELD(s32, group, 0x5c) = duration;
    FIELD(s32, group, 0x60) = current;
    FIELD(s32, group, 0x64) = 0;
    FIELD(void *, group, 0) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    func_02071ee0((u8 *)group + 4, data_020f4e18[0], 0x3293, 0x3294,
                  0x3295);
    func_02071ee0((u8 *)group + 0x10, data_020f4e18[0], 0x3296, 0x3294,
                  0x3297);
    FIELD(void *, group, 0x1c) =
        GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, group, 0), (u8 *)group + 4, 1);
    func_02073e48(FIELD(void *, group, 0x1c), 0, 0xdc, 0x86, 1, 0, 0);
    for (i = 0; i < 15; i++) {
        void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, group, 0),
                                     (u8 *)group + 0x10, 1);
        FIELD(void *, group, 0x20 + i * 4) = sprite;
        func_02073e48(sprite, 0, i * 0x10 + 0x10, 0xb0, 1, 0, 2);
    }
    return group;
}

/*
 * Update the group according to overlay-global progress. Fade the primary
 * sprite from 0 to 16 until global +0 reaches +8, then force mode zero. If
 * global +0x80 is clear, put every secondary sprite not already in mode 4 into
 * mode 4. Otherwise interpolate how many of the fifteen sprites are active,
 * switch newly reached sprites to mode 2, and play one cue (ID 0x4105 plus the
 * first changed index). Submit the renderer afterward. Sprite/audio/SDK state
 * changes; returns void and performs no direct hardware access.
 */
extern "C" void func_ov017_021fe894(void *group)
{
    s32 i;

    if (FIELD(s32, data_ov017_022016e0, 0) >=
        FIELD(s32, data_ov017_022016e0, 8)) {
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, group, 0x1c), 0);
    } else {
        s32 value = Presentation_InterpolateLinear(0, 0x10, FIELD(s32, group, 0x60),
                                  FIELD(s32, group, 0x64));
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, group, 0x1c), (u8)value);
    }

    if (FIELD(s32, data_ov017_022016e0, 0x80) == 0) {
        for (i = 0; i < 15; i++) {
            void *sprite = FIELD(void *, group, 0x20 + i * 4);
            if (FIELD(u8, sprite, 0x38) != 4) {
                GraphicsSpriteState_SetAnimationIndex(sprite, 4);
            }
        }
    } else {
        s32 limit = Presentation_InterpolateLinear(0, 15, FIELD(s32, group, 0x60),
                                  FIELD(s32, group, 0x64));
        s32 played = 0;
        for (i = 0; i < limit; i++) {
            void *sprite = FIELD(void *, group, 0x20 + i * 4);
            if (FIELD(u8, sprite, 0x38) != 2) {
                if (!played) {
                    u16 soundId = i + 0x4105;
                    Sound_Play(gSoundContext, soundId >> 7, soundId & 0x7f);
                    played = 1;
                }
                GraphicsSpriteState_SetAnimationIndex(sprite, 2);
            }
        }
    }
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, group, 0));
}
