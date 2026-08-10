#include "tingle/game_phase_runtime.h"

/* Orientation mapping, scene notification, and scaled area-value helpers. */

extern u8 data_020d430c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void OS_Halt(void);
extern void GamePhaseMetadata_WriteAdjustedCoordinates(void *destination, u32 areaValue);
#ifdef __cplusplus
}
#endif

/*
 * Map active-area orientation bits 18..19 to placement variants: zero maps to
 * two, one/two map to zero, and three maps to one. Invalid values halt. This
 * function changes no state and returns the mapped variant.
 */
s32 GamePhaseRuntime_GetActiveAreaPlacementVariant(GamePhaseRuntime *self)
{
    u8 *b = (u8 *)self;
    s32 result;
    u32 orientation = (*(u32 *)(*(u8 **)(b + 0x30bc) + 0x40) << 12) >> 30;
    switch (orientation) {
    case 0: result = 2; break;
    case 3: result = 1; break;
    case 1:
    case 2: result = 0; break;
    default: OS_Halt(); break;
    }
    return result;
}

/* Invoke virtual slot four of the object at runtime offset 0x30e8. */
void GamePhaseRuntime_UpdateDualScreenUiPresentation(GamePhaseRuntime *self)
{
    void *object = *(void **)((u8 *)self + 0x30e8);
    (*(void (***)(void *))object)[4](object);
}

/*
 * Initialize a 12-byte area-derived value with recovered vtable data, ask
 * GamePhaseMetadata_WriteAdjustedCoordinates to populate fields 4/8 from area offset zero, then scale those
 * fields by 480 and 352. self is unused; destination is mutated; returns no
 * meaningful value.
 */
void GamePhaseRuntime_InitScaledAreaCoordinates(void *destination, GamePhaseRuntime *self, const void *area)
{
    u8 *out = (u8 *)destination;
    (void)self;
    *(void **)out = data_020d430c;
    *(s32 *)(out + 4) = 0;
    *(s32 *)(out + 8) = 0;
    GamePhaseMetadata_WriteAdjustedCoordinates(out, *(u32 *)area);
    *(s32 *)(out + 4) *= 480;
    *(s32 *)(out + 8) *= 352;
}
