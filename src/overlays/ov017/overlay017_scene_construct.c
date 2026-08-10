#include "tingle/types.h"

/* Overlay 17 scene construction, resource acquisition, object population, and initial graphics setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern void *data_020f4e14;
extern void *data_020f4e18[];
extern void *data_021e9ac0;
extern u8 data_021e9e1c[];
extern const s32 data_ov017_02201414[];
extern const s32 data_ov017_02201548[2];
extern const u32 data_ov017_02201638[];
extern const u8 data_ov017_02201684[];
extern const u8 data_ov017_0220168c[];
extern const u8 data_ov017_02201694[];
extern const u8 data_ov017_0220169c[];
extern const u8 data_ov017_022016a4[];
extern const u8 data_ov017_022016ac[];
extern u8 data_ov017_022016e0[];
extern void *gHeapContext;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern u32 genrand_int32(void);
extern u32 func_02062a50(void *);
extern s32 func_02062b0c(void *);
extern s32 func_0206492c(void *, u16);
extern void func_02064e7c(void *, s32, u16);
extern void func_0206fc20(void *);
extern void func_0206fc38(void *, u16, s32);
extern s32 func_0206fca0(void *, s32);
extern void *func_0206fd30(void *);
extern void func_02071ea4(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void func_020720c0(void *);
extern void func_020720e8(void *, void *, s32, s32, s32);
extern void *func_02073ffc(void *, void *, s32);
extern void *func_020742cc(void *);
extern void func_02075358(void *, s32);
extern void *Graphics3DResourceOwner_Init(void *, s32, s32);
extern void *Graphics3DResourceOwner_CreateManager(void *);
extern void Graphics3DResourceOwner_PrepareResources(void *, void *);
extern void Graphics3DLightSet_Init(void *);
extern void func_02077ae8(void *);
extern void *Graphics3DRenderObject_Init(void *, void *, void *, s32, s32);
extern s32 func_020918f4(void *, s32);
extern void func_02091e28(void *);
extern void func_02092364(void *);
extern void func_020923a4(void *);
extern void func_020926d8(void *);
extern void func_02092754(void *, s32);
extern void func_02092798(void *);
extern void func_02092814(void *, s32);
extern void *func_020953f4(void *, void *);
extern void func_020954f4(void *);
extern void func_02095508(void *);
extern void func_020957bc(void *);
extern void func_020957f0(void *, void *, s32, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_02095940(void *);
extern void func_02094bbc(void *, s32, s32, s32);
extern void func_0205974c(void *, s32);
extern void func_020ae778(void);
extern void func_020ae7b0(void);
extern void *func_ov017_021fce00(void *, s32);
extern void *func_ov017_021fd744(void *);
extern void func_ov017_021fd7f8(void *, s32);
extern void *func_ov017_021fe40c(void *, void *);
extern void *func_ov017_021fe75c(void *, s32, s32);
extern void *func_ov017_021fe9c0(void *);
extern void func_ov017_021fea00(void *, s32, s32, s32);
extern void func_ov017_021fea08(void *, s32, s32, s32);
extern void func_ov017_021fea18(void *, s32, s32, s32, s32, u32, u32, u32);
extern void func_ov017_021fea8c(void *, s32, s32, s32);
extern void func_ov017_021ff150(void *);
extern void func_ov017_021ff58c(void *);
extern void func_ov017_021ff75c(void *);
extern void *func_ov017_021ff8a8(void *, s32, u32, u32, u16);
extern void func_ov017_02200064(void *);
#ifdef __cplusplus
}
#endif

/*
 * Construct the scene from an effect count, an array of effect IDs, a category,
 * and a global radius-table selector. Initialize all embedded controllers and
 * transforms, seed the scene PRNG, configure overlay globals, acquire the main
 * 2D/3D resource sets, and create the two UI objects plus the central resource
 * object. For every caller ID, register its data, update the selected global
 * record, choose a random radial position, spawn an effect, and accumulate its
 * recovered value. Then derive the three five-bit palette components, set up
 * graphics/projection, allocate the sprite pool, progress group, draw object,
 * and 9x9 deformation grid, start sound 0x82, enable display bit 10, and install
 * callback pair data_ov017_02201548. Returns state. Heap, PRNG, resource,
 * graphics, audio, global, and caller-owned scene state all change; setup
 * helpers may access Nintendo DS graphics hardware.
 */
extern "C" void *func_ov017_021feab4(void *state, s32 effectCount,
                                      const s32 *effectIds, s32 category,
                                      s32 radiusIndex)
{
    void *object;
    void *global;
    s32 i;

    func_02091e28(state);
    FIELD(const u32 *, state, 0) = data_ov017_02201638;
    func_02071ea4((u8 *)state + 0x5c);
    func_02071ea4((u8 *)state + 0x68);
    func_02071ea4((u8 *)state + 0x74);
    func_020957bc((u8 *)state + 0x80);
    func_020957bc((u8 *)state + 0x12c);
    func_02092798((u8 *)state + 0x1d8);
    func_020926d8((u8 *)state + 0x1fc);
    func_020720c0((u8 *)state + 0x248);
    func_ov017_021fd744((u8 *)state + 0x264);
    func_ov017_021fd744((u8 *)state + 0x290);
    Graphics3DLightSet_Init((u8 *)state + 0x2d0);
    func_02077ae8((u8 *)state + 0x310);
    func_ov017_021ff150((u8 *)state + 0x3ac);
    func_ov017_021fe9c0((u8 *)state + 0x3d8);
    func_ov017_021fe9c0((u8 *)state + 0x3ec);
    FIELD(s32, state, 0x3fc) = 0;
    func_02092364((u8 *)state + 0x404);
    FIELD(s32, state, 0x50) = 0;
    FIELD(u32, state, 0x3fc) = genrand_int32();

    FIELD(s32, data_ov017_022016e0, 0xc) = radiusIndex;
    FIELD(s32, data_ov017_022016e0, 0) = 0;
    FIELD(s32, data_ov017_022016e0, 8) = 0x708;
    FIELD(s32, state, 0x3d4) = 0;
    FIELD(s32, state, 0x3e8) = 0;
    FIELD(void *, state, 0x400) = 0;
    FIELD(void *, state, 0x440) = 0;
    func_02075358(data_020f4e14, 0);
    func_020923a4((u8 *)state + 0x404);
    func_020ae7b0();
    func_020ae778();

    object = Heap_Alloc(0x624, data_ov017_02201684, 4, gHeapContext);
    if (object != 0)
        object = Graphics3DResourceOwner_Init(object, 1, 1);
    FIELD(void *, state, 0x240) = object;
    FIELD(void *, state, 0x244) = Graphics3DResourceOwner_CreateManager(object);
    func_02092814((u8 *)state + 0x1d8, 0x7006);
    func_02071ee0((u8 *)state + 0x5c, data_020f4e18[0], 0xd, 0xe, 0xf);
    func_02071ee0((u8 *)state + 0x68, data_020f4e18[0], 0x10, 0x11, 0x12);
    func_02071ee0((u8 *)state + 0x74, data_020f4e18[0], 0x13, 0x14, 0x15);
    func_020720e8((u8 *)state + 0x248, data_020f4e18[0],
                  0x601b, 0x601c, 0x601d);
    Graphics3DResourceOwner_PrepareResources(FIELD(void *, state, 0x240), (u8 *)state + 0x248);
    func_02092754((u8 *)state + 0x1fc, 0x8002);
    func_02092754((u8 *)state + 0x1fc, 0x8003);

    FIELD(void *, state, 0x58) = func_020742cc(data_020f4e14);
    object = func_02073ffc(FIELD(void *, state, 0x58), (u8 *)state + 0x5c, 1);
    func_020957f0((u8 *)state + 0x12c, object, 5, 2, 0);
    func_02095820((u8 *)state + 0x12c, 0x50, 0xa0);
    func_02095940((u8 *)state + 0x12c);
    object = func_02073ffc(FIELD(void *, state, 0x58), (u8 *)state + 0x5c, 1);
    func_020957f0((u8 *)state + 0x80, object, 3, 2, 0);
    func_02095820((u8 *)state + 0x80, 0xb0, 0xa0);
    func_02095940((u8 *)state + 0x80);

    object = Heap_Alloc(0xa0, data_ov017_0220168c, 4, gHeapContext);
    if (object != 0) {
        object = func_020953f4(
            object, func_02073ffc(FIELD(void *, state, 0x58),
                                  (u8 *)state + 0x68, 1));
    }
    FIELD(void *, state, 0x260) = object;
    FIELD(u8, FIELD(void *, object, 0x9c), 0x3a) = 2;
    func_020954f4(object);
    func_02094bbc(object, -0x40000, 0x60000, 0);
    func_02095508(object);

    FIELD(s32, state, 0x310) = 1;
    func_ov017_021fea00((u8 *)state + 0x310, 0, 0x1800, 0x1000);
    func_ov017_021fea08((u8 *)state + 0x310, 0, 0, 0);
    func_ov017_021fea18((u8 *)state + 0x2d0, 0,
                        0x1000, -0x1000, -0x1000, 0x1f, 0x1f, 0x1f);
    func_ov017_021fea18((u8 *)state + 0x2d0, 1,
                        0x800, -0x1000, 0, 0x1f, 0x1f, 0x1f);

    func_0206fc20(data_021e9e1c);
    global = data_021e9ac0;
    FIELD(s32, state, 0x3c0) = effectCount;
    FIELD(s32, state, 0x3c4) = category;
    FIELD(s32, state, 0x3c8) = 0;
    FIELD(s32, state, 0x3cc) = 0;
    FIELD(s32, state, 0x3d0) = 0;
    for (i = 0; i < effectCount; i++) {
        u16 effectId = (u16)effectIds[i];
        s32 recordIndex;
        s32 recordValue;
        s32 angle;
        s32 radius;

        func_0206fc38(data_021e9e1c, effectId, 1);
        recordIndex = func_0206492c(global, effectId);
        recordValue = func_02062b0c(
            (u8 *)FIELD(void *, global, 8) + recordIndex * 0x24);
        func_02064e7c(global, recordIndex, (u16)category);
        angle = func_020918f4((u8 *)state + 0x3fc, 0x1000) << 1;
        radius = func_020918f4(
            (u8 *)state + 0x3fc,
            data_ov017_02201414[radiusIndex] - 0xc);
        func_ov017_021ff8a8(
            state, effectId,
            radius * data_020c9670[angle * 2],
            radius * data_020c9670[angle * 2 + 1],
            (u16)recordValue);
        FIELD(s32, state, 0x3c8) += recordValue;
    }

    FIELD(s32, state, 0x3b8) = 0;
    FIELD(s32, state, 0x3bc) = func_0206fca0(data_021e9e1c, category);
    FIELD(void *, state, 0x258) = func_0206fd30(data_021e9e1c);
    if (FIELD(void *, state, 0x258) == 0) {
        FIELD(s32, state, 0x2c4) = 0xc;
        FIELD(s32, state, 0x2c8) = 0x10;
        FIELD(s32, state, 0x2cc) = 8;
    } else {
        u32 color = func_02062a50(
            (u8 *)FIELD(void *, FIELD(void *, state, 0x258), 0) + 4);
        FIELD(s32, state, 0x2c4) = color & 0x1f;
        FIELD(s32, state, 0x2c8) = (color >> 5) & 0x1f;
        FIELD(s32, state, 0x2cc) = (color >> 10) & 0x1f;
    }

    func_ov017_02200064(state);
    func_ov017_021ff58c(state);
    func_ov017_021ff75c(state);
    func_ov017_021fd7f8((u8 *)state + 0x264, 0x5011);
    FIELD(s32, state, 0x278) = 0x400;
    FIELD(s32, state, 0x27c) = 0x400;
    FIELD(s32, state, 0x280) = 0x400;
    func_ov017_021fd7f8((u8 *)state + 0x290, 0x5052);

    object = Heap_Alloc(0x58, data_ov017_02201694, 4, gHeapContext);
    if (object != 0)
        object = func_ov017_021fe40c(object, FIELD(void *, state, 0x240));
    FIELD(void *, state, 0x254) = object;
    object = Heap_Alloc(0x68, data_ov017_0220169c, 4, gHeapContext);
    if (object != 0)
        object = func_ov017_021fe75c(
            object, FIELD(s32, state, 0x3c0), FIELD(s32, state, 0x3c8));
    FIELD(void *, state, 0x25c) = object;
    object = Heap_Alloc(0x10, data_ov017_022016a4, 4, gHeapContext);
    if (object != 0) {
        object = Graphics3DRenderObject_Init(object, data_020f4e18[0],
                               FIELD(void *, state, 0x240), 0x6122, 0x6123);
    }
    FIELD(void *, state, 0x2bc) = object;
    object = Heap_Alloc(0xca8, data_ov017_022016ac, 4, gHeapContext);
    if (object != 0) {
        object = func_ov017_021fce00(
            object, data_ov017_02201414[radiusIndex] + 0xc);
    }
    FIELD(void *, state, 0x2c0) = object;

    func_0205974c(gSoundContext, 0x82);
    FIELD(u32, state, 0x20) |= 0x400;
    func_ov017_021fea8c(state, data_ov017_02201548[0],
                        data_ov017_02201548[1], 0);
    return state;
}
