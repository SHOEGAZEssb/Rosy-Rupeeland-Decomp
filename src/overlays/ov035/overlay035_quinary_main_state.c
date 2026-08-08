#include "tingle/types.h"

/* Overlay 35 quinary scene's five-stage effect state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;
extern const u8 data_ov035_022030a0[];
extern const u8 data_ov035_02202c34[];
extern const u8 data_ov035_02202c6c[];
extern const u8 data_ov035_02202e0c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02059278(void *soundContext, s32 id, s32 value);
extern void func_0205929c(void *soundContext, s32 id, s32 value);
extern void func_02094cf0(void *object, const void *animation, s32 loop);
extern s32 func_ov035_021fd25c(void *object);
extern s32 func_02091c7c(void *state, s32 value);
extern s32 func_ov035_022011a8(void *scene);
extern s32 func_02095224(void *object);
extern void func_ov035_022012ac(void *scene);
extern void func_ov035_02201000(void *scene);
#ifdef __cplusplus
}
#endif

/*
 * Advances the five-stage quinary effect selected by state +0xA0. Stage 0
 * starts sound 0xB8 and four looping sprite animations, then falls through.
 * Stage 1 waits for sprite +0xFC and reduces particle count +0x16C to three.
 * Stage 2 waits for duration state +0x138; while waiting it requests/creates
 * geometry for sprite +0x104, and on completion starts the one-shot helper.
 * Stage 3 waits for the new duration and lowers sound 0xB8 to 0x10. Every call
 * runs func_ov035_02201000. Returns 1 only at terminal stage 4, otherwise 0;
 * sound, animation, primitive, particle, and scene state may change.
 */
extern "C" s32 func_ov035_02201360(void *scene)
{
    switch (FIELD(s32, scene, 0xa0)) {
    case 0:
        func_02059278(gSoundContext, 0xb8, 0x7f);
        func_02094cf0(FIELD(void *, scene, 0xfc),
                      data_ov035_022030a0, 1);
        func_02094cf0(FIELD(void *, scene, 0x100),
                      data_ov035_02202c34, 1);
        func_02094cf0(FIELD(void *, scene, 0x104),
                      data_ov035_02202c6c, 1);
        func_02094cf0(FIELD(void *, scene, 0xd8),
                      data_ov035_02202e0c, 1);
        ++FIELD(s32, scene, 0xa0);
        /* Fall through to poll the primary sprite immediately. */
    case 1:
        if (func_ov035_021fd25c(FIELD(void *, scene, 0xfc)) != 0) {
            FIELD(s32, scene, 0x16c) = 3;
            ++FIELD(s32, scene, 0xa0);
        }
        break;
    case 2:
        if (func_02091c7c((u8 *)scene + 0x138, 2) != 0) {
            if (func_ov035_022011a8(scene) != 0)
                ++FIELD(s32, scene, 0xa0);
        } else {
            FIELD(s32, scene, 0x174) = 1;
            if (func_02095224(FIELD(void *, scene, 0x104)) == 0)
                func_ov035_022012ac(scene);
        }
        break;
    case 3:
        if (func_02091c7c((u8 *)scene + 0x138, 2) != 0) {
            func_0205929c(gSoundContext, 0xb8, 0x10);
            ++FIELD(s32, scene, 0xa0);
        }
        break;
    case 4:
        func_ov035_02201000(scene);
        return 1;
    }

    func_ov035_02201000(scene);
    return 0;
}
