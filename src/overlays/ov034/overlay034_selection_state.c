#include "tingle/types.h"

/* Overlay 34 touch-driven selection state machine and terminal helper hooks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gTouchPanelManager;
extern void *gSoundContext;
extern const s32 data_ov034_021fe704[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_Play(void *sound, s32 id, s32 parameter);
extern void func_ov034_021fd9c0(void *owner);
extern void func_ov034_021fe668(void *scene);
extern s32 func_ov034_021fd9e8(void *owner);
extern s32 func_ov034_021fe2c4(void *object);
extern s32 func_ov034_021fd3f4(void *state, s32 input);
extern s32 func_ov034_021fda00(void *owner, s32 index);
extern void func_0205929c(void *sound, s32 id, s32 duration);
extern void func_02059278(void *sound, s32 id, s32 value);
extern s32 func_02094d28(void *object, s32 mode, s32 start, s32 end);
extern void func_ov034_021fdf98(void *scene);
extern void func_ov034_021fd978(void *owner);
extern u32 genrand_int32(void);
extern s32 func_020bf1f8(u32 value, s32 divisor);
extern void func_ov034_021fce00(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Runs the eleven-stage touch-driven selection sequence at +0x1B8. It starts
 * sound 0x1CD and all owner sectors, chooses one of ten table values randomly,
 * then cycles through the three sector states. Each stage waits for the relevant
 * sector/timer and, where required, a fresh touch (touch manager +0x44 == 1 and
 * +0x3C != 1), plays the recovered sound variants, dispatches the randomized
 * choice through func_ov034_021fd3f4, and seeds owner highlight/timer fields.
 * The final two stages animate owner +0xC4, wait 120 frames and a fresh touch,
 * then return -1. Other calls tick all virtual objects plus owner sector/timer
 * state and return 0. Audio, selection, animation, and touch-driven state may
 * change; no direct MMIO occurs.
 */
extern "C" s32 func_ov034_021fe2dc(void *scene)
{
    void *touch = gTouchPanelManager;
    s32 freshTouch = FIELD(u16, touch, 0x44) == 1 &&
                     FIELD(u16, touch, 0x3c) != 1;
    void *owner = FIELD(void *, scene, 0);
    s32 state = FIELD(s32, scene, 0x1b8);

    if (state == 0) {
        FIELD(s32, scene, 0x1b8) = 1;
        state = 1;
    }
    if (state == 1) {
        Sound_Play(gSoundContext, 0x1cd, 4);
        func_ov034_021fd9c0(owner);
        func_ov034_021fe668(scene);
        FIELD(s32, scene, 0x1b8) = 2;
    } else if (state == 2) {
        if (!func_ov034_021fd9e8(owner)) {
            FIELD(s32, owner, 0x7c) = 0x1e;
            FIELD(s32, owner, 0x80) = 0;
            FIELD(s32, scene, 0x1b8) = 3;
        }
    } else if (state == 3) {
        if (func_ov034_021fe2c4(owner) && freshTouch) {
            Sound_Play(gSoundContext, 0x1cd, 0);
            func_ov034_021fd3f4(FIELD(void *, owner, 0xa0),
                                FIELD(s32, scene, 0x1b4));
            FIELD(s32, scene, 0x1b8) = 4;
        }
    } else if (state == 4) {
        if (func_ov034_021fda00(owner, 0)) {
            FIELD(s32, owner, 0xc4) = 0x10;
            FIELD(s32, owner, 0x7c) = 0x1e;
            FIELD(s32, owner, 0x80) = 0;
            Sound_Play(gSoundContext, 0x1cd, 3);
            Sound_Play(gSoundContext, 0x1cd, 1);
            FIELD(s32, scene, 0x1b8) = 5;
        }
    } else if (state == 5) {
        if (func_ov034_021fe2c4(owner) && freshTouch) {
            Sound_Play(gSoundContext, 0x1cd, 0);
            func_ov034_021fd3f4(FIELD(void *, owner, 0xa4),
                                FIELD(s32, scene, 0x1b4));
            FIELD(s32, scene, 0x1b8) = 6;
        }
    } else if (state == 6) {
        if (func_ov034_021fda00(owner, 1)) {
            FIELD(s32, owner, 0xc4) = 0x10;
            FIELD(s32, owner, 0x7c) = 0xb4;
            FIELD(s32, owner, 0x80) = 0;
            Sound_Play(gSoundContext, 0x1cd, 3);
            Sound_Play(gSoundContext, 0x1cd, 2);
            FIELD(s32, scene, 0x1b8) = 7;
        }
    } else if (state == 7) {
        if (func_ov034_021fe2c4(owner) && freshTouch) {
            Sound_Play(gSoundContext, 0x1cd, 0);
            func_ov034_021fd3f4(FIELD(void *, owner, 0xa8),
                                FIELD(s32, scene, 0x1b4));
            FIELD(s32, scene, 0x1b8) = 8;
        }
    } else if (state == 8) {
        if (func_ov034_021fda00(owner, 2)) {
            FIELD(s32, owner, 0x7c) = 0x1e;
            FIELD(s32, owner, 0x80) = 0;
            func_0205929c(gSoundContext, 0xba, 0x1e);
            Sound_Play(gSoundContext, 0x1cd, 3);
            if (FIELD(s32, scene, 0x1b4) < 2)
                func_02059278(gSoundContext, 0xbb, 0x7f);
            FIELD(s32, scene, 0x1b8) = 9;
        }
    } else if (state == 9) {
        FIELD(s32, owner, 0xc4) = func_02094d28(owner, 3, 0, 0x1f);
        if (func_ov034_021fe2c4(owner)) {
            FIELD(s32, owner, 0x7c) = 0x78;
            FIELD(s32, owner, 0x80) = 0;
            FIELD(s32, scene, 0x1b8) = 10;
        }
    } else if (state == 10 && func_ov034_021fe2c4(owner) && freshTouch) {
        return -1;
    }

    func_ov034_021fdf98(scene);
    func_ov034_021fd978(owner);
    return 0;
}

/* Chooses one of ten recovered table entries uniformly using the game PRNG. */
extern "C" void func_ov034_021fe668(void *scene)
{
    s32 choices[10];
    for (s32 i = 0; i < 10; ++i)
        choices[i] = data_ov034_021fe704[i];
    s32 index = func_020bf1f8(genrand_int32(), 10);
    FIELD(s32, scene, 0x1b4) = choices[index];
}

/* Maps choice 0 to 1, choice 1 to 0, and every other value to -1. */
extern "C" s32 func_ov034_021fe6bc(void *scene)
{
    s32 choice = FIELD(s32, scene, 0x1b4);
    if (choice == 0) return 1;
    if (choice == 1) return 0;
    return -1;
}

/* Empty overlay-34 vtable hook; changes no state and returns no value. */
extern "C" void func_ov034_021fe6ec(void *object)
{
    (void)object;
}

/* Non-deleting base wrapper: invokes the base hook and returns `object`. */
extern "C" void *func_ov034_021fe6f0(void *object)
{
    func_ov034_021fce00(object);
    return object;
}
