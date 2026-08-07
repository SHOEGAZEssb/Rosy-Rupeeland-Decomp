#include "tingle/types.h"

/* Overlay 16 alternate selectable-list interaction state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u32 data_ov016_02201480[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02092260(void *, s32);
extern void func_02092288(void *, s32);
extern void func_02093de4(void *);
extern s32 func_02093ffc(void *);
extern void func_020946a8(void *, s32);
extern s32 func_020946c8(void *, void *);
extern void func_02094738(void *, s32);
extern s32 func_ov016_021fd640(void *);
extern void func_ov016_021fe754(void *, u32, u32);
extern void func_ov016_021ff7bc(void *);
extern void func_ov016_021ffba4(void *);
extern void func_ov016_021ffbd8(void *);
#ifdef __cplusplus
}
#endif

/*
 * Run the alternate list handler using substate +4. State 0 starts presentation
 * mode 4 and falls through. State 1 waits for opening; if the presentation's
 * +0x0C and +0x10 indices differ it synchronizes the panel and sends action 8,
 * then advances and falls through. While waiting it only refreshes cursor motion.
 * State 2 updates input: when scene flag bit 4 is set, accepted input backs up
 * one state with action 8; otherwise it closes using presentation mode 6 and
 * transitions through data_ov016_02201480. Update all scene components every
 * call and return zero. UI/action/transition state changes; no direct MMIO.
 */
extern "C" s32 func_ov016_02200488(void *state)
{
    void *list = FIELD(void *, state, 0x444);
    void *presentation = FIELD(void *, list, 0x58);

    switch (FIELD(s32, state, 4)) {
    case 0:
        func_020946a8(presentation, 4);
        FIELD(s32, state, 4)++;
        FIELD(s32, state, 8) = 0;
        /* Deliberate fall-through while the opening sequence begins. */
    case 1:
        if (func_02093ffc(presentation) != 0) {
            if (FIELD(s32, presentation, 0xc) !=
                FIELD(s32, presentation, 0x10)) {
                func_ov016_021ffbd8(state);
                func_02092288(state, 8);
            }
            FIELD(s32, state, 4)++;
            FIELD(s32, state, 8) = 0;
        } else {
            if (func_ov016_021fd640(list) != 0) {
                func_ov016_021ffba4(state);
            }
            break;
        }
        /* Completed opening continues directly into input state 2. */
    case 2:
        func_02093de4(presentation);
        if ((FIELD(u32, state, 0x20) & 0x10) != 0) {
            if (func_020946c8(presentation, (u8 *)state + 0x30) != 0) {
                func_02092260(state, 8);
                FIELD(s32, state, 4)--;
                FIELD(s32, state, 8) = 0;
            }
        } else {
            func_02094738(presentation, 6);
            func_ov016_021fe754(state, data_ov016_02201480[0],
                                data_ov016_02201480[1]);
        }
        break;
    }
    func_ov016_021ff7bc(state);
    return 0;
}
