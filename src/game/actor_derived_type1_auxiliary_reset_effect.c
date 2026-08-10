#include "tingle/heap.h"
#include "tingle/types.h"

/* Tear down a type-1 auxiliary resource and emit its guarded reset effect. */
extern void *gGameWork;
extern u8 *data_021052fc;
extern const char data_020df4a4[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0206e590(void *resource, s32 value);
extern void func_0206c978(void *resource);
extern void GameWork_ClearFlag(void *work, u32 flag);
extern void ActorMotionJitter_EnsureMinimum(void *manager, s32 first, s32 second);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void func_02008378(void *output, const void *left, const void *right);
extern void VecFx32Object_Destroy(void *vector);
extern void *func_0201f864(void *allocation, ...);
#ifdef __cplusplus
}
#endif

/*
 * When auxiliary resource +0x26c exists, send it value zero, destroy/free it,
 * clear the pointer, clear GameWork flag 0x3ee, and reset cooldown +0x268.
 * When byte +0x2a0 is still zero, set it to eight, dispatch manager event
 * (0x1e,4), construct a position 0x24000 above actor +0x18, and allocate a
 * 0x14-byte presentation object configured with IDs 0x21e0..0x21e2. Returns
 * no value. Resource, heap, GameWork, manager, vector, and presentation calls
 * have observable engine/SDK effects.
 */
void ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect(void *self)
{
    u8 *actor = (u8 *)self;
    void *resource = *(void **)(actor + 0x26c);

    if (resource != 0) {
        func_0206e590(resource, 0);
        resource = *(void **)(actor + 0x26c);
        if (resource != 0) {
            func_0206c978(resource);
            Heap_Free(resource);
        }
        *(void **)(actor + 0x26c) = 0;
        GameWork_ClearFlag(gGameWork, 0x3ee);
        *(s16 *)(actor + 0x268) = 0;
    }

    if (actor[0x2a0] == 0) {
        s32 offset[4];
        s32 position[4];
        void *allocation;
        actor[0x2a0] = 8;
        ActorMotionJitter_EnsureMinimum(data_021052fc + 0x2fbc, 0x1e, 4);
        VecFx32Object_InitComponents(offset, 0, 0, 0x24000);
        func_02008378(position, actor + 0x18, offset);
        VecFx32Object_Destroy(offset);
        allocation = Heap_Alloc(0x14, data_020df4a4, 4, &gHeapContext);
        if (allocation != 0) {
            void *attachment = *(void **)(actor + 0x54);
            func_0201f864(allocation, position, *(void **)attachment,
                          0x21e0, 0x21e1, 0x21e2, 0, -4, -1, 1);
        }
        VecFx32Object_Destroy(position);
    }
}
