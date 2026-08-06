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
extern void func_02031758(const void *source, void *actor);
extern void func_02031cac(void *actor, const void *touch_data);
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
 * Inputs are a source record and an actor. Run the inherited func_02031758
 * callback with both original inputs. If actor pointer 0x58 is non-null, build
 * a three-word record containing gSceneTouchInitialData and source words 1..2,
 * then pass it to func_02031cac. Returns nothing; actor touch state may change
 * and no hardware is accessed directly.
 */
void func_0204edd4(const void *source, void *actor)
{
    func_02031758(source, actor);
    if (FIELD(void *, actor, 0x58) != 0) {
        RecoveredTouchData data;
        data.initial_data = gSceneTouchInitialData;
        data.source_value_04 = FIELD(u32, source, 4);
        data.source_value_08 = FIELD(u32, source, 8);
        func_02031cac(actor, &data);
    }
}

