#include "tingle/game_phase_runtime.h"

/*
 * Build the optional actor transform for four recovered placement modes.
 * The retail stack/value-object schedule is retained in matching assembly.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02004fe0(void *value);
extern s32 GamePhaseRuntime_GetActiveAreaPlacementVariant(GamePhaseRuntime *self);
extern void func_0200500c(void *value, s32 x, s32 y, s32 z);
extern void *ActorMotion_GetPosition(void *object);
extern void func_02008378(void *destination, const void *left,
                          const void *right);
extern void func_020050a4(void *destination, const void *source);
extern void func_02005058(void *value);
extern void OS_Halt(void);
#ifdef __cplusplus
}
#endif

/*
 * Construct destination from runtime placement mode 0x30fc. Mode one selects
 * a variant-dependent area position and optional (-0x10000,-0x28000,0)
 * offset; mode two copies the area position; mode three uses
 * (-0x10000,-0x30000,0); mode zero keeps a zero base. Invalid modes/variants
 * halt. Finally add runtime offset fields 0x30a0/0x30a4. All temporary value
 * objects are explicitly destroyed; returns no value.
 */
void func_0200875c(void *destination, GamePhaseRuntime *self)
{
    u8 *b = (u8 *)self;
    u8 runtimeOffset[16];
    u8 mode3Offset[16];
    u8 combined[16];
    u8 mode1Offset[16];
    u8 base[16];
    s32 variant;

    func_02004fe0(base);
    switch (*(u32 *)(b + 0x30fc)) {
    case 0:
        break;
    case 1:
        variant = GamePhaseRuntime_GetActiveAreaPlacementVariant(self);
        if (variant == 0) {
            func_0200500c(mode1Offset, -0x10000, -0x28000, 0);
            func_02008378(combined, ActorMotion_GetPosition(b + 0x3044), mode1Offset);
            func_020050a4(base, combined);
            func_02005058(combined);
            func_02005058(mode1Offset);
        } else if (variant == 1 || variant == 2) {
            func_020050a4(base, ActorMotion_GetPosition(b + 0x3044));
        } else {
            OS_Halt();
        }
        break;
    case 2:
        func_020050a4(base, ActorMotion_GetPosition(b + 0x3044));
        break;
    case 3:
        func_0200500c(mode3Offset, -0x10000, -0x30000, 0);
        func_020050a4(base, mode3Offset);
        func_02005058(mode3Offset);
        break;
    default:
        OS_Halt();
        break;
    }
    func_02008740(runtimeOffset, b + 0x3088);
    func_02008378(destination, base, runtimeOffset);
    func_02005058(runtimeOffset);
    func_02005058(base);
}
