#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Animate a signed sprite-number group along a sampled presentation track.  Two
 * auxiliary track offsets are chained into the base track for 60 frames; their
 * signs are chosen from the initial vertical position so motion stays onscreen.
 */

typedef struct TrackValue { u8 bytes[0x10]; } TrackValue;
typedef struct SpriteNumberMotionPresentation {
    void **vtable; u32 field04; s32 sampleArgument08; TrackValue track0c;
    TrackValue firstOffset1c; TrackValue secondOffset2c;
    void *numberGroup3c; s32 timer40;
} SpriteNumberMotionPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6658[];
extern const char gSpriteNumberGroupAllocationTag[];
extern void *func_0201e250(void *);
extern void *func_0201e28c(void *);
extern void VecFx32Object_InitCopy(void *,const void *);
extern void VecFx32Object_Init(void *);
extern void VecFx32Object_InitComponents(void *,s32,s32,s32);
extern void VecFx32Object_Assign(void *,const void *);
extern void VecFx32Object_Destroy(void *);
extern void VecFx32Object_Add(void *,const void *);
extern void VecFx32_Subtract(void *,const void *,s32);
extern void func_02056f00(void *,const void *);
extern void *Actor_GetCollection(void *);
extern void *ActorCollection_GetSpriteOwner(void *);
extern void *func_0202293c(void *,void *,s32);
extern void func_02022b70(void *);
extern void func_02022c30(void *,s32,s32);
extern void func_02022c80(void *,s32);
#ifdef __cplusplus
}
#endif

/*
 * Initialize base and copy config track at 0x18, adding 0x10000 to its recovered
 * component at self+0x18. Initialize two zero tracks, allocate a 0x24-byte signed
 * number group using the resource derived from config, hide it when value is zero,
 * sample initial position, and place it. Configure the two Z-only offsets from
 * the two stack inputs, negating both when initial Y is at most 0x40; clear the
 * timer, destroy temporaries, and return self.
 */
SpriteNumberMotionPresentation *func_02022cb0(
    SpriteNumberMotionPresentation *self,s32 sampleArgument,const u8 *config,
    s32 value,s32 firstOffset,s32 secondOffset)
{
    TrackValue sampled,position,temp;
    void *group=0,*owner;
    func_0201e250(self);self->vtable=(void **)data_020d6658;
    self->sampleArgument08=sampleArgument;VecFx32Object_InitCopy(&self->track0c,config+0x18);
    VecFx32Object_Init(&self->firstOffset1c);VecFx32Object_Init(&self->secondOffset2c);
    *(s32 *)&self->track0c.bytes[0x0c]+=0x10000;
    group=Heap_Alloc(0x24,gSpriteNumberGroupAllocationTag,4,&gHeapContext);
    if(group){owner=ActorCollection_GetSpriteOwner(Actor_GetCollection((void *)config));func_0202293c(group,owner,value);}
    self->numberGroup3c=group;if(value==0)func_02022c80(group,0);
    VecFx32_Subtract(&sampled,&self->track0c,self->sampleArgument08);
    func_02056f00(&position,&sampled);VecFx32Object_Destroy(&sampled);
    func_02022c30(group,*(s32 *)&position.bytes[4]>>12,*(s32 *)&position.bytes[8]>>12);
    if((*(s32 *)&position.bytes[8]>>12)>0x40) {
        VecFx32Object_InitComponents(&temp,0,0,firstOffset);VecFx32Object_Assign(&self->firstOffset1c,&temp);VecFx32Object_Destroy(&temp);
        VecFx32Object_InitComponents(&temp,0,0,secondOffset);VecFx32Object_Assign(&self->secondOffset2c,&temp);VecFx32Object_Destroy(&temp);
    } else {
        VecFx32Object_InitComponents(&temp,0,0,-firstOffset);VecFx32Object_Assign(&self->firstOffset1c,&temp);VecFx32Object_Destroy(&temp);
        VecFx32Object_InitComponents(&temp,0,0,-secondOffset);VecFx32Object_Assign(&self->secondOffset2c,&temp);VecFx32Object_Destroy(&temp);
    }
    self->timer40=0;VecFx32Object_Destroy(&position);return self;
}

static SpriteNumberMotionPresentation *teardown_number_motion(SpriteNumberMotionPresentation *self)
{
    self->vtable=(void **)data_020d6658;
    if(self->numberGroup3c){func_02022b70(self->numberGroup3c);Heap_Free(self->numberGroup3c);}
    VecFx32Object_Destroy(&self->secondOffset2c);VecFx32Object_Destroy(&self->firstOffset1c);
    VecFx32Object_Destroy(&self->track0c);func_0201e28c(self);return self;
}

/* Destroy/free the number group and all three tracks, tear down base, and return self. */
SpriteNumberMotionPresentation *func_02022e70(SpriteNumberMotionPresentation *self)
{ return teardown_number_motion(self); }

/* Perform func_02022e70 teardown, free self, and return its old address. */
SpriteNumberMotionPresentation *func_02022ec8(SpriteNumberMotionPresentation *self)
{ teardown_number_motion(self);Heap_Free(self);return self; }

/*
 * Sample/transform the current track and reposition the number group. Add the
 * first offset into the base track and the second into the first offset, advance
 * timer, destroy the temporary, and return whether 60 frames have elapsed.
 */
s32 func_02022f28(SpriteNumberMotionPresentation *self)
{
    TrackValue sampled,position;
    VecFx32_Subtract(&sampled,&self->track0c,self->sampleArgument08);
    func_02056f00(&position,&sampled);VecFx32Object_Destroy(&sampled);
    func_02022c30(self->numberGroup3c,*(s32 *)&position.bytes[4]>>12,*(s32 *)&position.bytes[8]>>12);
    VecFx32Object_Add(&self->track0c,&self->firstOffset1c);
    VecFx32Object_Add(&self->firstOffset1c,&self->secondOffset2c);
    self->timer40++;VecFx32Object_Destroy(&position);return self->timer40>=60;
}
