#include "tingle/types.h"

/* Overlay 28 selected-entry display, effect spawning, and small base objects. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_021f3ecc[];
extern void *data_020f4e18[];
extern const u8 data_ov028_021ff29c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *func_02073ffc(void *, void *, s32);
extern void func_020740a4(void *);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_DrawText(void *, const void *, s32, s32, s32, s32, s32);
extern u32 func_02079d60(const void *);
extern const void *func_02079f3c(const void *, u16);
extern s32 func_02091b98(void *, s32);
extern s32 func_02091c7c(void *, s32);
extern void func_02092e9c(void *, u32, s32);
extern void func_02093360(void *, s32);
extern void func_02095308(void *);
extern void func_ov028_021fd7e0(void *);
extern void func_ov028_021fd86c(void *);
#ifdef __cplusplus
}
#endif

/*
 * Clears and refreshes the effect display, then shows `descriptor` or the
 * localized empty label 0x188 when it is null. A descriptor updates controller
 * +0x50 from its derived ID, renders text +0x18, loads its resource triple at
 * +4, and creates selector byte +0x0C at (0x39,0x38). In both branches a second
 * kind-2 sprite from resources +0x14 is placed at (0x3A,0x5E), using selector
 * `variant+0x32` for a descriptor and `variant` otherwise. Returns void; font,
 * resource, sprite, and controller SDK state change.
 */
extern "C" void func_ov028_021fd8b8(void *state, const void *descriptor,
                                      s32 variant)
{
    func_ov028_021fd86c(state);
    void *font = FIELD(void *, state, 0);
    if (descriptor != 0) {
        func_02092e9c(FIELD(void *, state, 0x50),
                      func_02079d60(descriptor), 1);
        func_02093360(FIELD(void *, state, 0x50), 0);
        GraphicsSpriteRenderer_SetFontResource(font, FIELD(void *, state, 0x30));
        GraphicsSpriteRenderer_DrawText(font, (u8 *)descriptor + 0x18,
                      0x60, 0x1d, 14, 6, 0);
        const s32 *ids = FIELD(const s32 *, descriptor, 4);
        func_02071ee0((u8 *)state + 8, data_020f4e18[0],
                      ids[1], ids[2], ids[3]);
        void *sprite = func_02073ffc(FIELD(void *, state, 4),
                                     (u8 *)state + 8, 2);
        func_02073e48(sprite, FIELD(u8, descriptor, 0xc),
                      0x39, 0x38, 1, 0, 0);
        sprite = func_02073ffc(FIELD(void *, state, 4),
                               (u8 *)state + 0x14, 2);
        func_02073e48(sprite, variant + 0x32, 0x3a, 0x5e, 1, 0, 0);
    } else {
        GraphicsSpriteRenderer_SetFontResource(font, FIELD(void *, state, 0x30));
        const void *text = func_02079f3c(data_021f3ecc, 0x188);
        GraphicsSpriteRenderer_DrawText(font, (u8 *)text + 2, 0x60, 0x1d, 1, 6, 0);
        void *sprite = func_02073ffc(FIELD(void *, state, 4),
                                     (u8 *)state + 0x14, 2);
        func_02073e48(sprite, variant, 0x3a, 0x5e, 1, 0, 0);
    }
}

/*
 * When flag +8 is nonzero and timer +0x58 fires for period 2, spawns one random
 * sprite and rearms the timer with value 3. It always advances renderer +4.
 * Returns void; timer, PRNG, sprite, and renderer SDK state may change.
 */
extern "C" void func_ov028_021fda4c(void *state)
{
    if (FIELD(s32, state, 8) != 0 &&
        func_02091c7c((u8 *)state + 0x58, 2) != 0) {
        func_ov028_021fd7e0(state);
        func_02091b98((u8 *)state + 0x58, 3);
    }
    func_020740a4(FIELD(void *, state, 4));
}

/* No-op callback: ignores `object`, changes no state, and returns void. */
extern "C" void func_ov028_021fda94(void *object)
{
    (void)object;
}

/*
 * Installs vtable 0x021FF29C and clears words +4/+8/+0xC. Returns void and only
 * initializes object memory; the vtable's exact role remains unidentified.
 */
extern "C" void func_ov028_021fda98(void *object)
{
    FIELD(const void *, object, 0) = data_ov028_021ff29c;
    FIELD(s32, object, 4) = 0;
    FIELD(s32, object, 8) = 0;
    FIELD(s32, object, 0xc) = 0;
}

/*
 * Restores vtable 0x021FF29C, calls the base destructor, and returns `object`.
 * Base-owned SDK state may be released; this function does not free memory.
 */
extern "C" void *func_ov028_021fdab8(void *object)
{
    FIELD(const void *, object, 0) = data_ov028_021ff29c;
    func_02095308(object);
    return object;
}

/*
 * Stores caller values `a`/`b` at +0x24/+0x28 and clears words +4/+8. Returns
 * void; only object memory changes and the value meanings remain unidentified.
 */
extern "C" void func_ov028_021fdad8(void *object, s32 a, s32 b)
{
    FIELD(s32, object, 0x24) = a;
    FIELD(s32, object, 0x28) = b;
    FIELD(s32, object, 4) = 0;
    FIELD(s32, object, 8) = 0;
}
