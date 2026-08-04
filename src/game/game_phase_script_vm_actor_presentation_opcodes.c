#include "tingle/game_phase_script_vm.h"

/* Implement actor-script opcodes for presentation state and scaled dimensions. */

#ifdef __cplusplus
extern "C" {
#endif
extern u8 data_02105310[];
extern void func_0200b0d0(void *state, u32 value);
extern void func_02033f20(void *actor, s32 firstFx, s32 secondFx);
#ifdef __cplusplus
}
#endif

/* Pop a value, pass it to data_02105310 through func_0200b0d0, and return zero. */
s32 func_020142cc(GamePhaseActorScriptVm *self)
{
    u32 value = func_02012704(&self->base);
    func_0200b0d0(data_02105310, value);
    return 0;
}

/* No-op script handler; ignores the VM and returns zero. */
s32 func_020142ec(GamePhaseActorScriptVm *self)
{
    (void)self;
    return 0;
}

/* Pop a value into halfword 0x30 of actor->0x54 and return zero. */
s32 func_020142f4(GamePhaseActorScriptVm *self)
{
    u32 value = func_02012704(&self->base);
    u8 *object = *(u8 **)((u8 *)self->actor_84 + 0x54);
    *(u16 *)(object + 0x30) = (u16)value;
    return 0;
}

/*
 * Pop a value and store the low halfword of 0x10000-(value<<8) at offset 0x30
 * of actor->0x54. Returns zero; the field's semantic unit is unconfirmed.
 */
s32 func_02014314(GamePhaseActorScriptVm *self)
{
    u32 value = func_02012704(&self->base);
    u8 *object = *(u8 **)((u8 *)self->actor_84 + 0x54);
    *(u16 *)(object + 0x30) = (u16)(0x10000 - (value << 8));
    return 0;
}

/*
 * Pop second then first dimensions, clamp each to 0x20..0x200, pass their
 * values shifted left four to func_02033f20, and store the unshifted values at
 * actor->0x54 offsets 0x32 and 0x34. Returns zero.
 */
s32 func_0201433c(GamePhaseActorScriptVm *self)
{
    s32 second = (s32)func_02012704(&self->base);
    s32 first = (s32)func_02012704(&self->base);
    u8 *object = *(u8 **)((u8 *)self->actor_84 + 0x54);
    if (first < 0x20)
        first = 0x20;
    else if (first > 0x200)
        first = 0x200;
    if (second < 0x20)
        second = 0x20;
    else if (second > 0x200)
        second = 0x200;
    func_02033f20(self->actor_84, first << 4, second << 4);
    *(u16 *)(object + 0x32) = (u16)first;
    *(u16 *)(object + 0x34) = (u16)second;
    return 0;
}
