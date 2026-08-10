#include "tingle/types.h"

/*
 * Represent one short-lived sprite particle with fixed-point position and
 * velocity values.  The particle selects a random sprite frame, travels under
 * constant downward acceleration, and rotates in the direction of emission.
 */

typedef struct ParticleVector {
    u32 field00;
    s32 x04;
    s32 y08;
    s32 z0c;
} ParticleVector;

typedef struct ParticleSpriteConfig {
    u32 field00;
    s32 resource04;
    s32 palette08;
    s32 animation0c;
} ParticleSpriteConfig;

typedef struct BallisticSpriteParticle {
    ParticleVector position00;
    ParticleVector velocity10;
    u8 *sprite20;
    s32 remaining24;
    s32 inactive28;
    u16 angle2c;
    s16 angularVelocity2e;
    s32 randomizedLifetime30;
} BallisticSpriteParticle;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02004fe0(ParticleVector *value);
extern void func_0200500c(ParticleVector *value, s32 x, s32 y, s32 z);
extern void func_02005030(ParticleVector *destination,
                          const ParticleVector *source);
extern void func_02005058(ParticleVector *value);
extern void func_020050a4(ParticleVector *destination,
                          const ParticleVector *source);
extern void func_020050c8(ParticleVector *position,
                          const ParticleVector *velocity);
extern u8 *func_02073fc4(void *owner, s32 resource, s32 palette,
                         s32 animation, s32 mode);
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, s32 frame);
extern void func_02074038(void *owner, void *sprite);
extern u32 genrand_int32(void);
extern u32 func_020be4e4(void);
/* The helper returns quotient in the low word and remainder in the high word. */
extern u64 func_020bf1f8(u32 value, u32 divisor);
#ifdef __cplusplus
}
#endif

/*
 * Copy the initial position, initialize velocity, and create a mode-2 sprite
 * from config offsets 4/8/12.  Select one of seven frames and set sprite flag
 * bit 1.  Two random low bytes choose horizontal speed in [0x800,0x17f0] and
 * vertical speed in [-0x4800,-0x3810]; direction selects the horizontal sign
 * and the opposite rotation sign.  The remainder returned in r1 by
 * func_020bf1f8 chooses randomizedLifetime30 in [15,29].  Return self.
 */
BallisticSpriteParticle *func_02023890(
    BallisticSpriteParticle *self, void *spriteOwner,
    const ParticleSpriteConfig *config, const ParticleVector *position,
    s32 remaining, s32 direction)
{
    ParticleVector temporary;
    u64 division;
    u32 firstRandom;
    u32 secondRandom;
    s32 horizontal;
    s32 vertical;

    func_02005030(&self->position00, position);
    func_02004fe0(&self->velocity10);
    self->remaining24 = remaining;
    self->inactive28 = 0;
    self->angle2c = 0;
    self->angularVelocity2e = 0;
    self->sprite20 = func_02073fc4(spriteOwner, config->resource04,
                                   config->palette08, config->animation0c, 2);
    division = func_020bf1f8(genrand_int32(), 7);
    GraphicsSpriteState_SetAnimationIndex(self->sprite20, (u8)(division >> 32));
    *(u16 *)(self->sprite20 + 0x24) |= 2;

    firstRandom = genrand_int32();
    secondRandom = genrand_int32();
    horizontal = ((firstRandom & 0xff) << 4) + 0x800;
    vertical = ((secondRandom & 0xff) << 4) - 0x4800;
    if (direction == 0) {
        horizontal = -horizontal;
    }
    func_0200500c(&temporary, horizontal, vertical, 0);
    func_020050a4(&self->velocity10, &temporary);
    func_02005058(&temporary);

    if (direction == 0) {
        self->angularVelocity2e = (s16)((func_020be4e4() & 0xff) << 4);
    } else {
        self->angularVelocity2e = (s16)(-((func_020be4e4() & 0xff) << 4));
    }
    division = func_020bf1f8(genrand_int32(), 15);
    self->randomizedLifetime30 = (s32)(division >> 32) + 15;
    return self;
}

/*
 * Release the sprite through its owner at sprite offset zero, destroy velocity
 * and position values, and return self.  The particle storage remains owned by
 * its containing manager.
 */
BallisticSpriteParticle *func_020239e8(BallisticSpriteParticle *self)
{
    func_02074038(*(void **)self->sprite20, self->sprite20);
    func_02005058(&self->velocity10);
    func_02005058(&self->position00);
    return self;
}

/*
 * When active, add velocity to position, add 0x200 fixed-point units of
 * downward acceleration to velocity.y, advance the 16-bit angle, and publish
 * x/y shifted down by 12 plus the angle to sprite offsets 0x2c/0x2e/0x30.
 * Decrement remaining24 and return one once it becomes negative.  An inactive
 * particle (nonzero field 0x28) is unchanged and returns zero.
 */
s32 func_02023a14(BallisticSpriteParticle *self)
{
    if (self->inactive28 != 0) {
        return 0;
    }
    func_020050c8(&self->position00, &self->velocity10);
    self->velocity10.y08 += 0x200;
    self->angle2c = (u16)(self->angle2c + self->angularVelocity2e);
    *(u16 *)(self->sprite20 + 0x2c) = (u16)(self->position00.x04 >> 12);
    *(u16 *)(self->sprite20 + 0x2e) = (u16)(self->position00.y08 >> 12);
    *(u16 *)(self->sprite20 + 0x30) = self->angle2c;
    self->remaining24--;
    return self->remaining24 < 0;
}
