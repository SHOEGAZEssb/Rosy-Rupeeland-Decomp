#include "tingle/types.h"

/*
 * Overlay 7 item rendering. This recovered routine submits the controller and
 * all populated objects using copied transforms, with optional random jitter.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0209a2ac(void *object, const void *transform, s32 mode);
extern void VecFx32Object_InitCopy(void *destination, const void *source);
extern u32 genrand_int32(void);
extern void VecFx32Object_InitComponents(void *member, s32 first, s32 second, s32 third);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *member);
#ifdef __cplusplus
}
#endif

/*
 * Return immediately if primary pointer +0x4C is null. Otherwise submit state
 * itself through func_0209a2ac(state,null,1), copy member +0x80 to a 16-byte
 * temporary through VecFx32Object_InitCopy, and, when byte +0xA1 is set, add independent
 * `((genrand_int32() & 7)-4)<<12` jitter to temporary words +0x04/+0x08. Submit
 * the primary and ten indexed pointers +0x50..+0x74 with that temporary/mode 1.
 * Construct a zero member through VecFx32Object_InitComponents, copy it over the temporary,
 * destroy the zero member, submit fixed pointers +0x78/+0x7C with the reset
 * temporary/mode 1, destroy the temporary, and return no value. Submission and
 * member ownership effects are delegated; object order and jitter range are
 * confirmed and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay007_RenderItems(void *state)
{
    u8 transform[0x10];
    u8 zeroTransform[0x10];
    s32 index;

    if (*(void **)((u8 *)state + 0x4c) == 0) {
        return;
    }
    func_0209a2ac(state, 0, 1);
    VecFx32Object_InitCopy(transform, (u8 *)state + 0x80);
    if (*(u8 *)((u8 *)state + 0xa1) != 0) {
        *(s32 *)(transform + 0x04) +=
            ((s32)(genrand_int32() & 7) - 4) << 12;
        *(s32 *)(transform + 0x08) +=
            ((s32)(genrand_int32() & 7) - 4) << 12;
    }
    func_0209a2ac(*(void **)((u8 *)state + 0x4c), transform, 1);
    for (index = 9; index >= 0; index--) {
        func_0209a2ac(*(void **)((u8 *)state + 0x50 + index * 4), transform,
                      1);
    }
    VecFx32Object_InitComponents(zeroTransform, 0, 0, 0);
    VecFx32Object_Assign(transform, zeroTransform);
    VecFx32Object_Destroy(zeroTransform);
    func_0209a2ac(*(void **)((u8 *)state + 0x78), transform, 1);
    func_0209a2ac(*(void **)((u8 *)state + 0x7c), transform, 1);
    VecFx32Object_Destroy(transform);
}
