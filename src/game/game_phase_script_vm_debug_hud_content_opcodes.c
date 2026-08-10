#include "tingle/debug_hud_state.h"
#include "tingle/game_phase_script_vm.h"

/* Implement script opcodes that write debug-HUD rows and configure its rectangle. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *Actor_GetCollection(void *actor);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

/* Accept the VM, perform no state changes or SDK effects, and return zero. */
s32 func_02017414(GamePhaseActorScriptVm *self)
{
    (void)self;
    return 0;
}

/* Pop a numeric value and row index, write that debug-HUD row, and return zero. */
s32 func_0201741c(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)func_02012704(&self->base);
    s32 row = (s32)func_02012704(&self->base);
    DebugHudState_SetNumberRow(DebugHudState_GetGlobal(), row, value);
    return 0;
}

/*
 * Pop a string-table index and row. Select text table 0 or 1 from the bound
 * actor's collection mode at offset 0x2e84 (modes 1 and 2 respectively), halt
 * for any other mode, write the selected UTF-16 text to the row, and return zero.
 */
s32 func_02017450(GamePhaseActorScriptVm *self)
{
    s32 index = (s32)func_02012704(&self->base);
    s32 row = (s32)func_02012704(&self->base);
    u8 *collection = (u8 *)Actor_GetCollection(self->actor_84);
    const u16 *text = 0;
    switch (*(u32 *)(collection + 0x2e84)) {
    case 1:
        text = (const u16 *)DebugHud_GetTextTableEntry(DebugHudState_GetGlobal(), 0, index);
        break;
    case 2:
        text = (const u16 *)DebugHud_GetTextTableEntry(DebugHudState_GetGlobal(), 1, index);
        break;
    default:
        OS_Halt();
        break;
    }
    DebugHudState_SetTextRow(DebugHudState_GetGlobal(), row, text);
    return 0;
}

/*
 * Pop height, width, top, and left; form a left/top/right/bottom rectangle by
 * adding the dimensions; apply it to the debug HUD; and return zero.
 */
s32 func_020174dc(GamePhaseActorScriptVm *self)
{
    DebugHudRect rect;
    s32 height = (s32)func_02012704(&self->base);
    s32 width = (s32)func_02012704(&self->base);
    s32 top = (s32)func_02012704(&self->base);
    s32 left = (s32)func_02012704(&self->base);
    rect.left = left;
    rect.top = top;
    rect.right = left + width;
    rect.bottom = top + height;
    DebugHudState_SetRectangle(DebugHudState_GetGlobal(), &rect);
    return 0;
}
