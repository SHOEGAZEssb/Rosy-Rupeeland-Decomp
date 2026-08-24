#include "tingle/types.h"

/* Overlay 94 radial burst effect; transition positions use Q12 fixed point. */

extern const s16 gFx32CosSinTable[];
extern const u8 data_ov094_02219eb8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void SpritePresentation_InitVariant(void *effect, void *firstState);
extern void *SpritePresentation_Destroy(void *effect);
extern void Presentation_SetPosition(void *effect, s32 x, s32 y, s32 z);
extern void PresentationScalar_SetImmediate(void *motion, s32 value);
extern void PresentationScalar_TransitionTo(void *motion, s32 mode, s32 value);
extern s32 Presentation_AdvanceTransitions(void *effect);
extern s32 Presentation_InterpolateSmoothStep(s32 start, s32 end);
extern void GraphicsSpriteState_SetAnimationIndex(void *state, s32 index);
extern void GraphicsSpriteState_ReleaseFromGroup(void *state);
extern s32 GraphicsSpriteState_GetSequenceDuration(void *state);
extern s32 func_020befec(s32 numerator, s32 denominator);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

extern "C" s32 func_ov094_02217bc8(void *effect);
extern "C" void func_ov094_02217be0(void *effect);

/*
 * Initializes paired sprite states and a randomized radial path. scale is Q8,
 * angle is a 16-bit turn, and duration is frames. The first state remains base-
 * owned; secondState is released by teardown. Both states receive animation
 * lifetime/affine fields and optional horizontal flip from duration parity.
 */
extern "C" void *func_ov094_022177e0(void *effect, void *firstState,
                                      void *secondState, s32 animationBase,
                                      s32 scale, s32 angle, u32 duration)
{
    SpritePresentation_InitVariant(effect, firstState);
    *(const void **)effect = data_ov094_02219eb8;
    *(void **)((u8 *)effect + 0xa0) = secondState;
    *(s32 *)((u8 *)effect + 0xb4) = animationBase;

    s32 index = angle >> 4;
    s32 cosine = gFx32CosSinTable[index * 2];
    s32 sine = gFx32CosSinTable[index * 2 + 1];
    s32 initialX = scale * cosine * 0x30 / 0x100 + 0x80000;
    s32 initialY = scale * sine * 0x10 / 0x100 - 0x40000;
    s32 targetX = scale * cosine * 0x80 / 0x100 + 0x80000;
    s32 targetY = scale * sine * 0x30 / 0x100 + 0x150000;
    Presentation_SetPosition(effect, initialX, initialY, 0);
    PresentationScalar_TransitionTo((u8 *)effect + 0x0c, 1, targetX);
    PresentationScalar_TransitionTo((u8 *)effect + 0x1c, 1, targetY);

    *(s32 *)((u8 *)effect + 0x7c) = (s16)duration;
    *(s32 *)((u8 *)effect + 0x80) = 0;
    *(s32 *)((u8 *)effect + 0xa4) = 0;
    *(s32 *)((u8 *)effect + 0xa8) = 0;
    *(s32 *)((u8 *)effect + 0xac) = 0;
    *(s32 *)((u8 *)effect + 0xb0) = func_020befec((s32)duration, 10);
    PresentationScalar_SetImmediate((u8 *)effect + 0x3c, 0);
    PresentationScalar_SetImmediate((u8 *)effect + 0x4c, 0);
    *(s32 *)((u8 *)effect + 0xb8) = duration & 1;
    if ((duration & 1) != 0) {
        *(u16 *)((u8 *)firstState + 0x24) |= 0x40;
        *(u16 *)((u8 *)secondState + 0x24) |= 0x40;
    }

    s32 sequenceDuration = GraphicsSpriteState_GetSequenceDuration(firstState);
    u16 lifetime = (u16)func_020befec(
        sequenceDuration << 8, *(s32 *)((u8 *)effect + 0xb0));
    *(u16 *)((u8 *)firstState + 0x36) = lifetime;
    *(u16 *)((u8 *)secondState + 0x36) = lifetime;
    u16 affine = (u16)(0x7fff - (targetY / 0x1000 - 0xc0));
    *(u8 *)((u8 *)firstState + 0x3a) = 1;
    *(u16 *)((u8 *)firstState + 0x28) = affine;
    *(u8 *)((u8 *)secondState + 0x3a) = 1;
    *(u16 *)((u8 *)secondState + 0x28) = affine;
    *(s32 *)((u8 *)effect + 0x88) = 1;
    return effect;
}

/* Releases the owned second state and base presentation, retaining storage. */
extern "C" void *func_ov094_022179b0(void *effect)
{
    *(const void **)effect = data_ov094_02219eb8;
    GraphicsSpriteState_ReleaseFromGroup(
        *(void **)((u8 *)effect + 0xa0));
    SpritePresentation_Destroy(effect);
    return effect;
}

/* Performs full teardown, frees storage, and returns the retail stale pointer. */
extern "C" void *func_ov094_022179dc(void *effect)
{
    *(const void **)effect = data_ov094_02219eb8;
    GraphicsSpriteState_ReleaseFromGroup(
        *(void **)((u8 *)effect + 0xa0));
    SpritePresentation_Destroy(effect);
    Heap_Free(effect);
    return effect;
}

/* Returns one after the configured frame counter reaches its duration. */
extern "C" s32 func_ov094_02217bc8(void *effect)
{
    return *(s32 *)((u8 *)effect + 0x80) >=
           *(s32 *)((u8 *)effect + 0x7c);
}

/*
 * Synchronizes both states to the summed base/auxiliary Q12 X/Y transitions,
 * narrowing positions to signed integer pixels. No ownership changes occur.
 */
extern "C" void func_ov094_02217be0(void *effect)
{
    s16 x = (s16)((*(s32 *)((u8 *)effect + 0x10) +
                     *(s32 *)((u8 *)effect + 0x40)) / 0x1000);
    s16 y = (s16)((*(s32 *)((u8 *)effect + 0x20) +
                     *(s32 *)((u8 *)effect + 0x50)) / 0x1000);
    void *firstState = *(void **)((u8 *)effect + 0x9c);
    void *secondState = *(void **)((u8 *)effect + 0xa0);
    *(s16 *)((u8 *)firstState + 0x2c) = x;
    *(s16 *)((u8 *)firstState + 0x2e) = y;
    *(s16 *)((u8 *)secondState + 0x2c) = x;
    *(s16 *)((u8 *)secondState + 0x2e) = y;
}

/*
 * Runs the three-state burst script: alternating adjacent animations plus
 * smooth-step/sine wobble, a 30-frame transition, then the terminal sprite
 * completion bit. Every nonterminal frame synchronizes both sprite states.
 */
extern "C" s32 func_ov094_02217a10(void *effect)
{
    s32 *state = (s32 *)((u8 *)effect + 0xa4);
    if (*state == 0) {
        Presentation_AdvanceTransitions(effect);
        s32 timer = ++*(s32 *)((u8 *)effect + 0xac);
        s32 interval = *(s32 *)((u8 *)effect + 0xb0);
        if (timer > interval) {
            s32 toggle = 1 - *(s32 *)((u8 *)effect + 0xa8);
            *(s32 *)((u8 *)effect + 0xa8) = toggle;
            *(s32 *)((u8 *)effect + 0xac) = 0;
            s32 animation =
                (*(s32 *)((u8 *)effect + 0xb4) + toggle) & 0xff;
            GraphicsSpriteState_SetAnimationIndex(
                *(void **)((u8 *)effect + 0x9c), animation);
            GraphicsSpriteState_SetAnimationIndex(
                *(void **)((u8 *)effect + 0xa0), animation);
        } else {
            s32 toggle = *(s32 *)((u8 *)effect + 0xa8);
            s32 start;
            s32 end;
            if (*(s32 *)((u8 *)effect + 0xb8) == 0) {
                start = toggle == 0 ? -0x10000 : 0x10000;
                end = toggle == 0 ? 0x10000 : -0x10000;
            } else {
                start = toggle == 0 ? 0x10000 : -0x10000;
                end = toggle == 0 ? -0x10000 : 0x10000;
            }
            PresentationScalar_SetImmediate(
                (u8 *)effect + 0x3c,
                Presentation_InterpolateSmoothStep(start, end));
            u32 phase = (u32)func_020befec(timer << 16, interval);
            s32 index = (s32)(phase & 0xffff) >> 4;
            PresentationScalar_SetImmediate(
                (u8 *)effect + 0x4c,
                -gFx32CosSinTable[index * 2 + 1] * 4);
        }
        if (func_ov094_02217bc8(effect)) {
            *(s32 *)((u8 *)effect + 0x7c) = 0x1e;
            *(s32 *)((u8 *)effect + 0x80) = 0;
            ++*state;
        }
    } else if (*state == 1) {
        if (Presentation_AdvanceTransitions(effect)) {
            s32 animation =
                (*(s32 *)((u8 *)effect + 0xb4) + 9 -
                 *(s32 *)((u8 *)effect + 0xa8)) & 0xff;
            GraphicsSpriteState_SetAnimationIndex(
                *(void **)((u8 *)effect + 0x9c), animation);
            GraphicsSpriteState_SetAnimationIndex(
                *(void **)((u8 *)effect + 0xa0), animation);
            ++*state;
        }
    } else if (*state == 2 &&
               (*(u16 *)((u8 *)*(void **)((u8 *)effect + 0x9c) + 0x24) & 1)) {
        return 1;
    }
    func_ov094_02217be0(effect);
    return 0;
}
