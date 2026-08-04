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
GamePhaseScriptVm *func_02012564(GamePhaseScriptVm *self)
{
    self->vtable = data_020d56b4;
    func_02012584(self);
    return self;
}

/*
 * Clear cursor/start, callbacks, values, both stacks, stackDepth, flags,
 * field_7f, and context. Field_7e is intentionally left untouched by retail.
 */
void func_02012584(GamePhaseScriptVm *self)
{
    s32 i;
    self->flags_7d = 0;
    self->cursor_04 = 0;
    self->start_08 = 0;
    for (i = 0; i < 8; i++)
        self->values_2c[i] = 0;
    for (i = 0; i < 12; i++)
        self->stack_4c[i] = 0;
    for (i = 0; i < 8; i++)
        self->callbacks_0c[i] = 0;
    self->stackDepth_7c = 0;
    self->field_7f = 0;
    self->context_80 = 0;
}

/* Recovered no-op non-deleting destructor; returns self unchanged. */
GamePhaseScriptVm *func_020125ec(GamePhaseScriptVm *self)
{
    return self;
}

/* Free the VM's outer allocation and return its former address. */
GamePhaseScriptVm *func_020125f0(GamePhaseScriptVm *self)
{
    Heap_Free(self);
    return self;
}

/* Recovered no-op lifecycle hook; returns self unchanged. */
GamePhaseScriptVm *func_02012604(GamePhaseScriptVm *self)
{
    return self;
}

/* Install the vtable, initialize script/context state, and return self. */
GamePhaseScriptVm *func_02012608(GamePhaseScriptVm *self,
                                 const s8 *script, void *context)
{
    self->vtable = data_020d56b4;
    func_02012628(self, script, context);
    return self;
}

/* Reset the VM, set both cursor and start to script, and retain context. */
void func_02012628(GamePhaseScriptVm *self,
                   const s8 *script, void *context)
{
    func_02012584(self);
    self->start_08 = script;
    self->cursor_04 = script;
    self->context_80 = context;
}

/* Copy source into a distinct VM through func_02012668 and return self. */
GamePhaseScriptVm *func_0201264c(GamePhaseScriptVm *self,
                                 const GamePhaseScriptVm *source)
{
    if (self != source)
        func_02012668(self, source);
    return self;
}

/*
 * Copy cursor/start, values, stack, state bytes, and context. Retail then
 * copies callbacks_0c into destination stack_4c[0..7], overwriting those eight
 * stack values instead of copying callbacks to offset 0x0c. This surprising
 * address-confirmed behavior is preserved as a compiler/original-code trap.
 */
void func_02012668(GamePhaseScriptVm *self,
                   const GamePhaseScriptVm *source)
{
    s32 i;
    self->cursor_04 = source->cursor_04;
    self->start_08 = source->start_08;
    for (i = 0; i < 8; i++)
        self->values_2c[i] = source->values_2c[i];
    for (i = 0; i < 12; i++)
        self->stack_4c[i] = source->stack_4c[i];
    for (i = 0; i < 8; i++)
        self->stack_4c[i] = (u32)source->callbacks_0c[i];
    self->stackDepth_7c = source->stackDepth_7c;
    self->flags_7d = source->flags_7d;
    self->field_7e = source->field_7e;
    self->field_7f = source->field_7f;
    self->context_80 = source->context_80;
}
