#include "tingle/heap.h"
#include "tingle/types.h"

/* Tear down an active type-1 actor descriptor and its owned presentation objects. */
extern const char data_020df4a4[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0201f864(void *allocation, ...);
extern void func_020349b8(void *actor, u32 sound, s32 extra);
extern void func_0205940c(void *context, s32 channel, s32 sound);
extern void ActorDerivedType1_ApplyResourceIndex(void *actor, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Return if owned object +0x274 is null. For descriptor types 0x73/0x74,
 * optionally allocate a 0x14-byte presentation from descriptor halfwords
 * +0x14/+0x16/+0x18 and actor position/attachment, then dispatch actor sound
 * +0x1a when present. For every type, dispatch packed sound +0x2e through
 * func_0205940c, clear resource variant state, destroy +0x274 by virtual +0x04,
 * and clear +0x274/+0x27c plus +0x230 bits 0xf800. Notify optional +0x278 by
 * virtual +0xd0 using actor byte +0xd4 and constants 0x80/0x1000, then clear
 * +0x278, halfwords +0x264/+0x280/+0x282, byte +0x26b, and call actor virtual
 * +0x5c. Returns no value; heap, presentation, audio, and virtual calls have
 * observable engine/SDK effects.
 */
void func_020390c8(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *descriptor;
    void *object = *(void **)(actor + 0x274);

    if (object == 0)
        return;
    descriptor = *(u8 **)(actor + 0x27c);
    if ((descriptor[8] == 0x73 || descriptor[8] == 0x74)) {
        if (*(u16 *)(descriptor + 0x14) != 0) {
            void *allocation = Heap_Alloc(0x14, data_020df4a4, 4,
                                          &gHeapContext);
            if (allocation != 0)
                func_0201f864(allocation, actor + 0x18,
                              **(void ***)(actor + 0x54),
                              *(u16 *)(descriptor + 0x14),
                              *(u16 *)(descriptor + 0x16),
                              *(u16 *)(descriptor + 0x18), 0, -4, -1, 1);
        }
        if (*(u16 *)(descriptor + 0x1a) != 0)
            func_020349b8(actor, *(u16 *)(descriptor + 0x1a), 0);
    }
    if (*(u16 *)(descriptor + 0x2e) != 0) {
        s32 sound = *(u16 *)(descriptor + 0x2e);
        func_0205940c(gSoundContext, sound >> 7, sound & 0x7f);
    }
    ActorDerivedType1_ApplyResourceIndex(actor, 0);
    object = *(void **)(actor + 0x274);
    if (object != 0)
        (*(void (**)(void *))(*(u8 **)object + 4))(object);
    *(void **)(actor + 0x274) = 0;
    *(void **)(actor + 0x27c) = 0;
    *(u32 *)(actor + 0x230) &= ~0xf800;
    object = *(void **)(actor + 0x278);
    if (object != 0)
        (*(void (**)(void *, u8, s32, s32))(*(u8 **)object + 0xd0))(
            object, actor[0xd4], 0x80, 0x1000);
    *(void **)(actor + 0x278) = 0;
    *(u16 *)(actor + 0x264) = 0;
    *(u16 *)(actor + 0x280) = 0;
    *(u16 *)(actor + 0x282) = 0;
    actor[0x26b] = 0;
    (*(void (**)(void *))(*(u8 **)actor + 0x5c))(actor);
}
