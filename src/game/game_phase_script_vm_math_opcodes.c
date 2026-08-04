#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/* Implement script opcodes for angle-table queries and actor-vector reads. */

#ifdef __cplusplus
extern "C" {
#endif
extern const s16 data_020c9670[];
extern s32 func_020ae024(fx32 first, fx32 second);
#ifdef __cplusplus
}
#endif

/*
 * Pop an eight-bit angle, use its upper-resolution index to read the first
 * signed component of the interleaved table at data_020c9670, push that
 * component, and return zero. The table's precise SDK identity is unconfirmed.
 */
s32 func_02012d18(GamePhaseActorScriptVm *self)
{
    u32 angle = func_02012704(&self->base);
    s32 index = (s16)((angle & 0xff) << 8) >> 4;
    func_020127f8(&self->base, data_020c9670[index * 2]);
    return 0;
}

/*
 * Pop an eight-bit angle, read the second signed component of the same
 * interleaved lookup-table entry, push it, and return zero.
 */
s32 func_02012d50(GamePhaseActorScriptVm *self)
{
    u32 angle = func_02012704(&self->base);
    s32 index = (s16)((angle & 0xff) << 8) >> 4;
    func_020127f8(&self->base, data_020c9670[index * 2 + 1]);
    return 0;
}

/*
 * Pop two integer components, convert both to fx32, pass them to the
 * address-derived fixed-point angle helper, reduce its signed 16-bit result
 * by 256 with truncation toward zero, push the result, and return zero.
 */
s32 func_02012d90(GamePhaseActorScriptVm *self)
{
    fx32 second = (s32)func_02012704(&self->base) << 12;
    fx32 first = (s32)func_02012704(&self->base) << 12;
    s32 angle = (s16)func_020ae024(first, second);
    func_020127f8(&self->base, (angle + ((u32)angle >> 24)) >> 8);
    return 0;
}

/* Copy the actor's vector object at offset 0x18, push integer x, and return zero. */
s32 func_02012dd8(GamePhaseActorScriptVm *self)
{
    VecFx32Object value;
    func_02005030(&value, (VecFx32Object *)((u8 *)self->actor_84 + 0x18));
    func_020127f8(&self->base, value.value.x >> 12);
    func_02005058(&value);
    return 0;
}

/* Copy the actor's vector object at offset 0x18, push integer y, and return zero. */
s32 func_02012e18(GamePhaseActorScriptVm *self)
{
    VecFx32Object value;
    func_02005030(&value, (VecFx32Object *)((u8 *)self->actor_84 + 0x18));
    func_020127f8(&self->base, value.value.y >> 12);
    func_02005058(&value);
    return 0;
}

/* Copy the actor's vector object at offset 0x18, push integer z, and return zero. */
s32 func_02012e58(GamePhaseActorScriptVm *self)
{
    VecFx32Object value;
    func_02005030(&value, (VecFx32Object *)((u8 *)self->actor_84 + 0x18));
    func_020127f8(&self->base, value.value.z >> 12);
    func_02005058(&value);
    return 0;
}
