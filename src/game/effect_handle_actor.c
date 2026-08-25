#include "tingle/graphics_3d_presentation.h"
#include "tingle/types.h"

/*
 * Recovered presentation-backed actor subclass that owns an effect handle.
 * It emits periodic visuals while in state zero, creates one persistent effect
 * in later states, and removes that effect during either destructor path.
 */

extern const u8 data_020e2458[];
extern void *gGamePhaseRuntime;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *allocation);
extern Graphics3dPresentation *
RuntimePresentationManager_GetGraphics3dPresentation(void *manager);
extern void *PresentationBackedActor_InitBase(void *actor,
                                              const void *descriptor);
extern void *PresentationBackedActor_Destroy(void *actor);
extern void PresentationBackedActor_UpdateStateMachine(void *actor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are actor storage and its borrowed spawn descriptor. Construct the
 * presentation-backed parent, install data_020e2458, clear the private frame
 * counter at 0x1FC, set the effect handle at 0x1FE to -1, and return self.
 * Parent construction changes engine state; this wrapper has no direct
 * hardware effects.
 */
void *EffectHandleActor_Init(void *self, const void *descriptor)
{
    PresentationBackedActor_InitBase(self, descriptor);
    FIELD(const void *, self, 0) = data_020e2458;
    FIELD(s16, self, 0x1fc) = 0;
    FIELD(s16, self, 0x1fe) = -1;
    return self;
}

/*
 * Input is an actor. Restore data_020e2458, remove the effect identified by
 * 0x1FE when it is not -1, then run the parent's non-deleting teardown and
 * return self. Effect and inherited engine state may change; heap storage is
 * retained and no hardware is touched directly.
 */
void *EffectHandleActor_Destroy(void *self)
{
    FIELD(const void *, self, 0) = data_020e2458;
    s16 handle = FIELD(s16, self, 0x1fe);
    if (handle != -1) {
        Graphics3dPresentation *manager =
            RuntimePresentationManager_GetGraphics3dPresentation(
                (u8 *)gGamePhaseRuntime + 0x2f7c);
        Graphics3dPresentation_RemoveSpriteEffect(manager, handle);
    }
    PresentationBackedActor_Destroy(self);
    return self;
}

/*
 * Input is an actor. Perform the effect removal and inherited teardown of
 * EffectHandleActor_Destroy, free the actor allocation, and return its former address.
 * Effect, inherited, and heap state change; there are no direct hardware effects.
 */
void *EffectHandleActor_Delete(void *self)
{
    EffectHandleActor_Destroy(self);
    Heap_Free(self);
    return self;
}

/*
 * Input is an actor. Once presentation selection 0x38 reaches 6, state zero
 * increments counter 0x1FC and emits a 40x40 kind-15 visual every 32 frames;
 * later states create one 40x40 kind-0x46 effect if handle 0x1FE is still -1.
 * Coordinates derive from fixed-point actor position and height, with the
 * recovered 20-pixel offsets and signed-16 truncation on persistent creation.
 * Always run PresentationBackedActor_UpdateStateMachine afterward. Returns nothing; visual and actor state
 * change, and hardware is not accessed directly.
 */
void EffectHandleActor_Update(void *actor)
{
    if (FIELD(u8, FIELD(void *, actor, 0x54), 0x38) >= 6) {
        Graphics3dPresentation *manager =
            RuntimePresentationManager_GetGraphics3dPresentation(
                (u8 *)gGamePhaseRuntime + 0x2f7c);
        s32 x = FIELD(s32, actor, 0x1c) >> 12;
        s32 y = (FIELD(s32, actor, 0x20) >> 12) -
                (FIELD(s32, actor, 0x24) >> 12);
        if (FIELD(u16, actor, 0x1ec) == 0) {
            FIELD(s16, actor, 0x1fc)++;
            if ((FIELD(s16, actor, 0x1fc) & 0x1f) == 0)
                Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds(manager, 0, x - 20, y - 20, 40, 40, 15);
        } else if (FIELD(s16, actor, 0x1fe) == -1) {
            FIELD(s16, actor, 0x1fe) = (s16)Graphics3dPresentation_CreatePreset1To2SpriteEffectInBounds(
                manager, 0, (s16)(x - 20), (s16)(y - 20), 40, 40, 0x46);
        }
    }
    PresentationBackedActor_UpdateStateMachine(actor);
}
