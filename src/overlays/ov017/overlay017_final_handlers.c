#include "tingle/types.h"

/* Overlay 17 final state callback, destructor thunks, and static global registration. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov017_02201618[];
extern const u32 data_ov017_02201628[];
extern u8 data_ov017_022016f0[];
extern u8 data_ov017_022016f8[];
extern u8 data_ov017_02201700[];
extern u8 data_ov017_0220170c[];
extern u8 data_ov017_02201718[];
extern u8 data_ov017_02201724[];
extern u8 data_ov017_02201730[];
extern u8 data_ov017_0220173c[];
extern u8 data_ov017_02201748[];
extern u8 data_ov017_02201754[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void __register_global_object(void *, void (*)(void *), void *);
extern void func_02091e0c(void *, s32);
extern void func_02091e1c(void *);
extern void PresentationList_DeleteAll(void *);
extern void Overlay017_EffectBase_NoOp(void *);
extern void Overlay017_RecordBase_NoOp(void *);
extern void *Overlay017_RecordBase_Init(void *);
extern void *Overlay017_RecordBase_Destroy(void *);
extern void Overlay017_RenderScene(void *);
#ifdef __cplusplus
}
#endif

/*
 * Final overlay state callback. On its first invocation (+4 == 0), advance +4
 * to one and clear +8; all invocations run the renderer/cleanup helper at
 * 0x022008AC and return one. Overlay and SDK state change; direct hardware
 * effects, if any, belong to the called helper.
 */
extern "C" s32 func_ov017_02201350(void *state)
{
    if (FIELD(s32, state, 4) == 0) {
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
    }
    Overlay017_RenderScene(state);
    return 1;
}

/*
 * No-op final virtual hook. The input is accepted but not read, no state is
 * changed, and the function returns void without SDK or hardware effects.
 */
extern "C" void func_ov017_02201384(void *state)
{
    (void)state;
}

/*
 * Invoke the recovered no-op effect-base destructor, free state, and return its
 * original pointer value. Heap state changes and the returned address is no
 * longer valid; no direct hardware access occurs.
 */
extern "C" void *func_ov017_02201388(void *state)
{
    Overlay017_EffectBase_NoOp(state);
    Heap_Free(state);
    return state;
}

/*
 * Invoke the recovered no-op effect-base destructor and return state without
 * freeing it. No observable state changes or direct hardware effects occur.
 */
extern "C" void *func_ov017_022013a4(void *state)
{
    Overlay017_EffectBase_NoOp(state);
    return state;
}

/*
 * Restore record-base vtable data_ov017_02201628, invoke the inherited SDK
 * destructor, free state, and return its original pointer value. SDK and heap
 * state change; the returned address is invalid and no direct MMIO occurs.
 */
extern "C" void *func_ov017_022013b8(void *state)
{
    FIELD(const u32 *, state, 0) = data_ov017_02201628;
    PresentationList_DeleteAll(state);
    Heap_Free(state);
    return state;
}

/*
 * Free state and return its original pointer value. Heap state changes, the
 * returned address is invalid, and there are no direct hardware effects.
 */
extern "C" void *func_ov017_022013e0(void *state)
{
    Heap_Free(state);
    return state;
}

/*
 * Initialize a three-word global helper object with vtable
 * data_ov017_02201618 and caller values at +4/+8. Returns state; only object
 * memory changes and no SDK or hardware state is touched.
 */
extern "C" void *func_ov017_022013f4(void *state, s32 value4, s32 value8)
{
    FIELD(const u32 *, state, 0) = data_ov017_02201618;
    FIELD(s32, state, 4) = value4;
    FIELD(s32, state, 8) = value8;
    return state;
}

/*
 * Overlay static initializer. Construct and register two three-word helpers,
 * one record base, and two fixed-capacity SDK containers (capacities four and
 * eight) with their compiler/runtime destructor nodes. Global runtime state and
 * allocation bookkeeping change; no direct hardware access occurs.
 */
extern "C" void __sinit_ov017_02201440(void)
{
    func_ov017_022013f4(data_ov017_0220170c, 0, 0);
    __register_global_object(data_ov017_0220170c, Overlay017_RecordBase_NoOp,
                             data_ov017_02201718);
    func_ov017_022013f4(data_ov017_02201730, 0, 0);
    __register_global_object(data_ov017_02201730, Overlay017_RecordBase_NoOp,
                             data_ov017_02201724);
    Overlay017_RecordBase_Init(data_ov017_02201754);
    __register_global_object(data_ov017_02201754,
                             (void (*)(void *))Overlay017_RecordBase_Destroy,
                             data_ov017_0220173c);
    func_02091e0c(data_ov017_022016f0, 4);
    __register_global_object(data_ov017_022016f0, func_02091e1c,
                             data_ov017_02201748);
    func_02091e0c(data_ov017_022016f8, 8);
    __register_global_object(data_ov017_022016f8, func_02091e1c,
                             data_ov017_02201700);
}
