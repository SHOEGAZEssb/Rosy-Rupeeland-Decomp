#include "tingle/types.h"

/* Overlay 36 four-record controller rendering and record submission. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02077b44(void *state);
extern void func_ov036_022029b0(void *records);
extern void func_020773e4(void *manager, void *transform);
extern void func_ov036_021fdef0(s32, s32, s32, s32,
                                s32, s32, s32, s32);
extern void func_ov036_021fcfa0(void *object, void *transform);
extern void Graphics3DLight_Apply(void *record, s32 index);
#ifdef __cplusplus
}
#endif

/*
 * Advances transform +0xC, submits the four records at +0x11C, synchronizes
 * manager +0xF8 with transform +0x64, and clears the recovered eight render
 * parameters. It then draws every object linked from +0x110 through link +8
 * using the common transform-aware renderer. Returns nothing and changes
 * renderer/GX state.
 */
extern "C" void func_ov036_0220293c(void *controller)
{
    func_02077b44((u8 *)controller + 0xc);
    func_ov036_022029b0((u8 *)controller + 0x11c);
    func_020773e4(FIELD(void *, controller, 0xf8),
                  (u8 *)controller + 0x64);
    func_ov036_021fdef0(0, 0, 0, 0, 0, 0, 0, 0);
    for (void *object = FIELD(void *, controller, 0x110);
         object != 0; object = FIELD(void *, object, 8))
        func_ov036_021fcfa0(object, (u8 *)controller + 0x64);
}

/*
 * Submits four contiguous 0x10-byte records through Graphics3DLight_Apply, passing
 * each record's zero-based index. Returns nothing and changes renderer/GX
 * state through that helper.
 */
extern "C" void func_ov036_022029b0(void *records)
{
    for (s32 i = 0; i < 4; ++i)
        Graphics3DLight_Apply((u8 *)records + i * 0x10, i);
}
