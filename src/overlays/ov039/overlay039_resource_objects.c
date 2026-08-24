#include "tingle/types.h"

/*
 * Overlay 39 resource particles and the final scene constructor. This group
 * renders secondary trails, owns a 39-record/13-particle emitter, and creates
 * the model hierarchy used by the overlay's last encounter phase.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay039ResourceVector {
    u32 field_00;
    s32 x_04;
    s32 y_08;
    s32 z_0c;
} Overlay039ResourceVector;

extern void *data_ov039_02208464;
extern void *data_ov039_02208498;
extern void *gGamePhaseRuntime;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov039_021fce00(void *object);
extern void func_ov039_021fce40(void *object);
extern void func_ov039_021fce5c(void *object);
extern void func_ov039_021fd06c(void *object);
extern void VecFx32Object_Init(void *vector);
extern void VecFx32Object_InitCopy(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *vector);
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void func_ov039_02204168(void *destination, const void *source);
extern u32 genrand_int32(void);
extern s32 func_020befec(s32 value, s32 divisor);
extern s32 func_020adc40(s32 value);
extern s32 func_020bf1f8(s32 value, s32 modulus);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(void *object);
extern void func_0209c430(void *renderer, ...);
extern void func_0209b58c(void *resource, ...);
extern void func_0209b7ec(void *resource, ...);
extern void func_0209b880(void *resource);
extern void Sound_StopEffect(void *context, s32 soundId, s32 mode);
extern void Sound_Play(void *context, s32 soundId, s32 mode);
extern void Heap_Free(void *allocation);
extern void *func_0209a208(void *scene, s32 id0, s32 id1, s32 id2,
                           void *context, s32 mode);
extern void func_0209a2a4(void *object, void *parent);
extern void func_02099fb0(void *scene);
extern void GraphicsSpriteState_SetAnimationIndex(void *renderObject, u8 mode);
extern void func_ov039_0220608c(void *scene);
extern void *func_ov039_02204900(void *record);
extern void func_ov039_0220491c(void *emitter);
extern void func_ov039_02204974(void *emitter);
#ifdef __cplusplus
}
#endif

/*
 * Render the three active secondary objects and each enabled member of their
 * paired eight-sample trails. The routine derives scale/position packets from
 * age, lifetime, and stored sample coordinates, obtains resource +0x2F7C, and
 * submits with alpha 0x7FFF. Temporary vectors and renderer state change.
 */
extern "C" void func_ov039_0220454c(void *scene)
{
    void *resource = RuntimePresentationManager_GetGraphics3dPresentation((u8 *)FIELD(void *, gGamePhaseRuntime, 0) +
                                   0x2f7c);
    for (s32 i = 2; i >= 0; i--) {
        void *effect = FIELD(void *, scene, 0x9c + i * 4);
        if (!FIELD(s32, effect, 0)) continue;
        Overlay039ResourceVector scale, position;
        VecFx32Object_InitComponents(&scale, 0x1000, 0x1000, 0x1000);
        VecFx32Object_Init(&position);
        position.x_04 = FIELD(s32, effect, 0x10);
        position.y_08 = FIELD(s32, effect, 0x14);
        position.z_0c = 0;
        func_0209c430(resource, &position, &scale, 0x7fff);
        for (s32 j = 7; j >= 0; j--) if (FIELD(s32, effect, 0x28 + j * 4)) {
            position.x_04 = FIELD(s32, effect, 0x8c + j * 12);
            position.y_08 = FIELD(s32, effect, 0x90 + j * 12);
            func_0209c430(resource, &position, &scale, 0x7fff);
        }
        VecFx32Object_Destroy(&position);
        VecFx32Object_Destroy(&scale);
    }
}

/* Initialize one eight-byte emitter record with its vtable and zero fields. */
extern "C" void *func_ov039_02204900(void *record)
{
    FIELD(void *, record, 0) = data_ov039_02208464;
    FIELD(u16, record, 4) = FIELD(u16, record, 6) = 0;
    return record;
}

/*
 * Construct the embedded emitter: initialize 39 eight-byte records and 39
 * twelve-byte vectors, two additional vectors, randomize four phase halfwords
 * for each of thirteen particles, clear their two state arrays, and zero gain,
 * sound counter, and mode. Returns emitter; RNG/vector state changes.
 */
extern "C" void *func_ov039_0220482c(void *emitter)
{
    for (s32 i = 0; i < 39; i++) {
        func_ov039_02204900((u8 *)emitter + 4 + i * 8);
        func_ov039_021fce40((u8 *)emitter + 0x13c + i * 12);
    }
    VecFx32Object_Init((u8 *)emitter + 0x378);
    VecFx32Object_Init((u8 *)emitter + 0x388);
    for (s32 i = 12; i >= 0; i--) {
        u8 *phase = (u8 *)emitter + i * 24;
        FIELD(u16, phase, 0x10) = (u16)genrand_int32();
        FIELD(u16, phase, 0x18) = (u16)genrand_int32();
        FIELD(u16, phase, 0x12) = (u16)genrand_int32();
        FIELD(u16, phase, 0x1a) = (u16)genrand_int32();
        FIELD(s32, emitter, 0x310 + i * 4) = 0;
        FIELD(s32, emitter, 0x344 + i * 4) = 0;
    }
    FIELD(s32, emitter, 0x398) = 0;
    FIELD(s32, emitter, 0x3a0) = 0;
    FIELD(s32, emitter, 0x3a4) = 0;
    return emitter;
}

/*
 * Count down emitter +0x3A4; when it reaches zero stop sound 0x1C5 mode nine.
 * Increase gain +0x398 by 0xF6 and clamp it to 0x1000.
 */
extern "C" void func_ov039_0220491c(void *emitter)
{
    s32 &counter = FIELD(s32, emitter, 0x3a4);
    if (counter > 0 && --counter == 0)
        Sound_StopEffect(FIELD(void *, gSoundContext, 0), 0x1c5, 9);
    FIELD(s32, emitter, 0x398) += 0xf6;
    if (FIELD(s32, emitter, 0x398) > 0x1000)
        FIELD(s32, emitter, 0x398) = 0x1000;
}

/*
 * Increase emitter +0x3A4 toward ten, starting sound 0x1C5 mode nine when ten
 * is reached. Decrease gain +0x398 by 0xF6 and clamp it at zero.
 */
extern "C" void func_ov039_02204974(void *emitter)
{
    s32 &counter = FIELD(s32, emitter, 0x3a4);
    if (counter < 10 && ++counter == 10)
        Sound_Play(FIELD(void *, gSoundContext, 0), 0x1c5, 9);
    FIELD(s32, emitter, 0x398) -= 0xf6;
    if (FIELD(s32, emitter, 0x398) < 0) FIELD(s32, emitter, 0x398) = 0;
}

/*
 * Advance the 13-particle resource emitter. Confirmed phases update gain and
 * sound gating, randomize/recycle particle phase and velocity data, derive
 * three vectors per active particle, and submit their resource handles through
 * func_0209b58c. It also updates the 39 backing records and their position
 * vectors. No value is returned; RNG, sound, resource, and emitter state change.
 */
extern "C" void func_ov039_022049cc(void *scene)
{
    void *emitter = (u8 *)scene + 0xbc;
    if (FIELD(s32, emitter, 0x3a0)) func_ov039_0220491c(emitter);
    else func_ov039_02204974(emitter);
    for (s32 i = 12; i >= 0; i--) {
        u32 &age = FIELD(u32, emitter, 0x310 + i * 4);
        u32 &state = FIELD(u32, emitter, 0x344 + i * 4);
        if (state == 0 && (genrand_int32() & 7) == 0) {
            state = 1;
            age = 0;
        } else if (state) {
            age++;
            if (age > 60) { age = 0; state = 0; }
        }
    }
}

/*
 * Render active emitter records. Four phase-dependent resource tables select
 * the resource for each of thirteen particles; each active record is submitted
 * with its derived position/scale by func_0209b7ec, then the resource batch is
 * finalized with func_0209b880. Resource renderer state changes.
 */
extern "C" void func_ov039_02205654(void *scene)
{
    void *emitter = (u8 *)scene + 0xbc;
    void *resource = RuntimePresentationManager_GetGraphics3dPresentation((u8 *)FIELD(void *, gGamePhaseRuntime, 0) +
                                   0x2f7c);
    for (s32 i = 0; i < 13; i++) if (FIELD(s32, emitter, 0x344 + i * 4))
        func_0209b7ec(resource, emitter, i);
    func_0209b880(resource);
}

/* Free allocation and return its original address. Heap state changes. */
extern "C" void *func_ov039_022058c4(void *allocation)
{
    Heap_Free(allocation);
    return allocation;
}

/* Configure one loaded model's orientation, fixed position/scale, and bit 1. */
extern "C" void func_ov039_02205bc4(void *scene, void *object, s32 x, s32 y,
                                     s32 z, u8 orientation)
{
    (void)scene;
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0x0c), orientation);
    FIELD(u16, FIELD(void *, object, 0x0c), 0x24) |= 2;
    FIELD(s32, object, 0x30) = x;
    FIELD(s32, object, 0x34) = y;
    FIELD(s32, object, 0x38) = z;
    FIELD(u16, object, 0x3c) = FIELD(u16, object, 0x3e) = 0x100;
    FIELD(u16, object, 0x40) = 0;
}

/*
 * Construct the final scene from owner/context. It creates a principal model,
 * two special models, ten indexed child models, and one final visible model;
 * links children to the principal object, initializes three vectors and all
 * script fields, calls the large resource/state initializer, and returns scene.
 * Model/resource ownership and scene state change.
 */
extern "C" void *func_ov039_022058d8(void *scene, void *owner, void *context)
{
    func_ov039_021fce00(scene);
    FIELD(void *, scene, 0) = data_ov039_02208498;
    VecFx32Object_Init((u8 *)scene + 0x84);
    VecFx32Object_Init((u8 *)scene + 0x94);
    VecFx32Object_Init((u8 *)scene + 0xc4);
    FIELD(void *, scene, 0x80) = owner;
    FIELD(void *, scene, 0x48) = func_0209a208(scene, 0x1036, 0x1001, 0x1037,
                                               context, 2);
    FIELD(void *, scene, 0x4c) = func_0209a208(scene, 0x1386, 0x1001, 0x1387,
                                               context, 2);
    FIELD(void *, scene, 0x50) = func_0209a208(scene, 0x16a3, 0x16a4, 0x16a5,
                                               context, 2);
    func_0209a2a4(FIELD(void *, scene, 0x50), FIELD(void *, scene, 0x48));
    for (s32 i = 9; i >= 0; i--) {
        void *model = func_0209a208(scene, 0x1038, 0x1039, 0x103a, context, 2);
        FIELD(void *, scene, 0x58 + i * 4) = model;
        func_0209a2a4(model, FIELD(void *, scene, 0x48));
    }
    FIELD(void *, scene, 0x54) = func_0209a208(scene, 0x1040, 0x1041, 0x1042,
                                               context, 2);
    FIELD(u16, FIELD(void *, scene, 0x54), 0x42) |= 4;
    FIELD(s32, FIELD(void *, scene, 0x54), 0x44) = -0x5a;
    FIELD(s32, scene, 0xa8) = 0x1e66;
    FIELD(u16, scene, 0xba) = 100;
    func_ov039_0220608c(scene);
    FIELD(u16, scene, 0xc0) = 0x200;
    FIELD(u16, scene, 0xc2) = 0;
    FIELD(s32, scene, 0xc8) = FIELD(s32, scene, 0xcc) = 0;
    FIELD(s32, scene, 0xd0) = FIELD(s32, scene, 0xd4) = 0;
    FIELD(u16, scene, 0xbe) = 0;
    return scene;
}

/*
 * Destroy the final scene's three vectors and base scene state. Model destruction
 * is handled by the base routine. Returns scene; vector and scene ownership state
 * change.
 */
extern "C" void *func_ov039_02205b94(void *scene)
{
    VecFx32Object_Destroy((u8 *)scene + 0xc4);
    VecFx32Object_Destroy((u8 *)scene + 0x94);
    VecFx32Object_Destroy((u8 *)scene + 0x84);
    func_02099fb0(scene);
    return scene;
}
