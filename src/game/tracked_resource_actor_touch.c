#include "tingle/types.h"

/* Recovered scene-touch callback for the tracked-resource actor. */

extern const u8 gSceneTouchInitialData[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02031758(const void *source, void *actor,
                          const void *transform);
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
 * Inputs are a source record, actor, and transform. Run func_02031758 with the
 * original inputs. If actor pointer 0x58 is non-null, pass func_02031cac a
 * three-word record containing gSceneTouchInitialData and source words 1..2.
 * Returns nothing; touch state may change and hardware is not accessed
 * directly.
 */
void TrackedResourceActor_ApplyTouchData(const void *source, void *actor,
                                         const void *transform)
{
    func_02031758(source, actor, transform);
    if (FIELD(void *, actor, 0x58) != 0) {
        RecoveredTouchData data;
        data.initial_data = gSceneTouchInitialData;
        data.source_value_04 = FIELD(u32, source, 4);
        data.source_value_08 = FIELD(u32, source, 8);
        func_02031cac(actor, &data);
    }
}
