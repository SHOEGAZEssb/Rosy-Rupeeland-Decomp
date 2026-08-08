#include "tingle/types.h"

/* Overlay 36 final-controller backdrop and object rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02077b44(void *state);
extern void func_ov048_0220baec(s32 x, s32 y, s32 width, s32 height,
                                s32 depth, s32 value, s32 flags);
extern void func_020773e4(void *manager, void *transform);
extern void func_ov036_02203c44(void *object, void *transform);
extern void func_ov036_021fcfa0(void *object, void *transform);
#ifdef __cplusplus
}
#endif

/*
 * Advances transform +0xC and draws two shared overlay-48 backdrop primitives
 * with recovered tuples (-0x100,0x140,0x100,0,-0x200,0x3FF,0x1F) and
 * (-0x100,0,0x100,-0x100,-0x200,0x1F,0). It synchronizes manager +0xE8 with
 * transform +0x64, renders three-child object +0xF0 through its specialized
 * renderer, and draws render object +0xF4 through the common renderer. Returns
 * nothing and changes renderer/GX state.
 */
extern "C" void func_ov036_02204510(void *controller)
{
    func_02077b44((u8 *)controller + 0xc);
    func_ov048_0220baec(-0x100, 0x140, 0x100, 0,
                        -0x200, 0x3ff, 0x1f);
    func_ov048_0220baec(-0x100, 0, 0x100, -0x100,
                        -0x200, 0x1f, 0);
    func_020773e4(FIELD(void *, controller, 0xe8),
                  (u8 *)controller + 0x64);
    func_ov036_02203c44(FIELD(void *, controller, 0xf0),
                        (u8 *)controller + 0x64);
    func_ov036_021fcfa0(FIELD(void *, controller, 0xf4),
                        (u8 *)controller + 0x64);
}
