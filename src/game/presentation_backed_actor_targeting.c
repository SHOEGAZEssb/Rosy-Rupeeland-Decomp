#include "tingle/types.h"

/*
 * Recovered target-acquisition helpers for the presentation-backed actor.
 * They gate interaction on actor and global state, choose between two nearby
 * global actor candidates, and preserve two thin inherited callback thunks.
 */

extern void *data_021052fc;
extern const u8 gActorRuntimeCollection[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorRuntimeCollection_GetPendingAttachmentFlag(const void *state);
extern void func_02031758(void);
extern void func_02032a94(void);
extern s32 Type7Actor_GetStateCode(void *actor);
extern s32 func_0204deec(void *actor);
extern void func_0204df40(void *actor, void *target);
extern s32 func_020adcac(const void *point0, const void *point1);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is an actor. If func_0204deec permits acquisition, compare its point
 * at 0x1C with the global primary actor at data_021052fc+0x2EA4 and trigger
 * func_0204df40 inside 0x10000 units. Otherwise consider the secondary actor
 * at +0x2EA8 when it exists, passes Type7Actor_GetStateCode, and is inside 0x18000 units.
 * Returns nothing; the chosen handler may mutate actor and global engine state.
 */
void func_0204de18(void *actor)
{
    void *primary;
    void *secondary;

    if (!func_0204deec(actor))
        return;

    primary = FIELD(void *, data_021052fc, 0x2ea4);
    if (func_020adcac((u8 *)primary + 0x1c, (u8 *)actor + 0x1c) < 0x10000) {
        func_0204df40(actor, primary);
        return;
    }

    secondary = FIELD(void *, data_021052fc, 0x2ea8);
    if (secondary == 0 || Type7Actor_GetStateCode(secondary) != 0)
        return;
    if (func_020adcac((u8 *)secondary + 0x1c, (u8 *)actor + 0x1c) <
        0x18000) {
        func_0204df40(actor, secondary);
    }
}

/*
 * Forward all register inputs to func_02032a94 and propagate its return value.
 * This recovered tail-call thunk has only the callee's engine-side effects.
 */
void func_0204ded4(void)
{
    func_02032a94();
}

/*
 * Forward all register inputs to func_02031758 and propagate its return value.
 * This recovered tail-call thunk has only the callee's engine-side effects.
 */
void func_0204dee0(void)
{
    func_02031758();
}

/*
 * Input is an actor. Return one only when state 0x1EC is 1, the global gate
 * queried with gActorRuntimeCollection is clear, and bit 0x100 is absent from the primary
 * actor's word at 0xD0; otherwise return zero. No state or hardware is changed.
 */
s32 func_0204deec(void *actor)
{
    if (FIELD(u16, actor, 0x1ec) == 1 &&
        ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection) == 0) {
        void *primary = FIELD(void *, data_021052fc, 0x2ea4);
        if ((FIELD(u32, primary, 0xd0) & 0x100) == 0)
            return 1;
    }
    return 0;
}
