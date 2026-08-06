#include "tingle/types.h"

/*
 * Recovered record-driven effect dispatcher for the tracked-resource actor.
 * A signed selector in the actor's table record chooses one of several visual
 * effect families, followed by optional auxiliary-object and action creation.
 */

extern void *data_021052fc;
extern const u8 data_020e35cc[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32 size, const void *tag, u32 align, void *heap);
extern void *func_0201e0ec(void *manager);
extern void func_0201f864(void *storage, const void *position, void *context,
                          u16 id, u16 value0, u16 value1, s32 arg0,
                          s32 arg1, s32 arg2, s32 arg3);
extern void *func_02030acc(void);
extern void func_020337d4(void *actor);
extern void func_02034a60(void *actor, u16 value, s32 mode, ...);
extern void func_020a2614(void *manager, s32 subtype, s32 x, s32 y,
                          s32 variant);
extern void func_020a2844(void *manager, s32 subtype, s32 x, s32 y,
                          s32 variant);
extern void func_020a2894(void *manager, s32 subtype, s32 x, s32 y,
                          s32 variant);
extern void func_020a291c(void *manager, s32 subtype, s32 x, s32 y);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is an actor whose record pointer is at 0x1FC. Convert actor position to
 * pixels (Y is reduced by actor height) and dispatch signed record byte 0x12:
 * 0 selects func_020a2894; 1,5,6 select func_020a2614 variants 1,2,3 with value
 * 5; 2/3 select func_020a291c variants 0/1; 10..15 select func_020a2844 subtype
 * selector-10 with value 4; 20..24 select func_020a2614 subtype 1 with value
 * selector-13; 25 uses value 15; and 30 selects func_020a2844 subtype 0 with
 * value 12. Other selectors have no primary effect. If record halfword 0x16 is
 * nonzero, allocate a 20-byte auxiliary object and initialize it from record
 * halfwords 0x16..0x1A. If record halfword 0x1C is nonzero, invoke
 * func_02034a60 with mode zero. Returns nothing; effect, heap, and actor state
 * may change, with no direct hardware access.
 */
void func_02050260(void *actor)
{
    void *record = FIELD(void *, actor, 0x1fc);
    void *manager = func_0201e0ec((u8 *)data_021052fc + 0x2f7c);
    s32 selector = FIELD(s8, record, 0x12);
    s32 x = FIELD(s32, actor, 0x1c) >> 12;
    s32 y = (FIELD(s32, actor, 0x20) >> 12) -
            (FIELD(s32, actor, 0x24) >> 12);

    switch (selector) {
    case 0:
        func_020a2894(manager, 0, x, y, 0);
        break;
    case 1:
        func_020a2614(manager, 1, x, y, 5);
        break;
    case 2:
        func_020a291c(manager, 0, x, y);
        break;
    case 3:
        func_020a291c(manager, 1, x, y);
        break;
    case 5:
        func_020a2614(manager, 2, x, y, 5);
        break;
    case 6:
        func_020a2614(manager, 3, x, y, 5);
        break;
    case 10: case 11: case 12: case 13: case 14: case 15:
        func_020a2844(manager, selector - 10, x, y, 4);
        break;
    case 20: case 21: case 22: case 23: case 24:
        func_020a2614(manager, 1, x, y, selector - 13);
        break;
    case 25:
        func_020a2614(manager, 1, x, y, 15);
        break;
    case 30:
        func_020a2844(manager, 0, x, y, 12);
        break;
    }

    if (FIELD(u16, record, 0x16) != 0) {
        void *object = Heap_Alloc(0x14, data_020e35cc, 4, gHeapContext);
        if (object != 0) {
            func_020337d4(actor);
            func_0201f864(object, (u8 *)actor + 0x18, func_02030acc(),
                          FIELD(u16, record, 0x16),
                          FIELD(u16, record, 0x18),
                          FIELD(u16, record, 0x1a), 0, -4, -1, 1);
        }
    }

    if (FIELD(u16, record, 0x1c) != 0)
        func_02034a60(actor, FIELD(u16, record, 0x1c), 0);
}

