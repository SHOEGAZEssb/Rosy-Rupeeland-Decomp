#include "tingle/game_phase_script_vm.h"

/* Implement actor-script opcodes for local fields and address-derived flags. */

/*
 * Pop a byte value and selector. Selector 0 copies the byte to offset 0x3a of
 * actor pointers at 0x54 and, when non-null, 0x58, then sets actor word flag
 * 0x80. Selector 1 only clears that word flag. Other selectors have no effect.
 * Returns zero.
 */
s32 GamePhaseActorScriptVm_ConfigureAttachmentByte3aAndFlag80(GamePhaseActorScriptVm *self)
{
    u32 value = GamePhaseScriptVm_Pop(&self->base);
    u32 selector = GamePhaseScriptVm_Pop(&self->base);
    u8 *actor = (u8 *)self->actor;
    if (selector == 0) {
        u8 *first = *(u8 **)(actor + 0x54);
        u8 *second = *(u8 **)(actor + 0x58);
        first[0x3a] = (u8)value;
        if (second != 0)
            second[0x3a] = (u8)value;
        *(u32 *)(actor + 0x14) |= 0x80;
    } else if (selector == 1) {
        *(u32 *)(actor + 0x14) &= ~0x80u;
    }
    return 0;
}

/* Store the bound actor's halfword at offset 0x4e as the VM result and return zero. */
s32 GamePhaseActorScriptVm_GetActorField4e(GamePhaseActorScriptVm *self)
{
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, *(u16 *)((u8 *)self->actor + 0x4e));
    return 0;
}

/* Pop a bit index and value, store value masked by that single bit as the VM result, and return zero. */
s32 GamePhaseActorScriptVm_MaskValueByBit(GamePhaseActorScriptVm *self)
{
    u32 bit = GamePhaseScriptVm_Pop(&self->base);
    u32 value = GamePhaseScriptVm_Pop(&self->base);
    GamePhaseScriptVm_StoreResultAndUpdateCondition(&self->base, value & (1u << bit));
    return 0;
}

/* Pop a boolean, mirror it into actor word flag 0x8 at offset 0x14, and return zero. */
s32 GamePhaseActorScriptVm_SetActorFlag8(GamePhaseActorScriptVm *self)
{
    u32 enabled = GamePhaseScriptVm_Pop(&self->base);
    u32 *flags = (u32 *)((u8 *)self->actor + 0x14);
    if (enabled != 0)
        *flags |= 8;
    else
        *flags &= ~8u;
    return 0;
}

/* Pop a boolean, apply Actor_SetFlag200000Inverse to the bound actor, and return zero. */
s32 GamePhaseActorScriptVm_SetActorFlag200000Inverse(GamePhaseActorScriptVm *self)
{
    s32 enabled = (s32)GamePhaseScriptVm_Pop(&self->base);
    Actor_SetFlag200000Inverse(self->actor, enabled);
    return 0;
}

/*
 * Clear actor word flag 0x200000 when enabled is nonzero and set it when zero.
 * This inverted polarity is confirmed; the flag's semantic name is unknown.
 */
void Actor_SetFlag200000Inverse(void *actor, s32 enabled)
{
    u32 *flags = (u32 *)((u8 *)actor + 0x14);
    if (enabled != 0)
        *flags &= ~0x200000u;
    else
        *flags |= 0x200000;
}
