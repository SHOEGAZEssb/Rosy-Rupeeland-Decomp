#include "tingle/types.h"

/* Overlay 16 actor-group insertion, selection, animation, and completion helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const char data_ov016_02201580[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern s32 func_02092910(void *, void *);
extern void PresentationScalar_TransitionBy(void *, s32, s32);
extern void Presentation_SetPosition(void *, s32, s32, s32);
extern s32 Presentation_InterpolateScalar(void *, s32, s32, s32);
extern void PresentationList_Append(void *, void *);
extern void PresentationList_Remove(void *, void *);
extern void SpritePresentation_SyncPosition(void *);
extern void func_020958d8(void *);
extern void func_02095928(void *);
extern void func_02095940(void *);
extern void *func_ov016_021fe004(void *, void *, void *);
extern void func_ov016_021fe2b0(void *);
extern s32 func_ov016_021fe728(void *);
#ifdef __cplusplus
}
#endif

/*
 * Add one actor for target while count +0xDC is below limit +0xE0. Allocate and
 * construct a 0xB0-byte sprite wrapper, append it to list +0xD0, position it from
 * signed target +0x10/+0x2C/+0x2E plus linked +0/+0x18/+0x1C offsets, activate
 * it, re-layout all actors, and start record +0x20. Return one on insertion or
 * zero at the limit. Heap/list/actor state changes; no direct MMIO.
 */
extern "C" s32 func_ov016_021fe4d0(void *state, void *target)
{
    void *actor;
    void *position;
    void *base;

    if (FIELD(s32, state, 0xdc) >= FIELD(s32, state, 0xe0)) {
        return 0;
    }
    actor = Heap_Alloc(0xb0, data_ov016_02201580, 4, gHeapContext);
    if (actor != 0) {
        actor = func_ov016_021fe004(actor, target, FIELD(void *, state, 0x18));
    }
    PresentationList_Append((u8 *)state + 0xd0, actor);
    position = FIELD(void *, target, 0x10);
    base = FIELD(void *, position, 0);
    Presentation_SetPosition(actor,
                  (FIELD(s16, position, 0x2c) + FIELD(s32, base, 0x18)) << 12,
                  (FIELD(s16, position, 0x2e) + FIELD(s32, base, 0x1c)) << 12,
                  0);
    SpritePresentation_SyncPosition(actor);
    func_ov016_021fe2b0(state);
    func_02095928((u8 *)state + 0x20);
    return 1;
}

/*
 * Find the first actor whose sprite +0x9C passes func_02092910 for key. If
 * remove is zero, return that actor's target +0xAC immediately. Otherwise unlink
 * it from +0xD0, store it at +0xCC, start a -0x20000 transition on component
 * +0x1C, reset counters +0x7C/+0x80, stop record +0x20 when the list becomes
 * empty, re-layout remaining actors, and return the removed target. Return null
 * when nothing matches. List/actor state changes; no direct hardware effects.
 */
extern "C" void *func_ov016_021fe584(void *state, void *key, s32 remove)
{
    void *actor;

    for (actor = FIELD(void *, state, 0xd4); actor != 0;
         actor = FIELD(void *, actor, 8)) {
        if (func_02092910(FIELD(void *, actor, 0x9c), key) != 0) {
            if (remove == 0) {
                return FIELD(void *, actor, 0xac);
            }
            PresentationList_Remove((u8 *)state + 0xd0, actor);
            FIELD(void *, state, 0xcc) = actor;
            PresentationScalar_TransitionBy((u8 *)actor + 0x1c, 1, -0x20000);
            FIELD(s32, actor, 0x7c) = 0x10;
            FIELD(s32, actor, 0x80) = 0;
            if (FIELD(s32, state, 0xdc) == 0) {
                func_02095940((u8 *)state + 0x20);
            }
            break;
        }
    }
    if (FIELD(void *, state, 0xcc) == 0) {
        return 0;
    }
    func_ov016_021fe2b0(state);
    return FIELD(void *, FIELD(void *, state, 0xcc), 0xac);
}

/*
 * Update actor record +0x20, select sprite +0x1C image (+0xE4 + count +0xDC)
 * modulo 256, and update child +0x18. For a departing actor +0xCC, invoke its
 * vtable update at +8: delete through slot +4 on completion, otherwise compute
 * and store sprite halfword +0x34 from func_02094D28. Finally invoke the same
 * update slot on every active +0xD4 actor. Return void; actor/sprite state and
 * heap ownership may change, with no direct MMIO.
 */
extern "C" void func_ov016_021fe63c(void *state)
{
    typedef s32 (*UpdateFunction)(void *);
    typedef void (*DeleteFunction)(void *);
    void *actor;

    func_020958d8((u8 *)state + 0x20);
    GraphicsSpriteState_SetAnimationIndex(FIELD(void *, state, 0x1c),
                  (FIELD(s32, state, 0xe4) + FIELD(s32, state, 0xdc)) & 0xff);
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 0x18));
    actor = FIELD(void *, state, 0xcc);
    if (actor != 0) {
        UpdateFunction *vtable = *(UpdateFunction **)actor;
        if (vtable[2](actor) != 0) {
            DeleteFunction *deleteTable = *(DeleteFunction **)actor;
            deleteTable[1](actor);
            FIELD(void *, state, 0xcc) = 0;
        } else {
            FIELD(u16, FIELD(void *, actor, 0x9c), 0x34) =
                (u16)Presentation_InterpolateScalar(actor, 1, 0x100, 0x10);
        }
    }
    for (actor = FIELD(void *, state, 0xd4); actor != 0;
         actor = FIELD(void *, actor, 8)) {
        UpdateFunction *vtable = *(UpdateFunction **)actor;
        vtable[2](actor);
    }
}

/*
 * Return the completion predicate for departing actor +0xCC when present; else
 * return one for an empty active list or the predicate for its first +0xD4 actor.
 * State is read only and there are no SDK or hardware effects beyond the helper.
 */
extern "C" s32 func_ov016_021fe6f4(void *state)
{
    if (FIELD(void *, state, 0xcc) != 0) {
        return func_ov016_021fe728(FIELD(void *, state, 0xcc));
    }
    if (FIELD(void *, state, 0xd4) == 0) {
        return 1;
    }
    return func_ov016_021fe728(FIELD(void *, state, 0xd4));
}

/* Return one when actor counter +0x80 reaches threshold +0x7C, otherwise zero. */
extern "C" s32 func_ov016_021fe728(void *actor)
{
    return FIELD(s32, actor, 0x80) >= FIELD(s32, actor, 0x7c);
}

/* Clear three leading words at +0/+4/+8 and return void without hardware effects. */
extern "C" void func_ov016_021fe740(void *value)
{
    FIELD(u32, value, 0) = 0;
    FIELD(u32, value, 4) = 0;
    FIELD(u32, value, 8) = 0;
}

/*
 * Store arguments two and three at +0x24/+0x28, clear words +4/+8, and return
 * void. Word +0 is intentionally preserved; there are no SDK or hardware effects.
 */
extern "C" void func_ov016_021fe754(void *value, u32 first, u32 second)
{
    FIELD(u32, value, 0x24) = first;
    FIELD(u32, value, 0x28) = second;
    FIELD(u32, value, 4) = 0;
    FIELD(u32, value, 8) = 0;
}
