#include "tingle/game_phase_script_vm.h"

/* Implement paired script dispatchers for two related record-operation helper families. */

#ifdef __cplusplus
extern "C" {
#endif
extern void OS_Halt(void);
extern void GraphicsSubBackground_Configure256ColorText(...);
extern void GraphicsSubBackground_Configure16ColorText(...);
extern void GraphicsSubBackground_SetScroll(...);
extern void GraphicsSubBackground_SetVisible(...);
extern void GraphicsMainBackground_Configure16ColorText(...);
extern void GraphicsMainBackground_LoadResources(...);
extern void GraphicsMainBackground_SetScroll(...);
extern void GraphicsMainBackground_SetVisible(...);
extern void GraphicsSubBackground_LoadResources(...);
extern void GraphicsMainBackground_ConfigureAlphaBlend(...);
extern void GraphicsSubBackground_ConfigureAlphaBlend(...);
#ifdef __cplusplus
}
#endif

/*
 * Pop five operands and a selector, dispatch selectors 0..6 through the first
 * record helper family, and return zero. Selectors 2 and 6 narrow the last
 * four operands to u16 and differ only in a final boolean. Invalid selectors
 * halt through the SDK routine.
 */
s32 GamePhaseActorScriptVm_DispatchSubBackgroundCommand(GamePhaseActorScriptVm *self)
{
    u32 operandE = GamePhaseScriptVm_Pop(&self->base);
    u32 operandD = GamePhaseScriptVm_Pop(&self->base);
    u32 operandC = GamePhaseScriptVm_Pop(&self->base);
    u32 operandB = GamePhaseScriptVm_Pop(&self->base);
    u32 operandA = GamePhaseScriptVm_Pop(&self->base);
    u32 selector = GamePhaseScriptVm_Pop(&self->base);

    switch (selector) {
    case 0:
        GraphicsSubBackground_Configure256ColorText(operandA, operandB,
                                                    operandC, operandD);
        break;
    case 1:
        GraphicsSubBackground_Configure16ColorText(operandA, operandB,
                                                   operandC, operandD);
        break;
    case 2:
        GraphicsSubBackground_LoadResources(operandA, (u16)operandB,
                                            (u16)operandC, (u16)operandD,
                                            (u16)operandE, 1);
        break;
    case 3: GraphicsSubBackground_SetScroll(operandA, operandB, operandC); break;
    case 4: GraphicsSubBackground_SetVisible(operandA, operandB); break;
    case 5:
        GraphicsSubBackground_ConfigureAlphaBlend(operandA, operandB, operandC);
        break;
    case 6:
        GraphicsSubBackground_LoadResources(operandA, (u16)operandB,
                                            (u16)operandC, (u16)operandD,
                                            (u16)operandE, 0);
        break;
    default: OS_Halt(); break;
    }
    return 0;
}

/*
 * Pop five operands and a selector, dispatch selectors 1..6 through the
 * second record helper family, and return zero. Selectors 2 and 6 narrow the
 * last four operands to u16 and differ only in a final boolean. Selector zero
 * and out-of-range values halt.
 */
s32 GamePhaseActorScriptVm_DispatchMainBackgroundCommand(GamePhaseActorScriptVm *self)
{
    u32 operandE = GamePhaseScriptVm_Pop(&self->base);
    u32 operandD = GamePhaseScriptVm_Pop(&self->base);
    u32 operandC = GamePhaseScriptVm_Pop(&self->base);
    u32 operandB = GamePhaseScriptVm_Pop(&self->base);
    u32 operandA = GamePhaseScriptVm_Pop(&self->base);
    u32 selector = GamePhaseScriptVm_Pop(&self->base);

    switch (selector) {
    case 1:
        GraphicsMainBackground_Configure16ColorText(operandA, operandB,
                                                    operandC, operandD);
        break;
    case 2:
        GraphicsMainBackground_LoadResources(operandA, (u16)operandB,
                                             (u16)operandC, (u16)operandD,
                                             (u16)operandE, 1);
        break;
    case 3: GraphicsMainBackground_SetScroll(operandA, operandB, operandC); break;
    case 4: GraphicsMainBackground_SetVisible(operandA, operandB); break;
    case 5:
        GraphicsMainBackground_ConfigureAlphaBlend(operandA, operandB, operandC);
        break;
    case 6:
        GraphicsMainBackground_LoadResources(operandA, (u16)operandB,
                                             (u16)operandC, (u16)operandD,
                                             (u16)operandE, 0);
        break;
    default: OS_Halt(); break;
    }
    return 0;
}
