#include "tingle/game_phase_runtime.h"

/* Update the optional secondary actor's area-relative position. */

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitPlanarProjection(void *value, const void *position);
extern void GamePhaseAreaScene_UpdateRegionAtPosition(void *actor, void *areaState, s32 x, s32 y);
extern void VecFx32Object_Destroy(void *value);
#ifdef __cplusplus
}
#endif

/*
 * When the optional actor exists and active-area orientation bits equal two,
 * convert gameplay position 0x18 into a temporary value and pass its fields
 * 4/8 to the actor update. Otherwise pass zeros. The area-state argument is
 * runtime offset 0x2fa4. The temporary is explicitly destroyed. Returns no
 * value and preserves the recovered behavior of forwarding null actors.
 */
void func_0200866c(GamePhaseRuntime *self)
{
    u8 *b = (u8 *)self;
    u8 value[16];
    void *actor = *(void **)(b + 0x2fb8);

    if (actor != 0 &&
        ((*(u32 *)(*(u8 **)(b + 0x30bc) + 0x40) << 12) >> 30) == 2) {
        VecFx32Object_InitPlanarProjection(value, (u8 *)*(void **)(b + 0x2ea4) + 0x18);
        GamePhaseAreaScene_UpdateRegionAtPosition(*(void **)(b + 0x2fb8), b + 0x2fa4,
                      *(s32 *)(value + 4), *(s32 *)(value + 8));
        VecFx32Object_Destroy(value);
    } else {
        GamePhaseAreaScene_UpdateRegionAtPosition(actor, b + 0x2fa4, 0, 0);
    }
}
