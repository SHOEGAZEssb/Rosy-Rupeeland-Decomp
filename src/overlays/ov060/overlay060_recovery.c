#include "tingle/debug_hud_state.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/game_work.h"
#include "tingle/graphics_sprite_group.h"
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/scene.h"
#include "tingle/touch_region.h"

/* Overlay 60 owns the two-choice touch scene created by actor scripts. */
typedef struct Overlay60TouchRegion {
    TouchRegion base;
    GraphicsSpriteState* sprite;
    u8 idleAnimation, pressedAnimation, padding22[2];
} Overlay60TouchRegion;
typedef struct Overlay60Resources {
    GraphicsSpriteGroup* group;
    void* resource[3];
} Overlay60Resources;
typedef struct Overlay60Scene {
    Scene base;
    Overlay60Resources* resources;
    s32 selection, countdown;
    GraphicsSpriteState* sourceSprite;
    s32 mirrorSourceState, firstSound, secondSound;
} Overlay60Scene;
typedef char Overlay60TouchRegionSizeCheck[sizeof(Overlay60TouchRegion) == 0x24
        ? 1
        : -1];
typedef char
    Overlay60ResourcesSizeCheck[sizeof(Overlay60Resources) == 0x10 ? 1 : -1];
typedef char Overlay60SceneSizeCheck[sizeof(Overlay60Scene) == 0x40 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif
extern TouchRegionVTable data_ov060_02210600;
extern SceneVTable data_ov060_02210620;
extern char data_ov060_0221064c[], data_ov060_02210654[];
extern void *data_020f4e18, *data_020f4e14, *gSoundContext;
extern GamePhaseRuntime* data_021052fc;
extern GameWork* gGameWork;
extern void *AnimationResourceState_InitEmbedded(void*), *AnimationResourceState_Destroy(void*);
extern void func_02071ee0(void*, void*, s32, s32, s32);
extern void Sound_PlayDirectSequence(void*, s32, s32);
extern void Sound_FadeDirectSequence(void*, s32, s32, s32);
extern void Sound_Play(void*, s32, s32);
#ifdef __cplusplus
}
#endif

/* Initialize one borrowed touch rectangle and clear its sprite binding. */
Overlay60TouchRegion* func_ov060_0220fd20(
    Overlay60TouchRegion* self, s32 value, const RectS16* bounds)
{
    TouchRegion_Init(&self->base, value, bounds, 1);
    self->base.vtable = &data_ov060_02210600;
    self->sprite = 0;
    self->idleAnimation = 0;
    self->pressedAnimation = 0;
    return self;
}
/* Destroy the inherited touch region without freeing its allocation. */
Overlay60TouchRegion* func_ov060_0220fd54(Overlay60TouchRegion* self)
{
    func_02004b54(self);
    return self;
}
/* Destroy and free one touch region, returning its former address. */
Overlay60TouchRegion* func_ov060_0220fd68(Overlay60TouchRegion* self)
{
    func_02004b54(self);
    Heap_Free(self);
    return self;
}
/* Return the horizontal midpoint of a borrowed signed rectangle. */
s16 func_ov060_0220fdd8(const RectS16* b)
{
    s16 d = (s16)(b->right - b->left);
    return (s16)(b->left + d / 2);
}
/* Return the vertical midpoint of a borrowed signed rectangle. */
s16 func_ov060_0220fdf8(const RectS16* b)
{
    s16 d = (s16)(b->bottom - b->top);
    return (s16)(b->top + d / 2);
}
/* Bind a sprite and animations, center it, and enable sprite flag 2. */
void func_ov060_0220fd84(Overlay60TouchRegion* self,
    GraphicsSpriteState* sprite, u8 idle, u8 pressed)
{
    self->sprite = sprite;
    self->idleAnimation = idle;
    self->pressedAnimation = pressed;
    GraphicsSpriteState_SetAnimationIndex(sprite, idle);
    sprite->screenX = func_ov060_0220fdd8(&self->base.bounds);
    sprite->screenY = func_ov060_0220fdf8(&self->base.bounds);
    sprite->flags |= 2;
}
/* Begin a press, select the pressed animation, and clear sprite flag 2. */
void func_ov060_0220fe18(Overlay60TouchRegion* self)
{
    TouchRegion_BeginPress(&self->base);
    GraphicsSpriteState_SetAnimationIndex(self->sprite, self->pressedAnimation);
    self->sprite->flags &= 0xfffd;
}
/* Forward release processing to the inherited touch-region boundary. */
void func_ov060_0220fe44(Overlay60TouchRegion* self)
{
    TouchRegion_EndPress(&self->base);
}
/* Move a region without resizing it and recenter its borrowed sprite. */
void func_ov060_0220fe50(Overlay60TouchRegion* self, s32 left, s32 top)
{
    s16 w = (s16)(self->base.bounds.right - self->base.bounds.left),
        h = (s16)(self->base.bounds.bottom - self->base.bounds.top);
    self->base.bounds.left = (s16)left;
    self->base.bounds.right = (s16)(left + w);
    self->base.bounds.top = (s16)top;
    self->base.bounds.bottom = (s16)(top + h);
    self->sprite->screenX = func_ov060_0220fdd8(&self->base.bounds);
    self->sprite->screenY = func_ov060_0220fdf8(&self->base.bounds);
}
/* Advance inherited touch-region state by one frame. */
void func_ov060_0220fec4(Overlay60TouchRegion* self)
{
    TouchRegion_Tick(&self->base);
}
/* Notify the region and mirror the enabled state through sprite flag 4. */
void func_ov060_0220fed0(Overlay60TouchRegion* self, s32 value)
{
    TouchRegion_Notify(&self->base, value);
    if (value)
        self->sprite->flags &= 0xfffb;
    else
        self->sprite->flags |= 4;
}
/* Write POWCNT1 bit 15 to select the retail main-display routing. */
void func_ov060_0220ff00(s32 route)
{
    volatile u16* p = (volatile u16*)0x04000304;
    *p = (u16)((*p & ~0x8000u) | ((u32)route << 15));
}
/* Store four signed bounds and return the initialized rectangle. */
RectS16* func_ov060_02210098(RectS16* b, s32 l, s32 t, s32 r, s32 bottom)
{
    b->left = (s16)l;
    b->top = (s16)t;
    b->right = (s16)r;
    b->bottom = (s16)bottom;
    return b;
}

/* Load sprite resources and allocate/register the two owned touch choices. */
Overlay60Resources* func_ov060_0220ff1c(Overlay60Resources* self, Scene* scene,
    s32 x, s32 y, s32 first, s32 second, s32 third)
{
    RectS16 bounds;
    Overlay60TouchRegion* region;
    GraphicsSpriteSource3 source;
    AnimationResourceState_InitEmbedded(self->resource);
    func_ov060_0220ff00(0);
    func_02071ee0(self->resource, data_020f4e18, first, second, third);
    self->group = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    TouchRegionManager_Allocate(
        (TouchRegionManager*)Scene_GetEmbedded10(scene), 2);
    func_ov060_02210098(&bounds, 0, 0, 44, 44);
    region = (Overlay60TouchRegion*)Heap_Alloc(
        sizeof(*region), data_ov060_0221064c, 4, &gHeapContext);
    if (region)
        func_ov060_0220fd20(region, 100, &bounds);
    TouchRegionManager_Add(
        (TouchRegionManager*)Scene_GetEmbedded10(scene), &region->base);
    source.graphicsResource = self->resource[0];
    source.paletteResource = self->resource[1];
    source.animationResource = self->resource[2];
    func_ov060_0220fd84(region,
        GraphicsSpriteGroup_CreateStateFromSource(self->group, &source, 1), 0,
        1);
    func_ov060_0220fe50(region, x - 60, y);
    region = (Overlay60TouchRegion*)Heap_Alloc(
        sizeof(*region), data_ov060_0221064c, 4, &gHeapContext);
    if (region)
        func_ov060_0220fd20(region, 101, &bounds);
    TouchRegionManager_Add(
        (TouchRegionManager*)Scene_GetEmbedded10(scene), &region->base);
    func_ov060_0220fd84(region,
        GraphicsSpriteGroup_CreateStateFromSource(self->group, &source, 1), 2,
        3);
    func_ov060_0220fe50(region, x + 12, y);
    return self;
}
/* Release the sprite group and its three loaded resource bindings. */
Overlay60Resources* func_ov060_022100b0(Overlay60Resources* self)
{
    GraphicsSpriteGroup_Clear(self->group);
    GraphicsSpriteGroupOwner_DestroyGroup(data_020f4e14, self->group);
    AnimationResourceState_Destroy(self->resource);
    return self;
}
/* Translate every edge of a borrowed HUD rectangle. */
void func_ov060_022101fc(DebugHudRect* r, s32 x, s32 y)
{
    r->left += x;
    r->top += y;
    r->right += x;
    r->bottom += y;
}

/* Construct the modal HUD scene and its two-choice sprite/touch resources. */
Overlay60Scene* func_ov060_022100e4(Overlay60Scene* self, s32 font,
    u32 resource, s32 thirdOperand, s32 secondOperand,
    GraphicsSpriteState* source, s32 mirror, s32 first, s32 second, s32 third,
    s32 firstSound, s32 secondSound)
{
    DebugHudRect rect;
    Scene_Init(&self->base);
    self->base.vtable = &data_ov060_02210620;
    self->selection = -1;
    self->countdown = 0;
    self->sourceSprite = source;
    self->mirrorSourceState = mirror;
    self->firstSound = firstSound;
    self->secondSound = secondSound;
    Scene_SetFlags03(&self->base);
    DebugHud_GetCurrentRectangle(&rect);
    func_ov060_022101fc(&rect, 0, 0);
    DebugHudState_SetRectangle(DebugHudState_GetGlobal(), &rect);
    DebugHudState_Open(DebugHudState_GetGlobal(), font, resource, 1);
    self->resources = (Overlay60Resources*)Heap_Alloc(
        sizeof(*self->resources), data_ov060_02210654, 4, &gHeapContext);
    if (self->resources)
        func_ov060_0220ff1c(self->resources, &self->base,
            thirdOperand + 0x80, secondOperand + 0x90, first, second, third);
    TouchRegionManager_SetEnabled(
        (TouchRegionManager*)Scene_GetEmbedded10(&self->base), 0);
    TouchRegionManager_NotifyAll(
        (TouchRegionManager*)Scene_GetEmbedded10(&self->base), 0);
    return self;
}
/* Close the HUD, release resources, unload overlay 60, and destroy base. */
Overlay60Scene* func_ov060_02210230(Overlay60Scene* self)
{
    self->base.vtable = &data_ov060_02210620;
    DebugHudState_Close(DebugHudState_GetGlobal());
    DebugHudState_RefreshRectangle(DebugHudState_GetGlobal());
    if (self->resources) {
        func_ov060_022100b0(self->resources);
        Heap_Free(self->resources);
    }
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 2);
    Scene_Destroy(&self->base);
    return self;
}
/* Perform scene teardown, free self, and return its former address. */
Overlay60Scene* func_ov060_0221028c(Overlay60Scene* self)
{
    func_ov060_02210230(self);
    Heap_Free(self);
    return self;
}
/* Return one after the post-selection countdown crosses below zero. */
s32 func_ov060_02210584(Overlay60Scene* self) { return self->countdown < 0; }

/* Poll input, update touch/sprites and phase presentation, or finish. */
s32 func_ov060_022102f0(Overlay60Scene* self)
{
    u32 input;
    --self->countdown;
    input = DebugHudState_PollInput(DebugHudState_GetGlobal(), 0);
    if (self->selection >= 0 && func_ov060_02210584(self)) {
        if (self)
            self->base.vtable->destroyAndFree(&self->base);
        return 1;
    }
    if (self->selection < 0 && (input & 1)) {
        TouchRegionManager_SetEnabled(
            (TouchRegionManager*)Scene_GetEmbedded10(&self->base), 1);
        TouchRegionManager_NotifyAll(
            (TouchRegionManager*)Scene_GetEmbedded10(&self->base), 1);
    }
    if (self->mirrorSourceState && self->sourceSprite) {
        if (input & 3)
            self->sourceSprite->flags &= 0xfffd;
        else if ((self->sourceSprite->flags & 2) == 0) {
            self->sourceSprite->flags &= 0xfffe;
            self->sourceSprite->flags |= 2;
        }
    }
    GraphicsSpriteGroup_AdvanceAnimations(self->resources->group);
    TouchRegionManager_Tick(
        (TouchRegionManager*)Scene_GetEmbedded10(&self->base));
    GamePhaseRuntime_UpdateActorPresentationState(data_021052fc, 2);
    return 0;
}
/* Invoke the active game-phase scene's virtual method at offset 0x10. */
s32 func_ov060_02210430(void)
{
    Scene* runtime = (Scene*)data_021052fc;
    return runtime->vtable->method10(runtime);
}
/* Invoke the active game-phase scene's virtual method at offset 0x0c. */
s32 func_ov060_02210450(void)
{
    Scene* runtime = (Scene*)data_021052fc;
    return runtime->vtable->method0C(runtime);
}
/* Commit choice 100/101, play sounds, update flag 0x3ea, and start closing. */
s32 func_ov060_02210470(Overlay60Scene* self, s32 selection)
{
    s32 packed;
    if (selection == 100) {
        Sound_PlayDirectSequence(gSoundContext, 0xbc, 0x7f);
        Sound_FadeDirectSequence(gSoundContext, 0xbc, 60, 0);
        packed = self->firstSound;
        if (packed != -1)
            Sound_Play(gSoundContext, (u16)packed >> 7, (u16)packed & 0x7f);
        GameWork_SetFlag(gGameWork, 0x3ea);
    } else {
        Sound_PlayDirectSequence(gSoundContext, 0xbd, 0x7f);
        Sound_FadeDirectSequence(gSoundContext, 0xbd, 60, 0);
        packed = self->secondSound;
        if (packed != -1)
            Sound_Play(gSoundContext, (u16)packed >> 7, (u16)packed & 0x7f);
        GameWork_ClearFlag(gGameWork, 0x3ea);
    }
    TouchRegionManager_SetEnabled(
        (TouchRegionManager*)Scene_GetEmbedded10(&self->base), 0);
    self->selection = selection;
    self->countdown = 60;
    return 0;
}
