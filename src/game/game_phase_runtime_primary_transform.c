#include "tingle/game_phase_runtime.h"

/* Build the primary actor transform from runtime offsets and current position. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02009d78(void *object);
extern void func_02008378(void *destination, const void *left,
                          const void *right);
extern void func_02005058(void *value);
extern void func_0200500c(void *destination, s32 x, s32 y, s32 z);
#ifdef __cplusplus
}
#endif

/*
 * Build a temporary vector from runtime fields 0x3018/0x301c, add it to the
 * current position of object 0x2fbc, store the resulting value at destination,
 * and destroy the temporary. Returns no value.
 */
void func_020086f8(void *destination, GamePhaseRuntime *self)
{
    u8 offset[16];
    u8 *b = (u8 *)self;
    func_02008740(offset, b + 0x3000);
    func_02008378(destination, func_02009d78(b + 0x2fbc), offset);
    func_02005058(offset);
}

/*
 * Construct a three-component vector from signed runtime fields 0x18 and
 * 0x1c, with a zero third component. The destination is mutated; returns no
 * value and tail-calls the recovered vector constructor.
 */
void func_02008740(void *destination, const void *runtimeFields)
{
    const u8 *b = (const u8 *)runtimeFields;
    func_0200500c(destination, *(s32 *)(b + 0x18), *(s32 *)(b + 0x1c), 0);
}
