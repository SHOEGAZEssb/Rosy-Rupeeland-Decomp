#include "tingle/types.h"

/* Overlay 36 composite-controller rendering and its adjacent no-op callback. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02077b44(void *state);
extern void func_ov036_022029b0(void *records);
extern void func_ov036_021fdef0(s32, s32, s32, s32,
                                s32, s32, s32, s32);
extern void func_ov036_021fcfa0(void *object, void *transform);
extern void func_ov036_021fdd4c(void *auxiliary);
extern void func_020773e4(void *manager, void *transform);
extern void func_ov036_021fd128(s32 lightMask, s32 polygonMode,
                                s32 cullMode, s32 polygonId,
                                s32 alpha, s32 misc);
extern void func_ov036_021fd97c(void *segment);
#ifdef __cplusplus
}
#endif

/*
 * Advances transform +0xC, submits records +0x160, clears common render
 * parameters, draws render objects +0x154/+0x158 with transform +0x64, draws
 * auxiliary +0x1A0, and synchronizes manager +0xF4. It then configures polygon
 * state (cull 3, ID 0x14, alpha 0x1F, final value 0x8000), clears parameters
 * again, and draws every segment linked from +0x114 through link +8. Returns
 * nothing and changes renderer/GX state.
 */
extern "C" void func_ov036_02203774(void *controller)
{
    func_02077b44((u8 *)controller + 0xc);
    func_ov036_022029b0((u8 *)controller + 0x160);
    func_ov036_021fdef0(0, 0, 0, 0, 0, 0, 0, 0);
    func_ov036_021fcfa0(FIELD(void *, controller, 0x154),
                        (u8 *)controller + 0x64);
    func_ov036_021fcfa0(FIELD(void *, controller, 0x158),
                        (u8 *)controller + 0x64);
    func_ov036_021fdd4c(FIELD(void *, controller, 0x1a0));
    func_020773e4(FIELD(void *, controller, 0xf4),
                  (u8 *)controller + 0x64);
    func_ov036_021fd128(0, 0, 3, 0x14, 0x1f, 0x8000);
    func_ov036_021fdef0(0, 0, 0, 0, 0, 0, 0, 0);
    for (void *segment = FIELD(void *, controller, 0x114);
         segment != 0; segment = FIELD(void *, segment, 8))
        func_ov036_021fd97c(segment);
}

/*
 * Recovered no-op callback. Its input is ignored, it changes no observable
 * state, returns nothing, and has no hardware or SDK effects.
 */
extern "C" void func_ov036_0220384c(void *unused)
{
    (void)unused;
}
