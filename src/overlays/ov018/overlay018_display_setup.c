#include "tingle/types.h"

/* Overlay 18 Nintendo DS sub-display initialization and camera-derived render placement. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_021052fc;
extern const u8 data_ov018_021ffcd0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GXS_SetGraphicsMode(s32);
extern void VecFx32Object_Destroy(void *);
extern void func_0200875c(void *, void *);
extern void *GamePhaseRuntime_GetAuxiliaryOverlayObject(void *);
extern void func_0202839c(void *, void *);
extern void func_020afd0c(void *, s32, s32, s32, s32);
extern void func_020afd28(void *, void *, s32, s32, s32, s32);
extern void *func_020afaec(void);
extern void func_ov018_021fe5f8(void *);
extern void func_ov056_0220f0ac(void *, void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Configure a fixed-point sub-display transform with diagonal 0x1000 values,
 * select sub graphics mode 5, and update masked bits of register 0x0400100C.
 * Submit descriptor data_ov018_021FFCD0 through the global scene object, obtain
 * its renderer and the current display helper, and hand them to overlay 56 at
 * state offsets +0x5C/+0x60 adjusted by returned tile coordinates (0x1E0 and
 * 0x160 strides). Finish with 0x021FE5F8. Returns void. Graphics SDK and direct
 * sub-engine MMIO state change; caller state is read.
 */
extern "C" void func_ov018_021fd5d0(void *state)
{
    s32 matrix[4] = {0x1000, 0, 0, 0x1000};
    struct {
        const void *descriptor;
        s32 x;
        s32 y;
    } request = {data_ov018_021ffcd0, 0, 0};
    void *global = data_021052fc;
    void *renderer;

    func_020afd28((void *)0x04001020, matrix, 0, 0, 0, 0);
    GXS_SetGraphicsMode(5);
    *(volatile u16 *)0x0400100c =
        (*(volatile u16 *)0x0400100c & 0x43) | 0x4480;
    func_0202839c(&request,
                  FIELD(void *, FIELD(void *, (u8 *)global + 0x3000, 0xbc), 0));
    renderer = GamePhaseRuntime_GetAuxiliaryOverlayObject(global);
    func_ov056_0220f0ac(renderer, func_020afaec(),
                        FIELD(s32, state, 0x5c) + request.x * 0x1e0,
                        FIELD(s32, state, 0x60) + request.y * 0x160);
    func_ov018_021fe5f8(state);
}

/* No-op display callback: accepts state, changes nothing, and returns void without SDK or hardware effects. */
extern "C" void func_ov018_021fd6bc(void *state)
{
    (void)state;
}

/*
 * Set state +0x4C to 0x15, enable bit 15 at power-control register 0x04000304,
 * configure masked sub-engine display/window registers at 0x04001008..10, and
 * call the brightness/window helper for 0x04001050 with values 1/0x3E/0x10/0.
 * Returns void. Caller and Nintendo DS display MMIO/SDK state change.
 */
extern "C" void func_ov018_021fd6c0(void *state)
{
    volatile u16 *power = (volatile u16 *)0x04000304;
    volatile u8 *sub = (volatile u8 *)0x04001008;

    *power |= 0x8000;
    FIELD(s32, state, 0x4c) = 0x15;
    *(volatile u16 *)sub = (*(volatile u16 *)sub & 0x43) | 0x3800;
    *(volatile u32 *)(sub + 8) = 0;
    *(volatile u16 *)sub &= ~3;
    *(volatile u16 *)(sub + 4) =
        (*(volatile u16 *)(sub + 4) & ~3) | 3;
    func_020afd0c((void *)(sub + 0x48), 1, 0x3e, 0x10, 0);
}

/*
 * Query the camera/scene transform from global data_021052FC into a temporary
 * four-word record, store its fixed-point X/Y words shifted right 12 at state
 * +0x5C/+0x60, and release the temporary record. Returns void. Caller and SDK
 * state change; no direct hardware access occurs.
 */
extern "C" void func_ov018_021fd740(void *state)
{
    s32 transform[4];
    func_0200875c(transform, data_021052fc);
    FIELD(s32, state, 0x5c) = transform[1] >> 12;
    FIELD(s32, state, 0x60) = transform[2] >> 12;
    VecFx32Object_Destroy(transform);
}
