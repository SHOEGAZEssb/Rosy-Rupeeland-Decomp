#include "tingle/animation_resource.h"
#include "tingle/heap.h"
#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Terminal 27-effect burst used by the retail overlay-90 boss-stage sequence. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct TitleEffectBounds {
    s8 left;
    s8 top;
    s8 right;
    s8 bottom;
} TitleEffectBounds;

extern void *data_021052fc;
extern const char data_ov090_0221cc00[];
extern const s16 data_020c9670[];
extern void *gSoundContext;
extern void *GamePhaseRuntime_GetActorCollection(void *runtime, s32 index);
extern void ActorCollection_QueueActorForRemoval(void *collection, void *actor);
extern void func_ov077_02216960(void *participant);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(void *value);
extern void func_020a2614(void *value, s32 first, s32 second, s32 third,
                          s32 fourth);
extern u32 genrand_int32(void);
extern void *PresentationBackedActor_Spawn(
    s32 key, s32 parent, s16 lifetime, const VecFx32Object *position,
    const VecFx32Object *velocity, s32 resource0, s32 resource1,
    s32 resource2, s32 animation, s32 kind, s32 enabled);
extern void func_ov090_0221b7e0(TitleEffectBounds *bounds, s32 left, s32 top,
                                s32 right, s32 bottom);
extern void func_020594ec(void *sound, s32 value);
extern void Actor_PlayHorizontalSpatialSound(void *actor, u32 packedSound, s32 pitch);
extern u64 func_020befec(s32 dividend, s32 divisor);

/*
 * Remove collection-1 actors of type 4, notify all three boss-stage participants,
 * issue the six recovered display operations, and allocate resource set
 * 0x1719..0x171b. Spawn 27 key-0x12 presentation actors using the retail RNG,
 * tiered lifetimes/animations, angular offsets, sprite flags, bounds, and
 * sizes. Finish with sound operation 8 and callback 0xa10c.
 */
void func_ov090_0221b428(void *self)
{
    void *collection;
    s32 i;
    s32 row;
    s32 column;
    AnimationResource *resources;
    VecFx32Object origin;
    s32 minusOne;
    s32 smallTop;
    s32 middleLeft;
    s32 largeLeft;
    s32 largeTop;
    s32 smallLeft;
    s32 spriteMinimum;
    u32 randomMask;

    for (i = 0;
         i < FIELD(s32,
                   GamePhaseRuntime_GetActorCollection(data_021052fc, 1),
                   0x2e74);
         i++) {
        void *actor;
        s32 isTypeFour;
        collection =
            GamePhaseRuntime_GetActorCollection(data_021052fc, 1);
        actor = FIELD(void *, collection, i * 4);
        if (actor != 0) {
            isTypeFour = FIELD(u8, actor, 0x4d) == 4;
        } else {
            isTypeFour = 0;
        }
        if (isTypeFour) {
            ActorCollection_QueueActorForRemoval(
                GamePhaseRuntime_GetActorCollection(data_021052fc, 1), actor);
        }
    }

    i = 0;
    do {
        func_ov077_02216960(FIELD(void *, self, 0x1f4 + i * 4));
        i++;
    } while (i < 3);

    row = 0;
    do {
        column = 0;
        do {
            func_020a2614(RuntimePresentationManager_GetGraphics3dPresentation((u8 *)data_021052fc + 0x2f7c), 0,
                          row * 0x60 + 0x1c2, column * 0x40 + 0xdc, 8);
            column++;
        } while (column < 2);
        row++;
    } while (row < 3);

    resources = (AnimationResource *)Heap_Alloc(
        sizeof(AnimationResource), data_ov090_0221cc00, 4, &gHeapContext);
    if (resources != 0)
        resources = AnimationResource_Init(resources, (void *)0x1719,
                                           (void *)0x171a, (void *)0x171b);
    FIELD(AnimationResource *, self, 0x208) = resources;

    VecFx32Object_InitComponents(&origin, 0x200000, 0x100000, 0x20000);
    minusOne = -1;
    largeLeft = minusOne - 0x13;
    largeTop = minusOne - 0x11;
    middleLeft = minusOne - 0x0d;
    smallLeft = minusOne - 9;
    smallTop = minusOne - 5;
    spriteMinimum = minusOne - 0x1f;
    randomMask = minusOne + 0x1000;
    i = 0;
    do {
        u32 random = genrand_int32();
        VecFx32Object velocity;
        s32 tier;
        s16 lifetime;
        s32 animation;
        void *effect;
        TitleEffectBounds bounds;

        VecFx32Object_InitComponents(
            &velocity,
            data_020c9670[((u16)random >> 4) * 2 + 1] * 3,
            ((random >> 8) & randomMask) + 0x4000, 0xa000);
        /* Retail obtains the signed remainder from the helper's high word. */
        velocity.value.y +=
            (s32)(func_020befec(i, 3) >> 32) * 0x4000;
        if (i < 5) {
            tier = 2;
            lifetime = 1000;
        } else if (i < 14) {
            tier = 1;
            lifetime = 300;
        } else {
            tier = 0;
            lifetime = 100;
        }

        if (tier == 0)
            animation = genrand_int32() & 3;
        else if (tier == 1)
            animation = (genrand_int32() & 1) + 4;
        else
            animation = 6;

        effect = PresentationBackedActor_Spawn(
            0x12, -1, lifetime, &origin, &velocity, 0x1719, 0x171a,
            0x171b, animation, 7, 1);
        if ((i & 1) != 0)
            FIELD(u16, FIELD(void *, effect, 0x54), 0x24) |= 0x40;
        /* The same ABI high word carries the signed i % 15 result. */
        FIELD(u16, effect, 0x1fc) =
            (s32)(func_020befec(i, 15) >> 32);

        if (tier == 0)
            func_ov090_0221b7e0(&bounds, smallLeft, smallTop, 10, 6);
        else if (tier == 1)
            func_ov090_0221b7e0(&bounds, middleLeft, smallLeft, 14, 10);
        else
            func_ov090_0221b7e0(&bounds, largeLeft, largeTop, 20, 20);
        FIELD(s8, effect, 8) = bounds.left;
        FIELD(s8, effect, 9) = bounds.top;
        FIELD(s8, effect, 10) = bounds.right;
        FIELD(s8, effect, 11) = bounds.bottom;
        FIELD(u16, effect, 0x68) = spriteMinimum;
        FIELD(u16, effect, 0x6a) = spriteMinimum;
        FIELD(u16, effect, 0x6c) = 32;
        FIELD(u16, effect, 0x6e) = 32;
        VecFx32Object_Destroy(&velocity);
        i++;
    } while (i < 27);

    func_020594ec(gSoundContext, 8);
    Actor_PlayHorizontalSpatialSound(self, 0xa10c, 0);
    VecFx32Object_Destroy(&origin);
}
