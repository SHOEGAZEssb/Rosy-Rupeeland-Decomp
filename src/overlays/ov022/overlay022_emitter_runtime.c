#include "tingle/types.h"

/* Overlay 22 emitter timing, randomized sprite spawning, and per-sprite lifetime setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_ov022_022004b4[7];
extern const s32 data_ov022_022005a8[];
extern const s32 data_ov022_022005b8[];
extern const u8 data_ov022_022006b4[];
extern void *gHeapContext;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void func_020593ac(void *, s32, s32, s32, ...);
extern void *func_02073e48(void *, s32, s32, s32, ...);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern s32 func_0209189c(void *, s32, s32);
extern s32 func_020918f4(void *, s32);
extern s32 func_02091a70(s32, s32, s32, s32);
extern void func_02091b98(void *, s32);
extern void func_02091bac(void *, s32, s32, s32, s32);
extern s32 func_02091c7c(void *, s32);
extern void func_02091cf0(void *);
extern void func_020948e4(void *, s32, s32);
extern void func_02094bbc(void *, s32, s32, s32);
extern void func_02095274(void *, void *);
extern void *func_ov022_021fce00(void *, void *, s32);
#ifdef __cplusplus
}
#endif

extern "C" void func_ov022_021fd2dc(void *object, s32 duration);

/*
 * Configures an emitter burst. Inputs are emitter, a randomization parameter,
 * requested count, and direction. A duration is sampled in the recovered
 * 20..200 range and clamped to count*4, then interpolation +0x10 is configured
 * for that count/duration. Counters +0x58/+0x5C are cleared, direction is saved
 * at +0x60, and endpoint tables +0x68/+0x6C are selected (swapped when the
 * direction is nonzero). Timer +0x2C starts at 10. Returns the chosen duration;
 * emitter timing state changes without direct allocation or MMIO.
 */
extern "C" s32 func_ov022_021fcfd4(void *emitter, s32 random_arg,
                                     s32 count, s32 direction)
{
    s32 duration = func_02091a70(20, 200, random_arg, count);
    if (duration > count * 4)
        duration = count * 4;
    func_02091bac((u8 *)emitter + 0x10, 1, 0, count, duration);
    FIELD(s32, emitter, 0x58) = 0;
    FIELD(s32, emitter, 0x5c) = 0;
    FIELD(s32, emitter, 0x60) = direction;
    FIELD(const s32 *, emitter, 0x68) =
        direction == 0 ? data_ov022_022005a8 : data_ov022_022005b8;
    FIELD(const s32 *, emitter, 0x6c) =
        direction == 0 ? data_ov022_022005b8 : data_ov022_022005a8;
    func_02091b98((u8 *)emitter + 0x2c, 10);
    return duration;
}

/*
 * Advances one emitter tick and spawns a moving sprite when interpolation
 * +0x10 crosses one of seven recovered thresholds. Timer +0x2C periodically
 * plays sound 0x4F and is reseeded to 10..20. A spawned object receives the
 * appropriate font/sprite frame, a randomized start around table +0x68, a
 * randomized target around table +0x6C, direction-dependent tween selectors,
 * and a 24-plus-random lifetime before being queued on controller +0x48.
 * The emitter's carry +0x5C, previous sample +0x58, RNG +0x64, interpolation,
 * heap, sprite/OAM, sound, and controller state may change. No value is
 * returned.
 */
extern "C" void func_ov022_021fd068(void *emitter)
{
    s32 current = func_02091c7c((u8 *)emitter + 0x10, 1);
    s32 delta = current - FIELD(s32, emitter, 0x58) +
                FIELD(s32, emitter, 0x5c);

    if (delta != 0) {
        if (func_02091c7c((u8 *)emitter + 0x2c, 2) != 0) {
            func_020593ac(gSoundContext, 0, 0x4f, 0x7f, 0, 0);
            func_02091b98((u8 *)emitter + 0x2c,
                          func_0209189c((u8 *)emitter + 0x64, 10, 20));
        }

        s32 frame = 0;
        while (frame < 6) {
            if (delta <= data_ov022_022004b4[frame]) {
                if (delta < data_ov022_022004b4[frame] && frame != 0)
                    --frame;
                FIELD(s32, emitter, 0x5c) =
                    delta - data_ov022_022004b4[frame];
                break;
            }
            ++frame;
        }

        void *font_resource = GraphicsSpriteGroup_CreateStateFromSource(
            FIELD(void *, emitter, 0), (u8 *)emitter + 4, 1);
        const s32 *start = FIELD(const s32 *, emitter, 0x68);
        void *sprite_resource = func_02073e48(font_resource, frame,
                                              start[0], start[1], 0, 0, 0);
        void *object = Heap_Alloc(0xa4, data_ov022_022006b4,
                                  4, gHeapContext);
        if (object != 0)
            object = func_ov022_021fce00(
                object, sprite_resource, FIELD(s32, emitter, 0x60));

        s32 start_x = start[0] + func_0209189c(
            (u8 *)emitter + 0x64, -start[2], start[2]);
        s32 start_y = start[1] + func_0209189c(
            (u8 *)emitter + 0x64, -start[3], start[3]);
        func_02094bbc(object, start_x << 12, start_y << 12, 0);

        const s32 *end = FIELD(const s32 *, emitter, 0x6c);
        s32 end_x = end[0] + func_0209189c(
            (u8 *)emitter + 0x64, -end[2], end[2]);
        s32 end_y = end[1] + func_0209189c(
            (u8 *)emitter + 0x64, -end[3], end[3]);
        if (FIELD(s32, emitter, 0x60) == 0) {
            func_020948e4((u8 *)object + 0xc, 1, end_x << 12);
            func_020948e4((u8 *)object + 0x1c, 5, end_y << 12);
        } else {
            func_020948e4((u8 *)object + 0xc, 5, end_x << 12);
            func_020948e4((u8 *)object + 0x1c, 1, end_y << 12);
        }
        func_ov022_021fd2dc(
            object, func_020918f4((u8 *)emitter + 0x64, 4) + 24);
        func_02095274((u8 *)emitter + 0x48, object);
    }

    FIELD(s32, emitter, 0x58) = FIELD(s32, emitter, 0x20);
    func_02091cf0((u8 *)emitter + 0x10);
}

/*
 * Sets a moving sprite's lifetime from the low signed halfword of the second
 * argument and resets elapsed time +0x80 to zero. The object is modified and
 * no value is returned; no SDK or hardware call occurs.
 */
extern "C" void func_ov022_021fd2dc(void *object, s32 duration)
{
    FIELD(s32, object, 0x7c) = (s16)duration;
    FIELD(s32, object, 0x80) = 0;
}
