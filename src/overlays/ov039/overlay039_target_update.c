#include "tingle/types.h"

/*
 * Overlay 39 target geometry and scripted movement. These recovered routines
 * derive direction/distance values, resolve successful target contacts, and
 * steer the later encounter through one of two eight-point waypoint paths.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay039TargetVector {
    u32 field_00;
    s32 x_04;
    s32 y_08;
    s32 z_0c;
} Overlay039TargetVector;

extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_Init(void *vector);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
extern void func_020adff0(const void *first, const void *second, void *output);
extern s32 func_020adc40(s32 squaredDistance);
extern s32 func_020adc90(s32 numerator, s32 denominator);
extern s32 func_020befec(s32 value, s32 divisor);
extern void func_ov049_0220c2dc(void *system, void *input, s32 mode);
extern void func_ov049_0220c67c(void *system);
extern void func_ov039_022012c4(void *scene);
extern void func_ov039_022036cc(void *scene);
extern void func_ov039_022040f4(void *scene);
extern void Sound_StopAllDirectSequences(void *context, s32 mode);
extern void SoundContext_PlayDefaultStream(void *context, s32 value);
extern void Sound_StopEffect(void *context, s32 soundId, s32 mode);
extern void Sound_Play(void *context, s32 soundId, s32 mode);
extern void func_ov039_022014f8(void *output, const void *first,
                                const void *second);
extern s32 func_ov039_02201530(void *scene, const void *point);
#ifdef __cplusplus
}
#endif

/* Initialize output and derive its +4 direction value from input +0x2C/+0xAC. */
extern "C" void func_ov039_022014e0(void *output, void *input)
{
    func_ov039_022014f8(output, (u8 *)input + 0x2c, (u8 *)input + 0xac);
}

/*
 * Initialize output, skip the leading word of each non-null input vector, and
 * call the fixed-point direction helper to write output +4. Returns no value;
 * output and any SDK vector-constructor state change.
 */
extern "C" void func_ov039_022014f8(void *output, const void *first,
                                     const void *second)
{
    VecFx32Object_Init(output);
    if (first) first = (const u8 *)first + 4;
    if (second) second = (const u8 *)second + 4;
    func_020adff0(first, second, (u8 *)output + 4);
}

static s32 fixedSquare(s32 value)
{
    return (s32)(((s64)value * value + 0x800) >> 12);
}

/*
 * Compare point +4/+8 with scene position +0x30/+0x34 plus offset
 * +0xB0/+0xB4. Return one when fixed-point distance is below 0x32000.
 */
extern "C" s32 func_ov039_02201530(void *scene, const void *point)
{
    s32 dx = FIELD(s32, point, 4) -
             (FIELD(s32, scene, 0x30) + FIELD(s32, scene, 0xb0));
    s32 dy = FIELD(s32, point, 8) -
             (FIELD(s32, scene, 0x34) + FIELD(s32, scene, 0xb4));
    return func_020adc40(fixedSquare(dx) + fixedSquare(dy)) < 0x32000;
}

/*
 * Measure the same offset scene position against the owner-chain position,
 * store distance minus 0x32000 through output, and return whether it is below
 * another 0x32000. Apart from math-helper effects, only output changes.
 */
extern "C" s32 func_ov039_0220159c(void *scene, s32 *output)
{
    void *position = FIELD(void *, FIELD(void *, FIELD(void *, scene, 0x48), 8),
                           0x48);
    s32 dx = FIELD(s32, scene, 0x30) + FIELD(s32, scene, 0xb0) -
             FIELD(s32, position, 0x30);
    s32 dy = FIELD(s32, scene, 0x34) + FIELD(s32, scene, 0xb4) -
             FIELD(s32, position, 0x34);
    *output = func_020adc40(fixedSquare(dx) + fixedSquare(dy)) - 0x32000;
    return *output < 0x32000;
}

/*
 * Feed input into +0x464 and accept contact only when +0x45C is clear and the
 * proximity test succeeds. Success resets script velocities/counters, subtracts
 * ten from signed health +0x1CA4, refreshes all indexed models, and updates owner
 * and sound state. At zero it starts a 0x564 completion delay, resets helper and
 * secondary systems, disables renderer bit 1 on eight objects, and sets owner
 * status 0x17. Returns one on accepted contact, otherwise zero.
 */
extern "C" s32 func_ov039_02201620(void *scene, void *input)
{
    func_ov049_0220c2dc((u8 *)scene + 0x464, input, 0);
    if (FIELD(s32, scene, 0x45c) != 0 || !func_ov039_02201530(scene, input))
        return 0;
    FIELD(u16, scene, 0x1ca6) = 30;
    FIELD(u16, scene, 0x1cde) = 0;
    FIELD(s32, scene, 0x1cc4) = FIELD(s32, scene, 0x1cc0) = 0;
    FIELD(s32, scene, 0x1cd8) = 0;
    func_ov039_022012c4(scene);
    FIELD(s32, scene, 0x1cf0) = FIELD(s32, scene, 0x1cec) = 0;
    FIELD(s16, scene, 0x1ca4) -= 10;
    void *owner = FIELD(void *, scene, 0x48);
    if (FIELD(s16, scene, 0x1ca4) > 0) {
        FIELD(s32, owner, 0x44) = 20;
        FIELD(s32, owner, 0x48) = 6;
    } else {
        FIELD(s16, scene, 0x1ca4) = 0;
        FIELD(u16, scene, 0x1ca8) = 0x564;
        FIELD(u16, scene, 0x1caa) = 0;
        FIELD(s32, scene, 0x1cac) = 0;
        func_ov039_022036cc(scene);
        func_ov039_022040f4(scene);
        func_ov049_0220c67c((u8 *)scene + 0x464);
        for (s32 i = 7; i >= 0; i--)
            FIELD(u16, FIELD(void *, FIELD(void *, scene, 0x50 + i * 4), 0x0c),
                  0x24) &= ~2;
        FIELD(s32, owner, 0x74) = 0x17;
        FIELD(s32, owner, 0x44) = 30;
        FIELD(s32, owner, 0x48) = 5;
        Sound_StopAllDirectSequences(FIELD(void *, gSoundContext, 0), 0);
        SoundContext_PlayDefaultStream(FIELD(void *, gSoundContext, 0), 8);
        Sound_StopEffect(FIELD(void *, gSoundContext, 0), 0x1c5, 9);
    }
    FIELD(u16, scene, 0x1cbc) = 0;
    FIELD(s32, scene, 0x1cc0) = 0;
    Sound_StopEffect(FIELD(void *, gSoundContext, 0), 0x1c5, 2);
    Sound_Play(FIELD(void *, gSoundContext, 0), 0x1c5, 0);
    return 1;
}

/*
 * If movement trigger +0x1CDE equals one, select one of two confirmed eight-way
 * offset paths according to health decade, add the encounter base position,
 * and steer +0x1CEC/+0x1CF0 toward the current waypoint at speed +0x1CE4.
 * Reaching a waypoint clears velocity/trigger and advances the wrapped index.
 * Temporary vectors are constructed and destroyed; no value is returned.
 */
extern "C" void func_ov039_022017d0(void *scene)
{
    static const s32 early[8][3] = {
        {0x0a000,0x50000,0x1000},{0x46000,0x50000,0x1000},
        {0x3c000,0x05000,0x1000},{-0x0a000,0,0x1000},
        {0x0a000,0x50000,0x1000},{-0x46000,0x50000,0x1000},
        {-0x3c000,0,0x1000},{-0x0a000,0x05000,0x1000}
    };
    static const s32 late[8][3] = {
        {0x28000,0x1e000,0x1000},{0x0f000,0,0x1000},
        {-0x28000,0x1e000,0x1000},{-0x0f000,0,0x1000},
        {0x28000,0x28000,0x1000},{-0x0a000,0x0a000,0x1000},
        {-0x28000,0x28000,0x1000},{0x0a000,0x0a000,0x1000}
    };
    Overlay039TargetVector vectors[16];
    for (s32 i = 0; i < 8; i++) {
        VecFx32Object_InitComponents(&vectors[i], late[i][0], late[i][1], late[i][2]);
        VecFx32Object_InitComponents(&vectors[8 + i], early[i][0], early[i][1], early[i][2]);
    }
    if (FIELD(u16, scene, 0x1cde) == 1) {
        const Overlay039TargetVector *path =
            func_020befec(FIELD(s16, scene, 0x1ca4), 10) >= 3 ? vectors : vectors + 8;
        Overlay039TargetVector target, delta;
        VecFx32Object_Init(&target);
        VecFx32Object_Init(&delta);
        VecFx32Object_Assign(&target, &path[FIELD(u16, scene, 0x1ce0)]);
        target.x_04 += 0x200000;
        target.y_08 += 0x118000;
        delta.x_04 = target.x_04 - FIELD(s32, scene, 0x30);
        delta.y_08 = target.y_08 - FIELD(s32, scene, 0x34);
        s32 distance = func_020adc40(fixedSquare(delta.x_04) +
                                     fixedSquare(delta.y_08));
        s32 speed = FIELD(s32, scene, 0x1ce4);
        if (distance > speed) {
            FIELD(s32, scene, 0x1cec) =
                (s32)(((s64)func_020adc90(delta.x_04, distance) * speed + 0x800) >> 12);
            FIELD(s32, scene, 0x1cf0) =
                (s32)(((s64)func_020adc90(delta.y_08, distance) * speed + 0x800) >> 12);
        } else {
            FIELD(s32, scene, 0x1cec) = FIELD(s32, scene, 0x1cf0) = 0;
            FIELD(u16, scene, 0x1ce0) = (FIELD(u16, scene, 0x1ce0) + 1) & 7;
            FIELD(u16, scene, 0x1cde) = 0;
        }
        VecFx32Object_Destroy(&delta);
        VecFx32Object_Destroy(&target);
    }
    for (s32 i = 15; i >= 0; i--) VecFx32Object_Destroy(&vectors[i]);
}
