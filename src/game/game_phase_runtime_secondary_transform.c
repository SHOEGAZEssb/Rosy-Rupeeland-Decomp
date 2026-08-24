#include "tingle/game_phase_runtime.h"
#include "tingle/vec_fx32.h"

/*
 * Build the optional actor transform for four recovered placement modes.
 * The retail stack/value-object schedule is retained in matching assembly.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GamePhaseRuntime_GetActiveAreaPlacementVariant(GamePhaseRuntime *self);
extern void *ActorMotion_GetPosition(void *object);
extern void VecFx32Object_InitSum(void *destination, const void *left,
                          const void *right);
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
void GamePhaseRuntime_BuildSecondaryTransform(void *destination, GamePhaseRuntime *self)
{
    u8 *b = (u8 *)self;
    VecFx32Object runtimeOffset;
    VecFx32Object mode3Offset;
    VecFx32Object combined;
    VecFx32Object mode1Offset;
    VecFx32Object base;
    s32 variant;

    VecFx32Object_Init(&base);
    switch (*(u32 *)(b + 0x30fc)) {
    case 0:
        break;
    case 1:
        variant = GamePhaseRuntime_GetActiveAreaPlacementVariant(self);
        if (variant == 0) {
            VecFx32Object_InitComponents(&mode1Offset, -0x10000, -0x28000, 0);
            VecFx32Object_InitSum(&combined, ActorMotion_GetPosition(b + 0x3044), &mode1Offset);
            VecFx32Object_Assign(&base, &combined);
            VecFx32Object_Destroy(&combined);
            VecFx32Object_Destroy(&mode1Offset);
        } else if (variant == 1 || variant == 2) {
            VecFx32Object_Assign(&base, ActorMotion_GetPosition(b + 0x3044));
        } else {
            OS_Halt();
        }
        break;
    case 2:
        VecFx32Object_Assign(&base, ActorMotion_GetPosition(b + 0x3044));
        break;
    case 3:
        VecFx32Object_InitComponents(&mode3Offset, -0x10000, -0x30000, 0);
        VecFx32Object_Assign(&base, &mode3Offset);
        VecFx32Object_Destroy(&mode3Offset);
        break;
    default:
        OS_Halt();
        break;
    }
    ActorMotionState_BuildOscillationOffset(&runtimeOffset, b + 0x3088);
    VecFx32Object_InitSum(destination, &base, &runtimeOffset);
    VecFx32Object_Destroy(&runtimeOffset);
    VecFx32Object_Destroy(&base);
}
