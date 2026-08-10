#include "tingle/game_phase_script_vm.h"

/* Implement the script opcode that replaces one field in a packed runtime value. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void func_02029b70(void *object, u32 first, u32 second, u32 packed);
#ifdef __cplusplus
}
#endif

typedef u32 (*RuntimePackedQueryMethod)(void *object, u32 first, u32 second);

/*
 * Pop replacement, second key, first key, and field selector values; query
 * the packed word through runtime object 0x2ed4's virtual method 0x2c;
 * replace signed/unsigned field bits 0..4, 5..9, or 10..13 for selectors
 * 0, 1, or 2; then submit the resulting word through func_02029b70.
 * Unsupported selectors resubmit the unmodified word. Returns zero.
 */
s32 func_02016c7c(GamePhaseActorScriptVm *self)
{
    u32 replacement = GamePhaseScriptVm_Pop(&self->base);
    u32 second = GamePhaseScriptVm_Pop(&self->base);
    u32 first = GamePhaseScriptVm_Pop(&self->base);
    u32 selector = GamePhaseScriptVm_Pop(&self->base);
    void *object = *(void **)((u8 *)data_021052fc + 0x2ed4);
    RuntimePackedQueryMethod *vtable = *(RuntimePackedQueryMethod **)object;
    u32 packed = vtable[0x2c / sizeof(void *)](object, first, second);

    if (selector == 0)
        packed = (packed & ~0x1fu) | (replacement & 0x1f);
    else if (selector == 1)
        packed = (packed & ~0x3e0u) | ((replacement & 0x1f) << 5);
    else if (selector == 2)
        packed = (packed & ~0x3c00u) | ((replacement & 0xf) << 10);
    func_02029b70(object, first, second, packed);
    return 0;
}
