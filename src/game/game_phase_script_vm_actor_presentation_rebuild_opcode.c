#include "tingle/game_phase_script_vm.h"

/* Implement the script opcode that rebuilds an actor presentation object while preserving its display fields. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0203bae4(void *actor, u16 first, u16 second, u16 third,
                           u16 fourth);
extern void func_02034be4(void *actor, u32 value);
extern void func_02033ae8(void *actor, u32 value);
#ifdef __cplusplus
}
#endif

/*
 * Pop a command and four u16 creation parameters, create a replacement
 * presentation object through func_0203bae4, apply the command to the actor,
 * copy the previous object's byte at 0x3a and signed halfwords at 0x30..0x36
 * into the replacement, request actor update value one, and return zero.
 */
s32 func_02015f50(GamePhaseActorScriptVm *self)
{
    u32 command = func_02012704(&self->base);
    u16 fourth = (u16)func_02012704(&self->base);
    u16 third = (u16)func_02012704(&self->base);
    u16 second = (u16)func_02012704(&self->base);
    u16 first = (u16)func_02012704(&self->base);
    u8 *actor = (u8 *)self->actor_84;
    u8 *oldObject = *(u8 **)(actor + 0x54);
    u8 byte3a = oldObject[0x3a];
    s16 value36 = *(s16 *)(oldObject + 0x36);
    s16 value32 = *(s16 *)(oldObject + 0x32);
    s16 value34 = *(s16 *)(oldObject + 0x34);
    s16 value30 = *(s16 *)(oldObject + 0x30);
    u8 *newObject = (u8 *)func_0203bae4(actor, first, second, third, fourth);

    func_02034be4(actor, command);
    newObject[0x3a] = byte3a;
    *(s16 *)(newObject + 0x36) = value36;
    *(s16 *)(newObject + 0x32) = value32;
    *(s16 *)(newObject + 0x34) = value34;
    *(s16 *)(newObject + 0x30) = value30;
    func_02033ae8(actor, 1);
    return 0;
}
