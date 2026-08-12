#include "tingle/graphics_sprite_state.h"
#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Nearest-participant branch selection for the overlay-90 boss-stage controller. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*TitleVirtualMethod)(void *self, s32 value);

extern void *data_021052fc;
extern s32 func_020adcac(const void *first, const void *second);
extern void func_ov090_0221a420(VecFx32Object *destination, void *participant);
extern s32 func_ov077_02214eec(void *participant, void *activeRecord);
extern void func_ov090_0221ad64(void *self, s32 first, void *second,
                                void *third);
extern void ActorDerivedType1_TeardownActiveRecord(void *actor);

/*
 * Find the closest of the three bound participants to the global actor and
 * query its interaction result against the actor's active record. Results zero
 * and one select the shared animation-4 sprite and enter states 0x10/0x11;
 * result two snapshots the actor position, selects animation zero, enters
 * state 0x14, and invokes virtual method +0xc4 with 0x82. Finally dismiss the
 * active record through virtual method +0xe8 and mark the actor inactive.
 */
void func_ov090_0221ae1c(void *self)
{
    void *actor = FIELD(void *, data_021052fc, 0x2ea4);
    VecFx32Object *actorPosition = (VecFx32Object *)((u8 *)actor + 0x18);
    s32 nearestDistance = 0x10000000;
    s32 nearestIndex = -1;
    s32 i = 0;
    s32 result;

    do {
        VecFx32Object candidate;
        s32 distance;
        const VecFx32Value *actorValue =
            actorPosition != 0 ? &actorPosition->value : 0;

        func_ov090_0221a420(&candidate,
                            FIELD(void *, self, 0x1f4 + i * 4));
        distance = func_020adcac(actorValue, &candidate.value);
        VecFx32Object_Destroy(&candidate);
        if (distance < nearestDistance)
            nearestIndex = i;
        i++;
        if (distance < nearestDistance)
            nearestDistance = distance;
    } while (i < 3);

    result = func_ov077_02214eec(
        FIELD(void *, self, 0x1f4 + nearestIndex * 4),
        FIELD(void *, actor, 0x278));
    FIELD(u8, self, 0x223) = nearestIndex;
    if (result == 0) {
        GraphicsSpriteState *sprite;
        func_ov090_0221ad64(self, 0x10a9, (void *)0x1001,
                            (void *)0x10aa);
        GraphicsSpriteState_SetAnimationIndex(
            FIELD(GraphicsSpriteState *, self, 0x200), 4);
        sprite = FIELD(GraphicsSpriteState *, self, 0x200);
        FIELD(u16, sprite, 0x24) |= 2;
        sprite = FIELD(GraphicsSpriteState *, self, 0x200);
        FIELD(u16, sprite, 0x32) = 0x180;
        FIELD(u16, sprite, 0x34) = 0x180;
        FIELD(u16, self, 0x1f0) = 0;
        FIELD(u32, self, 0x21c) = 0x19a;
        FIELD(u8, self, 0x1ec) = 0x10;
    } else if (result == 1) {
        GraphicsSpriteState *sprite;
        func_ov090_0221ad64(self, 0x10a9, (void *)0x1001,
                            (void *)0x10aa);
        GraphicsSpriteState_SetAnimationIndex(
            FIELD(GraphicsSpriteState *, self, 0x200), 4);
        sprite = FIELD(GraphicsSpriteState *, self, 0x200);
        FIELD(u16, sprite, 0x24) |= 2;
        sprite = FIELD(GraphicsSpriteState *, self, 0x200);
        FIELD(u16, sprite, 0x32) = 0x180;
        FIELD(u16, sprite, 0x34) = 0x180;
        FIELD(u16, self, 0x1f0) = 0;
        FIELD(u32, self, 0x21c) = 0x19a;
        FIELD(u8, self, 0x1ec) = 0x11;
    } else if (result == 2) {
        GraphicsSpriteState *sprite;
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x224),
                             actorPosition);
        func_ov090_0221ad64(self, 0x109d, (void *)0x1001,
                            (void *)0x109e);
        sprite = FIELD(GraphicsSpriteState *, self, 0x200);
        FIELD(u16, sprite, 0x24) |= 2;
        sprite = FIELD(GraphicsSpriteState *, self, 0x200);
        FIELD(u16, sprite, 0x24) &= ~1;
        GraphicsSpriteState_SetAnimationIndex(
            FIELD(GraphicsSpriteState *, self, 0x200), 0);
        FIELD(u16, self, 0x1f0) = 0;
        FIELD(u8, self, 0x1ec) = 0x14;
        ((TitleVirtualMethod)(*(void ***)self)[0xc4 / 4])(self, 0x82);
    }

    if (FIELD(void *, actor, 0x278) != 0) {
        void *record = FIELD(void *, actor, 0x278);
        ((TitleVirtualMethod)(*(void ***)record)[0xe8 / 4])(record, 0);
        ActorDerivedType1_TeardownActiveRecord(actor);
    }
    FIELD(u32, actor, 0x14) |= 2;
}
