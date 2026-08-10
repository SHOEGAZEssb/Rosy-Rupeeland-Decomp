#include "tingle/types.h"

/*
 * Recovered paired-transform update for the source-side actor class. It derives
 * actor transforms and presentation fields from the partner stored at +0x298.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0200500c(void *value, s32 x, s32 y, s32 z);
extern void func_02005058(void *value);
extern void func_020050a4(void *destination, const void *source);
extern void func_02008378(void *destination, const void *left, const void *right);
extern void ActorExtendedType2_RunRenderCallback(void *context, void *actor, void *record);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are the base-update context, actor, and record forwarded to
 * ActorExtendedType2_RunRenderCallback. While actor flags +0x29c bit zero are
 * set, obtain a fixed-point value from vtable +0x1e0, use it to form a
 * temporary transform-like value,
 * combine it with partner +0x18 and +0x28 through func_02008378, and assign the
 * results to actor +0x18/+0x28. After the base update, an enabled nonnull
 * partner also supplies byte +0x3a and halfword +0x28 in the objects at +0x54;
 * the halfword is adjusted by the virtual result and signed actor halfword
 * +0x5c. Finally set bit 0x10 in object +0xa8 halfword +0x24 while partnered,
 * or clear it otherwise. Returns no value; transform, presentation, and base
 * actor state may change, with no direct SDK or hardware access.
 */
void ActorExtendedLinkSource_UpdatePartnerTransform(void *context, void *self, void *record)
{
    u8 *actor = (u8 *)self;
    void *partner;
    u32 offset[4];
    u32 result[4];

    if ((*(u32 *)(actor + 0x29c) & 1) != 0) {
        s32 value = (*(s32 (**)(void *))(*(u8 **)actor + 0x1e0))(actor);
        func_0200500c(offset, 0, 0, value);
        partner = *(void **)(actor + 0x298);
        func_02008378(result, (u8 *)partner + 0x18, offset);
        func_020050a4(actor + 0x18, result);
        func_02005058(result);
        func_02008378(result, (u8 *)partner + 0x28, offset);
        func_020050a4(actor + 0x28, result);
        func_02005058(result);
        func_02005058(offset);
    }

    ActorExtendedType2_RunRenderCallback(context, actor, record);
    partner = *(void **)(actor + 0x298);
    if ((*(u32 *)(actor + 0x29c) & 1) != 0 && partner != 0) {
        u8 *actorObject = *(u8 **)(actor + 0x54);
        u8 *partnerObject = *(u8 **)((u8 *)partner + 0x54);
        s32 value;
        actorObject[0x3a] = partnerObject[0x3a];
        value = (*(s32 (**)(void *))(*(u8 **)actor + 0x1e0))(actor);
        *(u16 *)(actorObject + 0x28) = (u16)(
            *(u16 *)(partnerObject + 0x28) - (value >> 12)
            + *(s16 *)(actor + 0x5c));
        if (*(void **)(actor + 0xa8) != 0)
            *(u16 *)(*(u8 **)(actor + 0xa8) + 0x24) |= 0x10;
    } else if (*(void **)(actor + 0xa8) != 0) {
        *(u16 *)(*(u8 **)(actor + 0xa8) + 0x24) &= (u16)~0x10;
    }
}
