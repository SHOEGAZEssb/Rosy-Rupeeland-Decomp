#include "tingle/types.h"

/* Overlay 18 sprite-backed object construction plus small callback-record lifecycle helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern const u32 data_ov018_021ffd00[];
extern const u32 data_ov018_021ffd20[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void func_02095308(void *);
extern void func_020953c8(void *, s32);
extern void func_0209548c(void *);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the inherited object with mode zero, install vtable
 * data_ov018_021FFD20, and initialize resource controller +0xA0 from the three
 * halfword IDs at descriptor +4/+6/+8. Create sprite +0x9C from renderer and
 * configure it with descriptor animation +0xA, caller X/Y, and fixed trailing
 * values 2/0/4, then set sprite halfword +0x2A to one. Returns state. Object,
 * resource, and sprite SDK state change; no direct hardware access occurs.
 */
extern "C" void *func_ov018_021fce00(void *state, void *renderer,
                                      const void *descriptor, s32 x, s32 y)
{
    void *sprite;

    func_020953c8(state, 0);
    FIELD(const u32 *, state, 0) = data_ov018_021ffd20;
    func_02071ea4((u8 *)state + 0xa0);
    func_02071ee0((u8 *)state + 0xa0, data_020f4e18[0],
                  FIELD(u16, descriptor, 4), FIELD(u16, descriptor, 6),
                  FIELD(u16, descriptor, 8));
    sprite = GraphicsSpriteGroup_CreateStateFromSource(renderer, (u8 *)state + 0xa0, 2);
    FIELD(void *, state, 0x9c) = sprite;
    func_02073e48(sprite, FIELD(u16, descriptor, 0xa), x, y, 2, 0, 4);
    FIELD(u16, sprite, 0x2a) = 1;
    return state;
}

/*
 * Destroy resource controller +0xA0 and run the inherited object destructor,
 * retaining the allocation and returning state. SDK/resource ownership changes;
 * no direct hardware access occurs.
 */
extern "C" void *func_ov018_021fceb0(void *state)
{
    func_02071eb8((u8 *)state + 0xa0);
    func_0209548c(state);
    return state;
}

/*
 * Perform the same teardown as 0x021FCEB0, free the containing allocation, and
 * return its former address. Heap and SDK/resource state change; the returned
 * pointer no longer denotes live storage and no MMIO is accessed directly.
 */
extern "C" void *func_ov018_021fced0(void *state)
{
    func_02071eb8((u8 *)state + 0xa0);
    func_0209548c(state);
    Heap_Free(state);
    return state;
}

/* No-op virtual hook: accept state, change nothing, and return void without SDK or hardware effects. */
extern "C" void func_ov018_021fcef8(void *state)
{
    (void)state;
}

/* No-op virtual hook: accept state, change nothing, and return void without SDK or hardware effects. */
extern "C" void func_ov018_021fcefc(void *state)
{
    (void)state;
}

/*
 * Install callback-record vtable data_ov018_021FFD00 and clear words +4/+8/+C.
 * Returns state; only caller-owned memory changes and no SDK or hardware work
 * occurs.
 */
extern "C" void *func_ov018_021fcf00(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov018_021ffd00;
    FIELD(s32, state, 4) = 0;
    FIELD(s32, state, 8) = 0;
    FIELD(s32, state, 0xc) = 0;
    return state;
}

/*
 * Restore callback-record vtable data_ov018_021FFD00, invoke inherited SDK
 * teardown, and return state without freeing it. SDK/object state changes; no
 * direct hardware access occurs.
 */
extern "C" void *func_ov018_021fcf20(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov018_021ffd00;
    func_02095308(state);
    return state;
}

/*
 * Store caller values at record +0x24/+0x28 and clear phase/timer words +4/+8;
 * the fourth register argument is unused. Returns void. Only record memory
 * changes, with no SDK or hardware effects.
 */
extern "C" void func_ov018_021fcf40(void *state, s32 value24, s32 value28,
                                     s32 unused)
{
    (void)unused;
    FIELD(s32, state, 0x24) = value24;
    FIELD(s32, state, 0x28) = value28;
    FIELD(s32, state, 4) = 0;
    FIELD(s32, state, 8) = 0;
}
