#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/*
 * Control the active game-phase runtime entity and expose one bound-actor
 * state operation.  The large dispatcher retains offset-based entity fields
 * until their owning type and individual mode meanings are confirmed.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern const u8 data_020ea9b0[];
extern s32 data_020e1964;
extern void *Actor_GetAuxiliaryCollisionResource(void *actor);
extern void func_020573fc(void *state, s32 value);
extern void Type7Actor_SetMotionTargetWithTimer(void *entity, const VecFx32Object *position,
                          s32 angle);
extern void func_02047d40(void *entity);
extern void func_02048bcc(void *entity);
extern void func_02048c10(void *entity);
extern void func_0204a200(void *entity, s32 value);
extern void func_0204b078(void *entity, s32 value);
extern void func_0204b148(void *entity, s32 value);
extern void func_0204b6ec(void *entity, u16 value, s32 enabled);
extern void func_0204bf9c(s32 first, void *owner, s32 second, s32 third,
                          s32 fourth);
#ifdef __cplusplus
}
#endif

/*
 * Pop one value, resolve the bound actor's recovered state object, pass the
 * value to its external operation, and return zero.
 */
s32 func_02018c14(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)func_02012704(&self->base);
    func_020573fc(Actor_GetAuxiliaryCollisionResource(self->actor_84), value);
    return 0;
}

/*
 * Pop fourth, third, second, first, and command operands.  Dispatch commands
 * 0..15 against the active runtime entity at runtime offset 0x2ea8.  Commands
 * include creation, recovered state calls, an fx32 position update, flag and
 * field writes, a 36-entry table lookup whose result is pushed to the VM, and
 * global fallback-state clearing when no entity exists.  Missing entities and
 * unsupported commands do nothing unless the recovered case explicitly
 * updates the fallback state.  Return zero.
 */
s32 func_02018c3c(GamePhaseActorScriptVm *self)
{
    s32 fourth = (s32)func_02012704(&self->base);
    s32 third = (s32)func_02012704(&self->base);
    s32 second = (s32)func_02012704(&self->base);
    s32 first = (s32)func_02012704(&self->base);
    s32 command = (s32)func_02012704(&self->base);
    u8 *runtime = (u8 *)data_021052fc;
    u8 *entity = *(u8 **)(runtime + 0x2ea8);

    switch (command) {
    case 0:
        func_0204bf9c(first, **(void ***)(runtime + 0x30bc),
                      second, third, fourth);
        break;
    case 1:
        if (entity)
            func_02048bcc(entity);
        break;
    case 2:
        break;
    case 3:
        if (entity)
            func_0204a200(entity, first);
        break;
    case 4:
        if (entity)
            func_0204b6ec(entity, (u16)first, second != 0);
        break;
    case 5:
        if (entity) {
            VecFx32Object position;
            func_0200500c(&position, first << 12, second << 12, third << 12);
            Type7Actor_SetMotionTargetWithTimer(entity, &position, 0xb4);
            func_02005058(&position);
        }
        break;
    case 6:
        if (entity)
            func_0204b078(entity, first);
        break;
    case 7:
        if (entity)
            func_0204b148(entity, first);
        break;
    case 8:
        if (entity) {
            u32 *flags = (u32 *)(entity + 0x268);
            if (first)
                *flags &= ~0x4000;
            else
                *flags |= 0x4000;
        }
        break;
    case 9: {
        s32 index;
        func_020127f8(&self->base, (u32)-1);
        for (index = 0; index < 36; index++) {
            const u8 *record = data_020ea9b0 + index * 0x68;
            if (*(const s16 *)record == first) {
                func_020127f8(&self->base, (u32)*(const s16 *)(record + 0x2e));
                break;
            }
        }
        break;
    }
    case 10:
        if (!entity && data_020e1964 != -1)
            data_020e1964 = -1;
        break;
    case 11:
        if (!entity)
            data_020e1964 = -1;
        else
            func_02048c10(entity);
        break;
    case 12:
        if (entity)
            *(u16 *)(entity + 0x2a6) = (u16)first;
        break;
    case 13:
        if (entity) {
            if (first) {
                *(u32 *)(entity + 0x14) |= 0x400;
                *(u32 *)(entity + 0xd0) |= 4;
            } else {
                *(u32 *)(entity + 0x14) &= ~0x400;
                *(u32 *)(entity + 0xd0) &= ~4;
            }
        }
        break;
    case 14:
        if (entity)
            *(s32 *)(entity + 0x1fc) = first;
        break;
    case 15:
        if (entity && (*(u32 *)(entity + 0x268) & 0x10))
            func_02047d40(entity);
        break;
    }
    return 0;
}
