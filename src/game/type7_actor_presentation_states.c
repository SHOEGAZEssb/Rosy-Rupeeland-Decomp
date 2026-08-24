#include "tingle/types.h"

/*
 * Recovered type-seven presentation-state callbacks. They monitor global
 * target state and trigger one sound event while selecting presentations 17
 * and 18.
 */
extern u8 *gGamePhaseRuntime;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Type7Actor_DispatchCurrentCallback(void *actor);
extern void Sound_PlayOwnedEffect(void *soundContext, s32 zero, s32 soundId,
                          void *actor, s32 parameter, s32 volume);
#ifdef __cplusplus
}
#endif

/*
 * Input is a type-seven actor. Clear actor flag 0x8000 and +0xd0 bit one, then
 * select presentation 17. Read the global object at gGamePhaseRuntime+0x2ea4; if
 * its +0x270 pointer is null, dispatch the installed actor callback. Always
 * return zero. Actor presentation/callback state may change and the global
 * object is observed; no direct SDK or hardware access occurs.
 */
s32 Type7Actor_UpdatePresentation17UntilGlobalTargetClears(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *globalObject = *(u8 **)(gGamePhaseRuntime + 0x2ea4);
    *(u32 *)(actor + 0x268) &= ~0x8000;
    *(u32 *)(actor + 0xd0) &= ~2;
    *(u16 *)(actor + 0xd6) = 17;
    if (*(void **)(globalObject + 0x270) == 0)
        Type7Actor_DispatchCurrentCallback(actor);
    return 0;
}

/*
 * Input is a type-seven actor. On elapsed tick +0x248 equal to one, submit
 * sound ID 0x7e through the global sound context with recovered parameters
 * (actor, 0, 0x100). Then clear actor flag 0x8000 and +0xd0 bit one, select
 * presentation 18, and return zero. Actor presentation and sound state may
 * change; Sound_PlayOwnedEffect is the sound-system boundary and no hardware register
 * is accessed directly.
 */
s32 Type7Actor_UpdatePresentation18WithInitialSound(void *self)
{
    u8 *actor = (u8 *)self;
    if (*(s16 *)(actor + 0x248) == 1)
        Sound_PlayOwnedEffect(gSoundContext, 0, 0x7e, actor, 0, 0x100);
    *(u32 *)(actor + 0x268) &= ~0x8000;
    *(u32 *)(actor + 0xd0) &= ~2;
    *(u16 *)(actor + 0xd6) = 18;
    return 0;
}
