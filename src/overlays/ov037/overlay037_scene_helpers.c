#include "tingle/types.h"

/* Overlay 37 small scene containers, actor setup, and four-slot parameter tables. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov037_021fedac[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02095308(void *container);
extern void func_02076be8(void *actor, s32 mode);
extern void func_020add34(void *record, void *recordAgain);
#ifdef __cplusplus
}
#endif

/*
 * Initializes a 16-byte scene container: installs its vtable and clears words
 * +4, +8, and +0xC. Returns the container; no SDK or hardware effect occurs.
 */
extern "C" void *func_ov037_021fd6d0(void *container)
{
    FIELD(const void *, container, 0) = data_ov037_021fedac;
    FIELD(s32, container, 4) = 0;
    FIELD(s32, container, 8) = 0;
    FIELD(s32, container, 0x0c) = 0;
    return container;
}

/*
 * Reinstalls the container vtable and invokes the common teardown routine.
 * Returns container without freeing it; common resource state may change.
 */
extern "C" void *func_ov037_021fd6f0(void *container)
{
    FIELD(const void *, container, 0) = data_ov037_021fedac;
    func_02095308(container);
    return container;
}

/*
 * Selects actor mode from the low byte of mode, writes x/y/z at +0x20..+0x28,
 * stores a byte at +0x5A, and ORs flags into halfword +0x50. Returns nothing;
 * actor transform and the common actor-state subsystem change.
 */
extern "C" void func_ov037_021fd710(void *actor, s32 mode, s32 x, s32 y,
                                     s32 z, u8 parameter, u16 flags)
{
    func_02076be8(actor, mode & 0xff);
    FIELD(s32, actor, 0x20) = x;
    FIELD(s32, actor, 0x24) = y;
    FIELD(s32, actor, 0x28) = z;
    FIELD(u8, actor, 0x5a) = parameter;
    FIELD(u16, actor, 0x50) |= flags;
}

/* Writes three words to +4/+8/+0xC and returns nothing. */
extern "C" void func_ov037_021fd758(void *record, s32 a, s32 b, s32 c)
{
    FIELD(s32, record, 4) = a;
    FIELD(s32, record, 8) = b;
    FIELD(s32, record, 0x0c) = c;
}

/* Writes three words to +0x10/+0x14/+0x18 and returns nothing. */
extern "C" void func_ov037_021fd760(void *record, s32 a, s32 b, s32 c)
{
    FIELD(s32, record, 0x10) = a;
    FIELD(s32, record, 0x14) = b;
    FIELD(s32, record, 0x18) = c;
}

/*
 * Configures one of four 16-byte table slots. Valid indices write three words,
 * mark halfword +0xE active, invoke the common record initializer, then pack
 * three inferred 5-bit fields into +0xC. Invalid indices make no changes.
 */
extern "C" void func_ov037_021fd770(void *table, s32 index, s32 a, s32 b,
                                     s32 c, u32 field0, u32 field1, u32 field2)
{
    if (index < 0 || index >= 4)
        return;
    u8 *slot = (u8 *)table + index * 16;
    FIELD(u16, slot, 0x0e) = 1;
    FIELD(s32, slot, 0) = a;
    FIELD(s32, slot, 4) = b;
    FIELD(s32, slot, 8) = c;
    func_020add34(slot, slot);
    FIELD(u16, slot, 0x0e) = 1;
    FIELD(u16, slot, 0x0c) = (u16)(field0 | (field1 << 5) | (field2 << 10));
}
