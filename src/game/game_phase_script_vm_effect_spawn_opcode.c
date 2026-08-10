#include "tingle/game_phase_script_vm.h"
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/vec_fx32.h"

/* Reconstruct the actor-script opcode that creates an overlay-62 effect object. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern const char data_020d5b2c[];
extern void *Actor_GetCollection(void *actor);
extern void *ActorCollection_FindActorByDescriptorValue(void *collection, s32 index);
extern void func_ov062_0220fe78(void *allocation, const VecFx32Object *position,
                               u32 first, u32 second, u32 zero,
                               void *runtimeObject, u32 one);
extern void func_ov062_02210674(void *allocation, void *actor,
                               const VecFx32Object *position, u32 first,
                               u32 second, u32 zero0, u32 zero1);
#ifdef __cplusplus
}
#endif

/*
 * Pop two effect parameters, z/y/x integer coordinates, and a target selector.
 * Selector -1 writes x<<4 to bound-actor offset 0x44 and sets actor flag 0x400.
 * Other selectors construct an fx32 position and ensure overlay 62 is loaded
 * in slot 2. Selector 0 allocates 0x48 bytes and initializes a global-context
 * effect with the runtime pointer at 0x2ea4; a positive selector resolves an
 * indexed actor, allocates 0x40 bytes, initializes an actor-bound effect, and
 * sets flag 0x400 on that target even if allocation failed. Allocation uses
 * the confirmed heap tag at data_020d5b2c and four-byte alignment. Returns
 * zero; the overlay constructors own any successfully allocated object.
 */
s32 GamePhaseActorScriptVm_ConfigureOrSpawnOverlay62Effect(GamePhaseActorScriptVm *self)
{
    u32 second = GamePhaseScriptVm_Pop(&self->base);
    u32 first = GamePhaseScriptVm_Pop(&self->base);
    s32 z = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 y = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 x = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 selector = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *boundActor = (u8 *)self->actor;

    if (selector == -1) {
        *(s32 *)(boundActor + 0x44) = x << 4;
        *(u32 *)(boundActor + 0x10) |= 0x400;
    } else {
        VecFx32Object position;
        func_0200500c(&position, x << 12, y << 12, z << 12);
        OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x3e);
        if (selector == 0) {
            void *allocation = Heap_Alloc(0x48, data_020d5b2c, 4,
                                          &gHeapContext);
            if (allocation != 0) {
                void *runtimeObject =
                    *(void **)((u8 *)data_021052fc + 0x2ea4);
                func_ov062_0220fe78(allocation, &position, second, first,
                                    0, runtimeObject, 1);
            }
        } else {
            u8 *target = (u8 *)ActorCollection_FindActorByDescriptorValue(
                Actor_GetCollection(boundActor), selector);
            void *allocation = Heap_Alloc(0x40, data_020d5b2c, 4,
                                          &gHeapContext);
            if (allocation != 0)
                func_ov062_02210674(allocation, target, &position, second,
                                    first, 0, 0);
            *(u32 *)(target + 0x10) |= 0x400;
        }
        func_02005058(&position);
    }
    return 0;
}
