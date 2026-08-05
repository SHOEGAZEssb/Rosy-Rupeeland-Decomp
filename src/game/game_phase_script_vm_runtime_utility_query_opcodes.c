#include "tingle/game_phase_script_vm.h"

/*
 * Implement adjacent runtime utility and query opcodes: global subsystem
 * calls, a normalized-distance test, and accessors for two GameWork counters.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021e9e00;
extern void *data_021e9ac0;
extern void *data_02105300;
extern void *gRuntimeContext;
extern void *gGameWork;
extern void func_0206f914(void *state, u16 value);
extern void func_02065270(void *state);
extern void func_02010520(void *state, s32 value);
extern s32 func_0207f80c(void *context, s32 zero0, s32 zero1, s32 enabled);
extern s32 func_020befec(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

/* Pop a u16 value, pass it to the recovered global subsystem, and return zero. */
s32 func_02019104(GamePhaseActorScriptVm *self)
{
    u16 value = (u16)func_02012704(&self->base);
    func_0206f914(&data_021e9e00, value);
    return 0;
}

/*
 * Pop a u16 count and invoke the recovered operation on global state offset
 * 0x34 exactly count times.  A zero count has no effect.  Return zero.
 */
s32 func_02019128(GamePhaseActorScriptVm *self)
{
    u16 count = (u16)func_02012704(&self->base);
    u16 index;
    for (index = 0; index < count; index++)
        func_02065270((u8 *)data_021e9ac0 + 0x34);
    return 0;
}

/* Pop a value, apply it to recovered global state offset 0x08, and return zero. */
s32 func_02019164(GamePhaseActorScriptVm *self)
{
    s32 value = (s32)func_02012704(&self->base);
    func_02010520(*(void **)((u8 *)data_02105300 + 8), value);
    return 0;
}

/* Query the runtime context with fixed arguments (0, 0, 1), push, and return zero. */
s32 func_0201918c(GamePhaseActorScriptVm *self)
{
    func_020127f8(&self->base, (u32)func_0207f80c(gRuntimeContext, 0, 0, 1));
    return 0;
}

/* Convert an fx32 value squared back to fx32 using retail rounding. */
static s32 squareFx32(s32 value)
{
    return (s32)(((s64)value * value + 0x800) >> 12);
}

/*
 * Pop vertical radius, horizontal radius, first Y/X, and second Y/X.  Push one
 * when the points coincide or when the sum of the two normalized squared-axis
 * distances is below 1.0 fx32; otherwise push zero.  The recovered division
 * routine supplies each normalized term.  Return zero.
 */
s32 func_020191c4(GamePhaseActorScriptVm *self)
{
    s32 verticalRadius = (s32)func_02012704(&self->base);
    s32 horizontalRadius = (s32)func_02012704(&self->base);
    s32 firstY = (s32)func_02012704(&self->base);
    s32 firstX = (s32)func_02012704(&self->base);
    s32 secondY = (s32)func_02012704(&self->base);
    s32 secondX = (s32)func_02012704(&self->base);
    s32 dx = (secondX - firstX) << 12;
    s32 dy = (secondY - firstY) << 12;
    s32 inside = 0;
    if (dx == 0 && dy == 0) {
        inside = 1;
    } else if (func_020befec(squareFx32(dx), horizontalRadius * horizontalRadius)
             + func_020befec(squareFx32(dy), verticalRadius * verticalRadius)
             < 0x1000) {
        inside = 1;
    }
    func_020127f8(&self->base, (u32)inside);
    return 0;
}

/* Push the confirmed GameWork word at offset 0x44 and return zero. */
s32 func_02019288(GamePhaseActorScriptVm *self)
{
    func_020127f8(&self->base, *(u32 *)((u8 *)gGameWork + 0x44));
    return 0;
}

/* Push the negated GameWork word at offset 0x48 and return zero. */
s32 func_020192a8(GamePhaseActorScriptVm *self)
{
    func_020127f8(&self->base, (u32)-*(s32 *)((u8 *)gGameWork + 0x48));
    return 0;
}

/* Clear the GameWork words at offsets 0x44 and 0x48 and return zero. */
s32 func_020192cc(GamePhaseActorScriptVm *self)
{
    (void)self;
    *(u32 *)((u8 *)gGameWork + 0x44) = 0;
    *(u32 *)((u8 *)gGameWork + 0x48) = 0;
    return 0;
}

/* Return zero without consuming operands or changing state. */
s32 func_020192ec(GamePhaseActorScriptVm *self)
{
    (void)self;
    return 0;
}
