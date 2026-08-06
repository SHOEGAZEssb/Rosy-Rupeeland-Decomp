#include "tingle/heap.h"
#include "tingle/types.h"

/* Register the derived actor, initiate its timed state, and notify the primary runtime actor. */
extern void *data_02105718[4];
extern u8 *data_021052fc;
extern const char data_020df9d8[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0203392c(void *actor);
extern void func_020349b8(void *actor, u32 sound, s32 extra);
extern void func_02038ecc(void *actor, s32 value);
extern void func_02034b60(void *actor, s32 x, s32 y);
extern void *func_0201f864(void *allocation, ...);
void func_0203d48c(void *self, u16 limit);
#ifdef __cplusplus
}
#endif

/*
 * When signed actor state +0xd6 is at most one, store actor in the first null
 * slot of data_02105718's four entries. Invoke func_0203392c regardless of
 * registration, discard its result, and return one. Registry and base helper
 * calls have observable global/actor effects.
 */
s32 func_0203d3b4(void *self)
{
    u8 *actor = (u8 *)self;
    if (*(s16 *)(actor + 0xd6) <= 1) {
        s32 i;
        for (i = 0; i < 4; ++i) {
            if (data_02105718[i] == 0) {
                data_02105718[i] = actor;
                break;
            }
        }
    }
    (void)func_0203392c(actor);
    return 1;
}

/*
 * If actor state +0xd6 is zero, clear halfword +0x218, initiate state through
 * func_0203d48c(actor,120), and play packed sound 0xe204 through
 * func_020349b8. Then obtain the primary runtime actor at +0x2ea4, invoke
 * func_02038ecc(target,126), pass self-minus-target X/Y displacement to
 * func_02034b60, and invoke target virtual +0x5c. Returns no value; sound,
 * state, motion, and virtual calls mutate global actor state.
 */
void func_0203d3fc(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *target;
    if (*(s16 *)(actor + 0xd6) == 0) {
        *(u16 *)(actor + 0x218) = 0;
        func_0203d48c(actor, 0x78);
        func_020349b8(actor, 0xe204, 0);
    }
    target = *(u8 **)(data_021052fc + 0x2ea4);
    func_02038ecc(target, 0x7e);
    func_02034b60(target,
                  *(s32 *)(actor + 0x1c) - *(s32 *)(target + 0x1c),
                  *(s32 *)(actor + 0x20) - *(s32 *)(target + 0x20));
    (*(void (**)(void *))(*(u8 **)target + 0x5c))(target);
}

/*
 * Return unless signed state +0xd6 is at most one. Clamp halfword +0x21a down
 * to limit, set state +0xd6 to one, and set +0xd0 bit 0x1000. Allocate a
 * 0x14-byte tagged presentation and, when successful, initialize it through
 * func_0201f864 using actor position +0x18, primary attachment +0x54 recovered
 * words +0x00, +0x14/+0x10, +0x18/+0x10, +0x1c/+0x10 and constants
 * 2,-4,-1,1. Returns no value; heap and presentation calls establish owned
 * presentation state, although the returned presentation is not retained here.
 */
void func_0203d48c(void *self, u16 limit)
{
    u8 *actor = (u8 *)self;
    void *allocation;
    u8 *attachment;
    if (*(s16 *)(actor + 0xd6) > 1)
        return;
    if (*(u16 *)(actor + 0x21a) > limit)
        *(u16 *)(actor + 0x21a) = limit;
    *(s16 *)(actor + 0xd6) = 1;
    *(u32 *)(actor + 0xd0) |= 0x1000;
    allocation = Heap_Alloc(0x14, data_020df9d8, 4, &gHeapContext);
    if (allocation == 0)
        return;
    attachment = *(u8 **)(actor + 0x54);
    (void)func_0201f864(
        allocation, actor + 0x18, *(void **)attachment,
        *(s32 *)(*(u8 **)(attachment + 0x14) + 0x10),
        *(s32 *)(*(u8 **)(attachment + 0x18) + 0x10),
        *(s32 *)(*(u8 **)(attachment + 0x1c) + 0x10),
        2, -4, -1, 1);
}
