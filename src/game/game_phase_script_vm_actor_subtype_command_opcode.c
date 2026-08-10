#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/*
 * Apply script-selected commands to indexed actor objects of recovered
 * subtypes 9 and 10.  The commands update subtype-specific dimensions,
 * transforms, visibility bits, direction bits, and animation state.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorCollection_FindActorByDescriptorValue(void *collection, s32 index);
extern void *Actor_GetCollection(void *actor);
extern void func_ov087_022184b0(void *object, s32 value);
extern void func_ov087_022186a8(void *object, const VecFx32Object *position,
                               s32 value);
extern void func_ov089_02218f28(void *object, s32 value);
extern void func_ov089_02219224(void *object, const VecFx32Object *position,
                               s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Replace the two recovered directional flag groups in flags with encodings
 * selected by the signs of horizontal and vertical.  Zero selects neither
 * bit in its group.  Return the updated flags without other state changes.
 */
static u16 updateDirectionFlags(u16 flags, s32 horizontal, s32 vertical)
{
    flags &= (u16)~0x60;
    if (horizontal < 0)
        flags |= 0x40;
    else if (horizontal > 0)
        flags |= 0x20;

    flags &= (u16)~0x18;
    if (vertical < 0)
        flags |= 0x08;
    else if (vertical > 0)
        flags |= 0x10;
    return flags;
}

/*
 * Pop action, Z, Y, X/value, command, and target-index operands, then select
 * the indexed object associated with the bound actor.  Subtype 9 accepts
 * commands 0..4 and subtype 10 accepts commands 0..3; their field layouts are
 * intentionally kept as confirmed offsets.  Vector components are converted
 * from integer script units to fx32.  Unsupported subtypes/commands do
 * nothing.  Return zero.
 */
s32 func_02018208(GamePhaseActorScriptVm *self)
{
    s32 action = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 z = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 y = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 x = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 command = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 targetIndex = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *object = (u8 *)ActorCollection_FindActorByDescriptorValue(Actor_GetCollection(self->actor),
                                     targetIndex);
    u16 subtype = *(u16 *)(object + 0x4e);

    if (subtype == 9) {
        switch (command) {
        case 0:
            *(s32 *)(object + 0x20c) = x * 41;
            *(s32 *)(object + 0x210) = y * 29;
            *(u16 *)(object + 0x218) = (u16)z;
            func_ov087_022184b0(object, action);
            break;
        case 1: {
            VecFx32Object position;
            func_0200500c(&position, x << 12, y << 12, z << 12);
            func_ov087_022186a8(object, &position, action);
            func_02005058(&position);
            break;
        }
        case 2:
            if (x == 0)
                *(u16 *)(object + 0x21a) &= (u16)~4;
            else if (x == 1)
                *(u16 *)(object + 0x21a) |= 4;
            break;
        case 3:
            *(u16 *)(object + 0x21a) = updateDirectionFlags(
                *(u16 *)(object + 0x21a), x, y);
            break;
        case 4:
            *(s32 *)(object + 0x228) = x;
            if (y != 0)
                *(u16 *)(object + 0x21a) |= 0x100;
            break;
        }
    } else if (subtype == 10) {
        switch (command) {
        case 0:
            *(s32 *)(object + 0x208) = y * 6;
            func_ov089_02218f28(object, action);
            break;
        case 1: {
            VecFx32Object position;
            func_0200500c(&position, x << 12, y << 12, z << 12);
            func_ov089_02219224(object, &position, action);
            func_02005058(&position);
            break;
        }
        case 2:
            if (x == 0)
                *(u16 *)(object + 0x20c) &= (u16)~4;
            else if (x == 1)
                *(u16 *)(object + 0x20c) |= 4;
            break;
        case 3:
            *(u16 *)(object + 0x20c) = updateDirectionFlags(
                *(u16 *)(object + 0x20c), x, y);
            break;
        }
    }
    return 0;
}
