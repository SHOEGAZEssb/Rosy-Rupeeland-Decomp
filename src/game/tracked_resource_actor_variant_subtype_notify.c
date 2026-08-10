#include "tingle/types.h"

/* Recovered subtype-specific neighborhood scan and manager notification for a tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void ActorMotionJitter_EnsureMinimum(void *manager_field, s32 event, s32 argument);
extern void func_020505f0(void *actor, ...);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is a variant actor. Only subtype halfword 0x19 is handled: run the
 * recovered neighborhood scan, then, when actor flag 4 at offset 0x10 is set,
 * call ActorMotionJitter_EnsureMinimum on manager field 0x2FBC with values 0x14 and 3. Returns
 * nothing. The scan and manager callback mutate engine state and may cross SDK
 * boundaries; this wrapper does not access hardware directly. The meaning of
 * the manager field and numeric callback values remains unconfirmed.
 */
void func_02051314(void *actor)
{
    if (FIELD(s16, actor, 0x4e) != 0x19)
        return;
    func_020505f0(actor);
    if ((FIELD(u32, actor, 0x10) & 4) != 0)
        ActorMotionJitter_EnsureMinimum((u8 *)data_021052fc + 0x2fbc, 0x14, 3);
}
