#include "tingle/types.h"
#include "tingle/vec_fx32_triple.h"

/*
 * Control a sprite that follows a sampled motion path while rising and later
 * retracting.  The object owns sprite, collision/oscillation, and path state,
 * embeds the recovered motion-delta value, and writes final coordinates and
 * scale fields directly to the sprite state.
 */

typedef struct SpriteMotionDelta {
    s32 first00;
    s32 second04;
    s32 delta08;
    s16 scale0c;
    u16 active0e;
} SpriteMotionDelta;

typedef struct RisingSpriteMotionController {
    u8 *sprite00;
    void *spriteOwner04;
    s32 state08;
    u8 oscillation0c[0x0c];
    s32 frame18;
    VecFx32Triple path1c;
    SpriteMotionDelta motion4c;
    s32 offset5c;
    s32 systemTime60;
} RisingSpriteMotionController;

#ifdef __cplusplus
extern "C" {
#endif
extern u8 gSystemState[];
extern void ActorMotionTriple_Clear(void *state);
extern void func_02008378(VecFx32Object *destination,
                          const VecFx32Object *left,
                          const VecFx32Object *right);
extern void ActorMotionOscillation_InitInterval(void *value, s32 first, s32 second, s32 third);
extern void ActorMotionTriple_Assign(void *state, void *source);
extern s32 ActorMotionOscillation_Sample(void *state, s32 time, s32 mode);
extern void VecFx32_Subtract(VecFx32Object *destination, void *source,
                          s32 argument);
extern void func_02056f00(VecFx32Object *destination,
                          VecFx32Object *source);
extern u8 *GraphicsSpriteGroup_CreateState(void *owner, s32 first, s32 second, s32 third,
                         s32 mode);
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, s32 value);
extern void GraphicsSpriteGroup_ReleaseState(void *owner, void *sprite);
extern void SpriteMotionDelta_Init(SpriteMotionDelta *self);
extern SpriteMotionDelta *SpriteMotionDelta_Configure(SpriteMotionDelta *self,
                                                       s32 first, s32 second,
                                                       s32 scale);
extern void SpriteMotionDelta_Copy(SpriteMotionDelta *self,
                          const SpriteMotionDelta *source);
#ifdef __cplusplus
}
#endif

s32 SpriteMotionDelta_Step(SpriteMotionDelta *self);

/*
 * Initialize the recovered oscillation/path helpers and a zeroed controller,
 * snapshot system offset 0x64, and build the path from argument4 through three
 * temporary values.  Configure motion4c from 0x100000 to 0x2000 over 0x78
 * steps, create a mode-2 sprite using the three words at spriteConfig, and set
 * confirmed sprite flags/fields: clear bit 3, set bits 1 and 2, set offset
 * 0x36 to 0x40, offsets 0x32/0x34 to 2, and byte 0x3a to 1.  Finally configure
 * oscillation0c from 0x10000, -0x10000, and 60 and return self.  The recovered
 * third register argument is unused.
 */
RisingSpriteMotionController *RisingSpriteMotionController_Init(
    RisingSpriteMotionController *self, void *spriteOwner, s32 unused,
    const s32 *spriteConfig, const VecFx32Object *path, s32 sequence)
{
    VecFx32Object value60;
    VecFx32Object value50;
    VecFx32Triple pathValue20;
    SpriteMotionDelta motion;
    u8 oscillationValue[0x0c];

    (void)unused;
    (void)sequence;
    self->sprite00 = 0;
    self->spriteOwner04 = spriteOwner;
    self->state08 = 0;
    ActorMotionTriple_Clear(self->oscillation0c);
    self->frame18 = 0;
    VecFx32Triple_Init(&self->path1c);
    SpriteMotionDelta_Init(&self->motion4c);
    self->offset5c = 0;
    self->systemTime60 = *(s32 *)(gSystemState + 0x64);
    VecFx32Object_InitComponents(&value60, 0, 0, 0x46000);
    func_02008378(&value50, path, &value60);
    VecFx32Triple_InitWithValues(&pathValue20, path, &value50, path);
    VecFx32Triple_Assign(&self->path1c, &pathValue20);
    VecFx32Triple_Destroy(&pathValue20);
    VecFx32Object_Destroy(&value50);
    VecFx32Object_Destroy(&value60);
    SpriteMotionDelta_Configure(&motion, 0x100000, 0x2000, 0x78);
    SpriteMotionDelta_Copy(&self->motion4c, &motion);
    self->sprite00 = GraphicsSpriteGroup_CreateState(spriteOwner, spriteConfig[0],
                                   spriteConfig[1], spriteConfig[2], 2);
    GraphicsSpriteState_SetAnimationIndex(self->sprite00, 0);
    *(u16 *)(self->sprite00 + 0x24) &= (u16)~8;
    *(u16 *)(self->sprite00 + 0x24) |= 4;
    *(u16 *)(self->sprite00 + 0x24) |= 2;
    *(u16 *)(self->sprite00 + 0x36) = 0x40;
    *(s16 *)(self->sprite00 + 0x32) = 2;
    *(s16 *)(self->sprite00 + 0x34) = 2;
    self->sprite00[0x3a] = 1;
    ActorMotionOscillation_InitInterval(oscillationValue, 0x10000, -0x10000, 60);
    ActorMotionTriple_Assign(self->oscillation0c, oscillationValue);
    return self;
}

/* Release the owned sprite, destroy path1c, and return self. */
RisingSpriteMotionController *RisingSpriteMotionController_Destroy(
    RisingSpriteMotionController *self)
{
    GraphicsSpriteGroup_ReleaseState(self->spriteOwner04, self->sprite00);
    VecFx32Triple_Destroy(&self->path1c);
    return self;
}

/*
 * Advance state zero upward by 0x22 per call and step motion4c; advance its
 * frame counter as well.  State two retracts by 0x22 and returns one once the
 * offset becomes negative, otherwise stepping motion4c.  All live states then
 * sample the oscillation and path at the supplied argument, combine the result
 * with system time, write sprite coordinates and equal scale fields, clear
 * sprite flag bit 2, destroy temporaries, and return zero.
 */
s32 RisingSpriteMotionController_Update(RisingSpriteMotionController *self,
                                        s32 referencePosition)
{
    s32 scale;
    s32 x;
    s32 y;
    VecFx32Object pathSample;
    VecFx32Object sampled;
    VecFx32Object transformed;
    u8 oscillationSample[0x0c];

    if (self->state08 == 0) {
        self->offset5c += 0x22;
        SpriteMotionDelta_Step(&self->motion4c);
        self->frame18++;
    } else if (self->state08 == 2) {
        self->offset5c -= 0x22;
        if (self->offset5c < 0) {
            return 1;
        }
        SpriteMotionDelta_Step(&self->motion4c);
    }
    scale = (self->motion4c.second04 +
             ActorMotionOscillation_Sample(self->oscillation0c,
                           *(s32 *)(gSystemState + 0x64), 0)) >> 12;
    if (scale <= 2) {
        scale = 2;
    }
    ActorMotionOscillation_InitInterval(oscillationSample, -scale << 6, scale << 6, 0xc8);
    VecFx32Bezier_Evaluate3D(&pathSample, &self->path1c, self->offset5c);
    VecFx32_Subtract(&sampled, &pathSample, referencePosition);
    func_02056f00(&transformed, &sampled);
    VecFx32Object_Destroy(&sampled);
    VecFx32Object_Destroy(&pathSample);
    transformed.value.x +=
        ActorMotionOscillation_Sample(oscillationSample,
                      *(s32 *)(gSystemState + 0x64) + self->systemTime60, 0);
    x = transformed.value.x >> 12;
    y = transformed.value.y >> 12;
    *(s16 *)(self->sprite00 + 0x2c) = (s16)x;
    *(s16 *)(self->sprite00 + 0x2e) = (s16)y;
    *(u16 *)(self->sprite00 + 0x24) &= (u16)~4;
    *(s16 *)(self->sprite00 + 0x32) = (s16)(scale + 0x20);
    *(s16 *)(self->sprite00 + 0x34) = (s16)(scale + 0x20);
    VecFx32Object_Destroy(&transformed);
    return 0;
}

/*
 * Advance an active motion delta.  State one decrements scale0c; once it is
 * negative, copy first00 to second04, set state two, and return zero.  Otherwise
 * add delta08 to second04 and return one.  Inactive and finished records return
 * zero.  The switch's explicit state-two compare is preserved from retail.
 */
s32 SpriteMotionDelta_Step(SpriteMotionDelta *self)
{
    if (self->active0e == 1) {
        self->scale0c--;
        if (self->scale0c < 0) {
            self->second04 = self->first00;
            self->active0e = 2;
            return 0;
        }
        self->second04 += self->delta08;
        return 1;
    }
    if (self->active0e == 2) {
        return 0;
    }
    return 0;
}

/*
 * Store state08.  When selecting state two, replace motion4c with a new motion
 * from its current second04 value to zero over 0x78 steps.
 */
void RisingSpriteMotionController_SetState(RisingSpriteMotionController *self,
                                           s32 state)
{
    SpriteMotionDelta motion;

    self->state08 = state;
    if (state == 2) {
        SpriteMotionDelta_Configure(&motion, 0, self->motion4c.second04, 0x78);
        SpriteMotionDelta_Copy(&self->motion4c, &motion);
    }
}
