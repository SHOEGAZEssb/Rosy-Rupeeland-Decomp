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
    u32 field04;
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
extern void *data_020d6220;
extern const s16 data_020c9670[];
extern const char gTimedSpritePointerArrayAllocationTag[];
extern const char gTimedSpritePresentationAllocationTag[];
extern void *data_020f4e18;
extern u8 *data_021052fc;
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
extern void *func_0201e250(void *self);
extern void *func_0201e454(void *self, BurstSpriteConfig *config);
extern void func_0201e3b8(void *sprite, s32 enabled);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *font);
extern void GraphicsSpriteGroupOwner_DestroyGroup(void *font, void *spriteGroup);
extern void func_02071bdc(void *owner, void *resource);
extern void func_02071c38(void *owner, void *resource);
extern void func_02071c94(void *owner, void *resource);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *spriteGroup);
#ifdef __cplusplus
}
#endif

OwnedPointerArray *func_0201f0b0(OwnedPointerArray *array);
void func_0201f0d0(OwnedPointerArray *array);
BurstSpriteConfig *func_0201f0fc(BurstSpriteConfig *config);
void func_0201f11c(OwnedPointerArray *array, s32 count);

/*
 * Initialize the recovered base and manager vtable, construct a temporary
 * sprite config, acquire a sprite group from gDebugFont, allocate count pointer
 * slots, and compute the input rectangle's fixed-point center.  For each slot,
 * choose a random table direction and radius 12..19, build start/velocity
 * tracks around that center, allocate a 0x2c-byte oriented timed sprite, show
 * it, and retain it.  Set the manager timer to 300, destroy both temporary
 * tracks, and return self.  Allocation failure is preserved as a null slot.
 */
TimedSpriteBurstManager *func_0201eefc(TimedSpriteBurstManager *self,
                                       const BurstRectangle *rectangle,
                                       s32 count)
{
    BurstSpriteConfig config;
    TouchPointValue center;
    s32 index;

    func_0201e250(self);
    self->vtable = (void **)data_020d6220;
    self->sprites08.items = 0;
    self->sprites08.count = 0;
    self->state14 = 0;
    func_0201f0fc(&config);
    self->spriteGroup10 = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    config.spriteGroup = self->spriteGroup10;
    config.field04 = 0;
    config.field08 = 0;
    config.field0c = 0;
    config.second20.bytes[0xc] = 0;
    config.lifetime30 = 300;
    config.field34 = 2;
    func_0201f11c(&self->sprites08, count);
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
        s32 velocityX = -radius * (data_020c9670[tableIndex] >> 3);
        s32 velocityY = radius * (data_020c9670[tableIndex + 1] >> 3);
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
        func_0201e3b8(sprite, 1);
    }
    self->timer24 = 300;
    VecFx32Object_Destroy(&config.second20);
    VecFx32Object_Destroy(&config.first10);
    return self;
}

/* Destroy array storage when present and return the array. */
OwnedPointerArray *func_0201f0b0(OwnedPointerArray *array)
{
    if (array->items != 0) {
        func_0201f0d0(array);
    }
    return array;
}

/* Free array storage when present, then clear both pointer and count. */
void func_0201f0d0(OwnedPointerArray *array)
{
    if (array->items != 0) {
        func_02003e38(array->items);
        array->items = 0;
    }
    array->count = 0;
}

/* Construct the two embedded tracks and return config. */
BurstSpriteConfig *func_0201f0fc(BurstSpriteConfig *config)
{
    VecFx32Object_Init(&config->first10);
    VecFx32Object_Init(&config->second20);
    return config;
}

/*
 * Release existing storage, allocate count four-byte pointer slots with the
 * recovered tag/alignment from the game heap, and store pointer and count.
 */
void func_0201f11c(OwnedPointerArray *array, s32 count)
{
    if (array->items != 0) {
        func_0201f0d0(array);
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
TimedSpriteBurstManager *func_0201f15c(TimedSpriteBurstManager *self)
{
    s32 index;
    self->vtable = (void **)data_020d6220;
    for (index = 0; index < self->sprites08.count; index++) {
        void *sprite = self->sprites08.items[index];
        if (sprite != 0) {
            ((BurstSpriteDestroy)(*(void ***)sprite)[1])(sprite);
        }
    }
    func_0201f0d0(&self->sprites08);
    GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont, self->spriteGroup10);
    func_02071bdc(data_020f4e18, self->resource18);
    func_02071c38(data_020f4e18, self->resource1c);
    func_02071c94(data_020f4e18, self->resource20);
    func_0201f0b0(&self->sprites08);
    return self;
}

/* Perform func_0201f15c's teardown, free self, and return its old address. */
TimedSpriteBurstManager *func_0201f204(TimedSpriteBurstManager *self)
{
    func_0201f15c(self);
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
s32 func_0201f2b4(TimedSpriteBurstManager *self)
{
    PresentationTrack position;
    s32 index;

    VecFx32Object_InitCopy(&position, ActorMotion_GetPosition(data_021052fc + 0x3044));
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
