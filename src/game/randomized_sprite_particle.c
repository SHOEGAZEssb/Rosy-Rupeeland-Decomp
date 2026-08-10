#include "tingle/types.h"

/*
 * Simulate a short-lived sprite particle between two FX32 positions.  Each
 * particle receives horizontal spawn jitter and randomized downward velocity,
 * steers relative to its two stored positions, projects through a caller-owned
 * transform, updates OAM coordinates/visibility, and expires after 400 ticks.
 */
typedef struct ParticleVector {
    s32 x;
    s32 y;
    s32 z;
    s32 field_0c;
} ParticleVector;

typedef struct RandomizedSpriteParticle {
    ParticleVector position_00;
    ParticleVector target_10;
    ParticleVector velocity_20;
    ParticleVector steering_30;
    u8 *sprite_40;
    void *owner_44;
    s32 lifetime_48;
} RandomizedSpriteParticle;

#ifdef __cplusplus
extern "C" {
#endif
extern const s16 data_020c9670[];
extern u32 genrand_int32(void);
extern void func_02004fe0(void *);
extern void func_0200500c(void *, s32, s32, s32);
extern void func_02005030(void *, const void *);
extern void func_02005058(void *);
extern void func_020050a4(void *, const void *);
extern void func_020050c8(void *, const void *);
extern void VecFx32_Subtract(void *, const void *, const void *);
extern s32 func_020adcac(const s32 *, const s32 *);
extern s32 func_020adc90(s32, s32);
extern s32 func_020ae024(s32, s32);
extern u8 *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteGroup_ReleaseState(void *, void *);
#ifdef __cplusplus
}
#endif

/*
 * Copy the two input positions, clear velocity/steering, jitter position Y by
 * -16..15 pixels, create a sprite from resource subobject +4, set its frame and
 * affine/visibility bits, seed randomized negative Y velocity, and live 400 ticks.
 */
RandomizedSpriteParticle *func_02028860(RandomizedSpriteParticle *self,
                                        void *owner, u8 *resources,
                                        const ParticleVector *position,
                                        const ParticleVector *target,
                                        s32 frame)
{
    ParticleVector impulse;
    func_02005030(&self->position_00, position);
    func_02005030(&self->target_10, target);
    func_02004fe0(&self->velocity_20);
    func_02004fe0(&self->steering_30);
    self->owner_44 = owner;
    self->lifetime_48 = 0;
    self->position_00.y += ((s32)(genrand_int32() & 0x1f) - 0x10) << 12;
    self->sprite_40 = GraphicsSpriteGroup_CreateStateFromSource(owner, resources + 4, 1);
    GraphicsSpriteState_SetAnimationIndex(self->sprite_40, (u8)frame);
    *(u16 *)(self->sprite_40 + 0x24) |= 6;
    *(u16 *)(self->sprite_40 + 0x28) = 100;
    func_0200500c(&impulse, 0,
                  -0x1000 - (s32)(genrand_int32() & 0x7ff), 0);
    func_020050a4(&self->velocity_20, &impulse);
    func_02005058(&impulse);
    self->lifetime_48 = 400;
    return self;
}

/* Release the sprite and destroy the four embedded vector temporaries. */
RandomizedSpriteParticle *func_0202895c(RandomizedSpriteParticle *self)
{
    GraphicsSpriteGroup_ReleaseState(self->owner_44, self->sprite_40);
    func_02005058(&self->steering_30);
    func_02005058(&self->velocity_20);
    func_02005058(&self->target_10);
    func_02005058(&self->position_00);
    return self;
}

/*
 * Recompute steering from the position pair, apply damped velocity, advance
 * and project the particle, write sprite coordinates, hide it outside the
 * recovered vertical bounds, decrement lifetime, and return one on expiry.
 */
s32 func_02028998(RandomizedSpriteParticle *self, const void *projection)
{
    ParticleVector difference;
    ParticleVector damping;
    ParticleVector projected;
    s32 magnitude;
    s32 angle;
    s32 tableIndex;
    s32 x;
    s32 y;

    VecFx32_Subtract(&difference, &self->target_10, &self->position_00);
    magnitude = func_020adcac(&self->target_10.y, &self->position_00.y);
    magnitude = ((magnitude >> 1) + ((magnitude >> 1) < 0 ? 3 : 0)) >> 14;
    if (magnitude < 1)
        magnitude = 1;
    angle = func_020ae024(difference.z, difference.y) >> 4;
    tableIndex = angle * 2;
    self->steering_30.y =
        func_020adc90(data_020c9670[tableIndex + 1], magnitude << 12);
    self->steering_30.z =
        func_020adc90(data_020c9670[tableIndex], magnitude << 12);
    self->steering_30.x = 0;
    func_020050c8(&self->velocity_20, &self->steering_30);

    func_02004fe0(&damping);
    damping.y = (s32)(((s64)-self->velocity_20.y * 98 + 0x800) >> 12);
    damping.z = (s32)(((s64)-self->velocity_20.z * 98 + 0x800) >> 12);
    func_020050c8(&self->velocity_20, &damping);
    func_020050c8(&self->position_00, &self->velocity_20);

    VecFx32_Subtract(&projected, &self->position_00, projection);
    x = projected.y >> 12;
    y = (projected.z >> 12) - (projected.field_0c >> 12);
    *(u16 *)(self->sprite_40 + 0x2c) = (u16)x;
    *(u16 *)(self->sprite_40 + 0x2e) = (u16)y;
    if (x > -16 && y > -16 && y < 208)
        *(u16 *)(self->sprite_40 + 0x24) &= (u16)~4;
    else
        *(u16 *)(self->sprite_40 + 0x24) |= 4;

    self->lifetime_48--;
    func_02005058(&projected);
    func_02005058(&damping);
    func_02005058(&difference);
    return self->lifetime_48 < 0;
}
