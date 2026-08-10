#include "tingle/types.h"

/* Update mode-nibble actor contact fields or set recovered low flag bits. */
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GameWork_TestFlag(void *work, u32 flag);
#ifdef __cplusplus
}
#endif

/* Preserve the high mode nibble at +0x208 while ORing supplied low bits. */
static void addLowFlags(u8 *actor, u16 bits)
{
    u16 value = *(u16 *)(actor + 0x208);
    *(u16 *)(actor + 0x208) = (u16)((value & 0xf000) |
                                    ((value & 0x0fff) | bits));
}

/*
 * Return without changes when GameWork flag 0x438 is set. If the high nibble
 * of actor halfword +0x208 equals five, store one at +0x10c, copy other
 * halfword +0x4e to +0x110, dereference other pointer +0x1f8 and copy its
 * signed leading halfword to +0x114, then return. Otherwise, OR low flag bit
 * two into +0x208 when enabled is nonzero and always OR bit one, preserving
 * the high nibble. Returns no value; only actor state changes apart from the
 * GameWork query.
 */
void ActorModeNibble_HandleContactFromField1F8(void *self, const void *other, s32 enabled)
{
    u8 *actor = (u8 *)self;
    const u8 *source = (const u8 *)other;
    if (GameWork_TestFlag(gGameWork, 0x438) != 0)
        return;
    if ((*(u16 *)(actor + 0x208) >> 12) == 5) {
        *(s32 *)(actor + 0x10c) = 1;
        *(u32 *)(actor + 0x110) = *(u16 *)(source + 0x4e);
        *(s32 *)(actor + 0x114) =
            *(s16 *)*(void *const *)(source + 0x1f8);
        return;
    }
    if (enabled != 0)
        addLowFlags(actor, 2);
    addLowFlags(actor, 1);
}

/*
 * Behave exactly as ActorModeNibble_HandleContactFromField1F8 except that
 * mode-five contact data obtains the signed halfword through other pointer
 * +0x1fc instead of +0x1f8. Inputs, state changes, return behavior, and
 * GameWork effects are otherwise equal.
 */
void ActorModeNibble_HandleContactFromField1FC(void *self, const void *other, s32 enabled)
{
    u8 *actor = (u8 *)self;
    const u8 *source = (const u8 *)other;
    if (GameWork_TestFlag(gGameWork, 0x438) != 0)
        return;
    if ((*(u16 *)(actor + 0x208) >> 12) == 5) {
        *(s32 *)(actor + 0x10c) = 1;
        *(u32 *)(actor + 0x110) = *(u16 *)(source + 0x4e);
        *(s32 *)(actor + 0x114) =
            *(s16 *)*(void *const *)(source + 0x1fc);
        return;
    }
    if (enabled != 0)
        addLowFlags(actor, 2);
    addLowFlags(actor, 1);
}
