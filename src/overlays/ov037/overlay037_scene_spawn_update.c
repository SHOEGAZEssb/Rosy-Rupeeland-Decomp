#include "tingle/types.h"

/* Overlay 37 timed spawning of transient scene objects and their lifetime setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov037_021feeb0[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02091c7c(void *timer, s32 mode);
extern s32 TitleRandom_NextBounded(void *randomState, s32 bound);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *resourceOwner, void *slot);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *AlternateSpritePresentation_Init(void *object, void *actor);
extern s32 func_0209189c(void *randomState, s32 minimum, s32 maximum);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void PresentationScalar_SetImmediate(void *field, s32 value, ...);
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern void PresentationScalar_TransitionBy(void *field, s32 mode, s32 value);
extern s32 GraphicsAnimationInstance_GetSequenceDuration(void *actor);
extern void PresentationList_Append(void *container, void *object);
extern void func_02091b98(void *timer, s32 delay);
extern void GraphicsAnimationInstance_SetAnimation(void *actor, s32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Stores the signed low halfword of lifetime at +0x7C and clears elapsed
 * progress at +0x80. Returns nothing and only changes object state.
 */
extern "C" void func_ov037_021fdf50(void *object, s32 lifetime)
{
    FIELD(s32, object, 0x7c) = (s16)lifetime;
    FIELD(s32, object, 0x80) = 0;
}

/*
 * Processes two independent scene timers. A +0x1A8 event chooses one of two
 * actors, allocates a transient object, randomizes its position/scale and
 * lifetime, registers it in +0x12C, then restarts the timer with delay 2. A
 * +0x1C4 event randomizes an actor mode, spawns another object relative to the
 * primary child at +0x118, configures motion/lifetime, registers it, and
 * restarts with delay 8. Returns nothing; RNG, timers, heap, actors, and the
 * owned-child container may change.
 */
extern "C" void func_ov037_021fdd08(void *scene)
{
    void *randomState = (u8 *)scene + 0xbc;
    void *resourceOwner = FIELD(void *, scene, 0x114);

    if (func_02091c7c((u8 *)scene + 0x1a8, 2)) {
        void *slot = (u8 *)scene +
            (TitleRandom_NextBounded(randomState, 2) ? 0xec : 0xf8);
        void *actor = GraphicsAnimationInstanceManager_CreateInstance(resourceOwner, slot);
        FIELD(u16, actor, 0x50) |= 0x40;

        void *object = Heap_Alloc(0xa0, data_ov037_021feeb0, 4, gHeapContext);
        if (object != 0)
            object = AlternateSpritePresentation_Init(object, actor);
        s32 x = func_0209189c(randomState, -0x800, 0x800);
        s32 z = func_0209189c(randomState, 0x80, 0x100);
        Presentation_SetPosition(object, x, 0x1200, z);
        PresentationScalar_SetImmediate((u8 *)object + 0x6c,
                      func_0209189c(randomState, 0x1000, 0x2000));
        PresentationScalar_TransitionTo((u8 *)object + 0x1c, 1,
                      func_0209189c(randomState, 0x800, 0xc00));
        func_ov037_021fdf50(object, GraphicsAnimationInstance_GetSequenceDuration(actor));
        FIELD(s32, object, 0x88) = 1;
        PresentationList_Append((u8 *)scene + 0x12c, object);
        func_02091b98((u8 *)scene + 0x1a8, 2);
    }

    if (!func_02091c7c((u8 *)scene + 0x1c4, 2))
        return;

    void *actor = GraphicsAnimationInstanceManager_CreateInstance(resourceOwner, (u8 *)scene + 0x104);
    GraphicsAnimationInstance_SetAnimation(actor, func_0209189c(randomState, 5, 10) & 0xff);
    FIELD(u8, actor, 0x5a) = 6;
    FIELD(u8, actor, 0x5b) = 0x18;
    FIELD(u16, actor, 0x50) |= 0x40;

    void *object = Heap_Alloc(0xa0, data_ov037_021feeb0, 4, gHeapContext);
    if (object != 0)
        object = AlternateSpritePresentation_Init(object, actor);
    s32 offset = func_0209189c(randomState, -0x200, 0x200);
    void *primary = FIELD(void *, scene, 0x118);
    Presentation_SetPosition(object, FIELD(s32, primary, 0x10) + offset,
                   FIELD(s32, primary, 0x20),
                   FIELD(s32, primary, 0x30) + 0x10);
    PresentationScalar_TransitionBy((u8 *)object + 0x0c, 1, offset);
    PresentationScalar_TransitionBy((u8 *)object + 0x1c, 1, 0x400);
    FIELD(s32, object, 0x7c) = 0x3c;
    FIELD(s32, object, 0x80) = 0;
    FIELD(s32, object, 0x88) = 1;
    PresentationList_Append((u8 *)scene + 0x12c, object);
    func_02091b98((u8 *)scene + 0x1c4, 8);
}
