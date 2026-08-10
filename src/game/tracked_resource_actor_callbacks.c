#include "tingle/types.h"

/*
 * Recovered interaction, post-update, and visibility callbacks for the
 * tracked-resource actor. They bridge inherited behavior with private flags,
 * the primary global actor, and a screen-relative bounded action.
 */

extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02009d78(void *object);
extern void func_02032a94(void *actor, void *context, s32 condition);
extern void Actor_SetInteractionFlag2000(void *actor, void *context);
extern void func_02034a60(void *actor, u16 value, s32 mode,
                          s32 top, s32 left, s32 right, s32 bottom);
extern void ActorDerivedType1_ScanActiveRecordCollisions(void *actor);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef void (*ActorStateCallback)(void *actor, void *context, s32 condition);

/*
 * Inputs are an actor, context, and condition. When condition is zero, invoke
 * virtual slot 0xC4 with the original arguments, then always call inherited
 * func_02032a94 with all three inputs. Returns nothing; callback engine state
 * may change and no hardware is accessed directly.
 */
void func_0204ff0c(void *actor, void *context, s32 condition)
{
    if (condition == 0) {
        ActorStateCallback callback =
            *(ActorStateCallback *)((u8 *)FIELD(void *, actor, 0) + 0xc4);
        callback(actor, context, condition);
    }
    func_02032a94(actor, context, condition);
}

/*
 * Inputs are an actor and context. If the low 15 bits of halfword 0x1F0 are
 * zero and bit 0 of word 0x1F4 is clear, invoke ActorDerivedType1_ScanActiveRecordCollisions on the primary
 * global actor. Then always run Actor_SetInteractionFlag2000 with the original inputs. Returns
 * nothing; actor/global engine state may change without direct hardware effects.
 */
void func_0204ff40(void *actor, void *context)
{
    if ((FIELD(u16, actor, 0x1f0) & 0x7fff) == 0 &&
        (FIELD(u32, actor, 0x1f4) & 1) == 0) {
        ActorDerivedType1_ScanActiveRecordCollisions(FIELD(void *, data_021052fc, 0x2ea4));
    }
    Actor_SetInteractionFlag2000(actor, context);
}

/*
 * Input is an actor; remaining register inputs are unused. If the object at
 * 0x1FC supplies a nonzero halfword at 0x1E, calculate the actor's pixel offset
 * from the global point (subtracting actor height from Y). When it lies within
 * bounds [-right,256-left) and [-bottom,192-top), set actor flag 4 and call
 * func_02034a60 with that value and the four signed bounds at 0x68..0x6E.
 * Returns nothing; actor/action state may change and hardware is untouched directly.
 */
void func_0204ff98(void *actor)
{
    void *object = FIELD(void *, actor, 0x1fc);
    u16 value = FIELD(u16, object, 0x1e);
    if (value != 0) {
        void *point = func_02009d78((u8 *)data_021052fc + 0x2fbc);
        s32 left = FIELD(s16, actor, 0x68);
        s32 top = FIELD(s16, actor, 0x6a);
        s32 right = FIELD(s16, actor, 0x6c);
        s32 bottom = FIELD(s16, actor, 0x6e);
        s32 dx = (FIELD(s32, actor, 0x1c) >> 12) -
                 (FIELD(s32, point, 4) >> 12);
        s32 dy = (FIELD(s32, actor, 0x20) >> 12) -
                 ((FIELD(s32, point, 8) >> 12) +
                  (FIELD(s32, actor, 0x24) >> 12));
        if (dx >= -right && dx < 256 - left &&
            dy >= -bottom && dy < 192 - top) {
            FIELD(u32, actor, 0x10) |= 4;
            func_02034a60(actor, value, 0, top, left, right, bottom);
        }
    }
}

