#include "tingle/types.h"

/* Overlay 18 multi-phase result reveal, effects, dialog, and transition sequence. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern const s32 data_ov018_021ffbf0[2];
extern const s32 data_ov018_021ffbf8[2];
extern const u8 data_ov018_021ffd68[];
extern void *gDebugFont;
extern void *gHeapContext;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern u32 genrand_int32(void);
extern s32 func_02059344(void *, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *func_02073ffc(void *, void *, s32);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern s32 func_020918f4(void *, s32);
extern void func_02091b98(void *, s32);
extern void func_02091bac(void *, s32, s32, s32, s32);
extern s32 func_02091c7c(void *, s32);
extern s32 func_02091cf0(void *);
extern void func_020922f0(void *, s32);
extern void func_02092c8c(s32, s32);
extern void func_020939d8(void *);
extern void func_02095274(void *, void *);
extern void func_020954e0(void *);
extern void func_020afd0c(volatile u16 *, s32, s32, s32, s32);
extern s32 func_020befec(s32, s32);
extern void func_ov003_021fb7ec(void *);
extern void *func_ov018_021fce00(void *, void *, const void *, s32, s32);
extern void func_ov018_021fcf40(void *, s32, s32, s32);
extern void func_ov018_021fd788(void *);
extern void func_ov018_021fda10(void *, u16);
extern s32 func_ov018_021fda60(void *);
extern s32 func_ov018_021fe19c(void *, const void *);
extern s32 func_ov018_021fe1d8(void *, const void *);
extern void func_ov018_021fe46c(void *);
extern void func_ov018_021fe644(void *);
extern void func_ov018_021ff3cc(void *);
#ifdef __cplusplus
}
#endif

/* Divide a signed fixed-point product by 4096 with truncation toward zero. */
static s32 divideBy4096(s32 value)
{
    return (value + (value < 0 ? 0xfff : 0)) >> 12;
}

/* Invoke virtual destructor slot +4 when the optional object is present. */
static void destroyVirtual(void *object)
{
    if (object != 0) {
        typedef void (*Destructor)(void *);
        FIELD(Destructor *, object, 0)[1](object);
    }
}

/*
 * Run the result-presentation state machine in +4 (states 0..7 and 10; 8/9
 * intentionally idle). Fade the sub display out, clear the drawing, allocate
 * and register a descriptor-backed result object at +0x1C4, configure blending,
 * reveal the object, render centered result text, and spawn two randomized
 * sprites per frame during the reveal. Fade back in, wait for sound 0x8F, then
 * accept input bit 5. Mode +0x54==1 presents dialog message 0x1EC and destroys
 * it before transition 0x021FFBF8; other modes wait 21 frames, update completion
 * state, and select transition 0x021FFBF0. Always clear +0x414, synchronize the
 * frame/UI, and return zero. Heap, raster, sprite, audio, dialog, transition,
 * PRNG, and caller state change; sub-display brightness/blend registers
 * 0x04001052/0x04001050 are written directly. Unnamed constants preserve the
 * recovered SDK protocol and are not assigned speculative meanings.
 */
extern "C" s32 func_ov018_021fea1c(void *state)
{
    FIELD(s32, state, 0x414) = 0;
    switch (FIELD(s32, state, 4)) {
    case 0:
        func_020922f0(state, 0x8f);
        func_02091bac((u8 *)state + 0x1a8, 1, 0x10, 0, 0x14);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Confirmed fallthrough: update the new fade immediately. */
    case 1: {
        s32 brightness = func_02091c7c((u8 *)state + 0x1a8, 1) |
                         ((0x10 - FIELD(s32, state, 0x1b8)) << 8);
        *(volatile u16 *)0x04001052 = brightness;
        if (!func_02091cf0((u8 *)state + 0x1a8))
            break;

        func_ov003_021fb7ec(FIELD(void *, state, 0x190));
        func_ov018_021ff3cc(FIELD(void *, state, 0x58));
        FIELD(s32, state, 0x3c8) = 0;

        void *result = Heap_Alloc(0xac, data_ov018_021ffd68,
                                  4, gHeapContext);
        if (result != 0) {
            s32 x = func_ov018_021fe19c(
                state, FIELD(void *, state, 0x194));
            s32 y = func_ov018_021fe1d8(
                state, FIELD(void *, state, 0x194));
            result = func_ov018_021fce00(
                result, FIELD(void *, state, 0xcc),
                FIELD(void *, state, 0x194), x, y);
        }
        FIELD(void *, state, 0x1c4) = result;
        func_02095274((u8 *)state + 0x3cc, result);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        break;
    }
    case 2:
        func_02091bac((u8 *)state + 0x1a8, 1, 0, 0x10, 0x3c);
        func_020afd0c((volatile u16 *)0x04001050, 0, 0x24, 0, 0x10);
        func_020954e0(FIELD(void *, state, 0x1c4));
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        break;
    case 3:
        *(volatile u16 *)0x04001052 =
            func_02091c7c((u8 *)state + 0x1a8, 1) | 0x1000;
        if (func_02091cf0((u8 *)state + 0x1a8)) {
            func_02091bac((u8 *)state + 0x1a8, 1, 0x10, 0, 0x3c);
            func_ov018_021fe46c(state);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
            break;
        }
        {
            void *descriptor = FIELD(void *, state, 0x194);
            s32 width = FIELD(s16, descriptor, 0x14) -
                        FIELD(s16, descriptor, 0x10);
            s32 height = FIELD(s16, descriptor, 0x16) -
                         FIELD(s16, descriptor, 0x12);
            s32 centerX = FIELD(s16, descriptor, 0x10) + width / 2;
            s32 centerY = FIELD(s16, descriptor, 0x12) + height / 2;
            for (s32 i = 0; i < 2; i++) {
                s32 angle = (u16)genrand_int32() >> 4;
                s32 radiusX = func_020befec(width * (i + 2), 5);
                s32 radiusY = func_020befec(height * (i + 2), 5);
                s32 x = func_ov018_021fe19c(state, descriptor) + centerX +
                        divideBy4096(radiusX * data_020c9670[angle * 2]);
                s32 y = func_ov018_021fe1d8(state, descriptor) + centerY +
                        divideBy4096(radiusY * data_020c9670[angle * 2 + 1]);
                void *sprite = func_02073ffc(
                    FIELD(void *, state, 0xcc), (u8 *)state + 0xac, 1);
                func_02073e48(sprite,
                    func_020918f4((u8 *)state + 0x3dc, 4),
                    x, y, 0, 0, 0x100);
            }
        }
        break;
    case 4:
        *(volatile u16 *)0x04001052 =
            (func_02091c7c((u8 *)state + 0x1a8, 1) << 8) | 0x10;
        if (func_02091cf0((u8 *)state + 0x1a8)) {
            FIELD(u16, FIELD(void *, FIELD(void *, state, 0x1c4), 0x9c),
                  0x2a) = 0;
            func_020afd0c((volatile u16 *)0x04001050, 1, 0x3e, 0x10, 0);
            func_02091b98((u8 *)state + 0x1a8, 0x78);
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 5:
        if (!func_02059344(gSoundContext, 0x8f)) {
            FIELD(u16, FIELD(void *, state, 0xd4), 0x24) &= ~4;
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        }
        break;
    case 6:
        if (FIELD(u32, state, 0x20) & 0x20) {
            FIELD(s32, state, 0x408) = 0;
            FIELD(s32, state, 0x404) = 0;
            FIELD(u16, FIELD(void *, state, 0xd4), 0x24) |= 4;
            GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
            if (FIELD(s32, state, 0x54) != 1) {
                FIELD(s32, state, 4) = 10;
                FIELD(s32, state, 8) = 0;
            } else {
                func_02092c8c(2, -8);
                func_ov018_021fda10(state, 0x1ec);
                FIELD(s32, state, 4)++;
                FIELD(s32, state, 8) = 0;
            }
        }
        break;
    case 7:
        if (func_ov018_021fda60(state)) {
            void *dialog = FIELD(void *, state, 0x418);
            func_020939d8(dialog);
            func_02092c8c(2, 0);
            destroyVirtual(dialog);
            FIELD(void *, state, 0x418) = 0;
            func_ov018_021fcf40(state, data_ov018_021ffbf8[0],
                                data_ov018_021ffbf8[1], 0);
        }
        break;
    case 10:
        FIELD(s32, state, 8)++;
        if (FIELD(s32, state, 8) > 0x14) {
            func_ov018_021fe644(state);
            func_ov018_021fcf40(state, data_ov018_021ffbf0[0],
                                data_ov018_021ffbf0[1], 0);
        }
        break;
    }
    func_ov018_021fd788(state);
    return 0;
}
