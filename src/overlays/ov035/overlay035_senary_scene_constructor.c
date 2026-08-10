#include "tingle/types.h"

/* Overlay 35 senary scene construction, model setup, and five-sprite burst. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern const u8 data_ov035_02203bd0[];
extern const u8 data_ov035_02203d48[];
extern const u8 data_ov035_02203d20[];
extern const u8 data_ov035_02202d74[];
extern const u8 data_ov035_02203630[];
extern const u8 data_ov035_02202b98[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov035_021fce00(void *object, void *argument);
extern void func_020720c0(void *state);
extern void func_ov035_021fdce8(void *collection);
extern void func_02091b6c(void *state);
extern void func_02091d08(void *state);
extern void func_020720e8(void *state, void *resourceContext, s32 first,
                         s32 second, s32 third);
extern void Graphics3DResourceOwner_PrepareResources(void *owner, void *resource);
extern void *func_02071adc(void *resourceContext, s32 resourceId);
extern void *Graphics3DResourceOwner_CreateManager(void *owner);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov035_021fcf34(void *object, void *resource, s32 index,
                                s32 entry);
extern void func_02095274(void *collection, void *object);
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void func_020948d4(void *field, s32 value);
extern void func_ov035_021fdd70(void *record, s32 x, s32 y, s32 z);
extern void func_ov035_021fdd78(void *record, s32 x, s32 y, s32 z);
extern void *func_02077308(void *resourceSet, void *resource);
extern void func_ov035_021fdd28(void *record, s32 identifier, s32 value20,
                               s32 value24, s32 value28, u8 value5a,
                               u16 flags);
extern void *func_020955d8(void *allocation, void *spriteRecord);
extern void func_02094cf0(void *object, const void *animation, s32 loop);
extern s32 func_02091a70(s32 first, s32 second, s32 third, s32 fourth);
extern void func_ov035_022016ac(s32 enabled);
extern void func_020b035c(const void *configuration);
extern void func_020b0374(s32 first, s32 second, s32 third, s32 fourth);
extern void func_020b0300(s32 first, s32 second, s32 third, s32 fourth,
                         s32 fifth);
extern void func_02092850(s32 value);
extern void func_02091d24(void *state, s32 first, s32 second, s32 third,
                         s32 fourth);
#ifdef __cplusplus
}
#endif

/* Loads a consecutive three-ID resource group and registers it with owner. */
static void load_group(void *state, s32 finalId, void *resourceOwner)
{
    func_020720e8(state, data_020f4e18[0],
                  finalId - 2, finalId - 1, finalId);
    Graphics3DResourceOwner_PrepareResources(resourceOwner, state);
}

/*
 * Allocates one common sprite from record, attaches it to collection +0x10C,
 * and returns the constructed object. Null allocation results propagate.
 */
static void *allocate_sprite(void *scene, void *record)
{
    void *object = Heap_Alloc(0xa0, data_ov035_02203d20, 4, gHeapContext);
    if (object != 0)
        object = func_020955d8(object, record);
    func_02095274((u8 *)scene + 0x10c, object);
    return object;
}

/*
 * Constructs the senary overlay-35 scene. It initializes resource states
 * +0xDC/+0xE8, collections +0x10C/+0x11C, and timing/controller states
 * +0x12C/+0x148. Variants 0x12E/0x131/0x134 select resource 0x5005 or 0x5006
 * and consecutive +0xCC groups ending at 0x60CB/0x60CE/0x60D1. No fallback
 * initialization exists for unknown variants. Two models are created at
 * +0x104/+0x108, and five configured sprites at +0xD8 plus four anonymous
 * collection entries. The latter receive interpolated byte/color values and
 * animations from 0x50-byte descriptors. It also configures GX state and
 * directly changes registers 0x04000060 and 0x04000358. Returns scene; heap,
 * resource, renderer, controller, display, and hardware state change.
 */
extern "C" void *func_ov035_022016e8(void *scene, void *resourceOwner,
                                      void *baseArgument)
{
    func_ov035_021fce00(scene, baseArgument);
    FIELD(const void *, scene, 0) = data_ov035_02203bd0;
    func_020720c0((u8 *)scene + 0xdc);
    func_020720c0((u8 *)scene + 0xe8);
    func_ov035_021fdce8((u8 *)scene + 0x10c);
    func_ov035_021fdce8((u8 *)scene + 0x11c);
    func_02091b6c((u8 *)scene + 0x12c);
    func_02091d08((u8 *)scene + 0x148);
    load_group((u8 *)scene + 0xdc, 0x6011, resourceOwner);
    load_group((u8 *)scene + 0xe8, 0x6014, resourceOwner);
    FIELD(void *, scene, 0xfc) = func_02071adc(data_020f4e18[0], 0x5004);

    s32 variant = FIELD(s32, scene, 4);
    if (variant == 0x12e) {
        FIELD(void *, scene, 0x100) =
            func_02071adc(data_020f4e18[0], 0x5005);
        func_020720e8((u8 *)scene + 0xcc, data_020f4e18[0],
                      0x60c9, 0x60ca, 0x60cb);
    } else if (variant == 0x131) {
        FIELD(void *, scene, 0x100) =
            func_02071adc(data_020f4e18[0], 0x5005);
        func_020720e8((u8 *)scene + 0xcc, data_020f4e18[0],
                      0x60cc, 0x60cd, 0x60ce);
    } else if (variant == 0x134) {
        FIELD(void *, scene, 0x100) =
            func_02071adc(data_020f4e18[0], 0x5006);
        func_020720e8((u8 *)scene + 0xcc, data_020f4e18[0],
                      0x60cf, 0x60d0, 0x60d1);
    }
    Graphics3DResourceOwner_PrepareResources(resourceOwner, (u8 *)scene + 0xcc);
    FIELD(void *, scene, 0xf4) = Graphics3DResourceOwner_CreateManager(resourceOwner);

    void *model = Heap_Alloc(0xc4, data_ov035_02203d48, 4, gHeapContext);
    if (model != 0)
        model = func_ov035_021fcf34(model, FIELD(void *, scene, 0x100), 0, 1);
    FIELD(void *, scene, 0x104) = model;
    func_02095274((u8 *)scene + 0x11c, model);
    FIELD(s32, model, 0xb8) = 0x8000;
    func_02094bbc(model, 0, 0x800, -0x4000);
    func_020948d4((u8 *)model + 0x6c, 0x800);
    FIELD(u16, model, 0x98) |= 1;

    model = Heap_Alloc(0xc4, data_ov035_02203d48, 4, gHeapContext);
    if (model != 0)
        model = func_ov035_021fcf34(model, FIELD(void *, scene, 0xfc), 3, 9);
    FIELD(void *, scene, 0x108) = model;
    func_02095274((u8 *)scene + 0x11c, model);
    func_02094bbc(model, 0, 0, -0x4000);
    func_020948d4((u8 *)model + 0x6c, 0);
    FIELD(u16, model, 0x98) |= 1;

    func_ov035_021fdd70((u8 *)scene + 0x0c, 0, 0, 0x2980);
    func_ov035_021fdd78((u8 *)scene + 0x0c, 0, 0, 0);
    void *record = func_02077308(FIELD(void *, scene, 0xf4),
                                  (u8 *)scene + 0xcc);
    func_ov035_021fdd28(record, 0, 0, 0, 0, 2, 0x42);
    void *sprite = allocate_sprite(scene, record);
    FIELD(void *, scene, 0xd8) = sprite;
    func_02094cf0(sprite, data_ov035_02202d74, 1);

    for (s32 i = 0; i < 4; ++i) {
        record = func_02077308(FIELD(void *, scene, 0xf4),
                               (u8 *)scene + 0xcc);
        func_ov035_021fdd28(record, 0, 0, 0, 0, (u8)(i + 3), 0x42);
        FIELD(u8, record, 0x5b) = (u8)func_02091a70(0x18, 8, 4, i);
        s32 low = func_02091a70(0x1f, 0, 4, i);
        s32 high = func_02091a70(0x1f, 0x10, 4, i);
        FIELD(u16, record, 0x4e) = (u16)(low | (high << 10));
        sprite = allocate_sprite(scene, record);
        FIELD(s32, sprite, 0x88) = 1;
        func_02094cf0(sprite, data_ov035_02203630 + i * 0x50, 1);
    }

    func_ov035_022016ac(1);
    func_020b035c(data_ov035_02202b98);
    volatile u16 *reg60 = (volatile u16 *)0x04000060;
    *reg60 &= 0xcfef;
    func_020b0374(1, 0, 4, 0x6400);
    *(volatile u32 *)0x04000358 = 0;
    func_020b0300(0, 0x1f, 0x7fff, 0x3f, 0);
    func_02092850(0);
    func_02091d24((u8 *)scene + 0x148, 0, 0, 1, 1);
    FIELD(s32, scene, 0x164) = 0;
    FIELD(s32, scene, 0x160) = 0;
    return scene;
}
