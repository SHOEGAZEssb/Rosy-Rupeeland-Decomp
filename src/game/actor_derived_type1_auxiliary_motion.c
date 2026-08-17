#include "tingle/heap.h"
#include "tingle/types.h"

/* Synchronize a type-1 actor's auxiliary resource mode and directional motion. */
extern void *gLupyContext;
extern void *gGameWork;
extern u8 gSystemState[];
extern s32 data_020df254[];
extern s32 data_020df258[];
extern void *data_021e9abc;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 AuxiliaryInteraction_RunSelectedSequence(void *resource);
extern s32 GamePhaseCurrencyHud_GetCurrency(void *context);
extern void AuxiliaryInteraction_Destroy(void *resource);
extern void GameWork_ClearFlag(void *work, u32 flag);
extern s32 AuxiliaryInteraction_IsCoreHidden(void *resource);
extern s32 Actor_IsAtCachedTerrainHeight(void *actor);
extern s32 func_020adae4(s32 numerator, s32 denominator);
extern void SoundPhaseManager_StopSequence(void *manager);
#ifdef __cplusplus
}
#endif

/* Decode the confirmed directional input bits into the engine's eight-way index. */
static s32 inputDirection(u16 input)
{
    if ((input & 0x20) != 0) {
        if ((input & 0x40) != 0) return 3;
        return (input & 0x80) != 0 ? 1 : 2;
    }
    if ((input & 0x10) != 0) {
        if ((input & 0x40) != 0) return 5;
        return (input & 0x80) != 0 ? 7 : 6;
    }
    return (input & 0x40) != 0 ? 4 : 0;
}

/* Read the direction-indexed word whose table entries have an eight-byte stride. */
static s32 directionWord(const s32 *table, s32 direction)
{
    return *(const s32 *)((const u8 *)table + direction * 8);
}

/*
 * Set actor movement bits 1/2, query resource +0x26c with AuxiliaryInteraction_RunSelectedSequence, and
 * expose nonzero modes through actor +0x10 mask 0x0a0000 and virtual setter
 * +0x54. Mode 2 optionally clears that mask, destroys/frees the resource,
 * nulls +0x26c, clears GameWork flag 0x3ee, and advances the retail phase-sound
 * manager.
 * Mode zero continues only when actor/resource/height gates pass; cooldown
 * +0x268 then suppresses movement, otherwise system input selects an eight-way
 * table vector scaled by 0x60/0x80. Returns no value. Resource destruction,
 * heap release, GameWork access, sound transition, and virtual calls have
 * observable engine/SDK effects.
 */
void ActorDerivedType1_UpdateAuxiliaryResourceMotion(void *self)
{
    u8 *actor = (u8 *)self;
    void *resource;
    s32 mode;
    u32 flags;

    *(u32 *)(actor + 0x230) = (*(u32 *)(actor + 0x230) & ~1) | 2;
    resource = *(void **)(actor + 0x26c);
    mode = AuxiliaryInteraction_RunSelectedSequence(resource);
    flags = *(u32 *)(actor + 0x10);
    if (mode != 0) {
        *(u32 *)(actor + 0x10) = flags | 0x0a0000;
        (*(void (**)(void *, s32))(*(u8 **)actor + 0x54))(actor, 1);
    } else {
        *(u32 *)(actor + 0x10) = flags & ~0x1f0000;
        (*(void (**)(void *, s32))(*(u8 **)actor + 0x54))(actor, 0);
    }

    if (mode == 2) {
        if (GamePhaseCurrencyHud_GetCurrency(gLupyContext) > 0)
            *(u32 *)(actor + 0x10) &= ~0x1f0000;
        resource = *(void **)(actor + 0x26c);
        if (resource != 0) {
            AuxiliaryInteraction_Destroy(resource);
            Heap_Free(resource);
        }
        *(void **)(actor + 0x26c) = 0;
        GameWork_ClearFlag(gGameWork, 0x3ee);
        /* Fight-cloud release advances the retail phase-sound manager. */
        SoundPhaseManager_StopSequence(data_021e9abc);
    }
    if (mode != 0 || (*(u32 *)(actor + 0xd0) & 0x100) != 0 ||
        AuxiliaryInteraction_IsCoreHidden(*(void **)(actor + 0x26c)) != 0 ||
        Actor_IsAtCachedTerrainHeight(actor) == 0)
        return;

    if (*(s16 *)(actor + 0x268) > 0) {
        if ((*(u32 *)(actor + 0x230) & 0x40000) == 0)
            --*(s16 *)(actor + 0x268);
        *(s32 *)(actor + 0x3c) = 0;
        *(s32 *)(actor + 0x40) = 0;
        return;
    }

    {
        u16 input = *(u16 *)(gSystemState + 0x1a);
        if ((input & 0xf0) != 0) {
            s32 direction = inputDirection(input);
            *(s32 *)(actor + 0x3c) =
                func_020adae4(directionWord(data_020df254, direction) * 0x60,
                              0x80);
            *(s32 *)(actor + 0x40) =
                func_020adae4(directionWord(data_020df258, direction) * 0x60,
                              0x80);
        } else {
            *(s32 *)(actor + 0x3c) = 0;
            *(s32 *)(actor + 0x40) = 0;
        }
    }
}
