#include "tingle/types.h"

/*
 * Handle registered-subclass interactions and the four-entry global registry
 * used to select a nearby actor at the end of an update interval.
 */
extern s16 data_02105714[2];
extern void *data_02105718[4];
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorTableRecord_ApplyCollisionResponse(void *actor, s32 value,
                                                    s32 zero, s32 extra);
extern void func_0203d48c(void *actor, u16 limit);
extern s32 func_02007868(void *actor);
extern void func_0203d3fc(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Return immediately when actor +0x14 bit two is set. Otherwise forward value
 * r1 and original r2 as the first and fourth non-self arguments of
 * ActorTableRecord_ApplyCollisionResponse, with zero between them. Start or
 * clamp the timed state to data_02105714[0]*6+16 frames and increment that
 * counter. Returns no value; actor interaction state and the global counter
 * change.
 */
void func_0203d8bc(void *self, s32 value, s32 extra)
{
    u8 *actor = (u8 *)self;

    if ((*(u32 *)(actor + 0x14) & 2) != 0)
        return;
    ActorTableRecord_ApplyCollisionResponse(actor, value, 0, extra);
    func_0203d48c(actor, (u16)(data_02105714[0] * 6 + 16));
    ++data_02105714[0];
}

/*
 * Clear all four actor registry slots and both adjacent signed-halfword
 * counters in data_02105714. Takes no arguments, returns no value, and resets
 * the complete registered-subclass global state.
 */
void func_0203d910(void)
{
    s32 i;

    for (i = 0; i < 4; ++i)
        data_02105718[i] = 0;
    data_02105714[1] = 0;
    data_02105714[0] = 0;
}

/*
 * If counter data_02105714[1] is nonzero and the primary runtime actor passes
 * func_02007868, scan all four registry slots, selecting the actor whose
 * attachment halfword +0x28 is smallest. Every occupied slot is cleared while
 * scanning. If the selected actor is within squared X/Y distance 1600 of the
 * primary actor (coordinates shifted down 12), invoke func_0203d3fc on it.
 * Finally clear data_02105714[0]. Returns no value; registry, counter, and actor
 * interaction state may change. A zero [1] counter returns without clearing.
 */
void func_0203d944(void)
{
    u8 *primary;
    u8 *selected = 0;
    s32 minimum = 0x7fffffff;
    s32 i;

    if (data_02105714[1] == 0)
        return;
    primary = *(u8 **)(data_021052fc + 0x2ea4);
    if (func_02007868(primary) != 0) {
        for (i = 0; i < 4; ++i) {
            u8 *candidate = (u8 *)data_02105718[i];
            if (candidate != 0) {
                s32 rank = *(u16 *)(*(u8 **)(candidate + 0x54) + 0x28);
                if (rank < minimum) {
                    minimum = rank;
                    selected = candidate;
                }
                data_02105718[i] = 0;
            }
        }
        if (selected != 0) {
            s32 dy = (*(s32 *)(primary + 0x20) >> 12) -
                     (*(s32 *)(selected + 0x20) >> 12);
            s32 dx = (*(s32 *)(primary + 0x1c) >> 12) -
                     (*(s32 *)(selected + 0x1c) >> 12);
            if (dy * dy + dx * dx < 1600)
                func_0203d3fc(selected);
        }
    }
    data_02105714[0] = 0;
}

/* Return one without reading inputs or changing state. */
s32 func_0203da20(void)
{
    return 1;
}
