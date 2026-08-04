#include "tingle/game_phase_runtime.h"

/* Pre-transition synchronization for the runtime's primary and optional actors. */

extern u8 data_02105310[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0203ac9c(GamePhaseRuntime *self);
extern void func_0202dbe0(void *actor);
extern void func_0202e06c(void *actor);
extern void func_0202e15c(void *actor);
extern void func_0202e858(void *actor);
extern void func_0202dfec(void *actor);
extern void func_0202dddc(void *actor);
extern s32 func_0200b04c(void *state);
extern s32 func_0200b180(void *state);
extern s32 func_0200b294(void *state);
extern void func_0200af8c(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Prepare actors for a phase operation. Modes 1/3 update the primary actor at
 * offset 0x28; modes 2/3 also update the optional actor at 0x2fb8. The value
 * selects one of two actor setup variants. When global transition state is
 * idle, value is not 2, and the gameplay context passes func_02007868, this
 * also starts the global transition. Returns no value.
 */
void func_02007908(GamePhaseRuntime *self, s32 value, s32 mode)
{
    u8 *b = (u8 *)self;
    void *actor;

    func_0203ac9c(self);
    if (mode == 1 || mode == 3) {
        actor = b + 0x28;
        if (value == 2) {
            func_0202dbe0(actor);
            func_0202e06c(actor);
            func_0202e15c(actor);
            func_0202e858(actor);
        } else {
            func_0202dbe0(actor);
            func_0202dfec(actor);
            func_0202e15c(actor);
            func_0202e858(actor);
        }
    }

    if ((u32)(mode - 2) <= 1) {
        actor = *(void **)(b + 0x2fb8);
        if (actor != 0) {
            actor = (u8 *)actor + 8;
            if (value == 2 || value == 6) {
                func_0202dddc(actor);
                func_0202e06c((u8 *)*(void **)(b + 0x2fb8) + 8);
            } else {
                func_0202dddc(actor);
                func_0202dfec((u8 *)*(void **)(b + 0x2fb8) + 8);
            }
        }
    }

    if (!func_0200b04c(data_02105310) && value != 2 &&
        func_02007868(*(void **)(b + 0x2ea4)) &&
        !func_0200b180(data_02105310) &&
        func_0200b294(data_02105310))
        func_0200af8c(data_02105310);
}
