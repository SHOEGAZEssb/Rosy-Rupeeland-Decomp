#include "tingle/types.h"

/* Overlay 17 grid-effect object resource lookup, construction, and destruction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov017_02201670[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern u32 genrand_int32(void);
extern s32 func_01ff88c4(s32, void *, u32);
extern void Presentation_Init(void *);
extern void Presentation_SetPosition(void *, u32, u32, u32);
extern void *func_ov017_021fd744(void *);
extern void *func_ov017_021fd780(void *);
extern void func_ov017_021fd7f8(void *, s32);
extern void func_ov017_021fd948(void *);
extern void func_ov017_021fe0b4(void *);
#ifdef __cplusplus
}
#endif

/*
 * Resolve entry index in the resource referenced by object +4. Read its table
 * base at resource +0x24; each 0x0C-byte entry provides a word at +0 and a
 * relative offset at +4. Tail-call 0x01FF88C4 with selector 3, tableBase+offset,
 * and the entry word, returning that helper's result. Object/resource memory is
 * read only; downstream effects are those of 0x01FF88C4 and no MMIO occurs here.
 */
extern "C" s32 func_ov017_021fd918(void *object, s32 index)
{
    void *resource = FIELD(void *, object, 4);
    void *table = FIELD(void *, resource, 0x24);
    void *entry = (u8 *)table + index * 0xc;
    return func_01ff88c4(3, (u8 *)table + FIELD(u32, entry, 4),
                         FIELD(u32, entry, 0));
}

/*
 * No-op base destructor hook for the overlay-17 effect object. The input pointer
 * is accepted but not read, no state changes, and the function returns void.
 */
extern "C" void func_ov017_021fd948(void *state)
{
    (void)state;
}

/*
 * Construct the effect object. Initialize its SDK base, install vtable
 * data_ov017_02201670, construct embedded transform +0xBC, store caller
 * halfwords at +0x9A/+0x9C/+0xA0 while clearing +0x9E, configure the base with
 * caller arguments 3/4 and fixed value 0x200000, set +0xA4 to 12 and clear
 * +0xA8..+0xB8. Bind embedded resource selector argument 7, seed +0xDC/+0xE0/
 * +0xE4 from three random low halfwords, invoke 0x021FE0B4, and return state.
 * SDK, resource, and PRNG state change; no direct MMIO occurs.
 */
extern "C" void *func_ov017_021fd94c(void *state, u16 value9a,
                                      u32 baseArg1, u32 baseArg3,
                                      u16 value9c, u16 valuea0,
                                      u16 resourceId)
{
    Presentation_Init(state);
    FIELD(const u32 *, state, 0) = data_ov017_02201670;
    func_ov017_021fd744((u8 *)state + 0xbc);
    FIELD(u16, state, 0x9c) = value9c;
    FIELD(u16, state, 0x9e) = 0;
    FIELD(u16, state, 0x9a) = value9a;
    FIELD(u16, state, 0xa0) = valuea0;
    FIELD(u32, state, 0xb4) = 0;
    FIELD(u32, state, 0xb8) = 0;
    Presentation_SetPosition(state, baseArg1, 0x200000, baseArg3);
    FIELD(s32, state, 0xa4) = 0xc;
    FIELD(s32, state, 0xa8) = 0;
    FIELD(s32, state, 0xac) = 0;
    FIELD(s32, state, 0xb0) = 0;
    FIELD(s32, state, 0xb8) = 0;
    FIELD(s32, state, 0xb4) = 0;
    func_ov017_021fd7f8((u8 *)state + 0xbc, resourceId);
    FIELD(u32, state, 0xdc) = (u16)genrand_int32();
    FIELD(u32, state, 0xe0) = (u16)genrand_int32();
    FIELD(u32, state, 0xe4) = (u16)genrand_int32();
    func_ov017_021fe0b4(state);
    return state;
}

/*
 * Destroy the embedded transform/resource at +0xBC, invoke the recovered no-op
 * base destructor, and return state. SDK resource ownership may change; the
 * containing allocation is retained and no direct hardware access occurs.
 */
extern "C" void *func_ov017_021fda1c(void *state)
{
    func_ov017_021fd780((u8 *)state + 0xbc);
    func_ov017_021fd948(state);
    return state;
}

/*
 * Destroy the embedded transform/resource at +0xBC, invoke the recovered no-op
 * base destructor, free the containing object, and return its original pointer
 * value. The returned address is no longer valid storage; heap/resource state
 * changes and no direct MMIO occurs.
 */
extern "C" void *func_ov017_021fda3c(void *state)
{
    func_ov017_021fd780((u8 *)state + 0xbc);
    func_ov017_021fd948(state);
    Heap_Free(state);
    return state;
}
