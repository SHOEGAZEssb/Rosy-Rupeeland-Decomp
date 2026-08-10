#include "tingle/types.h"

/* Overlay 34 scene construction, render-item setup, and initial audio state. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern u8 gSystemState[];
extern void *gSoundContext;
extern const u8 data_ov034_021ff1b0[];
extern const u8 data_ov034_021ff1b8[];
extern const u8 data_ov034_021fe848[];
extern const s32 data_ov034_021fe770[];
extern const s32 data_ov034_021fe748[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DSceneState_Init(void *object);
extern void Graphics3DLightSet_Init(void *object);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment,
                       void *heapContext);
extern void *func_ov034_021fd544(void *owner);
extern void *func_02071adc(void *resourceContext, s32 resourceId);
extern void *func_ov034_021fce04(void *object, void *owner,
                                s32 entryIndex, u16 mode);
extern void func_02094bbc(void *object, s32 x, s32 y, s32 mode);
extern void func_02094bf0(void *object, s32 first, s32 second, s32 third);
extern void func_020948e4(void *field, s32 mode, s32 value);
extern void func_ov034_021fda34(void *object, s32 x, s32 y, s32 z);
extern void func_ov034_021fda3c(void *object, s32 x, s32 y, s32 z);
extern void func_ov034_021fda4c(void *base, s32 index, s32 first, s32 second,
                               s32 third, s32 field0, s32 field1, s32 field2);
extern void func_02059278(void *sound, s32 id, s32 value);
extern void func_0205974c(void *sound, s32 id);
extern void func_ov034_021fdac0(void *scene, s32 firstWord,
                               s32 secondWord, s32 thirdWord);
#ifdef __cplusplus
}
#endif

typedef struct Overlay034RenderSpec {
    s16 entryIndex;
    s16 mode0;
    s16 mode1;
    s16 mode2;
    s32 x;
    s32 y;
    s32 fieldC;
    s32 field1C;
} Overlay034RenderSpec;

/*
 * Constructs the overlay-34 scene. It initializes embedded objects +0x48,
 * +0xDC, and +0x170; allocates/constructs the 0xC8-byte render owner at +0;
 * acquires graphics resource 0x5002 at +4; and clears sixteen render pointers
 * +8..+0x44. A system-state byte +0x5F selects one of six 0x180-byte setup
 * tables (values >=6 clamp to 5) and a parallel item count stored at +0x1B0.
 * For each item it allocates a 0xA8-byte render object, packs three 5-bit mode
 * fields from the 0x18-byte spec, constructs it against the shared resource,
 * assigns position/scale fields, and seeds +0x7C/+0x80 to 30/0.
 *
 * It then initializes transforms +0x48/+0xDC with recovered Z values 0x299A/
 * 0x2CCD, configures descriptor zero at +0x170 with values 0x800/-0x1000 and
 * three 31 fields, starts sounds 0xBA and 0x1CD, sets +0x1B4 to -1, and installs
 * the callback pair at 0x021FE748 with third word 1. Returns `scene`; heap,
 * graphics-resource, render, descriptor, audio, and callback state change, but
 * there is no direct MMIO in this constructor. Allocations are assumed to
 * succeed where the binary immediately dereferences the resulting object.
 */
extern "C" void *func_ov034_021fdae8(void *scene)
{
    Graphics3DSceneState_Init((u8 *)scene + 0x48);
    Graphics3DSceneState_Init((u8 *)scene + 0xdc);
    Graphics3DLightSet_Init((u8 *)scene + 0x170);

    void *owner = Heap_Alloc(0xc8, data_ov034_021ff1b0, 4, gHeapContext);
    if (owner != 0)
        owner = func_ov034_021fd544(owner);
    FIELD(void *, scene, 0) = owner;
    FIELD(void *, scene, 4) = func_02071adc(data_020f4e18[0], 0x5002);
    for (s32 i = 0; i < 16; ++i)
        FIELD(void *, scene, 8 + i * 4) = 0;

    s32 variant = gSystemState[0x5f];
    if (variant >= 6)
        variant = 5;
    const Overlay034RenderSpec *specs =
        (const Overlay034RenderSpec *)(data_ov034_021fe848 + variant * 0x180);
    s32 count = data_ov034_021fe770[variant];
    FIELD(s32, scene, 0x1b0) = count;

    for (s32 i = 0; i < count; ++i) {
        const Overlay034RenderSpec *spec = &specs[i];
        void *item = Heap_Alloc(0xa8, data_ov034_021ff1b8, 4, gHeapContext);
        if (item != 0) {
            u16 mode = (u16)(spec->mode0 | (spec->mode1 << 5) |
                             (spec->mode2 << 10));
            item = func_ov034_021fce04(item, FIELD(void *, scene, 4),
                                      spec->entryIndex, mode);
        }
        FIELD(void *, scene, 8 + i * 4) = item;
        func_02094bbc(item, spec->x, spec->y, 0);
        func_02094bf0(item, 0, 0x10000, 0x1000);
        func_020948e4((u8 *)item + 0xc, 1, spec->fieldC);
        func_020948e4((u8 *)item + 0x1c, 4, spec->field1C);
        func_020948e4((u8 *)item + 0x4c, 1, 0);
        func_020948e4((u8 *)item + 0x5c, 1, 0);
        FIELD(s32, item, 0x7c) = 0x1e;
        FIELD(s32, item, 0x80) = 0;
    }

    FIELD(s32, scene, 0x48) = 0;
    func_ov034_021fda34((u8 *)scene + 0x48, 0, 0, 0x299a);
    func_ov034_021fda3c((u8 *)scene + 0x48, 0, 0, 0);
    FIELD(s32, scene, 0xdc) = 0;
    func_ov034_021fda34((u8 *)scene + 0xdc, 0, 0, 0x2ccd);
    func_ov034_021fda3c((u8 *)scene + 0xdc, 0, 0, 0);
    func_ov034_021fda4c((u8 *)scene + 0x170, 0, 0x800, -0x1000,
                        -0x1000, 0x1f, 0x1f, 0x1f);
    func_02059278(gSoundContext, 0xba, 0x7f);
    func_0205974c(gSoundContext, 0x1cd);
    FIELD(s32, scene, 0x1b4) = -1;
    func_ov034_021fdac0(scene, data_ov034_021fe748[0],
                       data_ov034_021fe748[1], 1);
    return scene;
}
