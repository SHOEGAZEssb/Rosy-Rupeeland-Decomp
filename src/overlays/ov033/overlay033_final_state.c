#include "tingle/types.h"

/* Overlay 33 final dialog, actor-action, audio, and completion state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;
extern const u8 data_021f3ecc[];
extern const s16 data_020c9670[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_020791e0(const void *table, s32 id);
extern void func_02092e9c(void *dialog, void *text, s32 mode);
extern s32 func_ov033_021fd418(void *scene);
extern void func_0205929c(void *sound, s32 id, s32 duration);
extern void func_02091b98(void *interpolator, s32 value);
extern void func_020939d8(void *dialog);
extern void func_ov033_021fd4cc(void *scene, s32 delta);
extern void func_020050c8(void *destination, void *source);
extern s32 func_02091c7c(void *interpolator, s32 advance);
extern void func_0205974c(void *sound, s32 id);
extern void func_02059278(void *sound, s32 id, s32 value);
extern void func_02091bac(void *interpolator, s32 mode, s32 start,
                         s32 end, s32 duration);
extern s32 func_02091cf0(void *interpolator);
extern void func_ov033_021fce04(void *group, s32 index);
extern void func_020740c8(void *context, void *sprite, s32 first,
                         s32 second, s32 third);
extern void func_02072b68(void *sprite, s32 animation);
extern void Sound_Play(void *sound, s32 id, s32 parameter);
extern void func_02047d40(void *actor);
extern void func_020597fc(void *sound, s32 id);
extern void func_020740a4(void *spriteContext);
#ifdef __cplusplus
}
#endif

typedef void (*Overlay033ActorMethod)(void *actor, s32 enabled);

/*
 * Runs the final six-state interaction at scene +0xD0. State 0 loads text
 * 0x1FC into the dialog. State 1 polls pad/touch acceptance; while waiting it
 * advances phase motion and snapshots the primary transform, and on acceptance
 * starts audio/dialog close behavior. State 2 waits for an embedded timer,
 * starts looping/ramped audio and two interpolators, then advances. State 3
 * derives horizontal render offset +0x40 from the recovered sine table, waits
 * for the main interpolation to finish, hides group sprites 0/8, reconfigures
 * the primary sprite from its +0x21C record, activates the optional secondary,
 * and starts a 30-frame upward offset. While waiting it periodically retriggers
 * sound 0x1F4. State 4 moves +0x44, keeps the secondary aligned, and on finish
 * clears its 0x40000 flag, restores it through func_02047d40, fades/stops the
 * recovered sounds, and advances. State 5 returns 1; all other calls update the
 * sprite context and return 0. Dialog, audio, animation, actor, and render state
 * change; there is no direct MMIO.
 */
extern "C" s32 func_ov033_021fd9a0(void *scene)
{
    s32 state = FIELD(s32, scene, 0xd0);
    void *group = FIELD(void *, scene, 0x48);

    if (state == 0) {
        void *text = func_020791e0(data_021f3ecc, 0x1fc);
        func_02092e9c(FIELD(void *, scene, 0xc4), text, 2);
        FIELD(s32, scene, 0xd0) = 1;
        state = 1;
    }

    if (state == 1) {
        if (func_ov033_021fd418(scene)) {
            func_0205929c(gSoundContext, 0x68, 0xc);
            func_02091b98((u8 *)scene + 0x84, 0xc);
            func_020939d8(FIELD(void *, scene, 0xc4));
            FIELD(s32, scene, 0xd0) = 2;
        } else {
            func_ov033_021fd4cc(scene, 0x800);
            FIELD(s32, scene, 0x1c) = 0;
            FIELD(s32, scene, 0x18) = 0;
            func_020050c8((u8 *)FIELD(void *, scene, 4) + 0x18,
                          (u8 *)scene + 0x14);
        }
    } else if (state == 2) {
        if (func_02091c7c((u8 *)scene + 0x84, 2) != 0) {
            func_0205974c(gSoundContext, 0x1f4);
            func_02059278(gSoundContext, 0x67, 0x7f);
            func_02091bac((u8 *)scene + 0x84, 1, 0, 0x800, 0x78);
            func_02091b98((u8 *)scene + 0x68, 0x14);
            FIELD(s32, scene, 0xd0) = 3;
        }
    } else if (state == 3) {
        s32 value = func_02091c7c((u8 *)scene + 0x84, 1);
        u32 phase = ((u32)value & 0xff) << 8;
        FIELD(u32, scene, 0x3c) = phase;
        s16 wave = data_020c9670[(phase >> 4) * 2];
        FIELD(s32, scene, 0x40) = (wave << 5) / 0x1000;

        if (func_02091cf0((u8 *)scene + 0x84)) {
            func_ov033_021fce04(group, 0);
            func_ov033_021fce04(group, 8);
            void *primary = FIELD(void *, scene, 4);
            void *sprite = FIELD(void *, primary, 0x54);
            void *record = FIELD(void *, primary, 0x21c);
            func_020740c8(FIELD(void *, sprite, 0), sprite,
                          FIELD(s32, record, 4), FIELD(s32, record, 8),
                          FIELD(s32, record, 0xc));
            func_02072b68(sprite, 9);
            FIELD(u16, sprite, 0x36) = 0x100;
            FIELD(u16, sprite, 0x24) =
                (FIELD(u16, sprite, 0x24) | 2) & (u16)~0x10;
            void *secondary = FIELD(void *, scene, 8);
            if (secondary != 0)
                FIELD(Overlay033ActorMethod, FIELD(void *, secondary, 0),
                      0x54)(secondary, 1);
            func_02091bac((u8 *)scene + 0x84, 5, 0, -0xa0, 0x1e);
            FIELD(s32, scene, 0xd0) = 4;
        } else if (func_02091c7c((u8 *)scene + 0x68, 2) != 0) {
            func_02091b98((u8 *)scene + 0x68, 0x14);
            Sound_Play(gSoundContext, 0x1f4, 0);
        }
    } else if (state == 4) {
        FIELD(s32, scene, 0x44) =
            func_02091c7c((u8 *)scene + 0x84, 1) - 0x18;
        void *secondary = FIELD(void *, scene, 8);
        void *primary = FIELD(void *, scene, 4);
        if (secondary != 0) {
            FIELD(s32, secondary, 0x1c) = FIELD(s32, primary, 0x1c) - 0x18000;
            FIELD(s32, secondary, 0x20) = FIELD(s32, primary, 0x20);
            FIELD(s32, secondary, 0x24) = FIELD(s32, primary, 0x24);
        }
        if (func_02091cf0((u8 *)scene + 0x84)) {
            if (secondary != 0) {
                FIELD(u32, secondary, 0x268) &= ~0x40000u;
                func_02047d40(secondary);
            }
            func_020597fc(gSoundContext, 0x1f4);
            func_0205929c(gSoundContext, 0x67, 0x1e);
            FIELD(s32, scene, 0xd0) = 5;
        }
    } else if (state == 5) {
        return 1;
    }

    func_020740a4(FIELD(void *, scene, 0));
    return 0;
}

/*
 * Empty vtable hook for the overlay-33 sprite group. It accepts an opaque
 * object, changes no state, returns no value, and has no SDK/hardware effects.
 */
extern "C" void func_ov033_021fdcdc(void *object)
{
    (void)object;
}
