#include "tingle/game_phase_script_vm.h"

/* Transfer VM register values to and from game-work, context, and callback storage. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGameWork;
#ifdef __cplusplus
}
#endif

/* Store the selected register's low halfword in game-work's indexed array and return zero. */
s32 func_0201be88(GamePhaseScriptVm *self)
{
    s32 source = (u8)*self->cursor_04++ & 7;
    u8 index = (u8)*self->cursor_04++;
    *(u16 *)((u8 *)gGameWork + 0x4c + index * 2) = (u16)self->values_2c[source];
    return 0;
}

/* Store the selected register in an unsigned-byte-indexed context slot and return zero. */
s32 func_0201becc(GamePhaseScriptVm *self)
{
    s32 source = (u8)*self->cursor_04++ & 7;
    u8 index = (u8)*self->cursor_04++;
    ((u32 *)self->context_80)[index] = self->values_2c[source];
    return 0;
}

/* Store the selected register in an indexed callback slot and return zero. */
s32 func_0201bf04(GamePhaseScriptVm *self)
{
    s32 source = (u8)*self->cursor_04++ & 7;
    u8 index = (u8)*self->cursor_04++;
    self->callbacks_0c[index] = (void *)self->values_2c[source];
    return 0;
}

/* Load a signed game-work halfword into the selected register and return zero. */
s32 func_0201bf3c(GamePhaseScriptVm *self)
{
    s32 destination = (u8)*self->cursor_04++ & 7;
    u8 index = (u8)*self->cursor_04++;
    self->values_2c[destination] =
        (u32)*(s16 *)((u8 *)gGameWork + 0x4c + index * 2);
    return 0;
}

/* Load an unsigned-byte-indexed context slot into the selected register and return zero. */
s32 func_0201bf80(GamePhaseScriptVm *self)
{
    s32 destination = (u8)*self->cursor_04++ & 7;
    u8 index = (u8)*self->cursor_04++;
    self->values_2c[destination] = ((u32 *)self->context_80)[index];
    return 0;
}

/* Load an indexed callback slot into the selected register and return zero. */
s32 func_0201bfb8(GamePhaseScriptVm *self)
{
    s32 destination = (u8)*self->cursor_04++ & 7;
    u8 index = (u8)*self->cursor_04++;
    self->values_2c[destination] = (u32)self->callbacks_0c[index];
    return 0;
}
