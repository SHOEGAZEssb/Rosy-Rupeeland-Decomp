#include "tingle/types.h"

/*
 * Recovered four-state update for the grid/effect actor. It handles ordinary
 * motion and collision, map/scene termination, a timed grid-rendered departure,
 * and proximity-triggered interaction with two globally tracked actors.
 */

extern void *data_020f4e14;
extern void *data_021052fc;
extern u8 data_02105790[];
extern void *gSceneManager;

#ifdef __cplusplus
extern "C" {
#endif
extern void *SceneManager_GetCurrent(void *manager);
extern void func_020050a4(void *destination, const void *source);
extern void func_020050c8(void *destination, const void *source);
extern void GraphicsSpriteState_SetScreenPositionCulled(void *presentation, s32 x, s32 y, s32 mode);
extern void *ActorCollection_QueueActorForRemoval(void *value, void *actor);
extern void *Actor_GetCollection(void *actor);
extern s32 Actor_QueryTerrainHeight(void *actor, s32 x, s32 y);
extern s32 Type7Actor_GetStateCode(void *actor);
extern s32 func_0204f478(void *actor);
extern void func_0204f4d4(void *actor, void *target);
extern u32 func_020628c8(void *subobject);
extern void func_02075598(void *context, u32 resource);
extern void func_02076148(void *context, u32 value, s32 x, s32 y,
                          s32 width, s32 height, s32 mode);
extern s32 func_020761f8(void *context, u32 value, s32 width, s32 mode);
extern s32 func_020ada8c(s32 numerator, s32 denominator);
extern s32 func_020adcac(const void *point0, const void *point1);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef s32 (*ActorScalarCallback)(void *actor);
typedef void (*ActorStateCallback)(void *actor, s32 value);
typedef s32 (*MapQueryCallback)(void *map, s32 x, s32 y);

static s32 fx_mul(s32 a, s32 b)
{
    return (s32)(((s64)a * b + 0x800) >> 12);
}

static void set_state(void *actor, u16 state)
{
    FIELD(u16, actor, 0x1f0) =
        (FIELD(u16, actor, 0x1f0) & (u16)~3) | state;
}

static void finish_actor(void *actor)
{
    ActorCollection_QueueActorForRemoval(Actor_GetCollection(actor), actor);
    FIELD(u32, data_021052fc, 0x30b8) |= 0x10;
    set_state(actor, 3);
}

/*
 * Input is a grid/effect actor. Increment the upper-bit counter in halfword
 * 0x1F0 up to 0x2000 and clear byte 0x21B. State 0 integrates velocity and
 * collision; state 1 checks map termination and an optional scene-driven flash
 * timer at 0x218; state 2 spends 120 frames interpolating toward coordinates
 * derived from byte 0x21A and the grid query object at 0x1F4 while drawing only
 * inside the recovered screen bounds; state 3 invokes virtual slot 0x54.
 * Finally, when func_0204f478 permits it, interact through func_0204f4d4 with
 * the first eligible global actor inside 0x18000 units. Actor, presentation,
 * scene, and grid state may change; no hardware registers are touched directly.
 */
void func_0204ee24(void *actor)
{
    u16 flags = FIELD(u16, actor, 0x1f0);
    u32 age = flags >> 2;
    if (age < 0x2000)
        FIELD(u16, actor, 0x1f0) = (flags & 3) | (u16)((age + 1) << 2);

    FIELD(u8, actor, 0x21b) = 0;
    func_020050a4((u8 *)actor + 0x28, (u8 *)actor + 0x18);

    switch (FIELD(u16, actor, 0x1f0) & 3) {
    case 0: {
        void *presentation = FIELD(void *, actor, 0x54);
        FIELD(u16, presentation, 0x24) &= (u16)~4;
        ActorScalarCallback gravity =
            *(ActorScalarCallback *)((u8 *)FIELD(void *, actor, 0) + 0xb0);
        FIELD(s32, actor, 0x44) -= gravity(actor);
        func_020050c8((u8 *)actor + 0x18, (u8 *)actor + 0x38);
        if (FIELD(s32, actor, 0x24) < FIELD(s32, actor, 0x1dc)) {
            FIELD(s32, actor, 0x24) = FIELD(s32, actor, 0x1dc);
            set_state(actor, 1);
            FIELD(u16, actor, 0x1f2) = 0;
            FIELD(s32, actor, 0x3c) = 0;
            FIELD(s32, actor, 0x40) = 0;
            FIELD(s32, actor, 0x44) = 0;
        } else {
            if (FIELD(u8, actor, 0x4b) & 3)
                FIELD(s32, actor, 0x3c) = -FIELD(s32, actor, 0x3c);
            if (FIELD(u8, actor, 0x4b) & 12)
                FIELD(s32, actor, 0x40) = -FIELD(s32, actor, 0x40);
        }
        break;
    }

    case 1: {
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

        s16 limit = FIELD(s16, actor, 0x218);
        if (limit != -1) {
            void *scene = SceneManager_GetCurrent(gSceneManager);
            if (FIELD(s32, scene, 4) == 1) {
                s32 timer = ++FIELD(s16, actor, 0x1f2);
                if (timer < limit) {
                    s32 half = (limit + ((u32)limit >> 31)) >> 1;
                    if (timer > half) {
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
        break;
    }

    case 2: {
        FIELD(u32, actor, 0x14) |= 0x80;
        FIELD(u8, FIELD(void *, actor, 0x54), 0x3a) = 0;
        s8 mode = FIELD(s8, actor, 0x21a);
        void *grid_context = data_020f4e14;
        func_02075598(grid_context, FIELD(u32, data_02105790, 8));
        u32 value = func_020628c8((u8 *)actor + 0x1f4);
        s32 grid_x = func_020761f8(grid_context, value, 8, 0);
        s32 target_x = mode < 6 ? 0x12000 : 0xe8000 - grid_x * 0x1000;
        s32 target_y = mode == -1 ? 0 : func_020ada8c(mode, 6) * 0x18000;

        if (++FIELD(s16, actor, 0x1f2) < 120) {
            FIELD(s32, actor, 0x1c) =
                fx_mul(FIELD(s32, actor, 0x1c), 0xc00) +
                fx_mul(target_x, 0x400);
            FIELD(s32, actor, 0x20) =
                fx_mul(FIELD(s32, actor, 0x20), 0xd9a) +
                fx_mul(target_y + 0x10000, 0x266);
            s32 pixel_x = FIELD(s32, actor, 0x1c) >> 12;
            s32 pixel_y = FIELD(s32, actor, 0x20) >> 12;
            if (pixel_x > 8 && pixel_x < 230 && pixel_y > 12 && pixel_y < 180) {
                func_02075598(grid_context, FIELD(u32, data_02105790, 8));
                value = func_020628c8((u8 *)actor + 0x1f4);
                func_02076148(grid_context, value, pixel_x, pixel_y, 13, 8, 0);
            }
            FIELD(u32, data_021052fc, 0x30b8) |= 0x10;
        } else {
            FIELD(u16, FIELD(void *, actor, 0x54), 0x24) |= 4;
            finish_actor(actor);
        }
        GraphicsSpriteState_SetScreenPositionCulled(FIELD(void *, actor, 0x54),
                      FIELD(s32, actor, 0x1c) >> 12,
                      FIELD(s32, actor, 0x20) >> 12, 4);
        break;
    }

    case 3: {
        ActorStateCallback callback =
            *(ActorStateCallback *)((u8 *)FIELD(void *, actor, 0) + 0x54);
        callback(actor, 0);
        break;
    }
    }

    if (func_0204f478(actor)) {
        void *primary = FIELD(void *, data_021052fc, 0x2ea4);
        if (func_020adcac((u8 *)primary + 0x1c,
                          (u8 *)actor + 0x1c) < 0x18000) {
            func_0204f4d4(actor, primary);
        } else {
            void *secondary = FIELD(void *, data_021052fc, 0x2ea8);
            if (secondary != 0 && Type7Actor_GetStateCode(secondary) == 0 &&
                func_020adcac((u8 *)secondary + 0x1c,
                              (u8 *)actor + 0x1c) < 0x18000) {
                func_0204f4d4(actor, secondary);
            }
        }
    }
}
