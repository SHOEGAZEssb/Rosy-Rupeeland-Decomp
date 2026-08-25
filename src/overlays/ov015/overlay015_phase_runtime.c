#include "tingle/types.h"

/* Overlay 15 interaction phase handlers and their completion predicates. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_021e9ac0;
extern void *gGameWork;
extern const u32 data_ov015_021febd0[];
extern const u32 data_ov015_021febe8[];
extern const u32 data_ov015_021febf0[];
extern const u32 data_ov015_021febf8[];
extern const u32 data_ov015_021fec00[];
extern const u32 data_ov015_021fec08[];
extern const u32 data_ov015_021fec10[];
extern const u32 data_ov015_021fec18[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_SetFlag(void *, s32);
extern s32 ActorDescriptor_GetPrimaryLabel(void *);
extern s32 ActorDescriptorState_FindInactiveQuantity(void *, u16);
extern s32 InventoryRecordCollection_HasInactiveKind1Subtype1(void *);
extern void SceneSound_PlayPackedEffect(void *, s32);
extern void SceneSound_StopPackedEffect(void *, s32);
extern void InventoryScroll_BeginMarkerDrag(void *, s32);
extern void InventoryScroll_EndMarkerDrag(void *, s32);
extern s32 ModalState_UpdateInput(void *, void *, s32);
extern s32 func_ov001_021fc0ac(void *, void *);
extern void func_ov001_021fc1f0(void *);
extern s32 func_ov001_021fc214(void *);
extern s32 func_ov001_021fc240(void *);
extern void Overlay001_Grid_UpdateTransition(void *);
extern s32 func_ov001_021fc2e4(void *);
extern s32 func_ov001_021fc310(void *);
extern s32 func_ov001_021fc320(void *);
extern s32 func_ov001_021fc348(void *, void *);
extern void func_ov001_021fc384(void *);
extern void func_ov001_021fc39c(void *);
extern void func_ov001_021fc3b4(void *);
extern s32 func_ov001_021fc3c4(void *, void *);
extern void func_ov001_021fc3dc(void *);
extern s32 func_ov001_021fc3ec(void *, void *);
extern void Overlay001_SyncSelection(void *);
extern void Overlay001_SetSelection(void *, s32);
extern void *func_ov001_021fc7e4(void *);
extern void func_ov001_021fc7f4(void *);
extern s32 func_ov001_021fcae0(void *, void *);
extern s32 func_ov001_021fcb60(void *, void *);
extern s32 func_ov001_021fcbf0(void *, void *);
extern s32 func_ov001_021fcc44(void *, void *);
extern void func_ov015_021fce30(void *, u32, u32);
extern void Overlay015_UpdateRecords(void *);
extern void func_ov015_021fd6c8(void *);
extern void func_ov015_021fdad4(void *);
extern s32 func_ov015_021fdd1c(void *);
extern void func_ov015_021fde00(void *, s32, s32, void *);
extern void func_ov015_021fdeac(void *);
extern s32 func_ov015_021fe548(void *);
#ifdef __cplusplus
}
#endif

/* Apply a confirmed two-word transition descriptor through the base helper. */
static void overlay015_transition(void *state, const u32 *descriptor)
{
    func_ov015_021fce30(state, descriptor[0], descriptor[1]);
}

/* Advance or rewind phase +4 and reset its per-phase counter +8. */
static void overlay015_step_phase(void *state, s32 delta)
{
    FIELD(s32, state, 4) += delta;
    FIELD(s32, state, 8) = 0;
}

/*
 * Run the two-stage transient-confirmation phase. Stage zero prepares the
 * +0xDC object and prompt records, then either launches transient presentation
 * 0x0F or selects the fallback transition. Stage one polls that presentation,
 * tears it down on a nonnegative result, restores the object, and transitions.
 * Return zero on every call; state, records, and presentation/audio subsystems
 * may change, but this handler performs no direct MMIO.
 */
extern "C" s32 Overlay015_UpdateTransientConfirmation(void *state)
{
    if (FIELD(s32, state, 4) == 0) {
        if (FIELD(void *, state, 0xec) == 0) {
            func_ov001_021fc3dc(FIELD(void *, state, 0xdc));
        }
        func_ov001_021fc3b4(FIELD(void *, state, 0xdc));
        func_ov015_021fdad4(state);
        if (FIELD(void *, state, 0xec) != 0 &&
            InventoryRecordCollection_HasInactiveKind1Subtype1(FIELD(void *, FIELD(void *, state, 0xdc), 0x204)) == 0) {
            func_ov001_021fc39c(FIELD(void *, state, 0xdc));
            func_ov015_021fde00(state, 0xf, 1, 0);
            overlay015_step_phase(state, 1);
        } else {
            overlay015_transition(state, data_ov015_021febd0);
        }
    } else if (FIELD(s32, state, 4) == 1 &&
               ModalState_UpdateInput(FIELD(void *, state, 0xf8), (u8 *)state + 0x30,
                             (FIELD(u32, state, 0x20) & 0x20) != 0 ? -1 : 0) >= 0) {
        func_ov015_021fdeac(state);
        func_ov001_021fc384(FIELD(void *, state, 0xdc));
        overlay015_transition(state, data_ov015_021fec18);
    }
    return 0;
}

/*
 * Drive the four-stage primary interaction loop. It starts and polls the +0xDC
 * object, gates selection on input bits 4/5 at +0x20, updates selected indices,
 * dispatches special object actions, and advances or rewinds phase +4. Several
 * confirmed transition descriptors and game flag 0x387 terminate subpaths.
 * The record updater always runs before returning zero; called routines may
 * mutate gameplay, prompt, transition, and audio state without direct MMIO here.
 */
extern "C" s32 func_ov015_021fdfe8(void *state)
{
    void *controller = FIELD(void *, state, 0xdc);

    switch (FIELD(s32, state, 4)) {
    case 0:
        func_ov001_021fc1f0(controller);
        func_ov015_021fd6c8(state);
        overlay015_step_phase(state, 1);
        break;
    case 1:
        if (func_ov001_021fc240(controller) != 0) {
            func_ov015_021fd6c8(state);
            func_ov015_021fdad4(state);
            overlay015_step_phase(state, 1);
        } else {
            Overlay001_Grid_UpdateTransition(controller);
            break;
        }
        /* The original intentionally continues into stage two after readiness. */
    case 2:
        if (func_ov001_021fcae0(controller, FIELD(void *, state, 0x2c)) == 0 &&
            (FIELD(u32, state, 0x20) & 0x10) != 0 &&
            func_ov001_021fcbf0(controller, (u8 *)state + 0x30) == 0 &&
            (FIELD(u32, state, 0x20) & 0x20) != 0) {
            s32 selected = func_ov001_021fc0ac(controller, (u8 *)state + 0x30);

            if (func_ov001_021fcb60(controller, (u8 *)state + 0x30) == 0) {
                if (func_ov001_021fcc44(controller, (u8 *)state + 0x30) != 0) {
                    overlay015_transition(state, data_ov015_021fec10);
                    break;
                }
                if (selected >= 0) {
                    SceneSound_PlayPackedEffect(state, 0);
                    if (selected != FIELD(s32, controller, 0x1ac)) {
                        Overlay001_SetSelection(controller, selected);
                        Overlay001_SyncSelection(controller);
                        func_ov015_021fd6c8(state);
                        func_ov015_021fdad4(state);
                    }
                    break;
                }
                if (func_ov001_021fc3c4(controller, (u8 *)state + 0x30) != 0) {
                    SceneSound_PlayPackedEffect(state, 3);
                    overlay015_transition(state, data_ov015_021fec00);
                    break;
                }
                if (func_ov001_021fc3ec(controller, (u8 *)state + 0x30) != 0) {
                    SceneSound_PlayPackedEffect(state, 0xb);
                    GameWork_SetFlag(gGameWork, 0x387);
                    overlay015_transition(state, data_ov015_021fec08);
                    break;
                }
                if (func_ov015_021fdd1c(state) != 0) {
                    break;
                }
            }
        }
        if (func_ov001_021fc214(controller) != 0) {
            SceneSound_PlayPackedEffect(state, 0);
            overlay015_step_phase(state, -1);
        } else if (func_ov001_021fc2e4(controller) != 0) {
            SceneSound_PlayPackedEffect(state, 0);
            overlay015_step_phase(state, 1);
        }
        break;
    case 3:
        if (func_ov001_021fc310(controller) != 0) {
            overlay015_step_phase(state, -1);
        } else if (func_ov001_021fc320(controller) != 0) {
            func_ov015_021fd6c8(state);
            func_ov015_021fdad4(state);
        }
        break;
    }
    Overlay015_UpdateRecords(state);
    return 0;
}

/*
 * Drive the three-stage auxiliary controller stored at +0xDC/+0x1BC. Start its
 * mode 4, poll controller readiness, refresh prompts when its counters differ,
 * then either accept bit-4 input or request mode 6 and transition. State +4/+8,
 * record objects, audio, and transition state may change. Always update records
 * and return zero; no direct hardware access.
 */
extern "C" s32 func_ov015_021fe2b0(void *state)
{
    void *controller = FIELD(void *, state, 0xdc);
    void *auxiliary = FIELD(void *, controller, 0x1bc);

    switch (FIELD(s32, state, 4)) {
    case 0:
        InventoryScroll_BeginMarkerDrag(auxiliary, 4);
        overlay015_step_phase(state, 1);
        /* Intentional fallthrough into readiness polling. */
    case 1:
        if (func_ov001_021fc240(controller) == 0) {
            Overlay001_Grid_UpdateTransition(controller);
            break;
        }
        if (FIELD(s32, auxiliary, 0xc) != FIELD(s32, auxiliary, 0x10)) {
            func_ov015_021fd6c8(state);
            func_ov015_021fdad4(state);
            SceneSound_StopPackedEffect(state, 8);
        }
        overlay015_step_phase(state, 1);
        /* Intentional fallthrough into input handling. */
    case 2:
        if ((FIELD(u32, state, 0x20) & 0x10) != 0) {
            if (func_ov001_021fc348(controller, (u8 *)state + 0x30) != 0) {
                SceneSound_PlayPackedEffect(state, 8);
                overlay015_step_phase(state, -1);
            }
        } else {
            InventoryScroll_EndMarkerDrag(auxiliary, 6);
            overlay015_transition(state, data_ov015_021febf8);
        }
        break;
    }
    Overlay015_UpdateRecords(state);
    return 0;
}

/*
 * Drive the five-stage action-confirmation sequence. It waits for the selected
 * record's +0x80 counter, creates presentation 0x12 using the selected object's
 * text handle, interprets poll results 1/2, and follows the appropriate cleanup
 * transition. State +4/+8 and transient/record objects may change. The record
 * updater always runs and the function always returns zero, with no direct MMIO.
 */
extern "C" s32 func_ov015_021fe3e4(void *state)
{
    void *status = func_ov001_021fc7e4(FIELD(void *, state, 0xdc));

    switch (FIELD(s32, state, 4)) {
    case 0: {
        void *record = (u8 *)state + 0xfc + FIELD(s32, state, 0xf0) * 0xac;
        if (func_ov015_021fe548(record) != 0) {
            overlay015_step_phase(state, 1);
        }
        break;
    }
    case 1:
        func_ov015_021fde00(state, 0x12, 0,
                            (void *)ActorDescriptor_GetPrimaryLabel(FIELD(void *, status, 0xc)));
        overlay015_step_phase(state, 1);
        break;
    case 2: {
        s32 result = ModalState_UpdateInput(FIELD(void *, state, 0xf8), (u8 *)state + 0x30,
                                   (FIELD(u32, state, 0x20) & 0x20) != 0 ? -1 : 0);
        if (result == 1) {
            func_ov001_021fc7f4(FIELD(void *, state, 0xdc));
            overlay015_step_phase(state, 2);
        } else if (result == 2) {
            func_ov015_021fdeac(state);
            overlay015_step_phase(state, 1);
        }
        break;
    }
    case 3:
        func_ov015_021fdad4(state);
        overlay015_transition(state, data_ov015_021febf0);
        break;
    case 4:
        func_ov015_021fdeac(state);
        func_ov015_021fdad4(state);
        overlay015_transition(state, data_ov015_021febe8);
        break;
    }
    Overlay015_UpdateRecords(state);
    return 0;
}

/*
 * Return one when record counter +0x80 has reached or exceeded threshold +0x7C,
 * otherwise zero. The record is read only and there are no hardware effects.
 */
extern "C" s32 func_ov015_021fe548(void *record)
{
    return FIELD(s32, record, 0x80) >= FIELD(s32, record, 0x7c);
}

/*
 * Query the global work object at +0x1C using the caller's second argument and
 * return one when the resulting value is at least 99, otherwise zero. The first
 * argument is unused, matching the recovered calling convention; no direct
 * state mutation or hardware access occurs.
 */
extern "C" s32 func_ov015_021fe560(void *unused, u16 selector)
{
    (void)unused;
    return ActorDescriptorState_FindInactiveQuantity((u8 *)FIELD(void *, data_021e9ac0, 0) + 0x1c, selector) >= 99;
}
