#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/*
 * Recovered interaction callbacks for the runtime actor variant. Three hooks
 * are intentionally empty; the fourth clears motion and may enter state two.
 */

extern u8 gActorRuntimeCollection[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorRuntimeCollection_GetPendingAttachmentFlag(void *registry);
extern s32 ActorContactState_AddContact(void *actor, void *other,
                                        s32 wasTracked);
#ifdef __cplusplus
}
#endif

/* Empty recovered callback: ignore all register inputs and change no state. */
void func_0204d3d8(void)
{
}

/* Empty recovered callback: ignore all register inputs and change no state. */
void func_0204d3dc(void)
{
}

/* Empty recovered callback: ignore all register inputs and change no state. */
void func_0204d3e0(void)
{
}

/*
 * Inputs are a runtime actor variant, another actor, and a mode. Invoke base
 * interaction helper ActorContactState_AddContact with all three inputs, construct a temporary
 * zero VecFx32Object, assign it into actor vector +0x38, and destroy the
 * temporary. If the other actor's type byte +0x4d is one, mode is zero, actor
 * pointer +0x188 is non-null, actor byte +0xe8 is zero, and registry predicate
 * ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection) is zero, invoke actor virtual slot 0x78 with
 * state two. Return one on every path. Actor/base/vector and virtual state may
 * change; there are no direct hardware effects.
 */
s32 func_0204d3e4(void *self, void *other, s32 mode)
{
    u8 *actor = (u8 *)self;
    u8 *otherActor = (u8 *)other;
    VecFx32Object zero;
    ActorContactState_AddContact(actor, otherActor, mode);
    VecFx32Object_InitComponents(&zero, 0, 0, 0);
    VecFx32Object_Assign((VecFx32Object *)(actor + 0x38), &zero);
    VecFx32Object_Destroy(&zero);

    if (otherActor[0x4d] == 1 && mode == 0
        && *(void **)(actor + 0x188) != 0 && actor[0xe8] == 0
        && ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection) == 0) {
        void (**vtable)(void *, s32) = *(void (***)(void *, s32))actor;
        vtable[0x78 / 4](actor, 2);
    }
    return 1;
}
