#include "tingle/types.h"

/* Overlay 18 matched-descriptor result text preparation and centered rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_021f3ecc[];
extern const u32 data_ov018_021ffce0[];
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02075598(void *, void *);
extern s32 func_02076148(void *, const void *, s32, s32, s32, s32, s32);
extern s32 func_020761f8(void *, const void *, s32, s32);
extern void func_0207c460(void *, u16);
extern const void *func_020791e0(const void *, s32);
extern s32 func_ov018_021fe1d8(void *, const void *);
#ifdef __cplusplus
}
#endif

typedef struct Overlay018TemporaryText {
    const u32 *vtable;
    void *storage;
    s32 field_08;
    s32 field_0c;
} Overlay018TemporaryText;

/*
 * Build temporary text from matched descriptor +0x194's unsigned ID +0x1A,
 * bind embedded text target +0x70 to gDebugFont, and render that text plus fixed
 * message 0x2F6 from data_021F3ECC. Center both around X=0x80 using measured
 * widths; use Y=0x90 (and +0x14) unless the descriptor's translated Y minus
 * scene offset +0x60 exceeds 0x80, in which case use Y=0x10. Returns void.
 * Font/text SDK state and the render target may change; no direct MMIO occurs.
 * Draw constants 13/11, 8, and -2 are confirmed but their style semantics are
 * not yet known.
 */
extern "C" void func_ov018_021fe46c(void *state)
{
    void *descriptor = FIELD(void *, state, 0x194);
    s32 y = 0x90;
    Overlay018TemporaryText temporary = {data_ov018_021ffce0, 0, 0, 0};

    if (func_ov018_021fe1d8(state, descriptor) -
            FIELD(s32, state, 0x60) > 0x80)
        y = 0x10;

    func_0207c460(&temporary, FIELD(u16, descriptor, 0x1a));
    func_02075598(gDebugFont, (u8 *)state + 0x70);

    const void *primary = (u8 *)temporary.storage + 0x2c;
    s32 width = func_020761f8(gDebugFont, primary, 8, -2);
    func_02076148(gDebugFont, primary, 0x80 - width / 2, y, 13, 8, -2);

    const void *secondary = func_020791e0(data_021f3ecc, 0x2f6);
    width = func_020761f8(gDebugFont, secondary, 8, -2);
    func_02076148(gDebugFont, secondary, 0x80 - width / 2,
                  y + 0x14, 11, 8, -2);
}
