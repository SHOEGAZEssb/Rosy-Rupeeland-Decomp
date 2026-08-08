#include "tingle/types.h"

/* Overlay 35 presentation callbacks, constant queries, and vtable destructor tail. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;
extern u8 gSystemState[];
extern void *data_ov035_022038f8[];
extern const u8 data_ov035_02203af8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02059230(void *soundContext, s32 first, s32 second);
extern void func_ov035_02202350(void *record, void *first, void *second,
                               void *unused);
extern s32 func_ov035_021fce5c(void *scene);
extern void func_ov035_022028b4(void *object);
extern void func_ov035_021fcf30(void);
extern void func_02095670(void *object);
extern void func_020720d4(void *state);
extern void func_02095308(void *collection);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/* Returns the fixed display/render offset 0x47E; it has no inputs or effects. */
extern "C" s32 func_ov035_02202948(void)
{
    return 0x47e;
}

/*
 * Advances a two-stage top-level callback using state +4. Stage 0 calls the
 * sound-control helper with (1,0), advances the state, clears timer +8, and
 * falls through. Stage 1 sets flag bit 0 in field +0x20 and reinitializes the
 * callback record from data_ov035_022038f8. Always returns 0; sound, callback,
 * flag, and local state change.
 */
extern "C" s32 func_ov035_02202954(void *object)
{
    switch (FIELD(s32, object, 4)) {
    case 0:
        func_02059230(gSoundContext, 1, 0);
        ++FIELD(s32, object, 4);
        FIELD(s32, object, 8) = 0;
        /* Fall through to install the active callback immediately. */
    case 1:
        FIELD(s32, object, 0x20) |= 1;
        func_ov035_02202350(object, data_ov035_022038f8[0],
                            data_ov035_022038f8[1], 0);
        break;
    }
    return 0;
}

/*
 * Advances a three-stage render callback using state +4. Stage 0 copies
 * gSystemState field +0x64 to object +0x4BC, advances state, and clears timer
 * +8. Stage 1 waits for child scene +0x60 through func_ov035_021fce5c. Stage 2
 * renders and reports completion. All paths call func_ov035_022028b4. Returns
 * 1 only in stage 2, otherwise 0; child, renderer, hardware, and state change.
 */
extern "C" s32 func_ov035_022029cc(void *object)
{
    switch (FIELD(s32, object, 4)) {
    case 0:
        FIELD(s32, object, 0x4bc) = FIELD(s32, gSystemState, 0x64);
        FIELD(s32, object, 4) = 1;
        FIELD(s32, object, 8) = 0;
        /* Fall through to poll the child immediately. */
    case 1:
        if (func_ov035_021fce5c(FIELD(void *, object, 0x60)) != 0) {
            FIELD(s32, object, 4) = 2;
            FIELD(s32, object, 8) = 0;
        }
        break;
    case 2:
        func_ov035_022028b4(object);
        return 1;
    }
    func_ov035_022028b4(object);
    return 0;
}

/* Returns fixed value 0x23F; it has no inputs or observable effects. */
extern "C" s32 func_ov035_02202a58(void)
{
    return 0x23f;
}

/*
 * Invokes the empty common render-object hook, frees object, and returns its
 * now-invalid original address. Heap state changes.
 */
extern "C" void *func_ov035_02202a64(void *object)
{
    func_ov035_021fcf30();
    Heap_Free(object);
    return object;
}

/*
 * Invokes the empty common render-object hook and returns object without freeing
 * it. It has no observable effect beyond preserving the vtable thunk ABI.
 */
extern "C" void *func_ov035_02202a80(void *object)
{
    func_ov035_021fcf30();
    return object;
}

/* Empty vtable hook with no recovered inputs, return value, or effects. */
extern "C" void func_ov035_02202a94(void)
{
}

/*
 * Destroys a common sprite object, frees it, and returns the original now-invalid
 * address. Renderer and heap state change.
 */
extern "C" void *func_ov035_02202a98(void *object)
{
    func_02095670(object);
    Heap_Free(object);
    return object;
}

/*
 * Destroys a common sprite object and returns its still-allocated address.
 * Renderer state changes while heap ownership remains with the caller.
 */
extern "C" void *func_ov035_02202ab4(void *object)
{
    func_02095670(object);
    return object;
}

/*
 * Second address-distinct deleting render-object thunk: invokes the empty base
 * hook, frees object, and returns its now-invalid address. Heap state changes.
 */
extern "C" void *func_ov035_02202ac8(void *object)
{
    func_ov035_021fcf30();
    Heap_Free(object);
    return object;
}

/*
 * Non-deleting partner of func_ov035_02202ac8. It invokes the empty base hook
 * and returns object without changing heap state.
 */
extern "C" void *func_ov035_02202ae4(void *object)
{
    func_ov035_021fcf30();
    return object;
}

/*
 * Third address-distinct deleting render-object thunk: invokes the empty base
 * hook, frees object, and returns its now-invalid address. Heap state changes.
 */
extern "C" void *func_ov035_02202af8(void *object)
{
    func_ov035_021fcf30();
    Heap_Free(object);
    return object;
}

/*
 * Non-deleting partner of func_ov035_02202af8. It invokes the empty base hook
 * and returns object without changing heap state.
 */
extern "C" void *func_ov035_02202b14(void *object)
{
    func_ov035_021fcf30();
    return object;
}

/*
 * Fourth address-distinct deleting render-object thunk: invokes the empty base
 * hook, frees object, and returns its now-invalid address. Heap state changes.
 */
extern "C" void *func_ov035_02202b28(void *object)
{
    func_ov035_021fcf30();
    Heap_Free(object);
    return object;
}

/*
 * Non-deleting partner of func_ov035_02202b28. It invokes the empty base hook
 * and returns object without changing heap state.
 */
extern "C" void *func_ov035_02202b44(void *object)
{
    func_ov035_021fcf30();
    return object;
}

/*
 * Destroys resource state +0xCC and returns object without freeing it. Resource
 * registry state changes; the containing allocation remains caller-owned.
 */
extern "C" void *func_ov035_02202b58(void *object)
{
    func_020720d4((u8 *)object + 0xcc);
    return object;
}

/*
 * Resets a collection object's vtable to data_ov035_02203af8, clears it through
 * func_02095308, frees the allocation, and returns the original now-invalid
 * address. Renderer/collection and heap state change.
 */
extern "C" void *func_ov035_02202b70(void *object)
{
    FIELD(const void *, object, 0) = data_ov035_02203af8;
    func_02095308(object);
    Heap_Free(object);
    return object;
}
