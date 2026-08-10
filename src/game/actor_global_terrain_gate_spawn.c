#include "tingle/heap.h"
#include "tingle/types.h"

/* Gate and spawn a global actor terrain interaction object. */
extern u8 *data_021052fc;
extern const char data_020df4d8[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorDerivedType1_IsIdleEligible(void *actor);
extern void *func_020022dc(s32 packedCell);
extern void func_0200222c(void *value, s32 kind, s32 id);
extern void *func_ov062_02210b38(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * Read global actor data_021052fc +0x2ea4 and return zero unless
 * ActorDerivedType1_IsIdleEligible reports it idle. Query object +0x2ed4 virtual +0x2c at the
 * actor's integer X/Y position. Extract packed bits 5..9 and require values
 * two through five. For an accepted cell, transform the packed value through
 * func_020022dc, dispatch kind two/ID 0x3e through func_0200222c, allocate a
 * tagged 0x7c-byte object, and construct it with overlay-62 entry
 * func_ov062_02210b38 when allocation succeeds. Return one once the terrain
 * class passes, including allocation failure; otherwise return zero. Virtual,
 * heap, and overlay calls have observable engine/SDK effects.
 */
s32 Actor_TrySpawnTerrainGateObject(void)
{
    u8 *actor = *(u8 **)(data_021052fc + 0x2ea4);
    u8 *query;
    s32 packed;
    s32 type;
    void *allocation;

    if (ActorDerivedType1_IsIdleEligible(actor) == 0)
        return 0;
    query = *(u8 **)(data_021052fc + 0x2ed4);
    packed = (*(s32 (**)(void *, s32, s32))(*(u8 **)query + 0x2c))(
        query, *(s32 *)(actor + 0x1c) >> 16,
        *(s32 *)(actor + 0x20) >> 16);
    type = (packed >> 5) & 0x1f;
    if (type < 2 || type > 5)
        return 0;
    func_0200222c(func_020022dc(packed), 2, 0x3e);
    allocation = Heap_Alloc(0x7c, data_020df4d8, 4, &gHeapContext);
    if (allocation != 0)
        func_ov062_02210b38(allocation);
    return 1;
}
