#include "tingle/field_effect.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement a burst-presentation manager that owns a pointer array of timed
 * sprites, seeds randomized radial tracks around a rectangle center, retains
 * graphics resources, and advances the burst through a two-state lifetime.
 */

typedef struct PresentationTrack {
    u8 bytes[0x10];
} PresentationTrack;

typedef struct OwnedPointerArray {
    void **items;
    s32 count;
} OwnedPointerArray;

typedef struct TouchPointValue {
    const void *vtable;
    s32 x;
    s32 y;
} TouchPointValue;

typedef struct BurstRectangle {
    s32 left;
    s32 top;
    s32 right;
    s32 bottom;
} BurstRectangle;

typedef struct BurstSpriteConfig {
    void *spriteGroup;
    s32 field04;
    s32 field08;
    s32 field0c;
    PresentationTrack first10;
    PresentationTrack second20;
    s32 lifetime30;
    s32 field34;
} BurstSpriteConfig;

typedef struct TimedSpriteBurstManager {
    void **vtable;
    u32 dispatchState;
    OwnedPointerArray sprites08;
    void *spriteGroup10;
    s32 state14;
    void *resource18;
    void *resource1c;
    void *resource20;
    s32 timer24;
} TimedSpriteBurstManager;

typedef void *(*BurstSpriteDestroy)(void *sprite);
typedef void (*BurstSpriteMove)(void *sprite,
                                const PresentationTrack *position);

#ifdef __cplusplus
extern "C" {
#endif
extern void *gTimedSpriteBurstManagerVtable;
extern const s16 gFx32CosSinTable[];
extern const char gTimedSpritePointerArrayAllocationTag[];
extern const char gTimedSpritePresentationAllocationTag[];
extern void *data_020f4e18;
extern u8 *gGamePhaseRuntime;
extern void *gDebugFont;
extern u32 genrand_int32(void);
extern void TouchPoint_Init(TouchPointValue *point, s32 x, s32 y);
extern void VecFx32Object_Init(PresentationTrack *track);
extern void VecFx32Object_InitCopy(PresentationTrack *track, const void *source);
extern void VecFx32Object_Destroy(void *track);
extern void *func_02003e20(u32 size, const char *tag, s32 alignment,
                           HeapContext *heap);
extern void func_02003e38(void *allocation);
extern void *ActorMotion_GetPosition(void *source);

extern void *func_0201e454(void *self, BurstSpriteConfig *config);
extern void TimedSpritePresentation_SetVisible(void *sprite, s32 enabled);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *font);
extern void GraphicsSpriteGroupOwner_DestroyGroup(void *font, void *spriteGroup);
extern void func_02071bdc(void *owner, void *resource);
extern void func_02071c38(void *owner, void *resource);
extern void func_02071c94(void *owner, void *resource);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *spriteGroup);
#ifdef __cplusplus
}
#endif

OwnedPointerArray *OwnedPointerArray_Destroy(OwnedPointerArray *array);
void OwnedPointerArray_Clear(OwnedPointerArray *array);
BurstSpriteConfig *TimedSpriteConfig_InitTracks(BurstSpriteConfig *config);
void OwnedPointerArray_Resize(OwnedPointerArray *array, s32 count);

/*
 * Initialize the FieldEffect base and manager vtable, construct a temporary
 * sprite config, acquire a sprite group from gDebugFont, allocate count pointer
 * slots, and compute the input rectangle's fixed-point center.  For each slot,
 * choose a random table direction and radius 12..19, build start/velocity
 * tracks around that center, allocate a 0x2c-byte oriented timed sprite, show
 * it, and retain it.  Set the manager timer to 300, destroy both temporary
 * tracks, and return self.  Allocation failure is preserved as a null slot.
 */
TimedSpriteBurstManager *TimedSpriteBurstManager_Init(
    TimedSpriteBurstManager *self, const BurstRectangle *rectangle, s32 count)
{
    BurstSpriteConfig config;
    TouchPointValue center;
    s32 index;

    FieldEffect_Init(self);
    self->vtable = (void **)gTimedSpriteBurstManagerVtable;
    self->sprites08.items = 0;
    self->sprites08.count = 0;
    self->state14 = 0;
    TimedSpriteConfig_InitTracks(&config);
    self->spriteGroup10 = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    config.spriteGroup = self->spriteGroup10;
    config.field04 = 0;
    config.field08 = 0;
    config.field0c = 0;
    config.second20.bytes[0xc] = 0;
    config.lifetime30 = 300;
    config.field34 = 2;
    OwnedPointerArray_Resize(&self->sprites08, count);
    TouchPoint_Init(&center,
                    ((rectangle->right - rectangle->left) * 8
                     + rectangle->left * 16)
                        << 12,
                    ((rectangle->bottom - rectangle->top) * 8
                     + rectangle->top * 16)
                        << 12);

    for (index = 0; index < self->sprites08.count; index++) {
        u16 random = (u16)genrand_int32();
        s32 radius = (random & 7) + 12;
        s32 tableIndex = ((s16)random >> 4) * 2;
        s32 velocityX = -radius * (gFx32CosSinTable[tableIndex] >> 3);
        s32 velocityY = radius * (gFx32CosSinTable[tableIndex + 1] >> 3);
        void *sprite;

        *(s32 *)&config.second20.bytes[4] = velocityX;
        *(s32 *)&config.second20.bytes[8] = velocityY;
        *(s32 *)&config.first10.bytes[4] = center.x + velocityX;
        *(s32 *)&config.first10.bytes[8] = center.y + velocityY;
        sprite = Heap_Alloc(0x2c, gTimedSpritePresentationAllocationTag, 4, &gHeapContext);
        if (sprite != 0) {
            func_0201e454(sprite, &config);
        }
        self->sprites08.items[index] = sprite;
        TimedSpritePresentation_SetVisible(sprite, 1);
    }
    self->timer24 = 300;
    VecFx32Object_Destroy(&config.second20);
    VecFx32Object_Destroy(&config.first10);
    return self;
}

/* Destroy array storage when present and return the array. */
OwnedPointerArray *OwnedPointerArray_Destroy(OwnedPointerArray *array)
{
    if (array->items != 0) {
        OwnedPointerArray_Clear(array);
    }
    return array;
}

/* Free array storage when present, then clear both pointer and count. */
void OwnedPointerArray_Clear(OwnedPointerArray *array)
{
    if (array->items != 0) {
        func_02003e38(array->items);
        array->items = 0;
    }
    array->count = 0;
}

/* Construct the two embedded tracks and return config. */
BurstSpriteConfig *TimedSpriteConfig_InitTracks(BurstSpriteConfig *config)
{
    VecFx32Object_Init(&config->first10);
    VecFx32Object_Init(&config->second20);
    return config;
}

/*
 * Release existing storage, allocate count four-byte pointer slots with the
 * recovered tag/alignment from the game heap, and store pointer and count.
 */
void OwnedPointerArray_Resize(OwnedPointerArray *array, s32 count)
{
    if (array->items != 0) {
        OwnedPointerArray_Clear(array);
    }
    array->items =
        (void **)func_02003e20((u32)count * 4, gTimedSpritePointerArrayAllocationTag, 4,
                              &gHeapContext);
    array->count = count;
}

/*
 * Install the manager vtable, invoke vtable slot 1 on every nonnull sprite,
 * release the pointer array, sprite group, and three recovered resources, run
 * the array's guarded destructor, and return self without freeing it.
 */
TimedSpriteBurstManager *TimedSpriteBurstManager_Destroy(TimedSpriteBurstManager *self)
{
    s32 index;
    self->vtable = (void **)gTimedSpriteBurstManagerVtable;
    for (index = 0; index < self->sprites08.count; index++) {
        void *sprite = self->sprites08.items[index];
        if (sprite != 0) {
            ((BurstSpriteDestroy)(*(void ***)sprite)[1])(sprite);
        }
    }
    OwnedPointerArray_Clear(&self->sprites08);
    GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont, self->spriteGroup10);
    func_02071bdc(data_020f4e18, self->resource18);
    func_02071c38(data_020f4e18, self->resource1c);
    func_02071c94(data_020f4e18, self->resource20);
    OwnedPointerArray_Destroy(&self->sprites08);
    return self;
}

/* Perform the manager teardown, free self, and return its old address. */
TimedSpriteBurstManager *TimedSpriteBurstManager_DestroyAndFree(TimedSpriteBurstManager *self)
{
    TimedSpriteBurstManager_Destroy(self);
    Heap_Free(self);
    return self;
}

/*
 * Construct a temporary position from the global runtime field at 0x3044.
 * In state 0, pass it to vtable slot 2 of every sprite and advance to state 1
 * after timer24 becomes negative.  State 1 destroys the temporary and returns
 * one.  Other paths render spriteGroup10, destroy the temporary, and return
 * zero.
 */
s32 TimedSpriteBurstManager_Update(TimedSpriteBurstManager *self)
{
    PresentationTrack position;
    s32 index;

    VecFx32Object_InitCopy(&position, ActorMotion_GetPosition(gGamePhaseRuntime + 0x3044));
    switch (self->state14) {
    case 0:
        for (index = 0; index < self->sprites08.count; index++) {
            void *sprite = self->sprites08.items[index];
            ((BurstSpriteMove)(*(void ***)sprite)[2])(sprite, &position);
        }
        self->timer24--;
        if (self->timer24 < 0) {
            self->state14++;
        }
        break;
    case 1:
        VecFx32Object_Destroy(&position);
        return 1;
    }
    GraphicsSpriteGroup_AdvanceAnimations(self->spriteGroup10);
    VecFx32Object_Destroy(&position);
    return 0;
}
