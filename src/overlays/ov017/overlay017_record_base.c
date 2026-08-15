#include "tingle/types.h"

/* Overlay 17 four-slot effect-record base lifecycle and field configuration API. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov017_02201628[];

#ifdef __cplusplus
extern "C" {
#endif
extern void PresentationList_DeleteAll(void *);
extern void func_020add34(void *, void *);
#ifdef __cplusplus
}
#endif

/*
 * No-op virtual hook for the record base. The input is accepted but not read,
 * no state changes occur, and the function returns void without SDK or hardware
 * effects.
 */
extern "C" void func_ov017_021fe9bc(void *state)
{
    (void)state;
}

/*
 * Install vtable data_ov017_02201628 and clear vector words +4/+8/+0xC. Returns
 * state in the incoming result register; only the object changes and there are
 * no SDK or hardware effects.
 */
extern "C" void *func_ov017_021fe9c0(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov017_02201628;
    FIELD(s32, state, 8) = 0;
    FIELD(s32, state, 4) = 0;
    FIELD(s32, state, 0xc) = 0;
    return state;
}

/*
 * Restore vtable data_ov017_02201628, invoke the inherited SDK destructor at
 * 0x02095308, and return state. Object/SDK state changes, the allocation is
 * retained, and no direct hardware access occurs.
 */
extern "C" void *func_ov017_021fe9e0(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov017_02201628;
    PresentationList_DeleteAll(state);
    return state;
}

/*
 * Store three caller words at +4/+8/+0xC. The object changes in place; the
 * function returns void and has no SDK or hardware effects.
 */
extern "C" void func_ov017_021fea00(void *state, s32 x, s32 y, s32 z)
{
    FIELD(s32, state, 4) = x;
    FIELD(s32, state, 8) = y;
    FIELD(s32, state, 0xc) = z;
}

/*
 * Store three caller words at +0x10/+0x14/+0x18. The object changes in place;
 * the function returns void and has no SDK or hardware effects.
 */
extern "C" void func_ov017_021fea08(void *state, s32 x, s32 y, s32 z)
{
    FIELD(s32, state, 0x10) = x;
    FIELD(s32, state, 0x14) = y;
    FIELD(s32, state, 0x18) = z;
}

/*
 * Configure one of four 0x10-byte records when index is in 0..3. Store three
 * caller words at +0/+4/+8, set active halfword +0xE, and call 0x020ADD34 with
 * the record as both arguments. Pack three five-bit caller values into +0xC and
 * set +0xE again. Invalid indices are ignored. Record/SDK state may change; the
 * function returns void and performs no direct hardware access.
 */
extern "C" void func_ov017_021fea18(void *records, s32 index, s32 value0,
                                     s32 value4, s32 value8, u32 packed0,
                                     u32 packed1, u32 packed2)
{
    if (index >= 0 && index < 4) {
        void *entry = (u8 *)records + index * 0x10;
        FIELD(u16, entry, 0xe) = 1;
        FIELD(s32, entry, 0) = value0;
        FIELD(s32, entry, 4) = value4;
        FIELD(s32, entry, 8) = value8;
        func_020add34(entry, entry);
    }
    if (index >= 0 && index < 4) {
        void *entry = (u8 *)records + index * 0x10;
        FIELD(u16, entry, 0xe) = 1;
        FIELD(u16, entry, 0xc) = packed0 | (packed1 << 5) | (packed2 << 10);
    }
}

/*
 * Store caller words at +0x24/+0x28 and clear +4/+8. The fourth register
 * argument is intentionally ignored by the recovered implementation. Object
 * state changes; returns void with no SDK or hardware effects.
 */
extern "C" void func_ov017_021fea8c(void *state, s32 value24, s32 value28,
                                     s32 unused)
{
    (void)unused;
    FIELD(s32, state, 0x24) = value24;
    FIELD(s32, state, 0x28) = value28;
    FIELD(s32, state, 4) = 0;
    FIELD(s32, state, 8) = 0;
}
