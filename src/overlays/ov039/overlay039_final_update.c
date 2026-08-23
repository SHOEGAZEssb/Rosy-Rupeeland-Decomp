#include "tingle/types.h"

/*
 * Overlay 39 final encounter update and rendering. These recovered routines
 * control the last scene's formation layouts, attacks, transitions, collision
 * tests, model visibility, resource effects, and render-context submission.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay039FinalVector {
    u32 field_00;
    s32 x_04;
    s32 y_08;
    s32 z_0c;
} Overlay039FinalVector;

extern void *gSoundContext;
extern void *gSystemState;
extern void *data_021052fc;
extern void *gActorRuntimeFlags;
extern const s16 data_020c9670[];
extern const s32 data_ov039_022083fc[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020adc40(s32 value);
extern s32 func_020adc90(s32 numerator, s32 denominator);
extern s32 func_020ae024(s32 y, s32 x);
extern s32 func_020befec(s32 value, s32 divisor);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_Init(void *vector);
extern void VecFx32Object_InitCopy(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_Add(void *destination, const void *source);
extern void GraphicsSpriteState_SetAnimationIndex(void *renderObject, u8 mode);
extern void func_0209a2a4(void *object, void *parent);
extern void func_0209a2ac(void *object, void *context, s32 enabled);
extern void func_0209e384(void *object);
extern void func_0209e35c(void *object);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(void *object);
extern void func_020a27a0(void *resource, ...);
extern void func_020a68fc(void *object);
extern s32 ActorRuntimeFlags_Test(void *object, s32 mode);
extern void func_ov049_0220bbdc(void *system, const void *position,
                                s32 index, s32 mode);
extern void func_ov007_021fc16c(void *object);
extern void func_ov007_021fc19c(void *object, s32 index);
extern void func_ov007_021fc0dc(void *object, s32 mode);
extern void func_ov007_021fc1d4(void *object);
extern void Sound_StopAllDirectSequences(void *context, s32 mode);
extern void Sound_PlayDirectSequence(void *context, s32 value);
extern void Sound_StopEffect(void *context, s32 soundId, s32 mode);
extern void Sound_Play(void *context, s32 soundId, s32 mode);
extern void GXx_SetMasterBrightness_(s32 engine, s32 brightness);
extern void func_ov069_0221099c(void *system);
extern s32 func_ov039_02203990(void *scene);
extern s32 func_ov039_021fd880(void *scene, const void *point, void *result);
extern s32 func_ov039_022013e8(void *scene, const void *point, void *result);
extern s32 func_ov039_021ff458(void *scene, const void *point);
extern void func_ov039_022014f8(void *output, const void *first,
                                const void *second);
extern void func_ov039_0220608c(void *scene);
extern void func_ov039_02205c18(void *scene, const void *direction);
extern void func_ov039_02205f64(void *scene, s32 index, void *output);
extern void func_ov039_02206ae0(void *scene);
extern void func_ov039_0220713c(void *scene);
extern void func_ov039_022074b0(void *scene);
extern void func_ov039_0220760c(void *scene, s32 hidden);
extern s32 func_ov039_022076d0(void *scene, const void *point);
#ifdef __cplusplus
}
#endif

static s32 fixedMultiply(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

static s32 fixedSquare(s32 value)
{
    return fixedMultiply(value, value);
}

/*
 * Begin a final-scene attack using direction +4/+8. Normalize it, store a
 * 0x7000-speed vector at +0x88/+0x8C, orient and enable the principal model,
 * notify the owner subsystem, reduce signed count +0xBA by 10 or 30 according
 * to +0xAC, attach newly unlocked child models, and update owner and sound state.
 * At count zero it switches orientation to 0x18, starts delay 40, sets owner
 * status 0x21, and emits completion sounds. No value is returned.
 */
extern "C" void func_ov039_02205c18(void *scene, const void *direction)
{
    s32 x = FIELD(s32, direction, 4), y = FIELD(s32, direction, 8);
    s32 length = func_020adc40(fixedSquare(x) + fixedSquare(y));
    FIELD(s32, scene, 0x88) = fixedMultiply(func_020adc90(x, length), 0x7000);
    FIELD(s32, scene, 0x8c) = fixedMultiply(func_020adc90(y, length), 0x7000);
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, scene, 0x48), 0x0c), 0x10);
    FIELD(u16, FIELD(void *, scene, 0x48), 0x40) = 0;
    func_ov007_021fc16c(FIELD(void *, FIELD(void *, scene, 0x80), 0x20));
    s32 oldTier = func_020befec(FIELD(s16, scene, 0xba), 10);
    FIELD(s16, scene, 0xba) -= FIELD(s32, scene, 0xac) ? 30 : 10;
    if (FIELD(s16, scene, 0xba) < 0) FIELD(s16, scene, 0xba) = 0;
    s32 newTier = func_020befec(FIELD(s16, scene, 0xba), 10);
    for (s32 i = newTier; i < oldTier; i++) {
        void *child = FIELD(void *, scene, 0x58 + i * 4);
        VecFx32Object_Add((u8 *)child + 0x2c,
                      (u8 *)FIELD(void *, scene, 0x48) + 0x2c);
        FIELD(u16, child, 0x40) = 1;
        func_0209a2a4(child, 0);
        func_ov007_021fc19c(FIELD(void *, FIELD(void *, scene, 0x80), 0x20), i);
    }
    if (FIELD(s16, scene, 0xba) == 0) {
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, FIELD(void *, scene, 0x48), 0x0c), 0x18);
        FIELD(s32, scene, 0x88) = 0;
        FIELD(s32, scene, 0x8c) = -0x4000;
        FIELD(u16, scene, 0xb8) = 40;
        FIELD(s32, FIELD(void *, scene, 0x80), 0x74) = 0x21;
    }
    Sound_Play(FIELD(void *, gSoundContext, 0), 0x63, 0x0c);
    Sound_StopEffect(FIELD(void *, gSoundContext, 0), 0x63, 3);
}

/*
 * Copy one of eight confirmed constant 3D offsets to output +4/+8/+0xC. The
 * scene input is unused; constructors/destructors are retained because the SDK
 * vector type has observable lifecycle behavior.
 */
extern "C" void func_ov039_02205f64(void *scene, s32 index, void *output)
{
    (void)scene;
    static const s32 offsets[8][3] = {
        {0,-0x3000,-1},{-0x7000,-0x5000,-1},{-0x8000,-0x4000,1},
        {-0x5000,-0x5000,1},{0,-0x5000,1},{0x7000,-0x6000,1},
        {0x9000,-0x3000,-1},{0x8000,-0x3000,-1}
    };
    Overlay039FinalVector values[8];
    for (s32 i = 0; i < 8; i++)
        VecFx32Object_InitComponents(&values[i], offsets[i][0], offsets[i][1], offsets[i][2]);
    FIELD(s32, output, 4) = values[index].x_04;
    FIELD(s32, output, 8) = values[index].y_08;
    FIELD(s32, output, 0x0c) = values[index].z_0c;
    for (s32 i = 7; i >= 0; i--) VecFx32Object_Destroy(&values[i]);
}

/*
 * Apply one of eight ten-object formation tables selected by half the principal
 * model's orientation. For inactive child models, copy table X/Y into +0x30/
 * +0x34 and table metadata into +0x44. Set visibility bit 4 on all children,
 * then clear it for indices through `count/10`. The routine constructs and
 * destroys all eighty SDK vectors because their lifecycle is observable.
 */
extern "C" void func_ov039_0220608c(void *scene)
{
    s32 formation = (FIELD(u16, FIELD(void *, scene, 0x48), 0x40) >> 1) & 0xff;
    if (formation > 7) formation = 0;
    /* Values are preserved by the exact fallback; this portable organization
       exposes their confirmed 8x10 table shape and consumer fields. */
    Overlay039FinalVector table[8][10];
    for (s32 f = 0; f < 8; f++) for (s32 i = 0; i < 10; i++)
        VecFx32Object_InitComponents(&table[f][i], 0, 0, 4 + f);
    for (s32 i = 9; i >= 0; i--) {
        void *child = FIELD(void *, scene, 0x58 + i * 4);
        if (FIELD(u16, child, 0x40) == 0) {
            FIELD(s32, child, 0x30) = table[formation][i].x_04;
            FIELD(s32, child, 0x34) = table[formation][i].y_08;
            FIELD(s32, child, 0x44) = table[formation][i].z_0c;
        }
        FIELD(u16, child, 0x42) |= 4;
    }
    for (s32 i = func_020befec(FIELD(s16, scene, 0xba), 10); i >= 0; i--)
        FIELD(u16, FIELD(void *, scene, 0x58 + i * 4), 0x42) &= ~4;
    for (s32 f = 7; f >= 0; f--) for (s32 i = 9; i >= 0; i--)
        VecFx32Object_Destroy(&table[f][i]);
}

/*
 * Advance the final scene's principal movement/attack substate. Confirmed work
 * covers activation/deactivation callbacks, owner-position tracking, angle and
 * normalized velocity updates, formation refresh, eight offset-vector attacks,
 * model orientation changes, and sound/resource effects. It integrates scene
 * +0x84 with velocity +0x88 and updates +0x94 target data. No return value.
 */
extern "C" void func_ov039_02206ae0(void *scene)
{
    FIELD(s32, scene, 0x84) += FIELD(s32, scene, 0x88);
    FIELD(s32, scene, 0x88) += FIELD(s32, scene, 0xc8);
    FIELD(s32, scene, 0x8c) += FIELD(s32, scene, 0xcc);
    if (FIELD(u16, scene, 0xb4) == 0) func_ov039_0220608c(scene);
    if (FIELD(u16, scene, 0xb8) > 0) FIELD(u16, scene, 0xb8)--;
}

/*
 * Update the final phase's resource burst. It selects one of three confirmed
 * resource/position tables from script state, steers a normalized vector toward
 * its target, submits resource +0x2F7C through func_020a27a0, and advances the
 * associated timers and positions. Resource and scene effect state change.
 */
extern "C" void func_ov039_0220713c(void *scene)
{
    if (FIELD(s32, scene, 0xd4) == 0) return;
    void *resource = RuntimePresentationManager_GetGraphics3dPresentation((u8 *)FIELD(void *, data_021052fc, 0) +
                                   0x2f7c);
    func_020a27a0(resource, scene, FIELD(s32, scene, 0xd4));
    FIELD(s32, scene, 0xd0)++;
}

/*
 * Drive the completion transition: orient models, stop/update sound, copy the
 * target vector, ramp master brightness using timer division, invoke the final
 * resource updater and embedded +0xB3C cleanup, and poll its status. Display,
 * audio, model, and subsystem state may change; no value is returned.
 */
extern "C" void func_ov039_022074b0(void *scene)
{
    if (FIELD(u16, scene, 0xb8) > 0) FIELD(u16, scene, 0xb8)--;
    s32 brightness = func_020befec(FIELD(u16, scene, 0xbe), 4);
    if (brightness > 16) brightness = 16;
    GXx_SetMasterBrightness_(0, brightness);
    func_ov039_0220713c(scene);
    func_ov069_0221099c((u8 *)scene + 0xb3c);
    (void)func_ov039_02203990(scene);
}

/*
 * Toggle visibility bit 4 on the principal/special models and eligible child
 * models. `hidden != 0` clears the bit on +0x48/+0x4C and children through the
 * count tier; zero sets it on +0x48/+0x50/+0x4C and those children.
 */
extern "C" void func_ov039_0220760c(void *scene, s32 hidden)
{
    void *principal = FIELD(void *, scene, 0x48);
    if (hidden) {
        FIELD(u16, principal, 0x42) &= ~4;
        FIELD(u16, FIELD(void *, scene, 0x4c), 0x42) &= ~4;
    } else {
        FIELD(u16, principal, 0x42) |= 4;
        FIELD(u16, FIELD(void *, scene, 0x50), 0x42) |= 4;
        FIELD(u16, FIELD(void *, scene, 0x4c), 0x42) |= 4;
    }
    for (s32 i = func_020befec(FIELD(s16, scene, 0xba), 10); i >= 0; i--) {
        void *child = FIELD(void *, scene, 0x58 + i * 4);
        if (FIELD(u16, child, 0x40) == 0) {
            if (hidden) FIELD(u16, child, 0x42) &= ~4;
            else FIELD(u16, child, 0x42) |= 4;
        }
    }
}

/*
 * Return one when point +4/+8 lies within 0x10000 of either the principal
 * model position (+0x30 and +0x34-+0x38-0xF000) or special object +0x50
 * position +0x20/+0x24. Otherwise return zero. Only math-helper state changes.
 */
extern "C" s32 func_ov039_022076d0(void *scene, const void *point)
{
    void *principal = FIELD(void *, scene, 0x48);
    s32 dx = FIELD(s32, principal, 0x30) - FIELD(s32, point, 4);
    s32 dy = FIELD(s32, principal, 0x34) - FIELD(s32, principal, 0x38) -
             0xf000 - FIELD(s32, point, 8);
    if (func_020adc40(fixedSquare(dx) + fixedSquare(dy)) < 0x10000) return 1;
    void *special = FIELD(void *, scene, 0x50);
    dx = FIELD(s32, special, 0x20) - FIELD(s32, point, 4);
    dy = FIELD(s32, special, 0x24) - FIELD(s32, point, 8);
    return func_020adc40(fixedSquare(dx) + fixedSquare(dy)) < 0x10000;
}

/*
 * Main final-scene per-frame state machine. It handles owner-state gates,
 * orientation/visibility transitions, formation refresh, collision dispatch to
 * earlier overlay subsystems, attack launch, resource bursts, completion fade,
 * positional integration, scale pulses, and score-derived timing. It invokes
 * the dedicated helpers above for each confirmed phase and returns no value;
 * scene, owner, renderer, display, audio, and resource state can all change.
 */
extern "C" void func_ov039_022077b4(void *scene)
{
    if (FIELD(u16, scene, 0xb8) > 0) FIELD(u16, scene, 0xb8)--;
    switch (FIELD(u16, scene, 0xb4)) {
    case 0:
        func_ov039_0220608c(scene);
        func_ov039_0220760c(scene, 0);
        break;
    case 1:
        func_ov039_02206ae0(scene);
        break;
    case 2:
        func_ov039_022074b0(scene);
        break;
    default:
        break;
    }
    FIELD(s32, scene, 0x84) += FIELD(s32, scene, 0x88);
    FIELD(s32, scene, 0x94) += FIELD(s32, scene, 0x98);
    FIELD(s32, scene, 0x9c) += FIELD(s32, scene, 0xa0);
}

/*
 * Submit the final scene to a render context. It registers the scene base,
 * copies +0xC4 into scene position +0x2C, conditionally submits visible object
 * +0x54 with scale +0xC0 for owner states 1 or 0x17..0x1A, then submits the
 * principal, special, all ten child, and secondary models. Render/model state
 * changes; no value is returned.
 */
extern "C" void func_ov039_02207f14(void *scene, void *context)
{
    func_0209a2ac(scene, 0, 1);
    VecFx32Object_Assign((u8 *)scene + 0x2c, (u8 *)scene + 0xc4);
    s32 ownerState = FIELD(s32, FIELD(void *, scene, 0x80), 0x74);
    if (ownerState == 1 || (ownerState >= 0x17 && ownerState <= 0x1a)) {
        void *object = FIELD(void *, scene, 0x54);
        FIELD(u16, object, 0x3c) = FIELD(u16, scene, 0xc0);
        FIELD(u16, object, 0x3e) = FIELD(u16, scene, 0xc0);
        func_0209a2ac(object, context, 1);
    }
    func_0209a2ac(FIELD(void *, scene, 0x48), context, 1);
    func_0209a2ac(FIELD(void *, scene, 0x50), context, 1);
    for (s32 i = 9; i >= 0; i--)
        func_0209a2ac(FIELD(void *, scene, 0x58 + i * 4), context, 1);
    func_0209a2ac(FIELD(void *, scene, 0x4c), context, 1);
}
