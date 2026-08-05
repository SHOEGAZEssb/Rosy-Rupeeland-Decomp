#include "tingle/heap.h"
#include "tingle/types.h"

/* Implement the base timed sprite presentation used by several runtime effects. */

typedef struct PresentationTrack { u8 bytes[0x10]; } PresentationTrack;
typedef struct TimedSpritePresentation {
    void *vtable;
    u8 *sprite;
    PresentationTrack first08;
    PresentationTrack second18;
    s32 remaining28;
} TimedSpritePresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6248;
extern void *data_020d6098;
extern void func_0200500c(PresentationTrack *track,s32 first,s32 second,s32 third);
extern void func_02005058(void *track);
extern void func_020050c8(PresentationTrack *first,PresentationTrack *second);
extern void func_020066a4(void *output,PresentationTrack *track,s32 argument);
extern u8 *func_02073fc4(u32 first,u32 second,u32 third,u32 fourth,u32 fifth);
extern void func_02074038(void *spriteOwner);
#ifdef __cplusplus
}
#endif

/* Install the base vtable and clear recovered flag bits 0..9; return self. */
void *func_0201e250(void *self)
{
    u32 *words=(u32 *)self;
    words[0]=(u32)data_020d6248;
    words[1]&=~0x3ff;
    return self;
}

/* Base destructor is a recovered no-op and returns self unchanged. */
void *func_0201e274(void *self) { return self; }

/* Free the base object and return its old address. */
void *func_0201e278(void *self) { Heap_Free(self); return self; }

/* Base update is a recovered no-op and returns the incoming value unchanged. */
s32 func_0201e28c(s32 value) { return value; }

/*
 * Initialize two zeroed interpolation tracks, clear the timer, create a sprite
 * from the five recovered config values, set sprite flag 4, and return self.
 */
TimedSpritePresentation *func_0201e290(TimedSpritePresentation *self,u8 *config)
{
    self->vtable=data_020d6098;
    func_0200500c(&self->first08,0,0,0);
    func_0200500c(&self->second18,0,0,0);
    self->remaining28=0;
    self->sprite=func_02073fc4(*(u32 *)(config+0),*(u32 *)(config+4),
        *(u32 *)(config+8),*(u32 *)(config+0xc),*(u32 *)(config+0x34)&0xff);
    *(u16 *)(self->sprite+0x24)|=4;
    return self;
}

/* Release the sprite owner and both tracks, then return self without freeing it. */
TimedSpritePresentation *func_0201e308(TimedSpritePresentation *self)
{
    self->vtable=data_020d6098;
    func_02074038(*(void **)self->sprite);
    func_02005058(&self->second18);
    func_02005058(&self->first08);
    return self;
}

/* Perform func_0201e308's teardown, free self, and return its old address. */
TimedSpritePresentation *func_0201e340(TimedSpritePresentation *self)
{
    self->vtable=data_020d6098;
    func_02074038(*(void **)self->sprite);
    func_02005058(&self->second18);
    func_02005058(&self->first08);
    Heap_Free(self);
    return self;
}

/* Duplicate non-freeing teardown retained for its distinct virtual-table slot. */
TimedSpritePresentation *func_0201e380(TimedSpritePresentation *self)
{
    self->vtable=data_020d6098;
    func_02074038(*(void **)self->sprite);
    func_02005058(&self->second18);
    func_02005058(&self->first08);
    return self;
}

/* Clear sprite flag 4 when enabled is nonzero, otherwise set it. */
void func_0201e3b8(TimedSpritePresentation *self,s32 enabled)
{
    if(enabled) *(u16 *)(self->sprite+0x24)&=~4;
    else *(u16 *)(self->sprite+0x24)|=4;
}

/*
 * Decrement the lifetime; once negative, hide via func_0201e3b8 and return one.
 * Otherwise advance the tracks, sample a fixed-point position, copy its X/Y
 * integer parts to sprite offsets 0x2c/0x2e, destroy the sample, and return zero.
 */
s32 func_0201e3d8(TimedSpritePresentation *self,s32 argument)
{
    s32 sample[4];
    self->remaining28--;
    if(self->remaining28<0){func_0201e3b8(self,0);return 1;}
    func_020050c8(&self->first08,&self->second18);
    func_020066a4(sample,&self->first08,argument);
    *(u16 *)(self->sprite+0x2c)=(u16)(sample[1]>>12);
    *(u16 *)(self->sprite+0x2e)=(u16)(sample[2]>>12);
    func_02005058(sample);
    return 0;
}
