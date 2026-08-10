#include "tingle/types.h"

/*
 * Overlay 39 main scene update. This recovered routine updates orbit anchors,
 * timed resource/effect transitions, six mode objects, two three-object
 * formations, and all thirty launched helper records each frame.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay039Vector {
    u32 field_00;
    s32 x_04;
    s32 y_08;
    s32 z_0c;
} Overlay039Vector;

extern const s32 data_ov039_0220801c[3];
extern const s32 data_ov039_02208028[3];
extern const s32 data_ov039_02208034[3];
extern const s16 data_020c9670[];
extern const s32 data_ov039_022083b0[3];
extern const s32 data_ov039_022083a4[3];
extern const s32 data_ov039_02208398[3];
extern const u8 data_ov039_02207fe0[7];
extern const u8 data_ov039_02207fe7[7];
extern const u8 data_ov039_02207fdc[4];
extern const u8 data_ov039_02207fd8[4];
extern const s32 data_ov039_02208010[3];
extern void *data_021052fc;
extern void *data_020f4dc8;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_ov039_021feff0(void *scene);
extern void func_ov039_021fe05c(void *scene);
extern void func_ov039_021ff01c(void *scene);
extern void func_ov039_021ff330(void *scene, s32 mode);
extern void GraphicsSpriteState_SetAnimationIndex(void *renderObject, u8 mode);
extern void GraphicsSpriteState_SetFrameIndex(void *renderObject, s32 value);
extern void VecFx32Object_InitCopy(Overlay039Vector *destination, void *source);
extern void VecFx32Object_Destroy(void *object);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern s32 func_020adc40(s32 squaredDistance);
extern s32 func_020ae024(s32 y, s32 x);
extern s32 func_ov069_02211594(void *system);
extern void func_ov069_0220ff20(void *system, s32 mode);
extern s32 func_ov069_022119dc(void *object);
extern void func_ov069_022119bc(void *object);
extern void func_ov069_02210a44(void *system, s32 index, s32 x, s32 y,
                                s32 ownerX, s32 ownerY);
extern void *func_0201e0ec(void *object);
extern void func_020a28e0(void *context, s32 type, s32 x, s32 y, s32 value);
extern void func_020a2614(void *context, s32 type, s32 x, s32 y, s32 value);
extern void func_0209f158(void *system, const void *position);
extern void Sound_Play(void *context, s32 soundId, s32 parameter);
extern void *DisplayBrightnessPair_GetScreen(void *object, s32 mode);
extern void DisplayBrightness_StartTransition(void *object, s32 first, s32 second, s32 third);
extern s32 DisplayBrightness_GetCurrent(void *object);
#ifdef __cplusplus
}
#endif

static s32 fixedMultiply(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

static s16 trigComponent(u16 angle, s32 component)
{
    return data_020c9670[((u32)angle >> 4) * 2 + component];
}

/* Update the three +0x74 orbit anchors from phase, amplitude, and velocity. */
static void updateOrbitAnchors(void *scene, s32 tier)
{
    u16 &phaseX = FIELD(u16, scene, 0x1c94);
    u16 &phaseY = FIELD(u16, scene, 0x1c96);
    u16 delay = FIELD(u16, scene, 0x1cae);
    if (delay == 0) {
        phaseX += tier * 0x190 + 0x226;
        phaseY += tier * 0xe6 + 0x12c;
        phaseX += FIELD(u16, scene, 0x1caa) * 0x898;
        phaseY += FIELD(u16, scene, 0x1caa) * 0x898;
    } else {
        s32 multiplier = 10 - (delay >> 3);
        if (multiplier < 0) multiplier = 0;
        phaseX += multiplier * 0x190;
        phaseY += multiplier * 0xe6;
    }

    s32 amplitude = FIELD(s16, scene, 0x1ca0);
    for (s32 i = 0; i < 3; i++) {
        void *object = FIELD(void *, scene, 0x74 + i * 4);
        s32 xWave = fixedMultiply(trigComponent(phaseX +
                                                data_ov039_0220801c[i], 0),
                                  amplitude);
        FIELD(s32, object, 0x30) = fixedMultiply(xWave, 0x4000);
        s32 yWave = fixedMultiply(trigComponent(phaseY +
                                                data_ov039_02208028[i], 0),
                                  amplitude);
        FIELD(s32, object, 0x34) = data_ov039_022083b0[i] +
            fixedMultiply(yWave, data_ov039_02208034[i]);
    }

    s32 velocityX = FIELD(s32, scene, 0x1c98);
    if (velocityX == 0) {
        if (FIELD(u16, scene, 0x1caa) == 0) {
            amplitude += 0x7b;
            if (amplitude > 0x1000) amplitude = 0x1000;
            FIELD(s16, scene, 0x1ca0) = (s16)amplitude;
        }
    } else {
        amplitude -= 0xcd;
        if (amplitude < 0) amplitude = 0;
        FIELD(s16, scene, 0x1ca0) = (s16)amplitude;
        s32 factor = 0x1000 - trigComponent((u16)velocityX, 1);
        const s32 *offsets = velocityX > 0 ? data_ov039_02208398
                                           : data_ov039_022083a4;
        for (s32 i = 0; i < 3; i++) {
            void *object = FIELD(void *, scene, 0x74 + i * 4);
            FIELD(s32, object, 0x30) += fixedMultiply(factor, offsets[i]);
        }
    }

    s32 velocityY = FIELD(s32, scene, 0x1c9c);
    if (velocityY != 0) {
        s32 factor = 0x1000 - trigComponent((u16)velocityY, 1);
        s32 second = velocityY > 0 ? 0x2800 : -0x5000;
        s32 third = velocityY > 0 ? 0x5000 : -0xa000;
        FIELD(s32, FIELD(void *, scene, 0x78), 0x34) +=
            fixedMultiply(factor, second);
        FIELD(s32, FIELD(void *, scene, 0x7c), 0x34) +=
            fixedMultiply(factor, third);
    }
    s32 hitTimer = FIELD(u16, scene, 0x1caa);
    FIELD(s32, FIELD(void *, scene, 0x74), 0x34) -= hitTimer << 12;
    FIELD(s32, FIELD(void *, scene, 0x78), 0x34) -= hitTimer * 0x555;
    FIELD(s32, FIELD(void *, scene, 0x7c), 0x34) -= hitTimer << 10;
}

/* Enable flag bit four on an object stored directly in a scene slot. */
static void enableObject(void *scene, s32 offset)
{
    FIELD(u16, FIELD(void *, scene, offset), 0x42) |= 4;
}

/* Emit the timed three-anchor effect sequence driven by +0x1CAE. */
static void updateTimedSequence(void *scene, s32 variant)
{
    u16 &time = FIELD(u16, scene, 0x1cae);
    u16 &hold = FIELD(u16, scene, 0x1cac);
    s32 effectIndex = variant * 3;
    if (hold > 1) hold--;
    void *owner = FIELD(void *, scene, 0x48);
    if (FIELD(s32, owner, 0x74) == 0x19 && hold >= 0x20 &&
        !func_ov069_02211594((u8 *)scene + 0xafc)) {
        hold = 0x20;
    }
    time++;

    s32 &transitionTimer = FIELD(s32, scene, 0x1db0);
    if (transitionTimer > 0) {
        transitionTimer++;
        if (transitionTimer == 20) {
            func_ov069_0220ff20((u8 *)scene + 0x118, -1);
            VecFx32Object_Assign((u8 *)scene + 0x1da0,
                          (u8 *)FIELD(void *, scene, 0x98) + 0x1c);
            enableObject(scene, 0x98);
            enableObject(scene, 0x9c);
            Sound_Play(gSoundContext, 0x1c5, 8);
        }
        s32 reduction = 0x2b33 - (transitionTimer - 20) * 0xbe;
        if (reduction < 0) reduction = 0;
        FIELD(s32, scene, 0x1da8) -= reduction;
    }

    void *effectContext = func_0201e0ec((u8 *)data_021052fc + 0x2f7c);
    if (time == 10) {
        void *a = FIELD(void *, scene, 0x74);
        void *b = FIELD(void *, scene, 0x78);
        void *c = FIELD(void *, scene, 0x7c);
        func_020a28e0(effectContext, 2, (FIELD(s32, a, 0x20) >> 12) - 40,
                      (FIELD(s32, a, 0x24) >> 12) + 20, 0x8c);
        func_020a28e0(effectContext, 2, (FIELD(s32, b, 0x20) >> 12) + 50,
                      (FIELD(s32, b, 0x24) >> 12) + 10, 0x8c);
        func_020a28e0(effectContext, 2, (FIELD(s32, c, 0x20) >> 12) - 60,
                      (FIELD(s32, c, 0x24) >> 12) + 20, 0x8c);
        func_020a28e0(effectContext, 2, (FIELD(s32, c, 0x20) >> 12) + 25,
                      (FIELD(s32, c, 0x24) >> 12) + 50, 0x8c);
        func_ov039_021ff330(scene, 4);
    }
    void *ownerEffect = FIELD(void *, owner, 0x1c);
    if (ownerEffect == 0) {
        if (time == 0xb4) time = 0x12c;
    } else if (func_ov069_022119dc(ownerEffect)) {
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, scene, 0x98), 0x0c), 8);
    }
    if (time == 0x12c) {
        if (variant == 0) time = 0x17c;
        else {
            transitionTimer++;
            func_ov069_0220ff20((u8 *)scene + 0x118, 1);
        }
        return;
    }

    const s32 trigger = 0x186;
    if (time == trigger || time == trigger + 0x28 || time == trigger + 0x50) {
        s32 which = time == trigger ? 0 : (time == trigger + 0x28 ? 1 : 2);
        void *anchor = FIELD(void *, scene, 0x74 + which * 4);
        s32 yAdjust = which == 2 ? -20 : 30;
        func_020a2614(effectContext, 0, FIELD(s32, anchor, 0x20) >> 12,
                      (FIELD(s32, anchor, 0x24) >> 12) + yAdjust, 100);
        enableObject(scene, 0x74 + which * 4);
        if (which == 0) {
            enableObject(scene, 0x98); enableObject(scene, 0x9c);
            enableObject(scene, 0x80); enableObject(scene, 0x84);
        } else if (which == 1) {
            enableObject(scene, 0x88); enableObject(scene, 0x8c);
        } else {
            enableObject(scene, 0x88); enableObject(scene, 0x90);
            enableObject(scene, 0x94);
        }
        void *ownerTransform = FIELD(void *, FIELD(void *, owner, 8), 0x48);
        func_ov069_02210a44((u8 *)scene + 0xafc, effectIndex + which,
                            FIELD(s32, anchor, 0x20) >> 12,
                            FIELD(s32, anchor, 0x24) >> 12,
                            FIELD(s32, ownerTransform, 0x30),
                            FIELD(s32, ownerTransform, 0x34));
        Sound_Play(gSoundContext, 0x63, which == 1 ? 2 : 1);
        FIELD(s32, owner, 0x44) = 20;
        FIELD(s32, owner, 0x48) = 7;
        if (which == 2 && variant == 1) {
            void *screen = DisplayBrightnessPair_GetScreen(data_020f4dc8, 0);
            DisplayBrightness_StartTransition(screen, 0, 0x10, 0x30);
        }
    } else if (time == 0x1f4 && variant == 0) {
        FIELD(s32, owner, 0x74) = 0x19;
        if (ownerEffect != 0) func_ov069_022119bc(ownerEffect);
    } else if (time >= 0x1f4 && variant != 0) {
        void *screen = DisplayBrightnessPair_GetScreen(data_020f4dc8, 0);
        if (DisplayBrightness_GetCurrent(screen) == 0x10) FIELD(s32, owner, 0x74) = 0x2b;
    }
}

/* Update six renderers whose flag bit zero requests one-shot processing. */
static void updateModeObjects(void *scene)
{
    if (FIELD(u16, scene, 0x1cac) != 0) return;
    for (s32 i = 5; i >= 0; i--) {
        void *object = FIELD(void *, scene, 0x80 + i * 4);
        void *render = FIELD(void *, object, 0x0c);
        if ((FIELD(u16, render, 0x24) & 1) == 0) continue;
        GraphicsSpriteState_SetFrameIndex(render, 0);
        FIELD(u16, render, 0x24) &= (u16)~1;
        if (FIELD(u8, render, 0x38) == 5) {
            Overlay039Vector position;
            VecFx32Object_InitCopy(&position, (u8 *)object + 0x1c);
            position.x_04 += (2 * (i / 2) - 1) * -0x28000;
            position.y_08 += 0x1c000;
            func_0209f158(FIELD(void *, FIELD(void *, scene, 0x48), 0x10),
                           &position);
            VecFx32Object_Destroy(&position);
        }
    }
}

/* Update one three-object formation group selected by base slot offset. */
static void updateFormationGroup(void *scene, s32 groupOffset)
{
    void *owner = FIELD(void *, scene, 0x48);
    void *ownerTransform = FIELD(void *, FIELD(void *, owner, 8), 0x48);
    Overlay039Vector target;
    Overlay039Vector objectPosition;
    VecFx32Object_InitCopy(&target, (u8 *)ownerTransform + 0x2c);
    void *thirdObject = FIELD(void *, scene, 0x58 + groupOffset);
    s32 centerX = FIELD(s32, thirdObject, 0x30);
    s32 centerY = FIELD(s32, thirdObject, 0x34);
    VecFx32Object_InitCopy(&objectPosition, (u8 *)thirdObject + 0x1c);
    s32 targetX = target.x_04;
    s32 targetY = target.y_08 - target.z_0c - 0x10000;
    s32 dx = targetX - objectPosition.x_04;
    s32 dy = targetY - objectPosition.y_08;
    s32 distance = func_020adc40(fixedMultiply(dx, dx) + fixedMultiply(dy, dy));

    s32 stateOffset = 0x1cc8 + groupOffset;
    s32 scaleOffset = 0x1cf0 + groupOffset;
    s32 type = FIELD(s32, scene, stateOffset);
    s32 scale = FIELD(s32, scene, scaleOffset);
    s32 transition = 0;
    if (FIELD(u16, scene, 0x1caa) != 0) {
        scale = 0x1800;
    } else if (distance < 0x50000) {
        scale += 0xcd;
        if (scale > 0x1000) scale = 0x1000;
        FIELD(s32, scene, scaleOffset) = scale;
        if (type == 0x65) transition = 1;
        else if (type == 0x66) transition = 2;
    } else {
        scale -= 0x7b;
        if (scale < 0) scale = 0;
        FIELD(s32, scene, scaleOffset) = scale;
        if (distance < 0x91000) {
            if (type == 0x64) transition = 3;
            else if (type == 0x66) transition = 4;
        } else {
            if (type == 0x64) transition = 5;
            else if (type == 0x65) transition = 6;
        }
    }
    void *firstObject = FIELD(void *, scene, 0x4c + groupOffset);
    void *firstRender = FIELD(void *, firstObject, 0x0c);
    if (transition != 0) {
        GraphicsSpriteState_SetAnimationIndex(firstRender, data_ov039_02207fe0[transition]);
        FIELD(u16, firstRender, 0x24) &= (u16)~2;
        FIELD(s32, scene, stateOffset) = data_ov039_02207fe7[transition];
        type = FIELD(s32, scene, stateOffset);
    }
    if (type >= 1 && type <= 3 && (FIELD(u16, firstRender, 0x24) & 1)) {
        GraphicsSpriteState_SetAnimationIndex(firstRender, data_ov039_02207fdc[type]);
        FIELD(u16, firstRender, 0x24) |= 2;
        FIELD(s32, scene, stateOffset) = data_ov039_02207fd8[type];
    }

    u16 angle = (u16)func_020ae024(dy, dx);
    s32 radii[3];
    for (s32 i = 0; i < 3; i++) radii[i] = fixedMultiply(data_ov039_02208010[i], scale);
    if (FIELD(u16, scene, 0x1caa) != 0)
        angle = (u16)(angle + FIELD(u16, scene, 0x1caa) * 0xfa0);
    s32 sine = trigComponent(angle, 1);
    s32 cosine = trigComponent(angle, 0);
    for (s32 i = 0; i < 3; i++) {
        void *object = FIELD(void *, scene, 0x4c + groupOffset + (2 - i) * 4);
        FIELD(s32, object, 0x30) = centerX + fixedMultiply(sine, radii[i]);
        FIELD(s32, object, 0x34) = centerY + fixedMultiply(cosine, radii[i]);
    }
    VecFx32Object_Destroy(&objectPosition);
    VecFx32Object_Destroy(&target);
}

/* Integrate active helper velocities and recycle records outside world bounds. */
static void updateLaunchedHelpers(void *scene)
{
    for (s32 i = 29; i >= 0; i--) {
        void *helper = FIELD(void *, scene, 0xa0 + i * 4);
        if (FIELD(s32, helper, 0x18) != 0) continue;
        FIELD(s32, helper, 4) += FIELD(s32, helper, 0x10);
        FIELD(s32, helper, 8) += FIELD(s32, helper, 0x14);
        FIELD(s32, helper, 0x1c)++;
        s32 x = FIELD(s32, helper, 4);
        s32 y = FIELD(s32, helper, 8);
        if (x > 0x2bc000 || x < 0x144000 || y > 0x280000 || y < 0x6e000)
            FIELD(s32, helper, 0x18) = 4;
    }
}

/*
 * Advance one complete scene frame. The function derives the count tier,
 * updates three orbit anchors and their amplitude/velocity offsets, then runs
 * either the compact central script (+0x1CAC==0) or the confirmed timed
 * transition/effect sequence. It handles the +0x1CAA recovery countdown and
 * scene translation, consumes six renderer completion flags, either hides the
 * ten main objects when anchor +0x74 has flag four or updates two three-object
 * formations, and finally integrates/recycles all thirty helper projectiles.
 * Input is scene; returns no value. Scene transforms, renderer/resource state,
 * owner state, effect systems, sound, temporary SDK objects, and helper records
 * may change. The exact fallback preserves the original compiler-sensitive
 * fixed-point arithmetic, table copies, and event ordering.
 */
extern "C" void func_ov039_021ff610(void *scene)
{
    s32 tier = func_ov039_021feff0(scene);
    updateOrbitAnchors(scene, tier);
    if (FIELD(u16, scene, 0x1cac) == 0)
        func_ov039_021fe05c(scene);
    else
        updateTimedSequence(scene, FIELD(u16, scene, 0x1cb2));

    u16 &recovery = FIELD(u16, scene, 0x1caa);
    if (recovery != 0) {
        recovery--;
        if (recovery == 0 && FIELD(u16, scene, 0x1cac) == 0) {
            FIELD(s32, scene, 0x1d94) = 0;
            func_ov039_021ff01c(scene);
            GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, scene, 0x98), 0x0c), 3);
            GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, scene, 0x4c), 0x0c), 0);
            GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, scene, 0x5c), 0x0c), 0);
            FIELD(u16, FIELD(void *, scene, 0x4c), 0x40) = 0x65;
            FIELD(u16, FIELD(void *, scene, 0x5c), 0x40) = 0x65;
            Sound_Play(gSoundContext, 0x63, 8);
        }
    } else {
        FIELD(s32, scene, 0x30) += FIELD(s32, scene, 0x1d94);
        FIELD(s32, scene, 0x34) += FIELD(s32, scene, 0x1d98);
    }

    updateModeObjects(scene);
    if ((FIELD(u16, FIELD(void *, scene, 0x74), 0x42) & 4) != 0) {
        for (s32 i = 0; i < 10; i++) enableObject(scene, 0x4c + i * 4);
    } else {
        updateFormationGroup(scene, 0);
        updateFormationGroup(scene, 4);
    }
    updateLaunchedHelpers(scene);
}
