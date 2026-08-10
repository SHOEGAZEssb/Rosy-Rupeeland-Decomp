#include "tingle/heap.h"
#include "tingle/types.h"

/* Materialize a type-1 actor descriptor and apply its type-specific flags. */
extern const char data_020df48c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *AnimationResource_Init(void *allocation, u16 first, u16 second, u16 third);
extern void ActorDerivedType1_TeardownActiveRecord(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Allocate a 0x10-byte object tagged by data_020df48c and, on success,
 * initialize it from descriptor +0x27c halfwords +0x20/+0x22/+0x24. Store the
 * result at actor +0x274, call virtual +0x5c, and set +0x230 bit 0x800. Type
 * byte +0x08 then sets bits 0x1000 (0x69), 0x2000 (0x6a), 0x4000 (0x6f), or
 * 0x8000 (0x6d/0x73/0x74); the last group also copies descriptor halfword
 * +0x1e to actor +0x282, while 0x73/0x74 clear byte +0x2a1. Clear halfword
 * +0x2a2. Unless the type path is retained—or actor +0xd0 bit 0x4000 is clear
 * for type 0x6d—roll back through ActorDerivedType1_TeardownActiveRecord. Returns no value; allocation,
 * initialization, virtual dispatch, and rollback change engine/heap state.
 */
void ActorDerivedType1_ApplyActiveRecord(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *descriptor = *(u8 **)(actor + 0x27c);
    void *object = Heap_Alloc(0x10, data_020df48c, 4, &gHeapContext);
    s32 retain = (*(u32 *)(actor + 0xd0) & 0x4000) == 0;

    if (object != 0)
        object = AnimationResource_Init(object, *(u16 *)(descriptor + 0x20),
                               *(u16 *)(descriptor + 0x22),
                               *(u16 *)(descriptor + 0x24));
    *(void **)(actor + 0x274) = object;
    (*(void (**)(void *))(*(u8 **)actor + 0x5c))(actor);
    *(u32 *)(actor + 0x230) |= 0x800;

    switch (descriptor[8]) {
    case 0x69:
        *(u32 *)(actor + 0x230) |= 0x1000;
        break;
    case 0x6a:
        *(u32 *)(actor + 0x230) |= 0x2000;
        break;
    case 0x6f:
        *(u32 *)(actor + 0x230) |= 0x4000;
        break;
    case 0x73:
    case 0x74:
        actor[0x2a1] = 0;
        retain = 1;
        /* Fall through. */
    case 0x6d:
        *(u16 *)(actor + 0x282) = *(s16 *)(descriptor + 0x1e);
        *(u32 *)(actor + 0x230) |= 0x8000;
        break;
    default:
        break;
    }
    *(u16 *)(actor + 0x2a2) = 0;
    if (!retain)
        ActorDerivedType1_TeardownActiveRecord(actor);
}
