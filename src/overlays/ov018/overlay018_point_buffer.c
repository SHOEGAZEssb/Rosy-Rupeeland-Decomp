#include "tingle/types.h"

/* Overlay 18 heap-backed fixed-capacity point buffer plus small deleting wrappers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov018_021ffd00[];
extern const u32 data_ov018_021ffd8c[];
extern const u8 data_ov018_021ffd94[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void *Heap_AllocAlternateEntry(u32, const void *, s32, void *);
extern void Heap_FreeAlternateEntry(void *);
extern void PresentationList_DeleteAll(void *);
extern void func_ov018_021ff3cc(void *);
#ifdef __cplusplus
}
#endif

/* Free the caller object and return its former address; heap state changes and the result is invalid. */
extern "C" void *func_ov018_021ff2cc(void *state)
{
    Heap_Free(state);
    return state;
}

/* Free the caller object and return its former address; heap state changes and the result is invalid. */
extern "C" void *func_ov018_021ff2e0(void *state)
{
    Heap_Free(state);
    return state;
}

/* Free the caller object and return its former address; heap state changes and the result is invalid. */
extern "C" void *func_ov018_021ff2f4(void *state)
{
    Heap_Free(state);
    return state;
}

/*
 * Restore vtable data_ov018_021FFD00, invoke inherited SDK teardown, free the
 * allocation, and return its former address. SDK/heap state changes; the result
 * is invalid and no direct hardware access occurs.
 */
extern "C" void *func_ov018_021ff308(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov018_021ffd00;
    PresentationList_DeleteAll(state);
    Heap_Free(state);
    return state;
}

/*
 * Install point-buffer vtable data_ov018_021FFD8C, store caller capacity +0xC,
 * allocate capacity*4 bytes using descriptor data_ov018_021FFD94 into +4, and
 * reset all counters/defaults through 0x021FF3CC. Return state. Heap and object
 * state change; no direct hardware access occurs.
 */
extern "C" void *func_ov018_021ff330(void *state, s32 capacity)
{
    FIELD(const u32 *, state, 0) = data_ov018_021ffd8c;
    FIELD(s32, state, 0xc) = capacity;
    FIELD(void *, state, 4) =
        Heap_AllocAlternateEntry(capacity * 4, data_ov018_021ffd94, 4, gHeapContext);
    func_ov018_021ff3cc(state);
    return state;
}

/*
 * Restore point-buffer vtable data_ov018_021FFD8C, release storage +4 through
 * 0x02003E38, and return state without freeing it. Heap/object state changes;
 * no direct hardware access occurs.
 */
extern "C" void *func_ov018_021ff37c(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov018_021ffd8c;
    Heap_FreeAlternateEntry(FIELD(void *, state, 4));
    return state;
}

/*
 * Perform the storage teardown of 0x021FF37C, free the containing object, and
 * return its former address. Heap state changes; the result is invalid and no
 * direct hardware access occurs.
 */
extern "C" void *func_ov018_021ff3a0(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov018_021ffd8c;
    Heap_FreeAlternateEntry(FIELD(void *, state, 4));
    Heap_Free(state);
    return state;
}

/*
 * Reset point count +0x10 and word +0x24 to zero, index/state words +0x14/+0x18
 * to -1, scale halfwords +0x1C/+0x1E to 0x1000, and signed halfwords +0x20/
 * +0x22 to -0x132A. Returns void; only caller memory changes.
 */
extern "C" void func_ov018_021ff3cc(void *state)
{
    FIELD(s32, state, 0x10) = 0;
    FIELD(s32, state, 0x14) = -1;
    FIELD(s32, state, 0x18) = -1;
    FIELD(u16, state, 0x1c) = 0x1000;
    FIELD(u16, state, 0x1e) = 0x1000;
    FIELD(s16, state, 0x22) = -0x132a;
    FIELD(s16, state, 0x20) = FIELD(s16, state, 0x22);
    FIELD(s32, state, 0x24) = 0;
}

/* Return one when point count +0x10 has reached capacity +0xC, else zero; state is read only. */
extern "C" s32 func_ov018_021ff408(void *state)
{
    return FIELD(s32, state, 0x10) >= FIELD(s32, state, 0xc);
}

/* Return one when point count +0x10 is zero, else zero; state is read only. */
extern "C" s32 func_ov018_021ff420(void *state)
{
    return FIELD(s32, state, 0x10) == 0;
}

/*
 * Append caller halfwords as one four-byte point when count +0x10 is below
 * capacity +0xC, then increment count. Full buffers are unchanged. Returns
 * void; only buffer/object memory changes and no SDK or hardware effects occur.
 */
extern "C" void func_ov018_021ff434(void *state, u16 x, u16 y)
{
    s32 count = FIELD(s32, state, 0x10);
    if (count < FIELD(s32, state, 0xc)) {
        u8 *point = (u8 *)FIELD(void *, state, 4) + count * 4;
        FIELD(u16, point, 0) = x;
        FIELD(u16, point, 2) = y;
        FIELD(s32, state, 0x10) = count + 1;
    }
}
