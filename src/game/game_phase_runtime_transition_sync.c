#include "tingle/game_phase_runtime.h"

/* Synchronize actors and global gameplay state after a phase transition. */

extern GamePhaseRuntime *data_021052fc;
extern void *gLupyContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02030b58(void *actor, s32 value);
extern void ActorCollection_UpdateFlag800Actors(void *actor);
extern void func_0201dcec(void *object, s32 enabled);
extern void func_02010e68(void *context);
#ifdef __cplusplus
}
#endif

/*
 * Temporarily set property zero on the global runtime's secondary actor and
 * remember its prior value, finalize the primary actor, synchronize actor zero
 * for modes 0/2 and actor one for modes 1/2, run transition finalization, then
 * restore the secondary property. It enables object 0x2f7c, advances the Lupy
 * context, and invokes virtual slot four on object 0x30e8. Returns no value.
 */
void func_02008e10(GamePhaseRuntime *self, s32 mode)
{
    u8 *b = (u8 *)self;
    s32 previous = func_02030b58(func_02007f0c(data_021052fc, 1), 0);

    ActorCollection_UpdateFlag800Actors(b + 0x28);
    if (mode == 0 || mode == 2)
        func_02008148(self, 0);
    if ((u32)(mode - 1) <= 1)
        func_02008148(self, 1);
    GamePhaseRuntime_FinalizeActorCollections(self, self->field_04, 3);
    func_02030b58(func_02007f0c(self, 1), previous);
    func_0201dcec(b + 0x2f7c, 1);
    func_02010e68(gLupyContext);
    {
        void *object = *(void **)(b + 0x30e8);
        (*(void (***)(void *))object)[4](object);
    }
}
