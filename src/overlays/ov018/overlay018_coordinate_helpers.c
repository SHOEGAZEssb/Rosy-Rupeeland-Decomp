#include "tingle/types.h"

/* Overlay 18 callback-state copying and descriptor-to-screen coordinate conversion helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseMetadata_GetByIndex(s32);
#ifdef __cplusplus
}
#endif

/*
 * When source and destination differ, copy source words +4/+8 to destination
 * +4/+8. Equal pointers are left untouched. Returns void; only destination
 * memory may change and no SDK or hardware effects occur.
 */
extern "C" void Overlay018_CopyCoordinates(void *destination, const void *source)
{
    if (destination != source) {
        FIELD(s32, destination, 4) = FIELD(s32, source, 4);
        FIELD(s32, destination, 8) = FIELD(s32, source, 8);
    }
}

/*
 * Resolve descriptor signed halfword +2 minus one through 0x02028388, subtract
 * state selector +0x1A0 from returned signed byte +0x4E, scale by 0x3C0/2 with
 * truncation toward zero, and add descriptor signed halfword +0xC. Return the
 * resulting coordinate. Inputs/global SDK data are read only; no MMIO occurs.
 */
extern "C" s32 func_ov018_021fe19c(void *state, const void *descriptor)
{
    void *entry = GamePhaseMetadata_GetByIndex(FIELD(s16, descriptor, 2) - 1);
    s32 delta = FIELD(s8, entry, 0x4e) - FIELD(s32, state, 0x1a0);
    return FIELD(s16, descriptor, 0xc) + (delta * 0x3c0) / 2;
}

/*
 * Resolve descriptor signed halfword +2 minus one through 0x02028388, subtract
 * state selector +0x1A4 from returned signed byte +0x4F, scale by 0x2C0/2 with
 * truncation toward zero, and add descriptor signed halfword +0xE. Return the
 * resulting coordinate. Inputs/global SDK data are read only; no MMIO occurs.
 */
extern "C" s32 func_ov018_021fe1d8(void *state, const void *descriptor)
{
    void *entry = GamePhaseMetadata_GetByIndex(FIELD(s16, descriptor, 2) - 1);
    s32 delta = FIELD(s8, entry, 0x4f) - FIELD(s32, state, 0x1a4);
    return FIELD(s16, descriptor, 0xe) + (delta * 0x2c0) / 2;
}
