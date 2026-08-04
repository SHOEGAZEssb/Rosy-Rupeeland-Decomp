#include "tingle/game_phase_script_vm.h"
#include "tingle/system.h"

/* Execute phase bytecode and manage the interpreter's recovered value stack. */

typedef s32 (*GamePhaseScriptOpcode)(GamePhaseScriptVm *self);

#ifdef __cplusplus
extern "C" {
#endif
extern GamePhaseScriptOpcode data_020d5bec[];
#ifdef __cplusplus
}
#endif

/* Decrement stackDepth_7c and return the new top stack_4c value; no bounds check. */
u32 func_02012704(GamePhaseScriptVm *self)
{
    self->stackDepth_7c--;
    return self->stack_4c[self->stackDepth_7c];
}

/* Push value at stackDepth_7c and increment the signed-byte depth; no bounds check. */
void func_02012720(GamePhaseScriptVm *self, u32 value)
{
    self->stack_4c[self->stackDepth_7c] = value;
    self->stackDepth_7c++;
}

/*
 * Execute bytecode from cursor_04 through the signed-opcode dispatch table.
 * Null cursor or flags_7d bit 0 stops immediately. In singleStep mode, exactly
 * one opcode runs only while pad 0 pressed bit 3 is set; normal mode continues
 * until an opcode handler returns nonzero. Cursor advances before each call.
 * The handler return only controls the loop; this wrapper always returns zero.
 */
s32 func_0201273c(GamePhaseScriptVm *self, s32 singleStep)
{
    s32 result = 0;
    if (!self->cursor_04)
        return 0;
    if (self->flags_7d & 1)
        return 0;
    if (singleStep) {
        if (gSystemState.pads[0].pressed & 8) {
            s8 opcode = *self->cursor_04++;
            data_020d5bec[opcode](self);
        }
    } else {
        while (!result) {
            s8 opcode = *self->cursor_04++;
            result = data_020d5bec[opcode](self);
        }
    }
    return 0;
}

/* Recovered default opcode/hook: ignore self and return zero. */
s32 func_020127f0(GamePhaseScriptVm *self)
{
    (void)self;
    return 0;
}

/*
 * Store value in values_2c[7] (offset 0x48) and mirror its nonzero state into
 * flags_7d bit 1. No value is returned.
 */
void func_020127f8(GamePhaseScriptVm *self, u32 value)
{
    self->values_2c[7] = value;
    if (value)
        self->flags_7d |= 2;
    else
        self->flags_7d &= ~2;
}
