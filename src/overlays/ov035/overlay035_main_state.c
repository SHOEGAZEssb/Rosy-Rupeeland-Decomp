#include "tingle/types.h"

/* Overlay 35 seven-stage main animation and particle-spawn state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02059278(void *sound, s32 id, s32 value);
extern void func_0205929c(void *sound, s32 id, s32 value);
extern void Sound_Play(void *sound, s32 id, s32 parameter);
extern void func_02091b98(void *state, s32 value);
extern s32 func_02091c7c(void *state, s32 mode);
extern s32 func_02091bd0(void *state, s32 first, s32 second, s32 maximum);
extern void func_ov035_021fe20c(void *scene, s32 direction);
extern void func_02091dac(void *state);
extern void func_020956fc(void *object);
extern void PresentationScalar_TransitionBy(void *field, s32 mode, s32 value);
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern s32 func_ov035_021fd25c(void *object);
extern void PresentationList_UpdateAndDeleteCompleted(void *collection);
extern void GraphicsAnimationInstanceManager_Update(void *resourceSet);
#ifdef __cplusplus
}
#endif

/*
 * Runs the scene's seven-stage main sequence in state +0xA0. It sequences
 * animation state +0xA4 through durations 0x6E, 0xB4, and 0x96; updates sprite
 * flags +0x52 through 0x40/0x80/0x100/0x200; periodically spawns animated
 * objects using direction +0x138; fades the +0xD8 sprite; and finally launches
 * the +0x104/+0x108 objects with 40-frame timers. Sound ID 0xB4 brackets the
 * sequence and ID 0x1B4 marks launch. Every call updates collection +0x10C and
 * resource set +0x100. Returns one only in terminal stage 6, otherwise zero.
 * Engine, sound, heap/collection, sprite, and animation state may change.
 */
extern "C" s32 func_ov035_021fe2f8(void *scene)
{
    switch (FIELD(s32, scene, 0xa0)) {
    case 0:
        func_02059278(gSoundContext, 0xb4, 0x7f);
        func_02091b98((u8 *)scene + 0xa4, 0x6e);
        FIELD(u16, FIELD(void *, FIELD(void *, scene, 0x108), 0x9c),
              0x52) = 0x40;
        FIELD(s32, scene, 0xa0)++;
        /* The recovered switch deliberately falls through into stage 1. */
    case 1:
        if (func_02091c7c((u8 *)scene + 0xa4, 2)) {
            func_02091b98((u8 *)scene + 0xa4, 0x6e);
            FIELD(u16, FIELD(void *, FIELD(void *, scene, 0x108), 0x9c),
                  0x52) = 0x80;
            FIELD(s32, scene, 0xa0)++;
            break;
        }
        if (func_02091c7c((u8 *)scene + 0x11c, 2)) {
            func_ov035_021fe20c(scene, FIELD(s32, scene, 0x138));
            func_02091dac((u8 *)scene + 0x138);
            func_02091b98((u8 *)scene + 0x11c, 4);
        }
        break;
    case 2:
        if (func_02091c7c((u8 *)scene + 0xa4, 2)) {
            func_02091b98((u8 *)scene + 0xa4, 0xb4);
            FIELD(u16, FIELD(void *, FIELD(void *, scene, 0x108), 0x9c),
                  0x52) = 0x100;
            func_020956fc(FIELD(void *, scene, 0xd8));
            FIELD(s32, scene, 0xa0)++;
            break;
        }
        if (func_02091c7c((u8 *)scene + 0x11c, 2)) {
            func_ov035_021fe20c(scene, FIELD(s32, scene, 0x138));
            func_02091dac((u8 *)scene + 0x138);
            func_02091b98((u8 *)scene + 0x11c, 2);
        }
        break;
    case 3:
        if (func_02091c7c((u8 *)scene + 0xa4, 2)) {
            func_02091b98((u8 *)scene + 0xa4, 0x96);
            FIELD(u16, FIELD(void *, FIELD(void *, scene, 0x108), 0x9c),
                  0x52) = 0x200;
            FIELD(s32, scene, 0xa0)++;
            break;
        }
        FIELD(u8, FIELD(void *, FIELD(void *, scene, 0xd8), 0x9c), 0x5b) =
            (u8)func_02091bd0((u8 *)scene + 0xa4, 1, 1, 0x1f);
        func_ov035_021fe20c(scene, FIELD(s32, scene, 0x138));
        func_02091dac((u8 *)scene + 0x138);
        break;
    case 4: {
        if (func_02091c7c((u8 *)scene + 0xa4, 2)) {
            Sound_Play(gSoundContext, 0x1b4, 0);
            void *right = FIELD(void *, scene, 0x108);
            PresentationScalar_TransitionBy((u8 *)right + 0x1c, 5, -0xc00);
            FIELD(s32, right, 0x7c) = 0x28;
            FIELD(s32, right, 0x80) = 0;
            void *left = FIELD(void *, scene, 0x104);
            PresentationScalar_TransitionTo((u8 *)left + 0x1c, 5, -0xe00);
            FIELD(s32, left, 0x7c) = 0x28;
            FIELD(s32, left, 0x80) = 0;
            FIELD(s32, scene, 0xa0)++;
        }
        break;
    }
    case 5:
        if (func_ov035_021fd25c(FIELD(void *, scene, 0x108))) {
            func_0205929c(gSoundContext, 0xb4, 0x10);
            FIELD(s32, scene, 0xa0)++;
        }
        break;
    case 6:
        PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x10c);
        GraphicsAnimationInstanceManager_Update(FIELD(void *, scene, 0x100));
        return 1;
    }
    PresentationList_UpdateAndDeleteCompleted((u8 *)scene + 0x10c);
    GraphicsAnimationInstanceManager_Update(FIELD(void *, scene, 0x100));
    return 0;
}
