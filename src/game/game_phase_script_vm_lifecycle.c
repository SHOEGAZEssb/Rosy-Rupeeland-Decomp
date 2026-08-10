#include "tingle/game_phase_script_vm.h"
#include "tingle/heap.h"

/* Initialize, copy, and destroy the compact game-phase script interpreter. */

#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_020d56b4;
#ifdef __cplusplus
}
#endif

/* Install the script-VM vtable, reset recovered state, and return self. */
GamePhaseScriptVm *GamePhaseScriptVm_Init(GamePhaseScriptVm *self)
{
    self->vtable = data_020d56b4;
    GamePhaseScriptVm_Reset(self);
    return self;
}

/*
 * Clear the cursor, script start, address-derived 0x0c slots, registers,
 * stack, depth, state flags, field_7f, and context. Field_7e is intentionally
 * left untouched by retail.
 */
void GamePhaseScriptVm_Reset(GamePhaseScriptVm *self)
{
    s32 i;
    self->stateFlags = 0;
    self->cursor = 0;
    self->scriptStart = 0;
    for (i = 0; i < 8; i++)
        self->registers[i] = 0;
    for (i = 0; i < 12; i++)
        self->stack[i] = 0;
    for (i = 0; i < 8; i++)
        self->callbacks_0c[i] = 0;
    self->stackDepth = 0;
    self->field_7f = 0;
    self->context = 0;
}

/* Recovered no-op non-deleting destructor; returns self unchanged. */
GamePhaseScriptVm *GamePhaseScriptVm_Destroy(GamePhaseScriptVm *self)
{
    return self;
}

/* Free the VM's outer allocation and return its former address. */
GamePhaseScriptVm *GamePhaseScriptVm_DestroyAndFree(GamePhaseScriptVm *self)
{
    Heap_Free(self);
    return self;
}

/* Recovered no-op lifecycle hook; returns self unchanged. */
GamePhaseScriptVm *GamePhaseScriptVm_DestroyBase(GamePhaseScriptVm *self)
{
    return self;
}

/* Install the vtable, initialize script/context state, and return self. */
GamePhaseScriptVm *GamePhaseScriptVm_InitWithScript(GamePhaseScriptVm *self,
                                                    const s8 *script,
                                                    void *context)
{
    self->vtable = data_020d56b4;
    GamePhaseScriptVm_ResetWithScript(self, script, context);
    return self;
}

/* Reset the VM, set both cursor and start to script, and retain context. */
void GamePhaseScriptVm_ResetWithScript(GamePhaseScriptVm *self,
                                       const s8 *script, void *context)
{
    GamePhaseScriptVm_Reset(self);
    self->scriptStart = script;
    self->cursor = script;
    self->context = context;
}

/* Copy source into a distinct VM through GamePhaseScriptVm_CopyState and return self. */
GamePhaseScriptVm *GamePhaseScriptVm_Assign(GamePhaseScriptVm *self,
                                            const GamePhaseScriptVm *source)
{
    if (self != source)
        GamePhaseScriptVm_CopyState(self, source);
    return self;
}

/*
 * Copy cursor/start, registers, stack, state bytes, and context. Retail then
 * copies callbacks_0c into destination stack[0..7], overwriting those eight
 * stack values instead of copying callbacks to offset 0x0c. This surprising
 * address-confirmed behavior is preserved as a compiler/original-code trap.
 */
void GamePhaseScriptVm_CopyState(GamePhaseScriptVm *self,
                                 const GamePhaseScriptVm *source)
{
    s32 i;
    self->cursor = source->cursor;
    self->scriptStart = source->scriptStart;
    for (i = 0; i < 8; i++)
        self->registers[i] = source->registers[i];
    for (i = 0; i < 12; i++)
        self->stack[i] = source->stack[i];
    for (i = 0; i < 8; i++)
        self->stack[i] = (u32)source->callbacks_0c[i];
    self->stackDepth = source->stackDepth;
    self->stateFlags = source->stateFlags;
    self->field_7e = source->field_7e;
    self->field_7f = source->field_7f;
    self->context = source->context;
}
