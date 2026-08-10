#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Allocate, construct, initialize, and register actors from 0x64-byte spawn
 * descriptors. The matching body preserves overlay-specific resource gates;
 * this portable reference exposes the recovered type-to-constructor matrix.
 */
typedef void *(*ActorConstructor)(void *, const void *);
typedef struct ActorFactorySpec {
    u16 size;
    ActorConstructor constructor;
} ActorFactorySpec;

typedef struct FactoryActorVTable {
    u8 field_00[0x10];
    void (*initialize_10)(void *, const void *);
} FactoryActorVTable;

typedef struct FactoryActor {
    FactoryActorVTable *vtable_00;
    u8 field_04[0x10];
    u32 flags_14;
    u8 field_18[0xcc];
    s16 descriptorValue_e4;
} FactoryActor;

typedef struct FactoryCollection {
    u8 field_0000[0x2e84];
    s32 mode_2e84;
} FactoryCollection;

typedef struct ActorSpawnDescriptor {
    u16 kind_00;
    u16 subtype_02;
    u8 field_04[0x4e];
    s16 value_52;
    u8 field_54[0x10];
} ActorSpawnDescriptor;

extern u8 data_020def5c[];
extern u8 data_020e8380[];
extern u8 data_020ed470[];

#ifdef __cplusplus
extern "C" {
#endif
#define DECLARE_ACTOR_CTOR(name) extern void *name(void *, const void *)
DECLARE_ACTOR_CTOR(func_02035060);
DECLARE_ACTOR_CTOR(func_0203b554);
DECLARE_ACTOR_CTOR(func_0203c140);
DECLARE_ACTOR_CTOR(func_0203c4e0);
DECLARE_ACTOR_CTOR(func_0203ca28);
DECLARE_ACTOR_CTOR(func_0203d2a8);
DECLARE_ACTOR_CTOR(func_0203df4c);
DECLARE_ACTOR_CTOR(func_02043830);
DECLARE_ACTOR_CTOR(func_02044118);
DECLARE_ACTOR_CTOR(func_020445d8);
DECLARE_ACTOR_CTOR(func_02044d84);
DECLARE_ACTOR_CTOR(func_020455bc);
DECLARE_ACTOR_CTOR(func_0204d068);
DECLARE_ACTOR_CTOR(func_0204d284);
DECLARE_ACTOR_CTOR(func_0204d488);
DECLARE_ACTOR_CTOR(func_0204d620);
DECLARE_ACTOR_CTOR(func_0204e740);
DECLARE_ACTOR_CTOR(func_0204e944);
DECLARE_ACTOR_CTOR(func_0204ec0c);
DECLARE_ACTOR_CTOR(func_02050a28);
DECLARE_ACTOR_CTOR(func_02050e74);
DECLARE_ACTOR_CTOR(func_0205135c);
DECLARE_ACTOR_CTOR(func_02051738);
DECLARE_ACTOR_CTOR(func_02052120);
DECLARE_ACTOR_CTOR(func_020522c8);
DECLARE_ACTOR_CTOR(func_020525b0);
DECLARE_ACTOR_CTOR(func_02052680);
DECLARE_ACTOR_CTOR(func_02052978);
DECLARE_ACTOR_CTOR(func_02052a70);
DECLARE_ACTOR_CTOR(func_02052ec0);
DECLARE_ACTOR_CTOR(func_020533e0);
DECLARE_ACTOR_CTOR(func_02055784);
DECLARE_ACTOR_CTOR(func_02055eb0);
DECLARE_ACTOR_CTOR(func_02056360);
DECLARE_ACTOR_CTOR(func_02056580);
DECLARE_ACTOR_CTOR(func_020567f4);
DECLARE_ACTOR_CTOR(func_02056880);
DECLARE_ACTOR_CTOR(func_02056be0);
DECLARE_ACTOR_CTOR(func_020579b0);
DECLARE_ACTOR_CTOR(func_ov075_02212ae0);
DECLARE_ACTOR_CTOR(func_ov075_02212bb8);
DECLARE_ACTOR_CTOR(func_ov075_0221352c);
DECLARE_ACTOR_CTOR(func_ov075_0221461c);
DECLARE_ACTOR_CTOR(func_ov075_02215068);
DECLARE_ACTOR_CTOR(func_ov075_022159c4);
DECLARE_ACTOR_CTOR(func_ov076_022137c8);
DECLARE_ACTOR_CTOR(func_ov076_02213858);
DECLARE_ACTOR_CTOR(func_ov076_022140a4);
DECLARE_ACTOR_CTOR(func_ov077_02212b7c);
DECLARE_ACTOR_CTOR(func_ov077_02213110);
DECLARE_ACTOR_CTOR(func_ov078_02214090);
DECLARE_ACTOR_CTOR(func_ov078_02215338);
DECLARE_ACTOR_CTOR(func_ov080_02212af4);
DECLARE_ACTOR_CTOR(func_ov081_02212c40);
DECLARE_ACTOR_CTOR(func_ov081_02214008);
DECLARE_ACTOR_CTOR(func_ov082_02213218);
DECLARE_ACTOR_CTOR(func_ov082_022143b0);
DECLARE_ACTOR_CTOR(func_ov083_02213748);
DECLARE_ACTOR_CTOR(func_ov084_02213e94);
DECLARE_ACTOR_CTOR(func_ov085_02212aec);
DECLARE_ACTOR_CTOR(func_ov087_022177e0);
DECLARE_ACTOR_CTOR(func_ov088_02217a3c);
DECLARE_ACTOR_CTOR(func_ov088_0221b394);
DECLARE_ACTOR_CTOR(func_ov088_0221b508);
DECLARE_ACTOR_CTOR(func_ov089_022177e4);
DECLARE_ACTOR_CTOR(func_ov092_02217940);
DECLARE_ACTOR_CTOR(func_ov092_0221a838);
DECLARE_ACTOR_CTOR(func_ov093_022177f0);
DECLARE_ACTOR_CTOR(func_ov095_0221b23c);
DECLARE_ACTOR_CTOR(func_ov095_0221c0b0);
DECLARE_ACTOR_CTOR(func_ov095_0221c724);
DECLARE_ACTOR_CTOR(func_ov096_02218310);
DECLARE_ACTOR_CTOR(func_ov097_02217804);
DECLARE_ACTOR_CTOR(func_ov097_022195f4);
DECLARE_ACTOR_CTOR(func_ov097_02219d20);
#undef DECLARE_ACTOR_CTOR
extern void OS_Halt(void);
extern void Actor_RefreshTerrainHeight(FactoryActor *);
extern void ActorCollection_RegisterActor(FactoryCollection *, FactoryActor *);
#ifdef __cplusplus
}
#endif

#define SPEC(bytes, ctor) {(bytes), (ctor)}
#define NONE {0, 0}

static const ActorFactorySpec sKind2Specs[36] = {
    SPEC(0x298, func_0203df4c), SPEC(0x2c8, func_ov078_02214090),
    SPEC(0x2c0, func_ov078_02215338), SPEC(0x2c0, func_ov097_022195f4),
    SPEC(0x298, func_0203df4c), SPEC(0x29c, func_ov075_02212ae0),
    SPEC(0x2b4, func_ov083_02213748), SPEC(0x2a8, func_ov075_02212ae0),
    SPEC(0x2ac, func_02044118), SPEC(0x29c, func_02043830),
    SPEC(0x29c, func_02043830), SPEC(0x29c, func_ov075_02212ae0),
    SPEC(0x2a8, func_020445d8), SPEC(0x2ac, func_ov076_02213858),
    SPEC(0x2a0, func_ov082_02213218), SPEC(0x2c0, func_ov075_0221352c),
    SPEC(0x2a4, func_ov075_02212bb8), SPEC(0x2c4, func_ov077_02212b7c),
    SPEC(0x30c, func_ov077_02213110), SPEC(0x29c, func_02043830),
    SPEC(0x2a0, func_ov087_022177e0), SPEC(0x29c, func_ov084_02213e94),
    SPEC(0x2d4, func_ov076_022137c8), SPEC(0x2ac, func_ov075_02212ae0),
    SPEC(0x29c, func_ov082_022143b0), SPEC(0x2ac, func_ov095_0221b23c),
    SPEC(0x2b0, func_ov096_02218310), SPEC(0x2a4, func_ov080_02212af4),
    SPEC(0x2c8, func_ov078_02214090), SPEC(0x2e8, func_ov097_02217804),
    SPEC(0x2bc, func_ov075_022159c4), SPEC(0x2b8, func_ov075_02215068),
    SPEC(0x324, func_ov087_022177e0), SPEC(0x2ac, func_02044d84),
    SPEC(0x2a0, func_ov076_022140a4), SPEC(0x2ac, func_ov075_02212ae0)
};

static const ActorFactorySpec sKind3Specs[25] = {
    SPEC(0x208, func_0203b554), SPEC(0x258, func_0203c140),
    SPEC(0x208, func_0203b554), SPEC(0x218, func_0204d068),
    SPEC(0x208, func_0203b554), SPEC(0x20c, func_0204d488),
    SPEC(0x244, func_ov081_02212c40), SPEC(0x244, func_ov081_02212c40),
    SPEC(0x244, func_ov081_02212c40), SPEC(0x230, func_ov087_022177e0),
    SPEC(0x248, func_ov089_022177e4), SPEC(0x258, func_ov081_02214008),
    SPEC(0x20c, func_0203c4e0), SPEC(0x20c, func_0203c4e0),
    SPEC(0x20c, func_0203c4e0), SPEC(0x20c, func_0203c4e0),
    SPEC(0x20c, func_0203c4e0), SPEC(0x218, func_0203ca28),
    SPEC(0x21c, func_0203d2a8), SPEC(0x20c, func_0203c4e0),
    SPEC(0x22c, func_ov075_0221461c), SPEC(0x258, func_ov085_02212aec),
    SPEC(0x208, func_ov088_0221b508), SPEC(0x208, func_0203b554),
    SPEC(0x208, func_0203b554)
};

static ActorFactorySpec kind4Spec(u16 subtype)
{
    switch (subtype) {
    case 10: case 11: case 12: case 13: case 19:
        return (ActorFactorySpec)SPEC(0x1fc, func_0204d620);
    case 14: case 15: case 16: case 17:
        return (ActorFactorySpec)SPEC(0x1f0, func_0204e944);
    case 18: return (ActorFactorySpec)SPEC(0x200, func_0204e740);
    case 20: return (ActorFactorySpec)SPEC(0x21c, func_0204ec0c);
    case 21: return (ActorFactorySpec)SPEC(0x200, func_02050a28);
    case 22: case 25: return (ActorFactorySpec)SPEC(0x200, func_02050e74);
    case 24: return (ActorFactorySpec)SPEC(0x200, func_0205135c);
    case 26: return (ActorFactorySpec)SPEC(0x204, func_02051738);
    case 27: return (ActorFactorySpec)SPEC(0x200, func_02052120);
    case 28: return (ActorFactorySpec)SPEC(0x200, func_020522c8);
    case 29: return (ActorFactorySpec)SPEC(0x200, func_020525b0);
    case 30: return (ActorFactorySpec)SPEC(0x218, func_ov092_0221a838);
    case 31: return (ActorFactorySpec)SPEC(0x200, func_02052680);
    case 32: return (ActorFactorySpec)SPEC(0x200, func_02052978);
    case 33: return (ActorFactorySpec)SPEC(0x218, func_02052a70);
    case 34: return (ActorFactorySpec)SPEC(0x204, func_02052ec0);
    case 35: return (ActorFactorySpec)SPEC(0x200, func_020533e0);
    case 36: return (ActorFactorySpec)SPEC(0x204, func_ov095_0221c0b0);
    case 37: return (ActorFactorySpec)SPEC(0x204, func_ov095_0221c724);
    case 38: return (ActorFactorySpec)SPEC(0x208, func_ov097_02219d20);
    case 100: return (ActorFactorySpec)SPEC(0x208, func_02055784);
    case 101: case 102: case 103:
        return (ActorFactorySpec)SPEC(0x208, func_02055eb0);
    case 104: return (ActorFactorySpec)SPEC(0x204, func_02056360);
    case 107: case 112: return (ActorFactorySpec)SPEC(0x204, func_02056580);
    case 108: return (ActorFactorySpec)SPEC(0x204, func_020567f4);
    case 110: return (ActorFactorySpec)SPEC(0x208, func_02056880);
    case 113: return (ActorFactorySpec)SPEC(0x20c, func_02056be0);
    default: return (ActorFactorySpec)NONE;
    }
}

static ActorFactorySpec selectFactorySpec(const ActorSpawnDescriptor *descriptor)
{
    u16 subtype = descriptor->subtype_02;

    switch (descriptor->kind_00) {
    case 1: return (ActorFactorySpec)SPEC(0x2b8, func_02035060);
    case 2: {
        s8 actorClass = *(s8 *)(data_020e8380 + subtype * 0x30 + 0x24);
        if (actorClass >= 0 && actorClass < 36)
            return sKind2Specs[actorClass];
        return (ActorFactorySpec)NONE;
    }
    case 3:
        return subtype < 25 ? sKind3Specs[subtype] : (ActorFactorySpec)NONE;
    case 4: return kind4Spec(subtype);
    case 5: return (ActorFactorySpec)SPEC(0x2a8, func_ov075_02212ae0);
    case 6:
        switch (subtype) {
        case 1: return (ActorFactorySpec)SPEC(0x250, func_ov087_022177e0);
        case 2: return (ActorFactorySpec)SPEC(0x23c, func_ov087_022177e0);
        case 3: return (ActorFactorySpec)SPEC(0x2a4, func_ov092_02217940);
        case 4: return (ActorFactorySpec)SPEC(0x250, func_ov093_022177f0);
        default: return (ActorFactorySpec)SPEC(0x1ec, func_0204d284);
        }
    case 7: return (ActorFactorySpec)SPEC(0x2b8, func_020455bc);
    case 8: return (ActorFactorySpec)SPEC(0x3e0, func_020579b0);
    case 9:
        switch (data_020ed470[subtype * 0x30 + 1]) {
        case 0: return (ActorFactorySpec)SPEC(0x274, func_ov088_02217a3c);
        case 1: return (ActorFactorySpec)SPEC(0x274, func_ov088_0221b394);
        case 2: return (ActorFactorySpec)SPEC(0x274, func_ov088_02217a3c);
        default: return (ActorFactorySpec)NONE;
        }
    default: return (ActorFactorySpec)NONE;
    }
}

/*
 * Select an allocation size and constructor from descriptor kind 0x00 and
 * subtype 0x02, allocate from gHeapContext with tag data_020def5c/alignment
 * four, run the constructor and vtable-offset-0x10 initializer, apply the
 * collection mode flag, copy descriptor halfword 0x52 to actor offset 0xe4,
 * and register the actor through ActorCollection_RegisterActor. Invalid selector values halt.
 * The exact assembly additionally preserves per-case resource loads, overlay
 * aliases, and flag mutations whose scheduling is not represented by this
 * compact portable matrix. Returns the constructed actor.
 */
void *func_0202ecd0(FactoryCollection *self,
                    const ActorSpawnDescriptor *descriptor)
{
    ActorFactorySpec spec = selectFactorySpec(descriptor);
    FactoryActor *actor;

    if (!spec.constructor) {
        OS_Halt();
        return 0;
    }
    actor = (FactoryActor *)Heap_Alloc(spec.size, (const char *)data_020def5c,
                                      4, &gHeapContext);
    if (actor)
        actor = (FactoryActor *)spec.constructor(actor, descriptor);
    if (!actor)
        return 0;
    actor->vtable_00->initialize_10(actor, descriptor);
    if (descriptor->kind_00 == 6)
        actor->flags_14 |= 0x0e;
    if (self->mode_2e84 == 2)
        actor->flags_14 |= 0x04000000;
    else
        Actor_RefreshTerrainHeight(actor);
    actor->descriptorValue_e4 = descriptor->value_52;
    ActorCollection_RegisterActor(self, actor);
    return actor;
}

#undef SPEC
#undef NONE
