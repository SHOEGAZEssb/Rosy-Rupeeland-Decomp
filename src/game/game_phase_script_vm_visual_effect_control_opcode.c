#include "tingle/game_phase_script_vm.h"

/* Control the runtime visual-effect state stored at offset 0x2ed8. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void func_02010094(void *effect, s32 value);
extern void func_02010104(void *effect, s32 first, s32 second);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

/*
 * Pop second, first, and mode operands.  Mode 1 clears runtime flag bit 0x8
 * when both values are zero; otherwise it sets the bit and configures effect
 * state 0x2ed8 with both values.  Mode 2 applies the first value through the
 * alternate effect operation.  Invalid modes invoke the SDK halt routine.
 * Return zero on the non-halting paths.
 */
s32 func_0201a130(GamePhaseActorScriptVm *self)
{
    s32 second = (s32)func_02012704(&self->base);
    s32 first = (s32)func_02012704(&self->base);
    s32 mode = (s32)func_02012704(&self->base);
    u8 *runtime = (u8 *)data_021052fc;
    void *effect = runtime + 0x2ed8;

    if (mode == 1) {
        if (first == 0 && second == 0) {
            *(u32 *)(runtime + 0x2f6c) &= ~8;
        } else {
            *(u32 *)(runtime + 0x2f6c) |= 8;
            func_02010104(effect, first, second);
        }
    } else if (mode == 2) {
        func_02010094(effect, first);
    } else {
        OS_Halt();
    }
    return 0;
}
