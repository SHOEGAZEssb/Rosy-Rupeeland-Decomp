#include "tingle/types.h"

/*
 * Recovered per-frame state machine for the presentation-backed actor. It
 * advances four numbered states, applies fixed-point motion and collision
 * responses, optionally steers toward another actor, and finishes through a
 * virtual update callback. Offset-based names remain until the actor layout is
 * understood more fully.
 */

extern void *data_021052fc;
extern void *gSceneManager;

#ifdef __cplusplus
extern "C" {
#endif
extern void *SceneManager_GetCurrent(void *manager);
extern void *ActorMotionAreaFollower_GetPosition(void *object);
extern void *ActorCollection_QueueActorForRemoval(void *value, void *actor);
extern void *Actor_GetOwningCollection(void *actor);
extern s32 Actor_QueryTerrainHeight(void *actor, s32 x, s32 y);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_Add(void *destination, const void *source);
extern s32 Fx32Vector2_Magnitude(s32 x, s32 y);
extern void GraphicsSpriteState_SetAnimationIndex(void *presentation, u32 selection);
extern s32 func_020adae4(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef s32 (*ActorGravityCallback)(void *actor);
typedef void (*ActorUpdateCallback)(void *actor);
typedef s32 (*MapQueryCallback)(void *map, s32 x, s32 y);

static s32 fx_mul(s32 a, s32 b)
{
    return (s32)(((s64)a * b + 0x800) >> 12);
}

static void finish_actor(void *actor)
{
    void *prepared = Actor_GetOwningCollection(actor);
    ActorCollection_QueueActorForRemoval(prepared, actor);
    FIELD(u16, actor, 0x1ec) = 3;
}

/*
 * Input is a presentation-backed actor. State 0 integrates motion and handles
 * boundary rebounds; state 1 checks the map and an optional flash timer; state
 * 2 performs a timed exit motion; state 3 is idle. While states 0 or 1 are
 * active, a target at 0x1F8 can influence the velocity at 0x8C..0x94 when more
 * than 0x18000 fixed-point units away. Finally call vtable slot 0xC0. The
 * routine mutates actor, presentation, scene, and map-related engine state but
 * has no direct hardware register effects and returns nothing.
 */
void func_0204d858(void *actor)
{
    u16 state = FIELD(u16, actor, 0x1ec);

    if (state == 0) {
        void *presentation = FIELD(void *, actor, 0x54);
        FIELD(u16, presentation, 0x24) &= (u16)~4;
        VecFx32Object_Assign((u8 *)actor + 0x28, (u8 *)actor + 0x18);
        VecFx32Object_Add((u8 *)actor + 0x18, (u8 *)actor + 0x38);

        ActorGravityCallback getGravityAcceleration =
            *(ActorGravityCallback *)((u8 *)FIELD(void *, actor, 0) + 0xb0);
        FIELD(s32, actor, 0x44) -=
            fx_mul(getGravityAcceleration(actor), 0x1666);

        if (FIELD(u16, actor, 0x4e) == 13 && FIELD(s32, actor, 0x44) < 0 &&
            FIELD(u8, actor, 0x1ef) != FIELD(u8, presentation, 0x38)) {
            GraphicsSpriteState_SetAnimationIndex(presentation, FIELD(u8, actor, 0x1ef));
            FIELD(u16, presentation, 0x24) &= (u16)~2;
        }

        if (FIELD(s32, actor, 0x24) < FIELD(s32, actor, 0x1dc)) {
            FIELD(s32, actor, 0x24) = FIELD(s32, actor, 0x1dc);
            FIELD(s16, actor, 0x1f0)++;
            if (FIELD(s16, actor, 0x1f0) < 2 &&
                FIELD(u16, actor, 0x4e) == 13) {
                FIELD(s32, actor, 0x3c) =
                    func_020adae4(FIELD(s32, actor, 0x3c), 2);
                FIELD(s32, actor, 0x40) =
                    func_020adae4(FIELD(s32, actor, 0x40), 2);
                FIELD(s32, actor, 0x44) =
                    func_020adae4(FIELD(s32, actor, 0x44) * 3, -5);
            } else {
                FIELD(u16, actor, 0x1ec) = 1;
                FIELD(s16, actor, 0x1f0) = 0;
                FIELD(s32, actor, 0x3c) = 0;
                FIELD(s32, actor, 0x40) = 0;
                FIELD(s32, actor, 0x44) = 0;
            }
        } else {
            if (FIELD(u8, actor, 0x4b) & 3)
                FIELD(s32, actor, 0x3c) = -FIELD(s32, actor, 0x3c);
            if (FIELD(u8, actor, 0x4b) & 12)
                FIELD(s32, actor, 0x40) = -FIELD(s32, actor, 0x40);
        }
    } else if (state == 1) {
        void *map = FIELD(void *, data_021052fc, 0x2ed4);
        MapQueryCallback query =
            *(MapQueryCallback *)((u8 *)FIELD(void *, map, 0) + 0x2c);
        s32 x = FIELD(s32, actor, 0x1c) >> 16;
        s32 y = FIELD(s32, actor, 0x20) >> 16;
        s32 tile = query(map, x, y);
        u32 kind = ((u32)tile << 18) >> 28;
        u32 detail = ((u32)tile << 22) >> 27;
        if ((kind == 1 || detail == 14) &&
            (FIELD(s32, actor, 0x24) >> 12) <=
                Actor_QueryTerrainHeight(actor, x, y) * 16) {
            finish_actor(actor);
        }

        if (FIELD(s16, actor, 0x1f4) != -1) {
            void *scene = SceneManager_GetCurrent(gSceneManager);
            if (FIELD(s32, scene, 4) == 1) {
                s32 timer = ++FIELD(s16, actor, 0x1f0);
                s32 limit = FIELD(s16, actor, 0x1f4);
                if (timer < limit) {
                    if (timer > func_020adae4(limit, 2)) {
                        void *presentation = FIELD(void *, actor, 0x54);
                        if (timer & 4)
                            FIELD(u16, presentation, 0x24) |= 4;
                        else
                            FIELD(u16, presentation, 0x24) &= (u16)~4;
                    }
                } else {
                    finish_actor(actor);
                }
            } else {
                FIELD(u16, FIELD(void *, actor, 0x54), 0x24) &= (u16)~4;
            }
        }
    } else if (state == 2) {
        FIELD(u32, actor, 0x14) |= 0x80;
        FIELD(u8, FIELD(void *, actor, 0x54), 0x3a) = 0;
        s16 duration = FIELD(u16, actor, 0x4e) == 10 ? 20 : 40;
        if (++FIELD(s16, actor, 0x1f0) < duration) {
            void *point = ActorMotionAreaFollower_GetPosition((u8 *)data_021052fc + 0x2fbc);
            if (FIELD(u16, actor, 0x4e) == 10) {
                FIELD(s32, actor, 0x1c) =
                    fx_mul(FIELD(s32, actor, 0x1c), 0xc00) +
                    fx_mul(FIELD(s32, point, 4) + 0x12000, 0x400);
                FIELD(s32, actor, 0x20) =
                    fx_mul(FIELD(s32, actor, 0x20), 0xd9a) +
                    fx_mul(FIELD(s32, point, 8) + 0x10000, 0x266);
            } else {
                FIELD(s32, actor, 0x24) += 0x6000;
            }
        } else {
            FIELD(u16, FIELD(void *, actor, 0x54), 0x24) |= 4;
            finish_actor(actor);
        }
    }

    void *target = FIELD(void *, actor, 0x1f8);
    if (target != 0 && FIELD(u16, actor, 0x1ec) < 2) {
        s32 dx = FIELD(s32, target, 0x1c) - FIELD(s32, actor, 0x1c);
        s32 dy = FIELD(s32, target, 0x20) - FIELD(s32, actor, 0x20);
        s32 distance = Fx32Vector2_Magnitude(dx, dy);
        if (distance > 0x18000) {
            FIELD(s32, actor, 0x8c) += func_020adae4(dx, distance);
            FIELD(s32, actor, 0x90) += func_020adae4(dy, distance);
            FIELD(s32, actor, 0x8c) = fx_mul(FIELD(s32, actor, 0x8c), 0xe66);
            FIELD(s32, actor, 0x90) = fx_mul(FIELD(s32, actor, 0x90), 0xe66);
            FIELD(s32, actor, 0x94) = fx_mul(FIELD(s32, actor, 0x94), 0xe66);
            VecFx32Object_Add((u8 *)actor + 0x18, (u8 *)actor + 0x88);
        }
    }

    ActorUpdateCallback callback =
        *(ActorUpdateCallback *)((u8 *)FIELD(void *, actor, 0) + 0xc0);
    callback(actor);
}
