#include "tingle/types.h"

/*
 * Overlay 13 scene-record runtime. These recovered routines advance two arrays
 * of 0xAC-byte objects, perform position tests, select reactions, and report
 * whether their per-record counters have finished.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

/* These linker symbols denote command-stream addresses, not pointer slots. */
extern const u32 data_ov013_021feb40[];
extern const u32 data_ov013_021feb58[];
extern const s32 data_ov013_021febb4[];
extern void *gLupyContext;
#ifdef __cplusplus
extern "C" {
#endif
extern s32 Presentation_IsScriptSuspended(void *);
extern s32 Presentation_IsScriptComplete(void *);
extern void Presentation_SetScript(void *, const void *, s32);
extern void func_020958f0(void *);
extern void func_020958d8(void *);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void GamePhaseCurrencyHud_Update(void *);
extern s32 func_02095860(void *, void *, s32, s32);
extern void func_02092260(void *, s32);
extern void func_02095988(void *, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern s32 func_ov013_021fdfbc(void *);
#ifdef __cplusplus
}
#endif

typedef void (*Overlay013UpdateMethod)(void *);

/* Invoke vtable slot +8 on object and return void; the dynamic update may alter graphics state. */
static void overlay013_virtual_update(void *object)
{
    void **vtable = FIELD(void **, object, 0);
    ((Overlay013UpdateMethod)vtable[2])(object);
}

/*
 * Advance the controller at +0x948 through confirmed states 0..5, then invoke
 * its update slot. Advance seven records at +0x8C, five at +0x540, and the
 * final record at +0x89C. When +0x974 is clear, the first array instead copies
 * signed halfwords +0x2C/+0x2E from each record's +0x9C pointer to the related
 * pointer at +0x950[index]. Update managers +0x84/+0x88 and, when +0x97C is
 * nonzero, dispatch the global context. Return void. The interpretation as
 * animation/controller state is inferred from the shared callees.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov013_021fdbb0(void *state)
{
    s32 i;
    void *controller;

    if (FIELD(void *, state, 0x84) != 0) {
        controller = FIELD(void *, state, 0x948);
        switch (FIELD(s32, state, 0x984)) {
        case 0:
            if (Presentation_IsScriptSuspended(controller)) {
                FIELD(s32, controller, 0x90) = 0;
                FIELD(s32, state, 0x984) = 1;
            }
            break;
        case 2:
            if (Presentation_IsScriptComplete(controller))
                FIELD(s32, state, 0x984) = 3;
            break;
        case 3:
            Presentation_SetScript(controller, data_ov013_021feb58, 0);
            FIELD(s32, state, 0x984) = 0;
            break;
        case 4:
            Presentation_SetScript(controller, data_ov013_021feb40, 0);
            FIELD(s32, state, 0x984) = 5;
            break;
        }
        overlay013_virtual_update(controller);

        if (FIELD(s32, state, 0x974) != 0) {
            for (i = 0; i < 7; ++i) {
                u8 *record = (u8 *)state + 0x8c + i * 0xac;
                overlay013_virtual_update(record);
                func_020958f0(record);
            }
        } else {
            for (i = 0; i < 7; ++i) {
                u8 *record = (u8 *)state + 0x8c + i * 0xac;
                void *source;
                void *target;

                func_020958d8(record);
                source = FIELD(void *, record, 0x9c);
                target = FIELD(void *, state, 0x950 + i * 4);
                FIELD(s16, target, 0x2c) = FIELD(s16, source, 0x2c);
                FIELD(s16, target, 0x2e) = FIELD(s16, source, 0x2e);
            }
        }
        for (i = 0; i < 5; ++i) {
            u8 *record = (u8 *)state + 0x540 + i * 0xac;
            overlay013_virtual_update(record);
            func_020958f0(record);
        }
        overlay013_virtual_update((u8 *)state + 0x89c);
        func_020958f0((u8 *)state + 0x89c);
        GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 0x84));
        GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 0x88));
    }
    if (FIELD(s32, state, 0x97c) != 0)
        GamePhaseCurrencyHud_Update(gLupyContext);
}

/*
 * Search the seven records at +0x8C using state member +0x30 and test mode 4.
 * Store the first record whose +0x98 bit 1 is clear in +0x96C and return one;
 * if that bit is set, request state 9 and return zero. Return zero if none
 * match. The positional/collision nature of the test is inferred.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov013_021fdd8c(void *state)
{
    s32 i;

    FIELD(s32, state, 0x96c) = -1;
    for (i = 0; i < 7; ++i) {
        u8 *record = (u8 *)state + 0x8c + i * 0xac;
        if (func_02095860(record, (u8 *)state + 0x30, 0, 4)) {
            if ((FIELD(u16, record, 0x98) & 2) == 0) {
                FIELD(s32, state, 0x96c) = i;
                return 1;
            }
            func_02092260(state, 9);
            return 0;
        }
    }
    return 0;
}

/*
 * Search the five records at +0x540 using test mode zero. A match whose +0x98
 * bit 1 is set requests state 9 and returns zero. Otherwise, select the table
 * value at index*20 plus one, select index+15 on +0x94C, clear that object's
 * halfword bit 2, store the index at +0x970, and return one. Return zero when
 * no record matches; callees may change animation state.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov013_021fde18(void *state)
{
    s32 i;

    FIELD(s32, state, 0x970) = -1;
    for (i = 0; i < 5; ++i) {
        u8 *record = (u8 *)state + 0x540 + i * 0xac;
        if (func_02095860(record, (u8 *)state + 0x30, 0, 0)) {
            void *target;
            if (FIELD(u16, record, 0x98) & 2) {
                func_02092260(state, 9);
                return 0;
            }
            func_02095988(record, data_ov013_021febb4[i * 5] + 1);
            target = FIELD(void *, state, 0x94c);
            GraphicsSpriteState_SetAnimationIndex(target, (i + 15) & 0xff);
            FIELD(u16, target, 0x24) &= (u16)~4;
            FIELD(s32, state, 0x970) = i;
            return 1;
        }
    }
    return 0;
}

/*
 * Test the final record at +0x89C against member +0x30. On a match select one,
 * clear bit 2 on the object at +0x94C, and return one; otherwise return zero.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov013_021fdee4(void *state)
{
    void *target;
    if (!func_02095860((u8 *)state + 0x89c, (u8 *)state + 0x30, 0, 0))
        return 0;
    func_02095988((u8 *)state + 0x89c, 1);
    target = FIELD(void *, state, 0x94c);
    FIELD(u16, target, 0x24) &= (u16)~4;
    return 1;
}

/* Return one if any of the 13 records has +0x80 below +0x7C, else return zero; no state or hardware changes. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov013_021fdf38(void *state)
{
    s32 i;
    for (i = 0; i < 7; ++i)
        if (!func_ov013_021fdfbc((u8 *)state + 0x8c + i * 0xac)) return 1;
    for (i = 0; i < 5; ++i)
        if (!func_ov013_021fdfbc((u8 *)state + 0x540 + i * 0xac)) return 1;
    return func_ov013_021fdfbc((u8 *)state + 0x89c) ? 0 : 1;
}

/* Compare signed counters +0x80 and +0x7C; return one when +0x80 is greater than or equal, otherwise zero. */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov013_021fdfbc(void *record)
{
    return FIELD(s32, record, 0x80) >= FIELD(s32, record, 0x7c);
}
