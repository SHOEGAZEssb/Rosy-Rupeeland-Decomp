#include "tingle/types.h"

/*
 * Overlay 42 scene-base lifecycle. These recovered routines release an
 * allocation and initialize the common 0x48-byte prefix used by the overlay's
 * larger scene object, including two SDK-owned transform blocks.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void Heap_Free(void *allocation);
void VecFx32Object_Init(void *state);
void func_02099fb0(void *object);
void func_ov042_021fcf9c(void *element);
extern u8 data_020f3058[];
}

/*
 * Free allocation through the game's heap API and return the original pointer.
 * The pointed allocation becomes invalid; no other object fields are changed.
 */
extern "C" void *func_ov042_021fd658(void *allocation)
{
    Heap_Free(allocation);
    return allocation;
}

/*
 * Initialize the common scene prefix and return object. Install the confirmed
 * address-derived table at +0, initialize SDK state blocks at +0x1C and +0x2C,
 * and clear words +4, +8, +0xC, and +0x44. The exact semantic roles of those
 * cleared offset-derived fields are not yet established.
 */
extern "C" void *func_ov042_021fd66c(void *object)
{
    FIELD(void *, object, 0) = data_020f3058;
    VecFx32Object_Init((u8 *)object + 0x1c);
    VecFx32Object_Init((u8 *)object + 0x2c);
    FIELD(s32, object, 4) = 0;
    FIELD(s32, object, 8) = 0;
    FIELD(s32, object, 0xc) = 0;
    FIELD(s32, object, 0x44) = 0;
    return object;
}

/*
 * Destroy the derived scene object's four embedded 12-byte element arrays in
 * reverse construction order: 48 entries at +0x1228, 48 at +0xFE8, 100 at
 * +0x4FC, then 100 at +0x4C. Delegate final base-object teardown to
 * func_02099fb0 and return object. The element destructor is a confirmed no-op;
 * this routine itself does not free the outer allocation.
 */
extern "C" void *func_ov042_021fd858(void *object)
{
    for (s32 i = 47; i >= 0; --i)
        func_ov042_021fcf9c((u8 *)object + 0x1228 + i * 12);
    for (s32 i = 47; i >= 0; --i)
        func_ov042_021fcf9c((u8 *)object + 0xfe8 + i * 12);
    for (s32 i = 99; i >= 0; --i)
        func_ov042_021fcf9c((u8 *)object + 0x4fc + i * 12);
    for (s32 i = 99; i >= 0; --i)
        func_ov042_021fcf9c((u8 *)object + 0x4c + i * 12);
    func_02099fb0(object);
    return object;
}
