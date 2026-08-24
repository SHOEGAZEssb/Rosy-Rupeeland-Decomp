#include "tingle/types.h"

/*
 * Overlay 39 secondary three-object effect system. This recovered group owns
 * its initialization, launch/reset, eight-particle trails, contact test, frame
 * update, and the later scene's combined render/submission pass.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay039EffectVector {
    u32 field_00;
    s32 x_04;
    s32 y_08;
    s32 z_0c;
} Overlay039EffectVector;

extern const s16 data_020c9670[];
extern void *gGamePhaseRuntime;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov039_021fce40(void *object);
extern void func_ov039_021fce5c(void *object);
extern u32 genrand_int32(void);
extern void func_0209a2ac(void *object, void *context, s32 enabled);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_Init(void *vector);
extern void VecFx32Object_InitCopy(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
extern void func_ov039_022014f8(void *output, const void *first,
                                const void *second);
extern void func_ov039_022014e0(void *output, void *input);
extern s32 func_020befec(s32 value, s32 divisor);
extern s32 func_020ae024(s32 y, s32 x);
extern s32 func_020adc40(s32 value);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(void *object);
extern void *func_0209c3b4(void);
extern void func_0209c430(void *renderer, ...);
extern void Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt(void *resource, s32 type, s32 x, s32 y, s32 mode);
extern void func_ov039_02203770(void *position, const void *velocity);
extern void func_ov039_02203794(void *scene);
extern void func_ov039_02203064(void *scene);
extern void func_ov039_0220454c(void *scene);
extern void func_ov039_02205654(void *scene);
extern void func_ov049_0220c8a0(void *system, void *position);
extern void func_ov045_0220c48c(void *system, void *position, s32 width,
                                s32 height);
extern s32 func_ov049_0220c254(void *system, void *iterator);
extern void func_ov049_0220cf94(void *system);
extern void func_ov069_0221100c(void *system, s32 mode);
extern void func_ov069_02211274(void *system);
extern void func_ov039_022035d4(void *scene, s32 targetX, s32 targetY,
                                s32 sourceX, s32 sourceY);
extern void Sound_Play(void *context, s32 soundId, s32 mode);
extern void func_ov039_02204168(void *destination, const void *source);
extern void func_ov039_02204118(void *object);
extern void func_ov039_02204180(void *object);
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
 * Attach the principal and nine indexed models to context, submit the scene's
 * base effect with phase/health-derived packet values, then invoke helper,
 * barrier, secondary-effect, and final resource renderers. It also refreshes
 * +0x464 bounds from owner data, turns each pending target-system point into a
 * ten-helper launch, and advances +0xB3C. Renderer, effect, and helper state
 * change; no value is returned. Exact packet field meanings remain unconfirmed.
 */
extern "C" void func_ov039_022039b8(void *scene, void *context)
{
    func_0209a2ac(scene, 0, 1);
    func_0209a2ac(FIELD(void *, scene, 0x4c), context, 1);
    for (s32 i = 0; i < 8; i++)
        func_0209a2ac(FIELD(void *, scene, 0x50 + i * 4), context, 1);
    func_0209a2ac(FIELD(void *, scene, 0x70), context, 1);
    func_ov039_02203794(scene);
    func_ov039_02203064(scene);
    func_ov039_0220454c(scene);
    func_ov039_02205654(scene);

    void *owner = FIELD(void *, scene, 0x48);
    void *ownerPos = FIELD(void *, FIELD(void *, owner, 8), 0x48);
    func_ov049_0220c8a0((u8 *)scene + 0x464, (u8 *)ownerPos + 0x2c);
    Overlay039EffectVector bounds;
    func_ov039_022014e0(&bounds, ownerPos);
    func_ov045_0220c48c((u8 *)scene + 0x464, &bounds, 0x40000, 0x40000);
    VecFx32Object_Destroy(&bounds);

    Overlay039EffectVector iterator;
    VecFx32Object_Init(&iterator);
    while (func_ov049_0220c254((u8 *)scene + 0x464, &iterator)) {
        Overlay039EffectVector source;
        VecFx32Object_InitCopy(&source, (u8 *)ownerPos + 0x2c);
        func_ov039_022035d4(scene, source.x_04, source.y_08,
                            iterator.x_04, iterator.y_08);
        VecFx32Object_Destroy(&source);
    }
    func_ov049_0220cf94((u8 *)scene + 0x464);
    VecFx32Object_Destroy(&iterator);
    func_ov069_0221100c((u8 *)scene + 0xb3c, 0);
    func_ov069_02211274((u8 *)scene + 0xb3c);
}

/*
 * Initialize a 0x148-byte secondary object: two base vectors, two arrays of
 * eight vector records, zero eight active flags, and randomize two eight-entry
 * phase arrays. Returns the object; RNG and vector-constructor state change.
 */
extern "C" void *func_ov039_02203ef0(void *object)
{
    FIELD(s32, object, 0) = 0;
    func_ov039_021fce40((u8 *)object + 0x0c);
    func_ov039_021fce40((u8 *)object + 0x18);
    for (s32 i = 0; i < 8; i++) {
        func_ov039_021fce40((u8 *)object + 0x88 + i * 12);
        func_ov039_021fce40((u8 *)object + 0xe8 + i * 12);
        FIELD(s32, object, 0x28 + i * 4) = 0;
        FIELD(u32, object, 0x48 + i * 4) = genrand_int32();
        FIELD(u32, object, 0x68 + i * 4) = genrand_int32();
    }
    return object;
}

/* Copy source vector coordinates into destination unless both addresses match. */
extern "C" void func_ov039_02204168(void *destination, const void *source)
{
    if (destination != source) {
        FIELD(s32, destination, 4) = FIELD(s32, source, 4);
        FIELD(s32, destination, 8) = FIELD(s32, source, 8);
    }
}

/*
 * Reset all eight trail records from the object's +0xC/+0x18 vectors, copying
 * those coordinates into the paired +0x88/+0xE8 arrays and setting each active
 * flag +0x28 to one.
 */
extern "C" void func_ov039_02204118(void *object)
{
    for (s32 i = 7; i >= 0; i--) {
        func_ov039_02204168((u8 *)object + 0x88 + i * 12,
                            (u8 *)object + 0x0c);
        func_ov039_02204168((u8 *)object + 0xe8 + i * 12,
                            (u8 *)object + 0x18);
        FIELD(s32, object, 0x28 + i * 4) = 1;
    }
}

/*
 * Launch the first inactive one of three secondary objects from scene origin,
 * offset 0xC000 opposite the barrier angle. It sets lifetime 0x21C, records the
 * wrapped angle, clears age, resets its eight trails, plays sound 0x1C5 mode 1,
 * and returns after one launch. If all are active, it only destroys its vector.
 */
extern "C" void func_ov039_02203f94(void *scene)
{
    Overlay039EffectVector origin;
    func_ov039_022014f8(&origin, (u8 *)scene + 0x2c,
                        (u8 *)scene + 0xac);
    u16 angle = (u16)FIELD(s32, scene, 0x1ccc);
    u32 index = ((u32)angle >> 4) * 2;
    for (s32 i = 2; i >= 0; i--) {
        void *effect = FIELD(void *, scene, 0x9c + i * 4);
        if (FIELD(s32, effect, 0) != 0) continue;
        FIELD(s32, effect, 0x10) = origin.x_04 -
            fixedMultiply(data_020c9670[index], 0xc000);
        FIELD(s32, effect, 0x14) = origin.y_08 +
            fixedMultiply(data_020c9670[index + 1], 0xc000);
        FIELD(s32, effect, 0x1c) = FIELD(s32, effect, 0x20) = 0;
        FIELD(s32, effect, 8) = 0x21c;
        FIELD(s32, effect, 0) = 1;
        FIELD(s32, effect, 0x24) = angle;
        FIELD(s32, effect, 4) = 0;
        func_ov039_02204118(effect);
        Sound_Play(FIELD(void *, gSoundContext, 0), 0x1c5, 1);
        break;
    }
    VecFx32Object_Destroy(&origin);
}

/* Deactivate all three secondary effect objects. */
extern "C" void func_ov039_022040f4(void *scene)
{
    for (s32 i = 2; i >= 0; i--)
        FIELD(s32, FIELD(void *, scene, 0x9c + i * 4), 0) = 0;
}

/*
 * Advance eight active trail samples using independent phase accumulators and
 * amplitude 0x16 around object +0x10/+0x14. Samples outside the confirmed scene
 * bounds are disabled. Only trail positions, phases, and active flags change.
 */
extern "C" void func_ov039_02204180(void *object)
{
    for (s32 i = 7; i >= 0; i--) {
        if (!FIELD(s32, object, 0x28 + i * 4)) continue;
        u32 &xPhase = FIELD(u32, object, 0x48 + i * 4);
        u32 &yPhase = FIELD(u32, object, 0x68 + i * 4);
        xPhase += i * 0x50 + 0xc8;
        yPhase += i * 0x3c + 0x12c;
        s32 x = FIELD(s32, object, 0x10) +
            data_020c9670[((u16)xPhase >> 4) * 2] * 0x16;
        s32 y = FIELD(s32, object, 0x14) +
            data_020c9670[((u16)yPhase >> 4) * 2 + 1] * 0x16;
        FIELD(s32, object, 0x8c + i * 12) = x;
        FIELD(s32, object, 0x90 + i * 12) = y;
        if (x > 0x2bc000 || x < 0x144000 || y > 0x280000 || y < 0x6e000)
            FIELD(s32, object, 0x28 + i * 4) = 0;
    }
}

/*
 * Test the owner position, shifted upward by 0x14000, against each active
 * secondary object's +0x10/+0x14. On distance below 0x14000, write the delta to
 * result +4/+8 and return one; otherwise return zero. No scene state changes.
 */
extern "C" s32 func_ov039_0220426c(void *scene, void *result)
{
    void *ownerPos = FIELD(void *, FIELD(void *, FIELD(void *, scene, 0x48), 8),
                           0x48);
    for (s32 i = 2; i >= 0; i--) {
        void *effect = FIELD(void *, scene, 0x9c + i * 4);
        if (!FIELD(s32, effect, 0)) continue;
        s32 dx = FIELD(s32, ownerPos, 0x30) - FIELD(s32, effect, 0x10);
        s32 dy = FIELD(s32, ownerPos, 0x34) - 0x14000 -
                 FIELD(s32, effect, 0x14);
        if (func_020adc40(fixedSquare(dx) + fixedSquare(dy)) < 0x14000) {
            FIELD(s32, result, 4) = dx;
            FIELD(s32, result, 8) = dy;
            return 1;
        }
    }
    return 0;
}

/*
 * Update all active secondary objects. After age 40, turn their stored angle
 * toward the owner by at most +/-0xC8 per frame; before age 20 their speed ramps
 * from base 0x1666 and emits a resource particle every four frames. Derive
 * velocity from angle, integrate position, increment age/decrement lifetime,
 * disable objects outside scene bounds, and update their trails.
 */
extern "C" void func_ov039_0220431c(void *scene)
{
    void *ownerPos = FIELD(void *, FIELD(void *, FIELD(void *, scene, 0x48), 8),
                           0x48);
    for (s32 i = 2; i >= 0; i--) {
        void *effect = FIELD(void *, scene, 0x9c + i * 4);
        if (!FIELD(s32, effect, 0)) continue;
        s32 angle = func_020ae024(FIELD(s32, ownerPos, 0x34) -
                                  FIELD(s32, effect, 0x14),
                                  -(FIELD(s32, ownerPos, 0x30) -
                                    FIELD(s32, effect, 0x10)));
        if (FIELD(s32, effect, 4) > 40 && FIELD(s32, effect, 8) > 0) {
            s32 delta = angle - FIELD(s32, effect, 0x24);
            if (delta > 0x7fff) delta -= 0x10000;
            if (delta < -0x8000) delta += 0x10000;
            if (delta > 0xc8) delta = 0xc8;
            if (delta < -0xc8) delta = -0xc8;
            FIELD(s32, effect, 0x24) =
                (u16)(FIELD(s32, effect, 0x24) + delta);
        }
        s32 age = FIELD(s32, effect, 4);
        s32 speed = 0x1666 + (age < 20 ? (20 - age) * 0x258 : 0);
        u32 index = ((u16)FIELD(s32, effect, 0x24) >> 4) * 2;
        FIELD(s32, effect, 0x1c) = -fixedMultiply(data_020c9670[index], speed);
        FIELD(s32, effect, 0x20) = fixedMultiply(data_020c9670[index + 1], speed);
        func_ov039_02203770((u8 *)effect + 0x0c, (u8 *)effect + 0x18);
        FIELD(s32, effect, 4)++;
        FIELD(s32, effect, 8)--;
        s32 x = FIELD(s32, effect, 0x10), y = FIELD(s32, effect, 0x14);
        if (x > 0x2bc000 || x < 0x144000 || y > 0x280000 || y < 0x6e000)
            FIELD(s32, effect, 0) = 0;
        func_ov039_02204180(effect);
    }
}
