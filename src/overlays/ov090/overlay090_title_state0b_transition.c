#include "tingle/types.h"

/* Retail event-driven transition out of overlay-90 controller state 0x0b. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

class TitleTransitionActor {
public:
    virtual void method00();
    virtual void method04();
    virtual void method08();
    virtual void method0c();
    virtual void method10();
    virtual void method14();
    virtual void method18();
    virtual void method1c();
    virtual void method20();
    virtual void method24();
    virtual void method28();
    virtual void method2c();
    virtual void method30();
    virtual void method34();
    virtual void method38();
    virtual void method3c();
    virtual void method40();
    virtual void method44();
    virtual void method48();
    virtual void method4c();
    virtual void method50();
    virtual void method54(s32 value);
};

extern "C" {
extern void *data_021052fc;
extern void *gGameWork;
extern void *gSoundContext;
extern s32 ActorDerivedType1_GetActiveRecordId(void *actor);
extern void ActorDerivedType1_TeardownActiveRecord(void *actor);
extern void GameWork_ClearFlag(void *gameWork, s32 flag);
extern void func_ov090_0221ad64(void *self, u32 first, u32 second, u32 third);
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, s32 index);
extern void *Actor_GetCollection(void *actor);
extern void ActorCollection_QueueActorForRemoval(void *collection, void *actor);
extern void Sound_Play(void *sound, s32 bank, s32 id);
}

/*
 * Tear down the active derived-actor record, clear its control flags and game
 * flag 0x3ec, then enter controller state 0x0c. The event's three resource
 * handles replace the boss-stage sprite, animation 8 is selected, the event actor
 * is queued for removal, and retail sound 0x43 is started.
 */
extern "C" void func_ov090_0221a784(void *self, void *event)
{
    void *actor = FIELD(void *, (u8 *)data_021052fc + 0x2000, 0xea4);

    if (FIELD(void *, actor, 0x278) != 0) {
        s32 recordId = ActorDerivedType1_GetActiveRecordId(actor);
        if ((u32)(recordId - 0x78) <= 2) {
            void *record = FIELD(void *, actor, 0x278);
            FIELD(u32, record, 0x1f0) |= 8;
        } else {
            ActorDerivedType1_TeardownActiveRecord(actor);
        }
    } else {
        ActorDerivedType1_TeardownActiveRecord(actor);
    }

    FIELD(u32, actor, 0x230) &= ~4;
    ((TitleTransitionActor *)actor)->method54(0);
    FIELD(u32, actor, 0x14) |= 2;
    GameWork_ClearFlag(gGameWork, 0x3ec);

    FIELD(u8, self, 0x1ec) = 0x0c;
    FIELD(u16, self, 0x1f0) = 0;
    FIELD(u32, self, 0x21c) = 0x29;
    func_ov090_0221ad64(self,
                        FIELD(u32, FIELD(void *, FIELD(void *, event, 0x54), 0x14), 0x10),
                        FIELD(u32, FIELD(void *, FIELD(void *, event, 0x54), 0x18), 0x10),
                        FIELD(u32, FIELD(void *, FIELD(void *, event, 0x54), 0x1c), 0x10));

    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, self, 0x200), 8);
    FIELD(u16, FIELD(void *, event, 0x54), 0x24) |= 0x10;
    ActorCollection_QueueActorForRemoval(Actor_GetCollection(self), event);
    FIELD(u16, FIELD(void *, self, 0x200), 0x24) &= ~2;
    Sound_Play(gSoundContext, 0, 0x43);
}
