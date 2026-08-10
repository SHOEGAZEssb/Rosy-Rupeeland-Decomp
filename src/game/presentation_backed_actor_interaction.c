#include "tingle/types.h"

/*
 * Recovered interaction dispatcher for the presentation-backed actor. Actor
 * type selects counter, sound, spawned-effect, and completion behavior while
 * the common path stops normal presentation playback before dispatch.
 */

extern void *data_021052fc;
extern void *gGameWork;
extern void *gHeapContext;
extern void *gLupyContext;
extern void *gSoundContext;
extern const u8 data_020e251c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32 size, const void *tag, u32 align, void *heap);
extern void Sound_Play(void *context, s32 bank, s32 sound);
extern void *func_02009d78(void *object);
extern void func_02010c00(void *context, s32 value, s32 mode);
extern void func_0201ded4(void *manager, void *effect);
extern void *func_0201e0ec(void *manager);
extern void *func_02022cb0(void *storage, void *point, void *actor, s32 value,
                           s32 scale, s32 vertical_offset);
extern void *ActorCollection_QueueActorForRemoval(void *value, void *actor);
extern void *Actor_GetCollection(void *actor);
extern void func_02038d38(void *actor, const void *position, s32 value,
                          s32 mode);
extern void func_02072b68(void *presentation, u32 selection);
extern void func_020a25c8(void *manager, s32 mode, s32 x, s32 y,
                          s32 width, s32 height, s32 kind);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef s32 (*ActorPredicate)(void *actor);

static void complete_interaction(void *actor)
{
    FIELD(u16, FIELD(void *, actor, 0x54), 0x24) |= 4;
    ActorCollection_QueueActorForRemoval(Actor_GetCollection(actor), actor);
    FIELD(u16, actor, 0x1ec) = 3;
}

/*
 * Inputs are an actor and the actor that triggered it. Type 13 is rejected
 * immediately. Other types reset the timer at 0x1F0, select the alternate
 * presentation byte at 0x1EF, enable presentation byte 0x3A, hide flag 4, and
 * set the low half of word 0x5C to 0xFF00. Types 10/19 spawn and register an
 * effect and complete; 11/12 submit three times the signed value at 0x1F2 and
 * enter state 2; type 18 increments gGameWork+0xF6, emits a visual, and
 * completes. Applicable cases play sound IDs 15, 17, or 18. Return the signed
 * 0x1F2 value (or zero for rejected type 13). Engine heap, sound, presentation,
 * effect, and actor state may change; no hardware registers are touched here.
 */
s32 func_0204df40(void *actor, void *trigger)
{
    u16 type = FIELD(u16, actor, 0x4e);
    s32 sound = -1;

    if (type == 13)
        return 0;

    FIELD(u16, actor, 0x1f0) = 0;
    func_02072b68(FIELD(void *, actor, 0x54), FIELD(u8, actor, 0x1ef));
    FIELD(u8, FIELD(void *, actor, 0x54), 0x3a) = 1;
    FIELD(u16, FIELD(void *, actor, 0x54), 0x24) &= (u16)~4;
    FIELD(u32, actor, 0x5c) = (FIELD(u32, actor, 0x5c) & 0xffff0000) | 0xff00;

    if (type == 10 || type == 19) {
        void *primary = FIELD(void *, data_021052fc, 0x2ea4);
        if (FIELD(u8, trigger, 0x4d) == 1) {
            ActorPredicate predicate =
                *(ActorPredicate *)((u8 *)FIELD(void *, primary, 0) + 0xa8);
            if (predicate(primary) == 0)
                func_02038d38(primary, (u8 *)actor + 0x18, 15, 2);
        }

        func_02010c00(gLupyContext, FIELD(s16, actor, 0x1f2), 0);
        void *effect = Heap_Alloc(0x44, data_020e251c, 4, gHeapContext);
        if (effect != 0) {
            void *point = func_02009d78((u8 *)data_021052fc + 0x2fbc);
            effect = func_02022cb0(effect, point, actor,
                                   FIELD(s16, actor, 0x1f2), 0x2000, -0xc0);
        }
        func_0201ded4((u8 *)data_021052fc + 0x2f7c, effect);

        if (type == 19) {
            void *manager = func_0201e0ec((u8 *)data_021052fc + 0x2f7c);
            s32 x = (FIELD(s32, actor, 0x1c) >> 12) - 20;
            s32 y = (FIELD(s32, actor, 0x20) >> 12) -
                    (FIELD(s32, actor, 0x24) >> 12) - 20;
            func_020a25c8(manager, 0, x, y, 40, 40, 15);
        }
        complete_interaction(actor);
        sound = 15;
    } else if (type == 11 || type == 12) {
        func_02010c00(gLupyContext, FIELD(s16, actor, 0x1f2) * 3, 0);
        FIELD(u16, actor, 0x1ec) = 2;
        sound = type == 11 ? 17 : 18;
    } else if (type == 18) {
        FIELD(s16, gGameWork, 0xf6) += FIELD(s16, actor, 0x1f2);
        void *manager = func_0201e0ec((u8 *)data_021052fc + 0x2f7c);
        s32 x = FIELD(s32, actor, 0x1c) >> 12;
        s32 y = (FIELD(s32, actor, 0x20) >> 12) -
                (FIELD(s32, actor, 0x24) >> 12) - 20;
        func_020a25c8(manager, 0, x, y, 32, 24, 0x46);
        complete_interaction(actor);
        sound = 15;
    }

    if (sound != -1)
        Sound_Play(gSoundContext, (u16)sound >> 7, (u16)sound & 0x7f);
    return FIELD(s16, actor, 0x1f2);
}

