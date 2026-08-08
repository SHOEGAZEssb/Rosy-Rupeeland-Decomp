#include "tingle/types.h"

/*
 * Overlay 39 shared scene-graph setup. This recovered routine places the
 * variant-created objects, creates six coordinate-table objects and two center
 * objects, links their parent hierarchy, initializes eight runtime records,
 * selects scene mode four, and starts a sound.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov039_0220807c[6];
extern const s32 data_ov039_02208094[6];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0209a208(void *scene, s32 firstId, s32 secondId,
                           s32 thirdId, void *argument, s32 mode);
extern void func_ov039_021fd7f0(void *scene, void *object, s32 x, s32 y,
                                u32 orientation, u32 enabled);
extern void func_0209a2a4(void *child, void *parent);
extern void func_ov039_021ff330(void *scene, s32 mode);
extern void Sound_Play(void *context, s32 soundId, s32 parameter);
#ifdef __cplusplus
}
#endif

/*
 * Place +0x6C at (0x24000,0x28000) and +0x70 at (-0x25000,0x2B000), marking
 * the first object's +0x42 halfword with 0x40. Create +0x98 from resource
 * triplet 0x1271..0x1273 and place it at (0,-0x9000), orientation 3; create
 * +0x9C from 0x13BD..0x13BF and place it at (0x9000,-0xC000), orientation 1.
 * Create six mode-one 0x1274..0x1276 objects at +0x80..+0x94 using the two
 * six-entry coordinate tables shifted by 12; all use orientation 4 and odd
 * entries receive halfword flag 0x40 at +0x42.
 *
 * Link +0x74..+0x7C to the scene; link all ten contiguous +0x4C..+0x70 slots
 * plus +0x98/+0x9C to +0x74; link each coordinate-table pair to successive
 * +0x74 parents. Confirmed child +0x44 values become -1 for +0x4C..+0x98,
 * -3 for +0x9C, and 1 for +0x80..+0x94; +0x9C also receives +0x42=4.
 * Initialize eight address-derived records with value 0x65 and zeroed companion
 * words, select mode four, and play sound 0x63 with parameter 8. Inputs are
 * scene and opaque loader argument. Returns no value; scene graph, resource,
 * runtime-record, mode, and sound state change.
 */
extern "C" void func_ov039_021fd438(void *scene, void *argument)
{
    func_ov039_021fd7f0(scene, FIELD(void *, scene, 0x6c),
                        0x24000, 0x28000, 0, 1);
    FIELD(u16, FIELD(void *, scene, 0x6c), 0x42) = 0x40;
    func_ov039_021fd7f0(scene, FIELD(void *, scene, 0x70),
                        -0x25000, 0x2b000, 0, 1);

    void *object = func_0209a208(scene, 0x1271, 0x1272, 0x1273,
                                 argument, 2);
    FIELD(void *, scene, 0x98) = object;
    func_ov039_021fd7f0(scene, object, 0, -0x9000, 3, 1);
    object = func_0209a208(scene, 0x13bd, 0x13be, 0x13bf, argument, 2);
    FIELD(void *, scene, 0x9c) = object;
    func_ov039_021fd7f0(scene, object, 0x9000, -0xc000, 1, 1);

    for (s32 i = 0; i < 6; i++) {
        object = func_0209a208(scene, 0x1274, 0x1275, 0x1276, argument, 1);
        FIELD(void *, scene, 0x80 + i * 4) = object;
        func_ov039_021fd7f0(scene, object,
                            data_ov039_0220807c[i] << 12,
                            data_ov039_02208094[i] << 12, 4, 1);
        if (i & 1) {
            FIELD(u16, object, 0x42) = 0x40;
        }
    }

    for (s32 i = 2; i >= 0; i--) {
        func_0209a2a4(FIELD(void *, scene, 0x74 + i * 4), scene);
    }
    for (s32 i = 9; i >= 0; i--) {
        object = FIELD(void *, scene, 0x4c + i * 4);
        func_0209a2a4(object, FIELD(void *, scene, 0x74));
        FIELD(s32, object, 0x44) = -1;
    }
    object = FIELD(void *, scene, 0x98);
    func_0209a2a4(object, FIELD(void *, scene, 0x74));
    FIELD(s32, object, 0x44) = -1;
    object = FIELD(void *, scene, 0x9c);
    func_0209a2a4(object, FIELD(void *, scene, 0x74));
    FIELD(s32, object, 0x44) = -3;
    FIELD(u16, object, 0x42) = 4;

    for (s32 i = 5; i >= 0; i--) {
        object = FIELD(void *, scene, 0x80 + i * 4);
        func_0209a2a4(object, FIELD(void *, scene, 0x74 + (i / 2) * 4));
        FIELD(s32, object, 0x44) = 1;
    }
    for (s32 i = 0; i < 8; i++) {
        FIELD(u32, scene, 0x1cc8 + i * 4) = 0x65;
        FIELD(u32, scene, 0x1cf0 + i * 4) = 0;
        FIELD(u32, scene, 0x1d20 + i * 12) = 0;
        FIELD(u32, scene, 0x1d1c + i * 12) = 0;
    }
    func_ov039_021ff330(scene, 4);
    Sound_Play(gSoundContext, 0x63, 8);
}
