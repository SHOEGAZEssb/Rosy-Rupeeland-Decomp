#include "tingle/types.h"

/* Overlay 35 quinary scene maintenance and cycling-color particle emission. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095360(void *collection);
extern void func_020773a8(void *resourceSet);
extern s32 func_02095224(void *object);
extern void func_ov035_022012ac(void *scene);
extern void func_ov035_021fd5ac(void *list);
extern s32 func_02091c7c(void *state, s32 value);
extern void func_02091b98(void *state, s32 duration);
extern void func_02091dac(void *state);
extern s32 func_02091bd0(void *state, s32 mode, s32 start, s32 end);
extern void func_ov035_02200ec0(void *scene, s32 red, s32 green, s32 blue);
#ifdef __cplusplus
}
#endif

/*
 * Advances the quinary scene and emits field +0x16C particles per call. It
 * updates collections +0x108/+0x118 and resource set +0xF8, conditionally
 * invokes func_ov035_022012ac when sprite +0x104 is active and flag +0x174 was
 * set, then clears that flag. Primitive list +0x170 is updated. When the
 * ten-frame color interpolator +0xA4 reaches mode 2 it is restarted and color
 * phase +0x154 advances. Phases 0..5 cycle one interpolated component among
 * saturated 5-bit RGB endpoints before spawning each particle. There is no
 * return value; renderer, resource, list, fade, RNG, heap, and scene state may
 * change. Out-of-range phases intentionally emit black particles.
 */
extern "C" void func_ov035_02201000(void *scene)
{
    func_02095360((u8 *)scene + 0x108);
    func_02095360((u8 *)scene + 0x118);
    func_020773a8(FIELD(void *, scene, 0xf8));
    if (func_02095224(FIELD(void *, scene, 0x104)) == 0 &&
        FIELD(s32, scene, 0x174) != 0)
        func_ov035_022012ac(scene);
    FIELD(s32, scene, 0x174) = 0;
    func_ov035_021fd5ac(FIELD(void *, scene, 0x170));

    if (func_02091c7c((u8 *)scene + 0xa4, 2) != 0) {
        func_02091b98((u8 *)scene + 0xa4, 10);
        func_02091dac((u8 *)scene + 0x154);
    }

    for (s32 i = 0; i < FIELD(s32, scene, 0x16c); ++i) {
        s32 red = 0;
        s32 green = 0;
        s32 blue = 0;
        switch (FIELD(s32, scene, 0x154)) {
        case 0:
            red = 0x1f;
            blue = func_02091bd0((u8 *)scene + 0xa4, 1, 0x1f, 0);
            break;
        case 1:
            green = func_02091bd0((u8 *)scene + 0xa4, 1, 0, 0x1f);
            blue = 0x1f;
            break;
        case 2:
            red = func_02091bd0((u8 *)scene + 0xa4, 1, 0x1f, 0);
            green = 0x1f;
            break;
        case 3:
            green = 0x1f;
            blue = func_02091bd0((u8 *)scene + 0xa4, 1, 0, 0x1f);
            break;
        case 4:
            red = 0x1f;
            green = func_02091bd0((u8 *)scene + 0xa4, 1, 0, 0x1f);
            blue = 0x1f;
            break;
        case 5:
            red = func_02091bd0((u8 *)scene + 0xa4, 1, 0, 0x1f);
            blue = 0x1f;
            break;
        }
        func_ov035_02200ec0(scene, red, green, blue);
    }
}
