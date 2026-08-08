#include "tingle/types.h"

/* Overlay 25 paired-engine animated effect controller and mode dispatcher. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern const u8 data_ov025_02202c84[];
extern const u8 data_ov025_02202d24[];
extern const u8 data_ov025_02203354[];
extern void *gDebugFont;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void __construct_array(void *, s32, s32, void *);
extern void __destroy_arr(void *, s32, s32, void *);
extern u32 genrand_int32(void);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void func_02072b68(void *, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *func_02073ffc(void *, void *, s32);
extern void func_020740e8(void *, void *, void *);
extern void func_0207419c(void *);
extern void *func_020742cc(void *);
extern s32 func_0209189c(u32 *, s32, s32);
extern s32 func_020918f4(u32 *, s32);
extern void func_020948e4(void *, s32, s32);
extern void func_020949ec(void *);
extern void func_02094bbc(void *, s32, s32, s32);
extern void func_02094cf0(void *, const void *, s32);
extern void func_ov025_021fdec8(void *);
extern void func_ov025_021fe174(void *, s32, s32, s32);
extern void func_ov025_021fe248(void *);
extern void func_ov025_021fe2c4(void *);
extern void func_ov025_021fe39c(void *);
extern void func_ov025_021fe4cc(void *, s32, s32);
extern void func_ov025_021feb08(void *, s32);
#ifdef __cplusplus
}
#endif

/* Empty base lifecycle hook; its input and all observable state are unchanged. */
extern "C" void func_ov025_021fdec8(void *object)
{
    (void)object;
}

static void prepare_effect_sprite(void *sprite, s32 phase)
{
    FIELD(u8, sprite, 0x3a) = 3;
    FIELD(u16, sprite, 0x28) = (u16)phase;
    FIELD(u16, sprite, 0x24) |= 6;
}

/*
 * Constructs the effect controller over its base animation object. It creates
 * three resource descriptors from recovered ID triplets, a fourth descriptor
 * for 0x1154..0x1156, clones shared and debug-font sprite owners, creates two
 * mirrored sprite pairs, seeds RNG state +0xF8, chooses a random binary side
 * +0xA4, and enters mode 2/variant 0. Heap-independent graphics, RNG, and
 * animation state change; the initialized object pointer is returned.
 */
extern "C" void *func_ov025_021fdecc(void *object)
{
    func_020949ec(object);
    FIELD(const void *, object, 0) = data_ov025_02203354;
    __construct_array((u8 *)object + 0xb0, 3, 0xc, (void *)func_02071ea4);
    func_02071ea4((u8 *)object + 0xd4);
    FIELD(u32, object, 0xf8) = 0;
    for (s32 i = 0; i < 3; ++i) {
        const u8 *entry = data_ov025_02202c84 + i * 8;
        func_02071ee0((u8 *)object + 0xb0 + i * 0xc, data_020f4e18,
                      FIELD(u16, entry, 0), FIELD(u16, entry, 2),
                      FIELD(u16, entry, 4));
    }
    FIELD(u32, object, 0xf8) = genrand_int32();
    FIELD(void *, object, 0xe0) = func_020742cc(data_020f4e14);
    FIELD(void *, object, 0xe4) = func_020742cc(gDebugFont);
    FIELD(s32, FIELD(void *, object, 0xe4), 0x18) = 0;
    FIELD(s32, FIELD(void *, object, 0xe4), 0x1c) = 0x100;

    FIELD(void *, object, 0xe8) = func_02073ffc(FIELD(void *, object, 0xe0),
                                                (u8 *)object + 0xb0, 2);
    prepare_effect_sprite(FIELD(void *, object, 0xe8), 0x2000);
    FIELD(void *, object, 0xf0) = func_02073ffc(FIELD(void *, object, 0xe4),
                                                (u8 *)object + 0xb0, 2);
    prepare_effect_sprite(FIELD(void *, object, 0xf0), 0x2000);
    func_02071ee0((u8 *)object + 0xd4, data_020f4e18,
                  0x1154, 0x1155, 0x1156);
    FIELD(void *, object, 0xec) = func_02073ffc(FIELD(void *, object, 0xe0),
                                                (u8 *)object + 0xd4, 1);
    prepare_effect_sprite(FIELD(void *, object, 0xec), 0x2100);
    FIELD(void *, object, 0xf4) = func_02073ffc(FIELD(void *, object, 0xe4),
                                                (u8 *)object + 0xd4, 1);
    prepare_effect_sprite(FIELD(void *, object, 0xf4), 0x2100);
    FIELD(s32, object, 0xa8) = 0;
    FIELD(s32, object, 0xa4) = func_020918f4((u32 *)object + 0x3e, 2);
    func_ov025_021fe4cc(object, 2, 0);
    return object;
}

static void cleanup_effect(void *object)
{
    FIELD(const void *, object, 0) = data_ov025_02203354;
    func_0207419c(FIELD(void *, object, 0xe0));
    func_0207419c(FIELD(void *, object, 0xe4));
    func_02071eb8((u8 *)object + 0xd4);
    __destroy_arr((u8 *)object + 0xb0, 3, 0xc, (void *)func_02071eb8);
    func_ov025_021fdec8(object);
}

/*
 * Releases both cloned sprite owners and all four resource descriptors while
 * retaining caller-owned object storage. Graphics/archive state changes; the
 * original object pointer is returned.
 */
extern "C" void *func_ov025_021fe0c4(void *object)
{
    cleanup_effect(object);
    return object;
}

/*
 * Deleting-destructor variant of func_ov025_021FE0C4. It performs identical
 * graphics teardown, frees the object allocation, and returns the now-invalid
 * original pointer value.
 */
extern "C" void *func_ov025_021fe118(void *object)
{
    cleanup_effect(object);
    Heap_Free(object);
    return object;
}

/*
 * Configures the mirrored primary sprites +0xE8/+0xF0 from resource set
 * `resource_index`, animation `animation`, and final setup flag `setup_flag`.
 * When their current resource differs, both owners are rebound first. Sprite
 * flags 1/2/6 are cleared and current coordinates are preserved. Graphics and
 * sprite state change; returns void.
 */
extern "C" void func_ov025_021fe174(void *object, s32 resource_index,
                                     s32 animation, s32 setup_flag)
{
    void *main_sprite = FIELD(void *, object, 0xe8);
    const u8 *entry = data_ov025_02202c84 + resource_index * 8;
    if (FIELD(u16, entry, 0) != FIELD(u32, FIELD(void *, main_sprite, 0x14), 0x10)) {
        void *descriptor = (u8 *)object + 0xb0 + resource_index * 0xc;
        func_020740e8(FIELD(void *, object, 0xe0), main_sprite, descriptor);
        func_020740e8(FIELD(void *, object, 0xe4),
                      FIELD(void *, object, 0xf0), descriptor);
    }
    void *sprites[2] = { main_sprite, FIELD(void *, object, 0xf0) };
    for (s32 i = 0; i < 2; ++i) {
        void *sprite = sprites[i];
        FIELD(u16, sprite, 0x24) &= (u16)~0x46;
        func_02073e48(sprite, animation, FIELD(s16, sprite, 0x2c),
                      FIELD(s16, sprite, 0x2e), 3, 0x2000, setup_flag);
    }
}

static void show_secondary_pair(void *object, s32 animation, bool select)
{
    void *sprites[2] = { FIELD(void *, object, 0xec),
                         FIELD(void *, object, 0xf4) };
    for (s32 i = 0; i < 2; ++i) {
        if (select) FIELD(u16, sprites[i], 0x24) |= 2;
        FIELD(u16, sprites[i], 0x24) &= (u16)~4;
        func_02072b68(sprites[i], animation);
    }
}

/* Selects resource 1/animation 12 with flag 2 and secondary animation 2; +0xA8 becomes 4. */
extern "C" void func_ov025_021fe248(void *object)
{
    func_ov025_021fe174(object, 1, 12, 2);
    show_secondary_pair(object, 2, true);
    FIELD(s32, object, 0xa8) = 4;
}

/* Selects resource 1/animation 12 with flag 0x42 and secondary animation 6; +0xA8 becomes -4. */
extern "C" void func_ov025_021fe2c4(void *object)
{
    func_ov025_021fe174(object, 1, 12, 0x42);
    show_secondary_pair(object, 6, true);
    FIELD(s32, object, 0xa8) = -4;
}

/* Selects resource 1/animation 14 with flag 2, shows secondary animation zero, and clears +0xA8. */
extern "C" void func_ov025_021fe340(void *object)
{
    func_ov025_021fe174(object, 1, 14, 2);
    show_secondary_pair(object, 0, false);
    FIELD(s32, object, 0xa8) = 0;
}

/* Selects resource 1/animation 22, clears secondary selection flag, uses animation 13, and clears +0xA8. */
extern "C" void func_ov025_021fe39c(void *object)
{
    func_ov025_021fe174(object, 1, 22, 2);
    void *sprites[2] = { FIELD(void *, object, 0xec), FIELD(void *, object, 0xf4) };
    for (s32 i = 0; i < 2; ++i) {
        FIELD(u16, sprites[i], 0x24) &= (u16)~2;
        func_02072b68(sprites[i], 13);
    }
    FIELD(s32, object, 0xa8) = 0;
}

/*
 * Chooses a random mode in 0..8 different from current +0x9C, chooses a random
 * variant in 0..2, and dispatches it through func_ov025_021FE4CC. RNG and
 * animation state change; returns void.
 */
extern "C" void func_ov025_021fe3f8(void *object)
{
    s32 mode;
    do mode = func_020918f4((u32 *)object + 0x3e, 9);
    while (mode == FIELD(s32, object, 0x9c));
    func_ov025_021fe4cc(object, mode,
                        func_0209189c((u32 *)object + 0x3e, 0, 3));
}

/*
 * For current mode 3 or 6, chooses a recovered random follow-up range (4..11
 * or 15..20) and passes it to func_ov025_021FEB08. Other modes are unchanged.
 * RNG/follow-up animation state may change; returns void.
 */
extern "C" void func_ov025_021fe444(void *object)
{
    if (FIELD(s32, object, 0x9c) == 3)
        func_ov025_021feb08(object,
            func_0209189c((u32 *)object + 0x3e, 4, 11));
    else if (FIELD(s32, object, 0x9c) == 6)
        func_ov025_021feb08(object,
            func_0209189c((u32 *)object + 0x3e, 15, 20));
}

static void position_by_side(void *object, s32 animation, s32 flag,
                             s32 y, s32 child_target)
{
    if (FIELD(s32, object, 0xa4)) {
        func_ov025_021fe174(object, 1, animation, flag);
        func_02094bbc(object, 0x120000, y, 0);
        func_020948e4((u8 *)object + 0xc, 2, -0x20000);
    } else {
        func_ov025_021fe174(object, 1, animation, 0x42);
        func_02094bbc(object, -0x20000, y, 0);
        func_020948e4((u8 *)object + 0xc, 2, 0x120000);
    }
    if (child_target != 0)
        func_020948e4((u8 *)object + 0x1c, 2, child_target);
}

/*
 * Central mode dispatcher. It stores mode +0x9C and variant +0xAC, resets
 * phase +0xA0, initially hides the secondary pair, then configures resources,
 * animations, mirrored side-dependent positions, child tweens, and duration
 * +0x7C/+0x80 for modes 0..8 and 10..11. Mode 9 deliberately has no setup.
 * Mode 0 may instead start recovered path data +0x2D24. Graphics/animation
 * state changes; returns void.
 */
extern "C" void func_ov025_021fe4cc(void *object, s32 mode, s32 variant)
{
    FIELD(s32, object, 0x9c) = mode;
    FIELD(s32, object, 0xac) = variant;
    FIELD(s32, object, 0xa0) = 0;
    FIELD(u16, FIELD(void *, object, 0xec), 0x24) |= 4;
    FIELD(u16, FIELD(void *, object, 0xf4), 0x24) |= 4;

    switch (mode) {
    case 0:
        if (FIELD(s32, object, 0xa4)) {
            func_ov025_021fe174(object, 0, 0, 2);
            func_02094cf0(object, data_ov025_02202d24, 1);
            return;
        }
        /* The opposite side intentionally shares mode 2 setup. */
    case 2:
        position_by_side(object, variant, 2, 0xa0000, 0);
        FIELD(s32, object, 0x7c) = (variant == 0 || variant == 3) ? 300 : 150;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 3:
    case 4:
        position_by_side(object, variant, 2, 0xa0000, 0);
        func_020948e4((u8 *)object + 0xc, 2, 0x80000);
        FIELD(s32, object, 0x7c) = 300;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 5:
        if (FIELD(s32, object, 0xa4)) func_ov025_021fe248(object);
        else func_ov025_021fe2c4(object);
        func_02094bbc(object, FIELD(s32, object, 0xa4) ? 0x120000 : -0x20000,
                      0xa0000, 0);
        func_020948e4((u8 *)object + 0xc, 2,
                      FIELD(s32, object, 0xa4) ? -0x20000 : 0x120000);
        func_020948e4((u8 *)object + 0x1c, 2, 0x40000);
        FIELD(s32, object, 0x7c) = 300;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 6:
    case 7:
    case 8:
        if (FIELD(s32, object, 0xa4)) func_ov025_021fe248(object);
        else func_ov025_021fe2c4(object);
        func_02094bbc(object, FIELD(s32, object, 0xa4) ? 0x120000 : -0x20000,
                      0x60000, 0);
        func_020948e4((u8 *)object + 0xc, 2, 0x80000);
        func_020948e4((u8 *)object + 0x1c, 2, 0x60000);
        FIELD(s32, object, 0x7c) = 300;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 1:
        position_by_side(object, 1, 2, 0xa0000, 0);
        func_020948e4((u8 *)object + 0xc, 1, 0x80000);
        func_020948e4((u8 *)object + 0x1c, 3, 0x60000);
        FIELD(s32, object, 0x7c) = 90;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 10:
        position_by_side(object, 13, 2, -0xe0000, 0);
        FIELD(s32, object, 0x7c) = 480;
        FIELD(s32, object, 0x80) = 0;
        return;
    case 11:
        func_ov025_021fe39c(object);
        func_02094bbc(object, 0x80000, -0x120000, 0);
        func_020948e4((u8 *)object + 0x1c, 1, 0xa0000);
        FIELD(s32, object, 0x7c) = 60;
        FIELD(s32, object, 0x80) = 0;
        return;
    default:
        return;
    }
}
