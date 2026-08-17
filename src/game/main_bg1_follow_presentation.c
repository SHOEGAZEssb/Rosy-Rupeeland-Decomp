#include "tingle/graphics_resources.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Update main-engine BG1 scroll from a retained scene target and install the
 * BG resource/palette state used by that view.  The presentation object is a
 * 0x0c-byte timed-presentation derivative; resource setup also writes the DS
 * BG1 control and display-mode registers.
 */
typedef struct MainBg1FollowPresentation {
    void **vtable_00;
    u32 baseFlags_04;
    u8 *target_08;
} MainBg1FollowPresentation;

typedef struct BgResourceRecord {
    u16 resource0;
    u16 resource1;
    u16 resource2;
    u8 remainder[10];
} BgResourceRecord;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020de7e4;
extern const char data_020de804[];
extern u8 *data_021052fc;
extern void *data_020f4e18;
extern void *gMainBgPaletteBuffer;
extern void TimedSpritePresentation_InitBase(void *);
extern void func_0201e28c(void *);
extern void PresentationList_AppendObject(void *, void *);
extern const u8 *GamePhaseGraphicsMetadata_GetByIndex(s32);
extern void *ActorMotionAreaFollower_GetPosition(void *);
extern void VecFx32Object_InitCopy(void *, const void *);
extern void func_02008740(void *, const void *);
extern void VecFx32Object_Add(void *, const void *);
extern void VecFx32Object_Destroy(void *);
extern void BgScroll_SetMainBg1(s32, s32);
extern void func_02070f80(void *, s32);
extern void func_020b44e8(void);
extern void *GraphicsBgResourceData_GetDecoded(void *);
extern void PaletteBuffer_Write(void *, const void *, s32, s32);
void func_02028684(MainBg1FollowPresentation *);
#ifdef __cplusplus
}
#endif

/* Initialize the presentation base, retain the target, install its vtable, and set up BG1. */
MainBg1FollowPresentation *func_02028544(MainBg1FollowPresentation *self,
                                         void *target)
{
    TimedSpritePresentation_InitBase(self);
    self->vtable_00 = (void **)data_020de7e4;
    self->target_08 = (u8 *)target;
    func_02028684(self);
    return self;
}

/* Tear down the presentation base and return self; the target is borrowed. */
MainBg1FollowPresentation *func_02028574(MainBg1FollowPresentation *self)
{
    func_0201e28c(self);
    return self;
}

/* Tear down, free the presentation, and return its old address. */
MainBg1FollowPresentation *func_02028588(MainBg1FollowPresentation *self)
{
    func_0201e28c(self);
    Heap_Free(self);
    return self;
}

/*
 * Sample the target position, halve its X/Y components, transform the target's
 * offset-0x44 vector into the same space, subtract it, and publish integer
 * FX32 coordinates to main BG1 scroll. Return zero to keep the worker active.
 */
s32 func_020285a4(MainBg1FollowPresentation *self)
{
    s32 sampled[4];
    s32 transformed[4];
    VecFx32Object_InitCopy(sampled, ActorMotionAreaFollower_GetPosition(self->target_08));
    sampled[1] = (sampled[1] + (sampled[1] < 0)) / 2;
    sampled[2] = (sampled[2] + (sampled[2] < 0)) / 2;
    func_02008740(transformed, self->target_08 + 0x44);
    VecFx32Object_Add(sampled, transformed);
    VecFx32Object_Destroy(transformed);
    BgScroll_SetMainBg1(sampled[1] >> 12, sampled[2] >> 12);
    VecFx32Object_Destroy(sampled);
    return 0;
}

/* Allocate/construct a 0x0c-byte follower and enqueue it at global offset 0x2f7c. */
void func_02028630(void *target)
{
    void *manager = data_021052fc + 0x2f7c;
    MainBg1FollowPresentation *self =
        (MainBg1FollowPresentation *)Heap_Alloc(
            sizeof(MainBg1FollowPresentation), data_020de804, 4,
            &gHeapContext);
    if (self)
        self = func_02028544(self, target);
    PresentationList_AppendObject(manager, self);
}

/*
 * Load resource-table entry ten into a temporary set, configure resource two,
 * transfer its palette to offset 0x1e0, select BG1 character/screen settings
 * through REG_BG1CNT, force display BG mode two, and release the temporary set.
 */
void func_02028684(MainBg1FollowPresentation *self)
{
    const BgResourceRecord *record =
        (const BgResourceRecord *)GamePhaseGraphicsMetadata_GetByIndex(10);
    GraphicsResourceSet resources;
    u16 control;
    u32 display;
    (void)self;
    GraphicsResourceSet_Init(&resources);
    GraphicsResourceSet_Load(&resources, data_020f4e18, record->resource0,
                             record->resource1, record->resource2);
    func_02070f80(resources.resource2, 15);
    func_020b44e8();
    control = *(volatile u16 *)0x0400000a;
    control = (control & 0x43) | 0x1a08;
    control = (control & ~3) | 3;
    *(volatile u16 *)0x0400000a = control;
    func_02072048(&resources, 1, 0x1e0);
    PaletteBuffer_Write(gMainBgPaletteBuffer, GraphicsBgResourceData_GetDecoded(resources.resource1),
                        0x1e0, 0x20);
    display = *(volatile u32 *)0x04000000;
    display = (display & ~0x1f00u) |
              ((((display & 0x1f00u) >> 8) | 2) << 8);
    *(volatile u32 *)0x04000000 = display;
    GraphicsResourceSet_Destroy(&resources);
}

/* Reinstall BG resources unless callback mode one indicates no reset is needed. */
void func_02028764(MainBg1FollowPresentation *self, s32 mode)
{
    if (mode != 1)
        func_02028684(self);
}
