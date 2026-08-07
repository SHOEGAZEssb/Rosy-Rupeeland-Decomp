#include "tingle/types.h"

/*
 * Overlay 7 item rendering. This recovered routine submits the controller and
 * all populated objects using copied transforms, with optional random jitter.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0209a2ac(void *object, const void *transform, s32 mode);
extern void func_02005030(void *destination, const void *source);
extern u32 genrand_int32(void);
extern void func_0200500c(void *member, s32 first, s32 second, s32 third);
extern void func_020050a4(void *destination, const void *source);
extern void func_02005058(void *member);
#ifdef __cplusplus
}
#endif

/*
 * Return immediately if primary pointer +0x4C is null. Otherwise submit state
 * itself through func_0209a2ac(state,null,1), copy member +0x80 to a 16-byte
 * temporary through func_02005030, and, when byte +0xA1 is set, add independent
 * `((genrand_int32() & 7)-4)<<12` jitter to temporary words +0x04/+0x08. Submit
 * the primary and ten indexed pointers +0x50..+0x74 with that temporary/mode 1.
 * Construct a zero member through func_0200500c, copy it over the temporary,
 * destroy the zero member, submit fixed pointers +0x78/+0x7C with the reset
 * temporary/mode 1, destroy the temporary, and return no value. Submission and
 * member ownership effects are delegated; object order and jitter range are
 * confirmed and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov007_021fbfdc(void *state)
{
    u8 transform[0x10];
    u8 zeroTransform[0x10];
    s32 index;

    if (*(void **)((u8 *)state + 0x4c) == 0) {
        return;
    }
    func_0209a2ac(state, 0, 1);
    func_02005030(transform, (u8 *)state + 0x80);
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
    func_0200500c(zeroTransform, 0, 0, 0);
    func_020050a4(transform, zeroTransform);
    func_02005058(zeroTransform);
    func_0209a2ac(*(void **)((u8 *)state + 0x78), transform, 1);
    func_0209a2ac(*(void **)((u8 *)state + 0x7c), transform, 1);
    func_02005058(transform);
}
