#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered extended type-two actor target binding. It installs the target
 * callback state and spawns the same small randomized presentation effect.
 */
extern u8 data_020df9e8[];
extern char gActorExtendedType2SpritePresentationAllocationTag[];

#ifdef __cplusplus
extern "C" {
#endif
extern u32 genrand_int32(void);
extern s32 func_020ada8c(s32 value, s32 divisor);
extern void *func_0201f864(void *allocation, ...);
#ifdef __cplusplus
}
#endif

/*
 * Install global callback pair +0x1e8/+0x1ec at actor +0x218/+0x21c and clear
 * halfword +0x254. Allocate a 0x14-byte effect and, on success, initialize it
 * with actor position, attachment resource, IDs 0x135b..0x135d, a random value
 * in [0,2], and fixed parameters 0x12, -1, and one. Then bind target at +0x228,
 * clear word +0x264 and bytes +0x268/+0x269, and return zero. Actor, heap,
 * random, and effect state may change; Heap_Alloc is the resource boundary.
 */
s32 ActorExtendedType2_BindTargetAndSpawnEffect(void *self, void *target)
{
    u8 *actor = (u8 *)self;
    void *allocation;

    *(u32 *)(actor + 0x218) = *(u32 *)(data_020df9e8 + 0x1e8);
    *(u32 *)(actor + 0x21c) = *(u32 *)(data_020df9e8 + 0x1ec);
    *(u16 *)(actor + 0x254) = 0;
    allocation = Heap_Alloc(0x14, gActorExtendedType2SpritePresentationAllocationTag, 4, &gHeapContext);
    if (allocation != 0) {
        u32 random = genrand_int32() & 0x7fffffff;
        void *resource = **(void ***)(actor + 0x54);
        func_0201f864(allocation, actor + 0x18, resource, 0x135b,
                      0x135c, 0x135d,
                      func_020ada8c((s32)random, 3) & 0xff,
                      0x12, -1, 1);
    }
    *(void **)(actor + 0x228) = target;
    *(u32 *)(actor + 0x264) = 0;
    actor[0x268] = 0;
    actor[0x269] = 0;
    return 0;
}
