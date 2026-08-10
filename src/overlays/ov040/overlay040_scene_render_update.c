#include "tingle/types.h"

/*
 * Overlay 40 scene rendering update. This recovered routine propagates camera
 * transforms to presentation groups, builds 29 linked slot positions, submits
 * software-rendered geometry and transient line effects, updates a texture
 * frame, and renders the 80-slot secondary object collection.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *VecFx32Object_InitCopy(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_Add(void *vector, const void *other);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void func_0209a2ac(void *object, const void *position, s32 enabled);
extern void func_0209b7a0(void *renderer, const void *position);
extern void func_0209b7ec(void *renderer, s32 value);
extern s32 func_020befec(s32 numerator, s32 denominator);
extern void *func_ov040_02200108(void *destination, const void *object);
extern void *func_ov040_022021dc(void *destination, const void *left,
                                 const void *right);
extern void func_ov040_0220332c(void *owner);
extern void func_020b1784(void *destination, s32 slot, void *source);
extern const s32 data_ov040_022038a0[];
#ifdef __cplusplus
}
#endif

/*
 * Apply `camera` and `offset` to all scene presentations. Confirmed effects
 * include main BG1/BG3 scroll writes, renderer submission through primary
 * +0x10, updates to 29 vectors at +0x660, transient counters +0x70/+0xAA4/
 * +0xB08, texture-frame upload through resource set +0x1B7C, and a call to the
 * 80-slot renderer. Returns no value. The exact fallback retains the original
 * large stack arrays and compiler-sensitive fixed-point raster loops; this
 * portable form documents the stable transform and ownership skeleton.
 */
extern "C" void func_ov040_022013e0(void *scene, const void *offset,
                                      const void *camera)
{
    s32 translated[4];
    s32 zero[4];
    void *primary = FIELD(void *, scene, 0x48);
    void *renderer = FIELD(void *, primary, 0x10);

    func_0209a2ac(scene, 0, 1);
    VecFx32Object_InitCopy(translated, camera);
    VecFx32Object_Add(translated, offset);
    for (s32 index = 0; index < 4; index++)
        func_0209a2ac(FIELD(void *, scene, 0xb44 + index * 4), translated, 1);

    VecFx32Object_Assign(translated, camera);
    s32 presentationPosition[4];
    func_ov040_02200108(presentationPosition, FIELD(void *, scene, 0xb44));
    FIELD(s32, translated, 4) +=
        (((FIELD(s32, presentationPosition, 8) - 0x80000) >> 0xc) / 8) * 0x1000;
    FIELD(s32, translated, 8) +=
        func_020befec(FIELD(s32, offset, 8) >> 0xc, 3) * 0x1000;
    func_0209a2ac(FIELD(void *, scene, 0xac0), translated, 1);
    func_0209a2ac(FIELD(void *, scene, 0xac4), translated, 1);
    if (FIELD(void *, scene, 0xb10) != 0)
        func_0209a2ac(FIELD(void *, scene, 0xb10), translated, 1);
    for (s32 index = 3; index >= 0; index--)
        func_0209a2ac(FIELD(void *, scene, 0xae8 + index * 4), offset, 1);

    VecFx32Object_InitComponents(zero, 0, 0, 0);
    func_0209a2ac(FIELD(void *, scene, 0xba0), zero, 1);
    for (s32 index = 2; index >= 0; index--)
        func_0209a2ac(FIELD(void *, scene, 0xbc4 + index * 4), zero, 1);

    *(volatile u32 *)0x04000014 =
        (0x01ff0000 & ((FIELD(s32, camera, 8) >> 0xc) +
         (FIELD(s32, offset, 8) >> 14) + 0x18) * 0x10000);
    *(volatile u32 *)0x0400001c =
        (((FIELD(s32, presentationPosition, 8) - 0x80000) >> 15) + 0x40 +
         (FIELD(s32, camera, 4) >> 0xc)) & 0x1ff |
        ((func_020befec(FIELD(s32, offset, 8) >> 0xc, 3) +
          (FIELD(s32, camera, 8) >> 0xc) + 8) & 0x1ff) << 16;

    FIELD(s32, translated, 8) =
        (func_020befec(FIELD(s32, offset, 8) >> 0xc, 3) + 8) * 0x1000;
    func_0209b7a0(renderer, translated);
    func_0209b7ec(renderer, 0);

    /* Later consumers use these confirmed linked positions as their source. */
    for (s32 index = 0; index < 29; index++) {
        s8 parent = FIELD(s8, scene, 0x624 + index);
        if (parent < 0)
            func_ov040_022021dc((u8 *)scene + 0x660 + index * 0x10,
                                (u8 *)scene + 0x84 + index * 0x10,
                                (u8 *)scene + 0x74);
        else
            func_ov040_022021dc((u8 *)scene + 0x660 + index * 0x10,
                                (u8 *)scene + 0x84 + index * 0x10,
                                (u8 *)scene + 0x660 + parent * 0x10);
    }

    func_ov040_0220332c((u8 *)scene + 0xbd8);
    if (FIELD(s32, scene, 0x70) > 0) FIELD(s32, scene, 0x70)--;
    if (FIELD(s32, scene, 0xb08) > 0) FIELD(s32, scene, 0xb08)--;
    s32 frame = func_020befec(FIELD(s32, scene, 0xab8) >> 4, 3);
    func_020b1784((u8 *)FIELD(void *, scene, 0x1b7c) + 0x24 +
                  frame * data_ov040_022038a0[1] * 2, 0,
                  (void *)data_ov040_022038a0[0]);
    VecFx32Object_Destroy(zero);
    VecFx32Object_Destroy(presentationPosition);
    VecFx32Object_Destroy(translated);
}
