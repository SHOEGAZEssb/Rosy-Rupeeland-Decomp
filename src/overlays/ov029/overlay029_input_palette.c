#include "tingle/types.h"

/* Overlay 29 controller-input translation and palette-transition selectors. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *GraphicsBgResourceData_GetDecoded(void *);
extern s32 TitleDialog_UpdateTextPage(void *, const void *);
extern void func_ov045_0220c028(void *);
extern void func_ov045_0220c128(void *, s32);
extern void func_ov045_0220c174(void *);
extern s32 func_ov045_0220c280(void *);
#ifdef __cplusplus
}
#endif

/*
 * Copies eleven halfwords from input packet +0x2C, then translates controller
 * +0x9C flags +0x38 and scene flag bit 5 into bits 0/1 of the copied packet's
 * second halfword. Depending on those gates it may query/reset or trigger the
 * external object +0xA4. The adjusted packet is applied through 0x02093360;
 * result bit 9 forwards controller value +0xE8 to the external object, and
 * result bit 0 triggers it and returns one. An already-set controller bit 0
 * also returns one immediately; all other paths return zero. Input/UI and
 * external overlay state may change; no hardware is accessed directly.
 */
extern "C" s32 func_ov029_021fd850(void *state)
{
    u16 packet[11];
    const u16 *source = FIELD(const u16 *, state, 0x2c);
    for (s32 i = 0; i < 11; ++i)
        packet[i] = source[i];
    void *controller = FIELD(void *, state, 0x9c);
    u32 controllerFlags = FIELD(u32, controller, 0x38);
    if (controllerFlags & 1)
        return 1;
    if (FIELD(u32, state, 0x20) & 0x20) {
        if (controllerFlags & 2) {
            void *external = FIELD(void *, state, 0xa4);
            if (func_ov045_0220c280(external) != 0)
                func_ov045_0220c028(external);
            packet[1] |= 1;
        } else {
            packet[1] |= 2;
        }
    } else if (controllerFlags & 2) {
        func_ov045_0220c174(FIELD(void *, state, 0xa4));
    }
    u32 result = (u32)TitleDialog_UpdateTextPage(controller, packet);
    if (result & 0x200)
        func_ov045_0220c128(FIELD(void *, state, 0xa4),
                            FIELD(s32, controller, 0xe8));
    if (result & 1) {
        func_ov045_0220c174(FIELD(void *, state, 0xa4));
        return 1;
    }
    return 0;
}

/*
 * Starts a palette transition by moving current target +0xD8 to source +0xD4,
 * selecting resource +0xE8 palette offset +0x80 as the new target, and clearing
 * progress +0xDC. Returns void; only scene transition state changes.
 */
extern "C" void func_ov029_021fd95c(void *state)
{
    FIELD(void *, state, 0xd4) = FIELD(void *, state, 0xd8);
    FIELD(void *, state, 0xd8) =
        (u8 *)GraphicsBgResourceData_GetDecoded(FIELD(void *, state, 0xe8)) + 0x80;
    FIELD(s32, state, 0xdc) = 0;
}

/* Same transition setup as 0x021FD95C, selecting palette offset +0x60. */
extern "C" void func_ov029_021fd988(void *state)
{
    FIELD(void *, state, 0xd4) = FIELD(void *, state, 0xd8);
    FIELD(void *, state, 0xd8) =
        (u8 *)GraphicsBgResourceData_GetDecoded(FIELD(void *, state, 0xe8)) + 0x60;
    FIELD(s32, state, 0xdc) = 0;
}

/* Same transition setup as 0x021FD95C, selecting palette offset +0x20. */
extern "C" void func_ov029_021fd9b4(void *state)
{
    FIELD(void *, state, 0xd4) = FIELD(void *, state, 0xd8);
    FIELD(void *, state, 0xd8) =
        (u8 *)GraphicsBgResourceData_GetDecoded(FIELD(void *, state, 0xe8)) + 0x20;
    FIELD(s32, state, 0xdc) = 0;
}
