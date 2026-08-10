#include "tingle/types.h"

/* Recovered completion, manager notification, and neighborhood scan for an animation-sequenced impulse actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void func_020099c0(void *manager_field, s32 event, s32 argument);
extern void func_0202d494(void *handle, void *actor);
extern void *Actor_GetCollection(void *actor);
extern void func_02050260(void *actor);
extern void func_020505f0(void *actor, ...);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is a sequence actor. Obtains its recovered handle, notifies
 * func_0202d494, invokes the recovered effect helper, and, if actor flag 4 is
 * set at offset 0x10, calls func_020099c0 on manager field 0x2FBC with values
 * 0x14 and 3. It finally runs the recovered neighborhood scan func_020505f0.
 * Returns nothing. These engine callbacks can mutate global and actor state;
 * the wrapper does not access hardware directly. Manager-field semantics and
 * numeric notification values are not yet confirmed.
 */
void func_02052254(void *actor)
{
    func_0202d494(Actor_GetCollection(actor), actor);
    func_02050260(actor);
    if ((FIELD(u32, actor, 0x10) & 4) != 0)
        func_020099c0((u8 *)data_021052fc + 0x2fbc, 0x14, 3);
    func_020505f0(actor);
}
