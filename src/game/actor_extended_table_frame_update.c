#include "tingle/types.h"

/* Recovered callback-sensitive frame update for the table-configured extended actor. */
extern u8 data_020e0ac8[];
extern u8 data_020e0ad0[];
extern u8 data_020e0ad8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorExtendedType2_UpdateFrame(void *actor);
extern void func_02032228(void *actor, s32 first, s32 second, s32 third);
extern s32 func_02043610(const void *actor);
extern s32 func_02044718(const void *actor);
extern s32 func_02044760(const void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Return immediately while actor +0x14 bit 0x200000 is set. Otherwise clear
 * actor +0x260 bit 0x400 whenever func_02043610 is nonzero or the callback pair
 * at +0x218/+0x21c matches either predicate func_02044718/func_02044760, the
 * data_020e0ac8+0x10/data_020e0ad8+4 pair, or the
 * data_020e0ac8+8/data_020e0ad0+4 pair. For all other callback pairs, set bit
 * 0x400, obtain a value from vtable +0x140, and call
 * func_02032228(actor,0,0x1000,value). Finish with ActorExtendedType2_UpdateFrame. Actor, virtual,
 * and motion state may change; no direct SDK or hardware operation occurs.
 */
void func_0204483c(void *self)
{
    u8 *actor = (u8 *)self;
    void *first;
    void *second;
    s32 recognized = 0;

    if ((*(u32 *)(actor + 0x14) & 0x200000) != 0)
        return;
    if (func_02043610(actor) != 0) {
        recognized = 1;
    } else if (func_02044718(actor) != 0 || func_02044760(actor) != 0) {
        recognized = 1;
    } else {
        first = *(void **)(actor + 0x218);
        second = *(void **)(actor + 0x21c);
        if (first == *(void **)(data_020e0ac8 + 0x10)
            && (second == *(void **)(data_020e0ad8 + 4) || first == 0)) {
            recognized = 1;
        } else if (first == *(void **)(data_020e0ac8 + 8)
                   && (second == *(void **)(data_020e0ad0 + 4) || first == 0)) {
            recognized = 1;
        }
    }
    if (recognized) {
        *(u32 *)(actor + 0x260) &= ~0x400u;
    } else {
        s32 value;
        *(u32 *)(actor + 0x260) |= 0x400;
        value = (*(s32 (**)(void *))(*(u8 **)actor + 0x140))(actor);
        func_02032228(actor, 0, 0x1000, value);
    }
    ActorExtendedType2_UpdateFrame(actor);
}
