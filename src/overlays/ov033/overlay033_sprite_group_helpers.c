#include "tingle/types.h"

/* Overlay 33 sprite-group destruction, placement synchronization, and setters. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov033_021fdd00[];

#ifdef __cplusplus
extern "C" {
#endif
extern void __destroy_arr(void *base, s32 count, s32 size, void *destructor);
extern void AnimationResourceState_Destroy(void *descriptor);
extern void func_ov033_021fce00(void *group);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * Destroys the nine 0x0C-byte descriptors at +0x9C and then invokes the empty
 * base-destructor hook. Returns the original group pointer, does not free it,
 * and has no direct hardware effect.
 */
extern "C" void *func_ov033_021fcf8c(void *group)
{
    __destroy_arr((u8 *)group + 0x9c, 9, 0xc, (void *)AnimationResourceState_Destroy);
    func_ov033_021fce00(group);
    return group;
}

/*
 * Destructs the nine embedded descriptors, invokes the base hook, and releases
 * `group` through Heap_Free. It returns the now-invalid original address, as
 * observed in the binary; callers must not dereference that value afterward.
 */
extern "C" void *func_ov033_021fcfbc(void *group)
{
    __destroy_arr((u8 *)group + 0x9c, 9, 0xc, (void *)AnimationResourceState_Destroy);
    func_ov033_021fce00(group);
    Heap_Free(group);
    return group;
}

/*
 * Copies the group's +0x12C vertical displacement to sprite +0x11C and applies
 * +0x130 as a horizontal displacement to sprites +0x114/+0x118 using base
 * coordinates at data table offsets +0x100/+0x118. Returns no value; only
 * sprite position halfwords change, with no direct MMIO.
 */
extern "C" void func_ov033_021fcff4(void *group)
{
    FIELD(s16, FIELD(void *, group, 0x11c), 0x30) =
        (s16)FIELD(s32, group, 0x12c);
    FIELD(s16, FIELD(void *, group, 0x114), 0x2e) =
        (s16)(FIELD(s32, data_ov033_021fdd00, 0x100) +
              FIELD(s32, group, 0x130));
    FIELD(s16, FIELD(void *, group, 0x118), 0x2e) =
        (s16)(FIELD(s32, data_ov033_021fdd00, 0x118) +
              FIELD(s32, group, 0x130));
}

/*
 * Stores four caller-supplied bounds/configuration words at object offsets
 * +0xA4..+0xB0. The fifth argument is read from the stack by the ABI. Returns
 * no value and has no SDK or hardware effects.
 */
extern "C" void func_ov033_021fd034(void *object, s32 first, s32 second,
                                     s32 third, s32 fourth)
{
    FIELD(s32, object, 0xa4) = first;
    FIELD(s32, object, 0xa8) = second;
    FIELD(s32, object, 0xac) = third;
    FIELD(s32, object, 0xb0) = fourth;
}

/*
 * Installs the recovered two-word callback/member-function representation at
 * +0xC8/+0xCC and clears its dispatch state at +0xD0. Returns no value and
 * performs no SDK or hardware operation.
 */
extern "C" void func_ov033_021fd04c(void *object, s32 callbackWord,
                                     s32 adjustmentWord)
{
    FIELD(s32, object, 0xc8) = callbackWord;
    FIELD(s32, object, 0xcc) = adjustmentWord;
    FIELD(s32, object, 0xd0) = 0;
}
