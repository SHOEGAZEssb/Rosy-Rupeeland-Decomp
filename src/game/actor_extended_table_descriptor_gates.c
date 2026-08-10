#include "tingle/types.h"

/*
 * Recovered descriptor-pair predicates and guarded base callbacks for the
 * table-configured extended actor.
 */
extern u8 data_020e0ac8[];
extern u8 data_020e0ae0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0203f2ec(void *actor, void *output);
extern s32 ActorExtendedType2_AccumulateProximityInteraction(void *actor, void *first, void *second);
extern s32 func_02043610(const void *actor);
#ifdef __cplusplus
}
#endif

s32 func_02044718(const void *self);
s32 func_02044760(const void *self);

/*
 * Run base output update func_0203f2ec(actor,output). Leave that output intact
 * when func_02043610 is nonzero or func_02044718 succeeds. Otherwise, if
 * func_02044760 also fails, clear the first three output halfwords. Returns no
 * meaningful value; base actor and caller-owned output state may change.
 */
void func_020446c8(void *self, void *output)
{
    func_0203f2ec(self, output);
    if (func_02043610(self) != 0)
        return;
    if (func_02044718(self) != 0)
        return;
    if (func_02044760(self) == 0) {
        *(u16 *)((u8 *)output + 0) = 0;
        *(u16 *)((u8 *)output + 2) = 0;
        *(u16 *)((u8 *)output + 4) = 0;
    }
}

/*
 * Return one when actor words +0x218/+0x21c match data_020e0ac8+0x18 and
 * data_020e0ae0+4 respectively; the retail comparison also accepts a zero
 * +0x218 after the first comparison. Return zero otherwise; no state changes.
 */
s32 func_02044718(const void *self)
{
    const u8 *actor = (const u8 *)self;
    void *first = *(void *const *)(actor + 0x218);
    if (first != *(void **)(data_020e0ac8 + 0x18))
        return 0;
    if (*(void *const *)(actor + 0x21c) == *(void **)(data_020e0ae0 + 4)
        || first == 0) {
        return 1;
    }
    return 0;
}

/*
 * Return one when actor words +0x218/+0x21c match data_020e0ac8+0/+4; the
 * retail comparison also accepts zero +0x218 after the first comparison.
 * Return zero otherwise; no state changes or hardware effects occur.
 */
s32 func_02044760(const void *self)
{
    const u8 *actor = (const u8 *)self;
    void *first = *(void *const *)(actor + 0x218);
    if (first != *(void **)data_020e0ac8)
        return 0;
    if (*(void *const *)(actor + 0x21c) == *(void **)(data_020e0ac8 + 4)
        || first == 0) {
        return 1;
    }
    return 0;
}

/*
 * When func_02043610 is zero and func_02044760 succeeds, return zero without
 * forwarding. In every other case forward actor and the remaining inputs to
 * ActorExtendedType2_AccumulateProximityInteraction and return its result; base interaction state may change.
 */
s32 func_020447a8(void *self, void *first, void *second)
{
    if (func_02043610(self) == 0 && func_02044760(self) != 0)
        return 0;
    return ActorExtendedType2_AccumulateProximityInteraction(self, first, second);
}
