#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Recovered type-seven transition callbacks. They switch actor modes,
 * maintain presentation state, optionally spawn a heap-owned effect, and
 * select the next installed callback.
 */
extern char data_020e1d0c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0201f864(void *allocation, const void *transform, u32 value,
                          s32 firstId, s32 centerId, s32 lastId, s32 zero,
                          s32 presentation, s32 negativeOne, s32 enabled);
extern void func_02048000(void *actor);
extern void func_02048148(void *actor);
extern s32 func_0204876c(void *actor, s32 finiteMode);
extern s32 func_020ada8c(s32 value, s32 divisor);
#ifdef __cplusplus
}
#endif

/* Invoke the actor's virtual +0x54 mode callback. */
static void set_actor_mode(u8 *actor, s32 mode)
{
    typedef void (*ModeCallback)(void *actor, s32 mode);
    ModeCallback callback = *(ModeCallback *)(*(u8 **)actor + 0x54);
    callback(actor, mode);
}

/*
 * Input is a type-seven actor. Enter virtual mode one, set presentation
 * halfword +0xd6 to 12, and return zero. Actor mode and presentation state may
 * change; no SDK or hardware effects occur directly.
 */
s32 func_020497a8(void *self)
{
    u8 *actor = (u8 *)self;
    set_actor_mode(actor, 1);
    *(u16 *)(actor + 0xd6) = 12;
    return 0;
}

/*
 * Input is a type-seven actor. Select presentation 13 while actor flag 0x200
 * is clear. When it is set, select presentation 14 and test whether signed
 * counter +0x248 modulo 20 equals five. On that cadence, allocate 20 bytes
 * from the heap described by data_020e1d0c/gHeapContext; if successful, pass
 * it to func_0201f864 with actor transform +0x18, the first word of object
 * +0x54, effect identifiers 0x162b..0x162d, and the recovered control tuple
 * (0, 12, -1, 1). Always return zero. Presentation and heap-owned effect state
 * may change; Heap_Alloc is the SDK-facing allocator effect.
 */
s32 func_020497d0(void *self)
{
    u8 *actor = (u8 *)self;
    if ((*(u32 *)(actor + 0x268) & 0x200) == 0) {
        *(u16 *)(actor + 0xd6) = 13;
    } else {
        void *allocation;
        *(u16 *)(actor + 0xd6) = 14;
        if (func_020ada8c(*(s16 *)(actor + 0x248), 20) != 5)
            return 0;
        allocation = Heap_Alloc(20, data_020e1d0c, 4, &gHeapContext);
        if (allocation != 0) {
            func_0201f864(allocation, actor + 0x18,
                          **(u32 **)(actor + 0x54),
                          0x162b, 0x162c, 0x162d, 0, 12, -1, 1);
        }
    }
    return 0;
}

/*
 * Input is a type-seven actor. When actor flag 0x200 is set, clear it and run
 * finite-mode-zero target acquisition. If acquisition succeeds, clear actor
 * +0x14 bits two/four and +0x10 mask 0x1f0000, then return. Otherwise select a
 * fresh randomized callback through func_02048000. Actor flags, target, random,
 * and callback state may change; there is no return value or direct hardware
 * access.
 */
void func_0204988c(void *self)
{
    u8 *actor = (u8 *)self;
    if ((*(u32 *)(actor + 0x268) & 0x200) != 0) {
        *(u32 *)(actor + 0x268) &= ~0x200;
        if (func_0204876c(actor, 0) != 0) {
            *(u32 *)(actor + 0x14) &= ~(2 | 4);
            *(u32 *)(actor + 0x10) &= ~0x1f0000;
            return;
        }
    }
    func_02048000(actor);
}

/*
 * Input is a type-seven actor. Dispatch the installed callback when actor
 * +0x10 flag four is clear. Otherwise select presentation 12 and enter virtual
 * mode zero. Return zero. Callback, presentation, and actor mode may change;
 * no SDK or hardware effects occur directly.
 */
s32 func_020498e4(void *self)
{
    u8 *actor = (u8 *)self;
    if ((*(u32 *)(actor + 0x10) & 4) == 0) {
        func_02048148(actor);
    } else {
        *(u16 *)(actor + 0xd6) = 12;
        set_actor_mode(actor, 0);
    }
    return 0;
}
