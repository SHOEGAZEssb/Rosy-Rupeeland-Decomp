#include "tingle/types.h"

/*
 * Control a sprite that follows a sampled motion path while rising and later
 * retracting.  The object owns sprite, collision/oscillation, and path state,
 * embeds the recovered motion-delta value, and writes final coordinates and
 * scale fields directly to the sprite state.
 */

typedef struct PresentationValue {
    u8 bytes[0x10];
} PresentationValue;

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
    u8 path1c[0x30];
    SpriteMotionDelta motion4c;
    s32 offset5c;
    s32 systemTime60;
} RisingSpriteMotionController;

#ifdef __cplusplus
extern "C" {
#endif
extern u8 gSystemState[];
extern void ActorMotionTriple_Clear(void *state);
extern void VecFx32Triple_Init(void *path);
extern void VecFx32Triple_Destroy(void *value);
extern void func_0200500c(PresentationValue *value, s32 x, s32 y, s32 z);
extern void func_02005058(PresentationValue *value);
extern void func_02008378(PresentationValue *destination, s32 argument,
                          PresentationValue *source);
extern void VecFx32Triple_InitWithValues(void *destination, s32 first,
                          PresentationValue *source, s32 second);
extern void VecFx32Triple_Assign(void *path, void *source);
extern void func_0200964c(void *value, s32 first, s32 second, s32 third);
extern void ActorMotionTriple_Assign(void *state, void *source);
extern s32 func_020096f0(void *state, s32 time, s32 mode);
extern void VecFx32Bezier_Evaluate3D(void *destination, void *path, s32 offset);
extern void VecFx32_Subtract(PresentationValue *destination, void *source,
                          s32 argument);
extern void func_02056f00(PresentationValue *destination,
                          PresentationValue *source);
extern u8 *func_02073fc4(void *owner, s32 first, s32 second, s32 third,
                         s32 mode);
extern void func_02072b68(void *sprite, s32 value);
extern void func_02074038(void *owner, void *sprite);
extern void func_02020364(SpriteMotionDelta *self);
extern SpriteMotionDelta *func_02020374(SpriteMotionDelta *self, s32 first,
                                        s32 second, s32 scale);
extern void func_020203b0(SpriteMotionDelta *self,
                          const SpriteMotionDelta *source);
#ifdef __cplusplus
}
#endif

s32 func_020206e8(SpriteMotionDelta *self);

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
RisingSpriteMotionController *func_020203e4(
    RisingSpriteMotionController *self, void *spriteOwner, s32 unused,
    const s32 *spriteConfig, s32 pathArgument)
{
    PresentationValue value60;
    PresentationValue value50;
    u8 pathValue20[0x30];
    SpriteMotionDelta motion;
    u8 oscillationValue[0x0c];

    (void)unused;
    self->sprite00 = 0;
    self->spriteOwner04 = spriteOwner;
    self->state08 = 0;
    ActorMotionTriple_Clear(self->oscillation0c);
    self->frame18 = 0;
    VecFx32Triple_Init(self->path1c);
    func_02020364(&self->motion4c);
    self->offset5c = 0;
    self->systemTime60 = *(s32 *)(gSystemState + 0x64);
    func_0200500c(&value60, 0, 0, 0x46000);
    func_02008378(&value50, pathArgument, &value60);
    VecFx32Triple_InitWithValues(pathValue20, pathArgument, &value50, pathArgument);
    VecFx32Triple_Assign(self->path1c, pathValue20);
    VecFx32Triple_Destroy(pathValue20);
    func_02005058(&value50);
    func_02005058(&value60);
    func_02020374(&motion, 0x100000, 0x2000, 0x78);
    func_020203b0(&self->motion4c, &motion);
    self->sprite00 = func_02073fc4(spriteOwner, spriteConfig[0],
                                   spriteConfig[1], spriteConfig[2], 2);
    func_02072b68(self->sprite00, 0);
    *(u16 *)(self->sprite00 + 0x24) &= (u16)~8;
    *(u16 *)(self->sprite00 + 0x24) |= 4;
    *(u16 *)(self->sprite00 + 0x24) |= 2;
    *(u16 *)(self->sprite00 + 0x36) = 0x40;
    *(s16 *)(self->sprite00 + 0x32) = 2;
    *(s16 *)(self->sprite00 + 0x34) = 2;
    self->sprite00[0x3a] = 1;
    func_0200964c(oscillationValue, 0x10000, -0x10000, 60);
    ActorMotionTriple_Assign(self->oscillation0c, oscillationValue);
    return self;
}

/* Release the owned sprite, destroy path1c, and return self. */
RisingSpriteMotionController *func_02020558(
    RisingSpriteMotionController *self)
{
    func_02074038(self->spriteOwner04, self->sprite00);
    VecFx32Triple_Destroy(self->path1c);
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
s32 func_0202057c(RisingSpriteMotionController *self, s32 argument)
{
    s32 scale;
    s32 x;
    s32 y;
    u8 pathSample[0x10];
    PresentationValue sampled;
    PresentationValue transformed;
    u8 oscillationSample[0x0c];

    if (self->state08 == 0) {
        self->offset5c += 0x22;
        func_020206e8(&self->motion4c);
        self->frame18++;
    } else if (self->state08 == 2) {
        self->offset5c -= 0x22;
        if (self->offset5c < 0) {
            return 1;
        }
        func_020206e8(&self->motion4c);
    }
    scale = (self->motion4c.second04 +
             func_020096f0(self->oscillation0c,
                           *(s32 *)(gSystemState + 0x64), 0)) >> 12;
    if (scale <= 2) {
        scale = 2;
    }
    func_0200964c(oscillationSample, -scale << 6, scale << 6, 0xc8);
    VecFx32Bezier_Evaluate3D(pathSample, self->path1c, self->offset5c);
    VecFx32_Subtract(&sampled, pathSample, argument);
    func_02056f00(&transformed, &sampled);
    func_02005058(&sampled);
    func_02005058((PresentationValue *)pathSample);
    *(s32 *)&transformed.bytes[4] +=
        func_020096f0(oscillationSample,
                      *(s32 *)(gSystemState + 0x64) + self->systemTime60, 0);
    x = *(s32 *)&transformed.bytes[4] >> 12;
    y = *(s32 *)&transformed.bytes[8] >> 12;
    *(s16 *)(self->sprite00 + 0x2c) = (s16)x;
    *(s16 *)(self->sprite00 + 0x2e) = (s16)y;
    *(u16 *)(self->sprite00 + 0x24) &= (u16)~4;
    *(s16 *)(self->sprite00 + 0x32) = (s16)(scale + 0x20);
    *(s16 *)(self->sprite00 + 0x34) = (s16)(scale + 0x20);
    func_02005058(&transformed);
    return 0;
}

/*
 * Advance an active motion delta.  State one decrements scale0c; once it is
 * negative, copy first00 to second04, set state two, and return zero.  Otherwise
 * add delta08 to second04 and return one.  Inactive and finished records return
 * zero.  The switch's explicit state-two compare is preserved from retail.
 */
s32 func_020206e8(SpriteMotionDelta *self)
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
void func_02020754(RisingSpriteMotionController *self, s32 state)
{
    SpriteMotionDelta motion;

    self->state08 = state;
    if (state == 2) {
        func_02020374(&motion, 0, self->motion4c.second04, 0x78);
        func_020203b0(&self->motion4c, &motion);
    }
}
