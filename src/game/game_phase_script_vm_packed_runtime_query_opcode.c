#include "tingle/game_phase_script_vm.h"

/* Implement the script opcode that queries a packed value from the runtime object at offset 0x2ed4. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
#ifdef __cplusplus
}
#endif

typedef u32 (*RuntimePackedQueryMethod)(void *object, u32 first, u32 second);

/*
 * Pop second, first, and field selector values; invoke virtual method 0x2c on
 * runtime object 0x2ed4 with first and second; then store either the signed
 * low five bits (selector 0), bits 5..9 (selector 1), or bits 10..13
 * (selector 2) as the VM result. Other selectors store no VM result. Returns zero.
 */
s32 func_02016bc0(GamePhaseActorScriptVm *self)
{
    u32 second = GamePhaseScriptVm_Pop(&self->base);
    u32 first = GamePhaseScriptVm_Pop(&self->base);
    u32 selector = GamePhaseScriptVm_Pop(&self->base);
    void *object = *(void **)((u8 *)data_021052fc + 0x2ed4);
    RuntimePackedQueryMethod *vtable = *(RuntimePackedQueryMethod **)object;
    u32 packed = vtable[0x2c / sizeof(void *)](object, first, second);

    if (selector == 0)
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (u32)((s32)(packed << 27) >> 27));
    else if (selector == 1)
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (packed >> 5) & 0x1f);
    else if (selector == 2)
        GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, (packed >> 10) & 0xf);
    return 0;
}
