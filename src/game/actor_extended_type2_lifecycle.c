#include "tingle/heap.h"
#include "tingle/types.h"

/* Reset and destroy the extended type-two actor and its copied record array. */
extern const void *data_020dfee4;
extern const void *data_020dfec0;
extern u8 data_020df9e8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02031488(void *actor);
extern void Type7MarkerPresentation_Destroy(void *object);
extern void VecFx32Object_Destroy(void *vector);
extern void ActorDerivedRuntime_DestroyAlternate(void *actor);
extern void func_020c0c24(void *array, s32 countOrSize, s32 elementSize,
                          void (*destructor)(void *));
extern void func_02004ac8(void *element);
#ifdef __cplusplus
}
#endif

/*
 * Zero recovered actor halfwords +0x24e/+0x254/+0x256/+0x258/+0x25a/+0x25c,
 * bytes +0x24c/+0x24d, and word +0x228. Copy global word pairs +0xb0/+0xb4
 * and +0x98/+0x9c into +0x218..+0x224, clear +0x260 bits zero and one, invoke
 * virtual +0xcc, then zero halfword +0x270. Returns no value; actor and virtual
 * callback state change. Meanings of the copied global fields are unconfirmed.
 */
void ActorExtendedType2_ResetRuntimeState(void *self)
{
    u8 *actor = (u8 *)self;

    *(u16 *)(actor + 0x24e) = 0;
    *(u16 *)(actor + 0x254) = 0;
    actor[0x24c] = 0;
    *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0xb0);
    *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0xb4);
    *(u32 *)(actor + 0x220) = *(u32 *)(data_020df9e8 + 0x98);
    *(u32 *)(actor + 0x224) = *(u32 *)(data_020df9e8 + 0x9c);
    *(u32 *)(actor + 0x260) &= ~3;
    *(u16 *)(actor + 0x258) = 0;
    *(u16 *)(actor + 0x25a) = 0;
    *(u16 *)(actor + 0x256) = 0;
    *(u16 *)(actor + 0x25c) = 0;
    actor[0x24d] = 0;
    *(u32 *)(actor + 0x228) = 0;
    (*(void (**)(void *))(*(u8 **)actor + 0xcc))(actor);
    *(u16 *)(actor + 0x270) = 0;
}

/*
 * Restore vtable data_020dfee4, free optional object +0x26c, invoke virtual
 * destructor +0x04 on optional object +0x278, then invoke actor virtual +0xbc
 * and func_02031488. Destroy optional objects +0x208/+0x20c/+0x210/+0x214
 * through their virtual +0x04 slots, destroy helper +0x284 and vectors
 * +0x23c/+0x22c, and finish through ActorDerivedRuntime_DestroyAlternate. Return self; owned heap,
 * vector, helper, and base actor state is released.
 */
void *ActorExtendedType2_DestroyComplete(void *self)
{
    u8 *actor = (u8 *)self;
    s32 index;

    *(const void **)actor = data_020dfee4;
    if (*(void **)(actor + 0x26c) != 0)
        Heap_Free(*(void **)(actor + 0x26c));
    if (*(void **)(actor + 0x278) != 0) {
        void *object = *(void **)(actor + 0x278);
        (*(void (**)(void *))(*(u8 **)object + 4))(object);
    }
    (*(void (**)(void *))(*(u8 **)actor + 0xbc))(actor);
    func_02031488(actor);
    for (index = 0; index < 2; ++index) {
        void *object = *(void **)(actor + 0x208 + index * 4);
        if (object != 0)
            (*(void (**)(void *))(*(u8 **)object + 4))(object);
    }
    if (*(void **)(actor + 0x210) != 0) {
        void *object = *(void **)(actor + 0x210);
        (*(void (**)(void *))(*(u8 **)object + 4))(object);
    }
    if (*(void **)(actor + 0x214) != 0) {
        void *object = *(void **)(actor + 0x214);
        (*(void (**)(void *))(*(u8 **)object + 4))(object);
    }
    Type7MarkerPresentation_Destroy(actor + 0x284);
    VecFx32Object_Destroy(actor + 0x23c);
    VecFx32Object_Destroy(actor + 0x22c);
    ActorDerivedRuntime_DestroyAlternate(actor);
    return actor;
}

/*
 * Restore vtable data_020dfec0. If array +0x04 exists, destroy its eight-byte
 * elements through func_020c0c24 and func_02004ac8, then free self. Return the
 * original pointer value after the free; array and object heap state is released.
 */
void *ActorExtendedRecordArray_DestroyAndFree(void *self)
{
    u8 *object = (u8 *)self;

    *(const void **)object = data_020dfec0;
    if (*(void **)(object + 4) != 0)
        func_020c0c24(*(void **)(object + 4), 8, 8, func_02004ac8);
    Heap_Free(object);
    return object;
}
