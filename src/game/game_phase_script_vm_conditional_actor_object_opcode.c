#include "tingle/game_phase_runtime.h"
#include "tingle/game_phase_script_vm.h"
#include "tingle/game_work.h"
#include "tingle/heap.h"

/* Implement a conditional script opcode that creates and registers an actor-associated object. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern const char data_020d5b34[];
extern void *ActorCollection_FindActorByDescriptorValue(void *collection, s32 index);
extern void *func_02009d78(void *motion);
extern void *func_02020794(void *object, void *position, void *actor, s32 value);
extern void func_0201ded4(void *list, void *object);
#ifdef __cplusplus
}
#endif

/*
 * Pop actor index, object value, and enable. When enabled, resolve the actor
 * from runtime collection 1, allocate 0x4c bytes, initialize it through
 * func_02020794 using the motion at runtime offset 0x2fbc, and append even a
 * null allocation result to the list at offset 0x2f7c. When disabled, call
 * func_02001944 on GameWork with 0x408. Return zero.
 */
s32 func_0201797c(GamePhaseActorScriptVm *self)
{
    s32 actorIndex = (s32)func_02012704(&self->base);
    s32 value = (s32)func_02012704(&self->base);
    s32 enabled = (s32)func_02012704(&self->base);
    u8 *runtime = (u8 *)data_021052fc;
    if (enabled) {
        void *actor = ActorCollection_FindActorByDescriptorValue(
            func_02007f0c((GamePhaseRuntime *)runtime, 1), actorIndex);
        void *object = Heap_Alloc(0x4c, data_020d5b34, 4, &gHeapContext);
        if (object)
            object = func_02020794(object, func_02009d78(runtime + 0x2fbc),
                                   actor, value);
        func_0201ded4(runtime + 0x2f7c, object);
    } else {
        GameWork_SetFlag(gGameWork, 0x408);
    }
    return 0;
}
