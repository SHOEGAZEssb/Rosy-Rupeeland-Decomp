#include "tingle/types.h"

/*
 * Recovered touch-data callback for the grid/effect actor. It augments the
 * inherited callback with scene touch initialization when the actor owns an
 * active presentation object.
 */

extern const u8 gSceneTouchInitialData[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_UpdatePresentation(void *screenPosition, void *actor,
                                     const void *viewPosition);
extern void ActorAttachment_CopyTouchState(void *actor, const void *touch_data);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct RecoveredTouchData {
    const void *initial_data;
    u32 source_value_04;
    u32 source_value_08;
} RecoveredTouchData;

/*
 * Inputs are a writable screen-position record, actor, and borrowed view
 * position. Run
 * the inherited Actor_UpdatePresentation callback with all three original inputs. If
 * actor pointer 0x58 is non-null, build
 * a three-word record containing gSceneTouchInitialData and screen-position
 * words 1..2,
 * then pass it to ActorAttachment_CopyTouchState. Returns nothing; actor touch state may change
 * and no hardware is accessed directly.
 */
void GridEffectActor_ApplyTouchData(void *screenPosition, void *actor,
                                    const void *viewPosition)
{
    Actor_UpdatePresentation(screenPosition, actor, viewPosition);
    if (FIELD(void *, actor, 0x58) != 0) {
        RecoveredTouchData data;
        data.initial_data = gSceneTouchInitialData;
        data.source_value_04 = FIELD(u32, screenPosition, 4);
        data.source_value_08 = FIELD(u32, screenPosition, 8);
        ActorAttachment_CopyTouchState(actor, &data);
    }
}
