#include "tingle/actor_motion.h"

/*
 * Extract a motion destination from the bound actor. Actor fields remain
 * offset-named because the complete actor type and mode byte are not recovered.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 Actor_GetCachedTerrainHeight(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Construct `result`, derive its X/Y components from the actor bound at offset
 * four, then combine it with the motion target vector at offset 0x34. Actor
 * mode byte 1 enables additional offsets at 0x23c..0x244; motion flag 0x8
 * selects the alternate Y calculation and invokes Actor_GetCachedTerrainHeight, whose exact
 * actor-side effect is not yet known. Returns no value; no hardware is touched.
 */
void func_02009514(VecFx32Object *result, const ActorMotion *self)
{
    u8 *actor = (u8 *)self->actor;

    func_02004fe0(result);
    if (*(u8 *)(actor + 0x4d) == 1) {
        result->value.x = *(s32 *)(actor + 0x1c) +
                          *(s32 *)(actor + 0x23c);
        if (self->field_30 & 8) {
            s32 offset = *(s32 *)(actor + 0x240);
            s32 adjustment = Actor_GetCachedTerrainHeight(actor);
            actor = (u8 *)self->actor;
            result->value.y = *(s32 *)(actor + 0x20) + offset - adjustment;
        } else {
            result->value.y = *(s32 *)(actor + 0x20) -
                              *(s32 *)(actor + 0x24) +
                              *(s32 *)(actor + 0x240) -
                              *(s32 *)(actor + 0x244);
        }
        func_020050c8(result, &self->target);
        return;
    }

    result->value.x = *(s32 *)(actor + 0x1c);
    result->value.y = *(s32 *)(actor + 0x20);
    func_020050c8(result, &self->target);
}
