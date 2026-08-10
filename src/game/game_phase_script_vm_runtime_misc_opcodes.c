#include "tingle/game_phase_script_vm.h"
#include "tingle/game_work.h"

/* Implement runtime-wide actor-script opcodes for a synchronized flag, no-ops, an actor object call, and a height query. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void *func_02007f0c(void *runtime, s32 index);
extern void func_0204cc30(void *object);
extern s32 Actor_GetCachedTerrainHeight(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Pop a boolean. Set or clear GameWork flag 1004 and mirror it into bit 2 of
 * runtime collection 1's actor-at-0x2e7c word at 0x230. Returns zero.
 */
s32 func_02016814(GamePhaseActorScriptVm *self)
{
    s32 enabled = (s32)func_02012704(&self->base);
    u8 *collection;
    u8 *actor;
    if (enabled != 0)
        GameWork_SetFlag(gGameWork, 1004);
    else
        GameWork_ClearFlag(gGameWork, 1004);
    collection = (u8 *)func_02007f0c(data_021052fc, 1);
    actor = *(u8 **)(collection + 0x2e7c);
    if (enabled != 0)
        *(u32 *)(actor + 0x230) |= 4;
    else
        *(u32 *)(actor + 0x230) &= ~4u;
    return 0;
}

/* Confirmed no-op opcode; ignore the VM and return zero. */
s32 func_02016898(GamePhaseActorScriptVm *self)
{
    (void)self;
    return 0;
}

/* Second confirmed no-op opcode; ignore the VM and return zero. */
s32 func_020168a0(GamePhaseActorScriptVm *self)
{
    (void)self;
    return 0;
}

/* Pass runtime actor 0x2ea4's object at offset 0x270 to func_0204cc30 and return zero. */
s32 func_020168a8(GamePhaseActorScriptVm *self)
{
    u8 *runtime = (u8 *)data_021052fc;
    u8 *actor = *(u8 **)(runtime + 0x2ea4);
    (void)self;
    func_0204cc30(*(void **)(actor + 0x270));
    return 0;
}

/*
 * Push one when runtime actor 0x2ea4 has bit 4 set at 0xd0 or its fx32 Y at
 * 0x24 is greater than Actor_GetCachedTerrainHeight(actor); otherwise push zero. Return zero.
 */
s32 func_020168d0(GamePhaseActorScriptVm *self)
{
    u8 *actor = *(u8 **)((u8 *)data_021052fc + 0x2ea4);
    s32 result = (*(u32 *)(actor + 0xd0) & 0x10) != 0;
    if (!result)
        result = (*(s32 *)(actor + 0x24) >> 12) >
                 (Actor_GetCachedTerrainHeight(actor) >> 12);
    func_020127f8(&self->base, result);
    return 0;
}
