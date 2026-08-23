#include "tingle/types.h"

/* Overlay 26 composite-effect scaling, rendering, animation, and flag-event handling. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_Play(void *, s32, s32);
extern void Sound_StopEffect(void *, s32, s32);
extern void PresentationScalar_SetImmediate(void *, s32);
extern s32 Presentation_InterpolateScalar(void *, s32, s32, s32);
extern void func_ov026_021fdd28(void *);
extern void func_ov026_021fe284(void *);
extern void func_ov026_021fe56c(void *);
extern void func_ov026_021fd900(u32, u32, u32, u32, u32, u32, u32, u32);
extern void func_ov026_021fd964(u32, u32, u32, u32, u32, u32);
#ifdef __cplusplus
}
#endif

typedef void (*ObjectMethod)(void *);

/* Submits a polymorphic child through virtual slot +0x14. */
static void submit_child(void *child)
{
    ((ObjectMethod *)FIELD(void *, child, 0))[5](child);
}

/*
 * Applies scale mode 1 to `object`, multiplying recovered scale controls +0x134
 * and +0x138 by ten for the two scale axes. Returns the callee's result.
 */
extern "C" s32 func_ov026_021ff4f8(void *object)
{
    return Presentation_InterpolateScalar(object, 1, FIELD(s32, object, 0x134) * 10,
                         FIELD(s32, object, 0x138) * 10);
}

/*
 * Renders the composite unless flag 0x400 at +0x12C suppresses it. It installs
 * the owner translation and Y-only scale, renders all tube children, the disc,
 * and radial fan, then optionally renders four orbit panels when flag 0x80 is
 * set and the central panel unless flag 0x8000 is set. +0x120 supplies the
 * central panel's alternating count. Returns void and writes DS G3 registers.
 */
extern "C" void func_ov026_021ff51c(void *object)
{
    if (FIELD(u32, object, 0x12c) & 0x400)
        return;

    *(volatile u32 *)0x04000444 = 0;
    *(volatile u32 *)0x04000470 = FIELD(u32, object, 0x10);
    *(volatile u32 *)0x04000470 = FIELD(u32, object, 0x20);
    *(volatile u32 *)0x04000470 = FIELD(u32, object, 0x30);
    *(volatile u32 *)0x0400046c = FIELD(u32, object, 0x70);
    *(volatile u32 *)0x0400046c = 0x1000;
    *(volatile u32 *)0x0400046c = FIELD(u32, object, 0x70);

    for (s32 i = 0; i < FIELD(s32, object, 0x9c); ++i)
        func_ov026_021fdd28(FIELD(void *, object, 0xa0 + i * 4));
    func_ov026_021fe284(FIELD(void *, object, 0xe0));
    func_ov026_021fe56c(FIELD(void *, object, 0xe4));
    func_ov026_021fd900(0, 0, 0, 0, 0, 0, 0, 0);

    if (FIELD(u32, object, 0x12c) & 0x80) {
        func_ov026_021fd964(0, 0, 2, 0x18, 0x1f, 0);
        for (s32 i = 0; i < 4; ++i)
            submit_child(FIELD(void *, object, 0xec + i * 4));
    }
    if (!(FIELD(u32, object, 0x12c) & 0x8000)) {
        func_ov026_021fd964(0, 0, 3, 0x16, 0x1f, 0);
        FIELD(s32, FIELD(void *, object, 0xe8), 0xa0) =
            FIELD(s32, object, 0x120);
        submit_child(FIELD(void *, object, 0xe8));
    }
    *(volatile u32 *)0x04000448 = 1;
}

/*
 * Advances the central panel selector every 16 ticks. While flag 0x80 is set,
 * it enables all four orbit panels, alternates their control value between
 * 0xF6 and 0x1EC every four ticks, and advances their +0x4C angle by 0x1000.
 * Otherwise it disables the orbit panels. Returns void.
 */
extern "C" void func_ov026_021ff674(void *object)
{
    s32 panel_tick = FIELD(s32, object, 0x124) + 1;
    FIELD(s32, object, 0x124) = panel_tick;
    FIELD(s32, object, 0x120) = (panel_tick >> 4) & 1;

    if (FIELD(u32, object, 0x12c) & 0x80) {
        s32 orbit_tick = FIELD(s32, object, 0x130) + 1;
        FIELD(s32, object, 0x130) = orbit_tick;
        s32 control = ((((orbit_tick >> 2) & 1) + 1) * 0xf6);
        for (s32 i = 0; i < 4; ++i) {
            void *panel = FIELD(void *, object, 0xec + i * 4);
            FIELD(s32, panel, 0xac) = 1;
            PresentationScalar_SetImmediate((u8 *)panel + 0x6c, control);
            PresentationScalar_SetImmediate((u8 *)panel + 0x4c,
                          FIELD(s32, panel, 0x50) + 0x1000);
        }
    } else {
        for (s32 i = 0; i < 4; ++i)
            FIELD(s32, FIELD(void *, object, 0xec + i * 4), 0xac) = 0;
    }
}

/*
 * Applies a two-word flag event: type 0 ORs mask +4 into +0x12C and type 1
 * clears it. A newly set/cleared bit 0 starts/stops sound 0x22 respectively.
 * Stores the event type at +0x128. Returns 2 for known types and 1 otherwise.
 */
extern "C" s32 func_ov026_021ff730(void *object, const u32 *event)
{
    u32 type = event[0];
    u32 mask = event[1];
    FIELD(u32, object, 0x128) = type;
    if (type == 0) {
        if ((mask & 1) && !(FIELD(u32, object, 0x12c) & 1))
            Sound_Play(gSoundContext, 0x22, 0);
        FIELD(u32, object, 0x12c) |= mask;
        return 2;
    }
    if (type == 1) {
        if ((mask & 1) && (FIELD(u32, object, 0x12c) & 1))
            Sound_StopEffect(gSoundContext, 0x22, 0);
        FIELD(u32, object, 0x12c) &= ~mask;
        return 2;
    }
    return 1;
}
