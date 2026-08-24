#include "tingle/field_effect.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Own a rotating 0x308-byte core object and its sprite resources.  During an
 * initial countdown the controller can spawn one short-lived orbiting sprite
 * from a lazily configured descriptor, updates that effect against the camera,
 * jitters the core position for a limited number of frames, and then signals
 * the core's completion phase.
 */

typedef struct ControllerVector {
    u32 field00;
    s32 x04;
    s32 y08;
    s32 z0c;
} ControllerVector;

typedef struct ResourceDescriptor {
    void **vtable00;
    s32 resource04;
    s32 palette08;
    s32 animation0c;
} ResourceDescriptor;

typedef struct TransientOrbitEffect {
    void **vtable00;
    u8 *sprite04;
} TransientOrbitEffect;

typedef struct RotatingCoreEffectController {
    void **vtable00;
    u32 dispatchState;
    u8 *core08;
    ResourceDescriptor *firstDescriptor0c;
    ResourceDescriptor *secondDescriptor10;
    ResourceDescriptor *thirdDescriptor14;
    ControllerVector position18;
    TransientOrbitEffect *effect28;
    ResourceDescriptor *optionalDescriptor2c;
    s16 value30;
    s16 jitterFrames32;
    s16 countdown34;
    u16 stateFlags36;
} RotatingCoreEffectController;

typedef void *(*ObjectDestructor)(void *);
typedef s32 (*ObjectUpdate)(void *);
typedef void (*ObjectCameraUpdate)(void *, const void *);

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6a70;
extern const char data_020d6a90[];
extern const char data_020d6a98[];
extern const char data_020d6aa0[];
extern const s16 data_020c9670[];
extern u8 *gGamePhaseRuntime;

extern void VecFx32Object_Init(ControllerVector *);
extern void VecFx32Object_InitComponents(ControllerVector *, s32, s32, s32);
extern void VecFx32Object_InitCopy(ControllerVector *, const ControllerVector *);
extern void VecFx32Object_Destroy(ControllerVector *);
extern void VecFx32Object_Assign(ControllerVector *, const ControllerVector *);
extern void func_02008378(ControllerVector *, const ControllerVector *,
                          const ControllerVector *);
extern void *AnimationResource_Init(ResourceDescriptor *, s32, s32, s32);
extern void *func_0206b628(void *, void *, ResourceDescriptor *,
                           ResourceDescriptor *, ResourceDescriptor *, s32,
                           s32, s32, s32, s32, s32, s32, s32);
extern void AuxiliaryCore_Destroy(void *);
extern void AuxiliaryCoreSprite_SetVisible(void *, s32);
extern void AuxiliaryCore_ApplyScale(void *, s32, s32);
extern void AuxiliaryCore_UpdateMotion(void *, const ControllerVector *);
extern void *func_0201ebac(void *, const void *, u8 *, s32, s16, s16);
extern void TimedSpritePresentation_SetVisible(void *, s32);
extern const void *ActorMotionAreaFollower_GetPosition(void *);
extern u32 genrand_int32(void);
extern u64 func_020bf1f8(u32, u32);
#ifdef __cplusplus
}
#endif

static void destroy_polymorphic(void *object)
{
    if (object != 0) {
        ((ObjectDestructor)(*(void ***)object)[1])(object);
    }
}

/*
 * Initialize base and copy position.  Set effect/optional descriptor null,
 * value30=0x100, jitterFrames32=30, countdown34 from the fourth register
 * argument, and clear stateFlags36.  Allocate descriptors for resource triples
 * (0x1367,0x1140,0x1368), (0x1357,0x1001,0x1358), and
 * (0x1359,0x1001,0x135a).  Allocate/construct the 0x308-byte core with those
 * descriptors, position coordinates, fixed values 0,0,-0x18000, and the two
 * stack arguments; enable it through AuxiliaryCoreSprite_SetVisible and return self.
 */
RotatingCoreEffectController *func_02025300(
    RotatingCoreEffectController *self, const ControllerVector *position,
    void *owner, s32 countdown, s32 argument5, s32 argument6)
{
    FieldEffect_Init(self);
    self->vtable00 = (void **)data_020d6a70;
    VecFx32Object_InitCopy(&self->position18, position);
    self->effect28 = 0;
    self->optionalDescriptor2c = 0;
    self->value30 = 0x100;
    self->jitterFrames32 = 30;
    self->countdown34 = (s16)countdown;
    self->stateFlags36 = 0;

    self->firstDescriptor0c = (ResourceDescriptor *)Heap_Alloc(
        0x10, data_020d6a90, 4, &gHeapContext);
    if (self->firstDescriptor0c)
        AnimationResource_Init(self->firstDescriptor0c, 0x1367, 0x1140, 0x1368);
    self->secondDescriptor10 = (ResourceDescriptor *)Heap_Alloc(
        0x10, data_020d6a98, 4, &gHeapContext);
    if (self->secondDescriptor10)
        AnimationResource_Init(self->secondDescriptor10, 0x1357, 0x1001, 0x1358);
    self->thirdDescriptor14 = (ResourceDescriptor *)Heap_Alloc(
        0x10, data_020d6a98, 4, &gHeapContext);
    if (self->thirdDescriptor14)
        AnimationResource_Init(self->thirdDescriptor14, 0x1359, 0x1001, 0x135a);

    self->core08 = (u8 *)Heap_Alloc(0x308, data_020d6a90, 4, &gHeapContext);
    if (self->core08) {
        self->core08 = (u8 *)func_0206b628(
            self->core08, owner, self->firstDescriptor0c,
            self->secondDescriptor10, self->thirdDescriptor14,
            self->position18.x04, self->position18.y08,
            self->position18.z0c, 0, 0, -0x18000, argument5, argument6);
    }
    AuxiliaryCoreSprite_SetVisible(self->core08, 1);
    return self;
}

/*
 * Destroy the transient effect and optional descriptor, tear down/free the
 * core, destroy all three fixed descriptors, destroy position/base, and return
 * self.  Descriptor and effect destruction dispatch through vtable slot one.
 */
RotatingCoreEffectController *func_020254a4(
    RotatingCoreEffectController *self)
{
    self->vtable00 = (void **)data_020d6a70;
    destroy_polymorphic(self->effect28);
    destroy_polymorphic(self->optionalDescriptor2c);
    if (self->core08) {
        AuxiliaryCore_Destroy(self->core08);
        Heap_Free(self->core08);
    }
    destroy_polymorphic(self->firstDescriptor0c);
    destroy_polymorphic(self->secondDescriptor10);
    destroy_polymorphic(self->thirdDescriptor14);
    VecFx32Object_Destroy(&self->position18);
    FieldEffect_DestroyBase(self);
    return self;
}

/* Perform func_020254a4 teardown, free self, and return its old address. */
RotatingCoreEffectController *func_02025564(
    RotatingCoreEffectController *self)
{
    func_020254a4(self);
    Heap_Free(self);
    return self;
}

/* Set bit 2 in the core halfword at recovered offset 0x2ee. */
void func_0202562c(RotatingCoreEffectController *self)
{
    *(u16 *)(self->core08 + 0x2ee) |= 4;
}

/* Store the recovered signed control value at offset 0x30. */
void func_02025644(RotatingCoreEffectController *self, s32 value)
{
    self->value30 = (s16)value;
}

/*
 * Once only, set stateFlags36 bit 15, allocate the optional 0x10-byte
 * descriptor, construct it from the three supplied IDs, and store it at 0x2c.
 */
void func_0202564c(RotatingCoreEffectController *self,
                   s32 resource, s32 palette, s32 animation)
{
    if ((self->stateFlags36 & 0x8000) != 0) return;
    self->stateFlags36 |= 0x8000;
    self->optionalDescriptor2c = (ResourceDescriptor *)Heap_Alloc(
        0x10, data_020d6a98, 4, &gHeapContext);
    if (self->optionalDescriptor2c)
        AnimationResource_Init(self->optionalDescriptor2c,
                      resource, palette, animation);
}

/*
 * In state zero, decrement countdown.  While positive, an available optional
 * descriptor and empty effect slot spawn one 0x50-byte free-orbit timed sprite:
 * its position combines position18 with (0,-0x18000,0), its resource tuple is
 * derived from core offset 4 -> offset 0x34 plus optional descriptor fields,
 * its angular position follows core offset 0x2d8, and random bits select sprite
 * flags 0x80/0x40.  At countdown expiry, enter state one, set core flag bit 1,
 * and destroy any active effect.  State one forces value30=8 and returns one
 * when core halfword 0x2de becomes zero.
 *
 * Independently update/destroy the effect through vtable slots 3/1 or pass the
 * camera to slot 4, apply value30 through AuxiliaryCore_ApplyScale, advance core angle
 * 0x2d8 by 0x180 with 16-bit wrapping, copy position18, add random +/-4-pixel
 * x/y jitter while jitterFrames32 remains, publish it through AuxiliaryCore_UpdateMotion,
 * and otherwise return zero.
 */
s32 func_020256b4(RotatingCoreEffectController *self)
{
    ControllerVector position;
    s32 state = ((s32)self->stateFlags36 << 17) >> 17;

    if (state == 0) {
        if (self->countdown34 > 0) {
            self->countdown34--;
            if (self->optionalDescriptor2c != 0 && self->effect28 == 0) {
                ControllerVector first;
                ControllerVector offset;
                ControllerVector combined;
                u32 config[4];
                u8 *resourceRecord;
                u64 division;
                u32 randomFlags;
                s32 angle;

                VecFx32Object_Init(&first);
                VecFx32Object_Init(&position);
                resourceRecord = *(u8 **)(
                    *(u8 **)(self->core08 + 4) + 0x34);
                config[0] = *(u32 *)resourceRecord;
                config[1] = (u32)self->optionalDescriptor2c->resource04;
                config[2] = (u32)self->optionalDescriptor2c->palette08;
                config[3] = (u32)self->optionalDescriptor2c->animation0c;
                VecFx32Object_Assign(&first, &self->position18);
                angle = *(s32 *)(self->core08 + 0x2d8) >> 4;
                first.x04 += data_020c9670[angle * 2 + 1] << 4;
                first.y08 += (data_020c9670[angle * 2] << 4) - 0x18000;
                VecFx32Object_InitComponents(&offset, 0, -0x18000, 0);
                func_02008378(&combined, &self->position18, &offset);
                VecFx32Object_Destroy(&offset);
                self->effect28 = (TransientOrbitEffect *)Heap_Alloc(
                    0x50, data_020d6aa0, 4, &gHeapContext);
                if (self->effect28) {
                    division = func_020bf1f8(genrand_int32(), 5);
                    self->effect28 = (TransientOrbitEffect *)func_0201ebac(
                        self->effect28, &combined, (u8 *)config,
                        (u8)(division >> 32), -64, resourceRecord[0x3a]);
                }
                randomFlags = genrand_int32();
                if (randomFlags & 1) *(u16 *)(self->effect28->sprite04 + 0x24) |= 0x80;
                if (randomFlags & 2) *(u16 *)(self->effect28->sprite04 + 0x24) |= 0x40;
                TimedSpritePresentation_SetVisible(self->effect28, 1);
                VecFx32Object_Destroy(&combined);
                VecFx32Object_Destroy(&position);
                VecFx32Object_Destroy(&first);
            }
        } else {
            self->stateFlags36 = (u16)((self->stateFlags36 & 0x8000) | 1);
            *(u16 *)(self->core08 + 0x2ee) |= 2;
            if (self->effect28) destroy_polymorphic(self->effect28);
            self->effect28 = 0;
        }
    } else if (state == 1) {
        self->value30 = 8;
        if (*(s16 *)(self->core08 + 0x2de) == 0) return 1;
    }

    if (self->effect28 != 0) {
        if (((ObjectUpdate)self->effect28->vtable00[3])(self->effect28)) {
            destroy_polymorphic(self->effect28);
            self->effect28 = 0;
        } else {
            ((ObjectCameraUpdate)self->effect28->vtable00[4])(
                self->effect28, ActorMotionAreaFollower_GetPosition(gGamePhaseRuntime + 0x2fbc));
        }
    }
    AuxiliaryCore_ApplyScale(self->core08, self->value30, -1);
    *(s32 *)(self->core08 + 0x2d8) =
        (s16)(*(s32 *)(self->core08 + 0x2d8) + 0x180);
    VecFx32Object_InitCopy(&position, &self->position18);
    if (self->jitterFrames32 > 0) {
        position.x04 += (4 - (s32)(func_020bf1f8(genrand_int32(), 9) >> 32)) << 12;
        position.y08 += (4 - (s32)(func_020bf1f8(genrand_int32(), 9) >> 32)) << 12;
        self->jitterFrames32--;
    }
    AuxiliaryCore_UpdateMotion(self->core08, &position);
    VecFx32Object_Destroy(&position);
    return 0;
}

/* Store the remaining jitter-frame count at recovered offset 0x32. */
void func_02025a3c(RotatingCoreEffectController *self, s32 frames)
{
    self->jitterFrames32 = (s16)frames;
}
