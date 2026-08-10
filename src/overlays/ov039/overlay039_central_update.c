#include "tingle/types.h"

/*
 * Overlay 39 central scripted update. This recovered routine interprets one of
 * six compact event scripts, advances projectile/formation behavior, and runs
 * a second visual-effect offset sequencer tied to the owning gameplay state.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay039Vector {
    u32 field_00;
    s32 x_04;
    s32 y_08;
    s32 z_0c;
} Overlay039Vector;

extern const u8 data_ov039_02207fee[10];
extern const u8 data_ov039_02207ff8[11];
extern const u8 data_ov039_02208003[11];
extern const u8 data_ov039_02208040[16];
extern const u8 data_ov039_02208050[19];
extern const u8 data_ov039_02208063[22];
extern void *gGameWork;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GameWork_TestFlag(void *gameWork, u32 flag);
extern void func_ov039_021fdb9c(void *scene);
extern void func_ov039_021ff330(void *scene, s32 mode);
extern void func_ov039_021fd93c(void *scene, s32 targetX, s32 targetY,
                                s32 angleOffset);
extern void GraphicsSpriteState_SetAnimationIndex(void *renderObject, u8 orientation);
extern void Sound_Play(void *context, s32 soundId, s32 parameter);
extern void func_0205940c(void *context, s32 soundId, s32 parameter);
extern void func_02005030(Overlay039Vector *destination, void *source);
extern void func_02004fe0(void *object);
extern void func_020050a4(void *destination, const void *source);
extern void func_02005058(void *object);
extern void func_020050c8(void *destination, const void *source);
extern void func_ov069_0220fe2c(void *system, const void *position);
extern void func_ov069_0220fe3c(void *system, const void *first,
                                const void *second);
extern void func_ov049_0220c6cc(void *system, const void *position, u16 angle);
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

/* Return the script selected by variant +0x1CB2 and count bucket +0x1CA8/10. */
static const u8 *selectEventScript(void *scene)
{
    s32 bucket = FIELD(s16, scene, 0x1ca8) / 10;
    if (FIELD(u16, scene, 0x1cb2) == 0) {
        if (bucket == 1) return data_ov039_02208003;
        if (bucket == 2) return data_ov039_02207ff8;
        return data_ov039_02207fee;
    }
    if (bucket == 1) return data_ov039_02208063;
    if (bucket == 2) return data_ov039_02208050;
    return data_ov039_02208040;
}

/* Play the scene's shared sound ID 0x63 with the supplied parameter. */
static void playSceneSound(s32 parameter)
{
    Sound_Play(gSoundContext, 0x63, parameter);
}

/* Launch one helper and play the repeated launch sound. */
static void launchAndSound(void *scene, s32 x, s32 y, s32 angle)
{
    func_ov039_021fd93c(scene, x, y, angle);
    playSceneSound(0x0b);
}

/*
 * Advance the +0x1CB8 projectile pattern state. State 0 resets counters; state
 * 6 delays 91 ticks before state 1; state 1 optionally re-enables +0x9C and
 * transitions to state 2; state 2 delays 21 ticks; state 3 emits one of the
 * patterns selected by +0x1CBA; states 4/5 are 31-tick return delays.
 */
static void updateProjectilePattern(void *scene, s32 enableSpecial)
{
    u16 &state = FIELD(u16, scene, 0x1cb8);
    u16 &timer = FIELD(u16, scene, 0x1cb6);
    u16 &pattern = FIELD(u16, scene, 0x1cba);
    u16 &patternTimer = FIELD(u16, scene, 0x1cbc);
    void *object98 = FIELD(void *, scene, 0x98);

    switch (state) {
    case 0:
        timer = 0;
        patternTimer = 0;
        return;
    case 6:
        if (++timer > 0x5a) {
            state = 1; timer = 0; pattern = 10;
        }
        return;
    case 1:
        if (enableSpecial) {
            void *object9c = FIELD(void *, scene, 0x9c);
            FIELD(u16, object9c, 0x42) &= (u16)~4;
            GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object9c, 0x0c), 1);
            FIELD(s32, scene, 0x1ca4) = 0x5a;
        }
        state++;
        timer = 0;
        if (pattern != 0) {
            GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object98, 0x0c), 9);
            FIELD(u16, FIELD(void *, object98, 0x0c), 0x24) |= 2;
            playSceneSound(0x0d);
        }
        return;
    case 2:
        if (++timer > 0x14) {
            state++; timer = 0; patternTimer = 0;
            if (pattern != 0) playSceneSound(7);
        }
        return;
    case 4:
        if (++timer > 0x1e) { timer = 0; state = 1; }
        return;
    case 5:
        if (++timer > 0x1e) { timer = 0; state = 0; }
        return;
    case 3:
        break;
    default:
        return;
    }

    Overlay039Vector target;
    void *owner = FIELD(void *, scene, 0x48);
    void *ownerChild = FIELD(void *, FIELD(void *, owner, 8), 0x48);
    func_02005030(&target, (u8 *)ownerChild + 0x2c);
    s32 targetX = target.x_04;
    s32 targetY = target.y_08 - target.z_0c - 0x10000;

    switch (pattern) {
    case 0:
        if (++patternTimer > 15) patternTimer = 0;
        break;
    case 1:
        if ((patternTimer % 15) == 0) {
            const s32 angles[5] = {-0x11f8, -0x8fc, 0, 0x8fc, 0x11f8};
            for (s32 i = 0; i < 5; i++)
                func_ov039_021fd93c(scene, targetX, targetY, angles[i]);
            playSceneSound(0x0b);
        }
        if (++patternTimer > 60) patternTimer = 0;
        break;
    case 2:
        if ((patternTimer % 20) == 0) {
            s32 angle = (s32)(genrand_int32() % 1000) - 500;
            launchAndSound(scene, targetX, targetY, angle);
        }
        if (++patternTimer > 40) patternTimer = 0;
        break;
    case 3:
        if ((patternTimer % 10) == 0)
            launchAndSound(scene, 0, 0, patternTimer * 0x19a);
        if (++patternTimer > 0x104) patternTimer = 0;
        break;
    case 4:
        if ((patternTimer % 18) == 0) {
            if (((patternTimer / 18) & 1) == 0) {
                launchAndSound(scene, targetX, targetY, 0);
            } else {
                func_ov039_021fd93c(scene, targetX, targetY, -0xdac);
                launchAndSound(scene, targetX, targetY, 0xdac);
            }
        }
        if (++patternTimer > 100) patternTimer = 0;
        break;
    case 5: {
        s32 remainder = patternTimer % 40;
        if (remainder == 0 || remainder == 20) {
            s32 first = remainder == 0 ? 0 : 0x2000;
            for (s32 i = 0; i < 4; i++)
                func_ov039_021fd93c(scene, 0, 0, first + i * 0x4000);
            playSceneSound(0x0b);
        }
        if (++patternTimer > 0x104) patternTimer = 0;
        break;
    }
    case 10:
        if (++patternTimer > 0x5a) patternTimer = 0;
        break;
    default:
        break;
    }
    func_02005058(&target);
    if (patternTimer == 0) {
        timer = 0;
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object98, 0x0c), 3);
        func_0205940c(gSoundContext, 0x63, 7);
        if (pattern == 10) {
            state = 4;
            timer = 0;
        } else {
            state = 5;
        }
    }
}

/* Advance the independent +0x1D9C visual-effect/offset sequencer. */
static void updateEffectSequence(void *scene)
{
    u16 &state = FIELD(u16, scene, 0x1d9c);
    s32 &offset = FIELD(s32, scene, 0x448);
    s32 &counter = FIELD(s32, scene, 0x44c);
    s32 ownerStatus = FIELD(s32, FIELD(void *, scene, 0x48), 0x74);
    void *anchor = FIELD(void *, scene, 0x74);

    switch (state) {
    case 0:
        offset = 0; counter = 0;
        if (ownerStatus > 0) state = 14;
        break;
    case 1: case 3: case 8: case 10: {
        Overlay039Vector position;
        func_02004fe0(&position);
        func_020050a4(&position, (u8 *)anchor + 0x1c);
        position.y_08 += 0x46000;
        func_ov069_0220fe2c((u8 *)scene + 0x118, &position);
        func_02005058(&position);
        offset += 0xcd;
        if (offset > 0x1000) state++;
        break;
    }
    case 2: case 4: case 9: case 11:
        offset -= 0xcd;
        if (offset < -0xb33) state++;
        break;
    case 5: {
        void *ownerChild = FIELD(void *, FIELD(void *, scene, 0x48), 8);
        func_ov069_0220fe3c((u8 *)scene + 0x118, (u8 *)anchor + 0x1c,
                            (u8 *)FIELD(void *, ownerChild, 0x48) + 0x2c);
        counter = 0;
        func_0205940c(gSoundContext, 0x63, 8);
        state++;
        break;
    }
    case 6: {
        void *ownerChild = FIELD(void *, FIELD(void *, scene, 0x48), 8);
        func_ov069_0220fe3c((u8 *)scene + 0x118, (u8 *)anchor + 0x1c,
                            (u8 *)FIELD(void *, ownerChild, 0x48) + 0x2c);
        func_020050c8((u8 *)scene + 0x428, (u8 *)scene + 0x438);
        offset += 0x333;
        if (offset > 0x1000) offset = 0x1000;
        if (++counter > 24) state++;
        break;
    }
    case 7:
        offset -= 0x118;
        if (offset < 0) {
            offset = 0;
            playSceneSound(8);
            state = 0;
        }
        break;
    case 12: {
        Overlay039Vector position;
        func_02004fe0(&position);
        func_020050a4(&position, (u8 *)anchor + 0x1c);
        position.y_08 += 0x39000;
        func_ov049_0220c6cc((u8 *)scene + 0x454, &position, 0x4000);
        position.x_04 += 0x19000;
        func_ov049_0220c6cc((u8 *)scene + 0x454, &position, 0);
        position.x_04 -= 0x32000;
        func_ov049_0220c6cc((u8 *)scene + 0x454, &position, 0x8000);
        playSceneSound(9);
        func_02005058(&position);
        state++;
        break;
    }
    case 13:
        offset += 0x148;
        if (offset > 0) { offset = 0; state = 0; }
        break;
    case 14: {
        Overlay039Vector position;
        func_02004fe0(&position);
        func_020050a4(&position, (u8 *)anchor + 0x1c);
        position.y_08 += 0x46000;
        func_ov069_0220fe2c((u8 *)scene + 0x118, &position);
        if (ownerStatus == 0) state = 0;
        func_02005058(&position);
        offset += 0xa4;
        if (offset > 0xe66) state++;
        break;
    }
    case 15:
        offset -= 0xa4;
        if (offset < -0x333) {
            if (++counter < 3) state--;
            else { state++; counter = 0; }
        }
        break;
    case 16:
        offset -= 0x333;
        if (offset < -0x1333) {
            offset = -0x1333 >> 1;
            if (++counter > 12) { state++; counter = 0; }
        }
        break;
    case 17:
        state = ownerStatus != 0 ? 14 : 0;
        break;
    }
}

/*
 * Select and interpret one compact script when the owner status permits it;
 * script bits start formation motion, schedule projectile patterns, or start
 * effect states 1/8, with 0xFF wrapping the script index. Maintain the desired
 * formation velocity, delayed +0x9C render flag, projectile pattern state, and
 * independent visual-effect sequence described by the two static helpers.
 * Input is scene; returns no value. Scene offsets +0x448/+0x44C and
 * +0x1C94..+0x1D9C, helper/projectile state, render flags, temporary SDK
 * objects, gameplay-flag queries, random state, sound, and effect systems may
 * change. Script contents remain address-derived data rather than inferred
 * event names.
 */
extern "C" void func_ov039_021fe05c(void *scene)
{
    const u8 *script = selectEventScript(scene);
    s32 ownerStatus = FIELD(s32, FIELD(void *, scene, 0x48), 0x74);
    s32 enableSpecial = 0;
    if (ownerStatus > 0) {
        if (ownerStatus == 7) {
            if (FIELD(u16, scene, 0x1cb8) == 0) {
                FIELD(u16, scene, 0x1cb8) = 6;
                FIELD(u16, scene, 0x1cba) = 10;
                FIELD(u16, scene, 0x1cb6) = 0;
            }
            if (!GameWork_TestFlag(gGameWork, 0x14d) &&
                !GameWork_TestFlag(gGameWork, 0x354)) {
                enableSpecial = 1;
            }
        } else if (ownerStatus == 8 || ownerStatus == 9) {
            FIELD(u16, scene, 0x1cb8) = 0;
            FIELD(u16, scene, 0x1cba) = 0;
            FIELD(u16, scene, 0x1cb6) = 0;
            FIELD(s32, scene, 0x448) = 0;
            FIELD(s32, scene, 0x44c) = 0;
            FIELD(u16, scene, 0x1d9c) = 0;
            void *renderObject = FIELD(void *, FIELD(void *, scene, 0x98), 0x0c);
            if (FIELD(u8, renderObject, 0x38) != 3)
                GraphicsSpriteState_SetAnimationIndex(renderObject, 3);
        }
    } else if (FIELD(u16, scene, 0x1cc0) == 0 &&
               FIELD(u16, scene, 0x1cb8) == 0 &&
               FIELD(u16, scene, 0x1d9c) == 0) {
        u8 event = script[FIELD(u16, scene, 0x1cb4)];
        if (event & 1) {
            FIELD(u16, scene, 0x1cc0) = 1;
            func_ov039_021ff330(scene, 5);
            FIELD(s32, scene, 0x1cc4) = 0x2000;
        }
        if (event & 2) {
            FIELD(u16, scene, 0x1cb8) = 4;
            FIELD(u16, scene, 0x1cb6) = 30;
            FIELD(u16, scene, 0x1cba) = event >> 4;
        }
        if (event & 4) FIELD(u16, scene, 0x1d9c) = 1;
        if (event & 8) FIELD(u16, scene, 0x1d9c) = 8;
        FIELD(u16, scene, 0x1cb4)++;
        if (script[FIELD(u16, scene, 0x1cb4)] == 0xff)
            FIELD(u16, scene, 0x1cb4) = 0;
    }

    func_ov039_021fdb9c(scene);
    if (FIELD(s32, scene, 0x1ca4) > 0 &&
        --FIELD(s32, scene, 0x1ca4) == 0) {
        FIELD(u16, FIELD(void *, scene, 0x9c), 0x42) |= 4;
    }
    updateProjectilePattern(scene, enableSpecial);
    updateEffectSequence(scene);
}
