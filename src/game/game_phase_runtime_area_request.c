#include "tingle/game_phase_runtime.h"

/* Area-request staging and primary/secondary actor selection helpers. */

extern void *gSoundContext;
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void SoundContext_RequestPhaseTransition(void *soundContext, s32 unused);
extern void *GamePhaseMetadata_GetByIndex(s32 areaId);
#ifdef __cplusplus
}
#endif

/* Empty recovered callback; it accepts no documented input and changes no state. */
void GamePhaseRuntime_NoOpAreaRequestHook(void)
{
}

/*
 * Return the primary actor at runtime offset 0x28 when index is one; otherwise
 * return the embedded actor at offset 8 of the optional object at 0x2fb8.
 * This accessor changes no state and assumes the optional object is present.
 */
void *GamePhaseRuntime_GetActorCollection(GamePhaseRuntime *self, s32 index)
{
    u8 *b = (u8 *)self;
    if (index == 1)
        return b + 0x28;
    return (u8 *)*(void **)(b + 0x2fb8) + 8;
}

/*
 * Stage an area request at offsets 0x30d0..0x30e4. areaNumber is one-based;
 * the three values and mode are retained for the transition constructor.
 * The current gameplay coordinates are copied into gGameWork after converting
 * 20.12 fixed point to integers, and fixed control halfwords are installed.
 * The sound context is reset first. Returns no value.
 */
void GamePhaseRuntime_StageAreaRequest(GamePhaseRuntime *self, s32 areaNumber,
                   s32 value0, s32 value1, s32 value2, s32 mode)
{
    u8 *b = (u8 *)self;
    SoundContext_RequestPhaseTransition(gSoundContext, 0);
    *(void **)(b + 0x30d0) = GamePhaseMetadata_GetByIndex(areaNumber - 1);
    *(s32 *)(b + 0x30d4) = value0;
    *(s32 *)(b + 0x30d8) = value1;
    *(s32 *)(b + 0x30dc) = value2;
    *(s32 *)(b + 0x30e0) = 0;
    *(s32 *)(b + 0x30e4) = mode;

    *(u16 *)((u8 *)gGameWork + 0x236) =
        (u16)(*(s32 *)((u8 *)*(void **)(b + 0x2ea4) + 0x1c) >> 12);
    *(u16 *)((u8 *)gGameWork + 0x238) =
        (u16)(*(s32 *)((u8 *)*(void **)(b + 0x2ea4) + 0x20) >> 12);
    *(u16 *)((u8 *)gGameWork + 0x200) = 0x20;
    *(u16 *)((u8 *)gGameWork + 0x1f6) = 0x186;
    *(u16 *)((u8 *)gGameWork + 0x1f4) = 0x2ad;
}
