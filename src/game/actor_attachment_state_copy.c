#include "tingle/types.h"

/* Place and synchronize an actor's secondary attachment from its primary one. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 DisplayController_GetSubScreenVerticalOffset(void);
extern void func_020083b0(void *, s32, s32, s32, s32);
extern s32 GamePhaseRegion_ContainsPoint(const void *, s32, s32);
extern void func_02072b68(void *, s32);
extern void func_02072bdc(void *, s32);
#ifdef __cplusplus
}
#endif

static void copyFlag(u8 *destination, const u8 *source, u16 mask)
{
    if (*(const u16 *)(source + 0x24) & mask)
        *(u16 *)(destination + 0x24) |= mask;
    else
        *(u16 *)(destination + 0x24) &= ~mask;
}

/*
 * If secondary attachment 0x58 exists, place it at point 0x04/0x08 plus the
 * DisplayController_GetSubScreenVerticalOffset vertical offset. Test that point against a 256x192 rectangle
 * reduced by actor halfwords 0x68-0x6e and mirror visibility to attachment flag
 * eight. Synchronize animation bytes 0x38/0x39 through their helpers, copy
 * flags 2/4/0x10/0x20/0x40/0x80/0x200, then copy fields 0x28/0x30/0x32-0x36
 * and byte 0x3a from primary attachment 0x54. Confirmed retail behavior clears
 * destination bit 0x20, rather than 0x200, when source bit 0x200 is absent.
 * Returns no value; animation helpers may affect presentation state.
 */
void func_02031cac(void *self, const void *pointPointer)
{
    u8 *actor = (u8 *)self;
    const u8 *point = (const u8 *)pointPointer;
    u8 *destination = *(u8 **)(actor + 0x58);
    u8 *source;
    s16 rectangle[4];
    s32 verticalOffset;

    if (!destination)
        return;
    verticalOffset = DisplayController_GetSubScreenVerticalOffset();
    *(s16 *)(destination + 0x2c) = (s16)*(s32 *)(point + 0x04);
    *(s16 *)(destination + 0x2e) =
        (s16)(*(s32 *)(point + 0x08) + verticalOffset);
    func_020083b0(rectangle, 0, 0, 0x100, 0xc0);
    rectangle[0] -= *(s16 *)(actor + 0x6c);
    rectangle[1] -= *(s16 *)(actor + 0x6e);
    rectangle[2] -= *(s16 *)(actor + 0x68);
    rectangle[3] -= *(s16 *)(actor + 0x6a);
    verticalOffset = DisplayController_GetSubScreenVerticalOffset();
    if (GamePhaseRegion_ContainsPoint(rectangle, *(s32 *)(point + 0x04),
                      *(s32 *)(point + 0x08) + verticalOffset))
        *(u16 *)(destination + 0x24) &= ~8;
    else
        *(u16 *)(destination + 0x24) |= 8;

    source = *(u8 **)(actor + 0x54);
    if (destination[0x38] != source[0x38])
        func_02072b68(destination, source[0x38]);
    if (destination[0x39] != source[0x39])
        func_02072bdc(destination, source[0x39]);
    copyFlag(destination, source, 2);
    copyFlag(destination, source, 4);
    copyFlag(destination, source, 0x10);
    copyFlag(destination, source, 0x40);
    copyFlag(destination, source, 0x80);
    copyFlag(destination, source, 0x20);
    if (*(u16 *)(source + 0x24) & 0x200)
        *(u16 *)(destination + 0x24) |= 0x200;
    else
        *(u16 *)(destination + 0x24) &= ~0x20;
    *(s16 *)(destination + 0x36) = *(s16 *)(source + 0x36);
    *(s16 *)(destination + 0x32) = *(s16 *)(source + 0x32);
    *(s16 *)(destination + 0x34) = *(s16 *)(source + 0x34);
    destination[0x3a] = source[0x3a];
    *(u16 *)(destination + 0x28) = *(u16 *)(source + 0x28);
    *(s16 *)(destination + 0x30) = *(s16 *)(source + 0x30);
}
