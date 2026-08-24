#include "tingle/types.h"

/*
 * Scan the runtime actor collection and trigger a visual response on eligible
 * type-two actors whose descriptor threshold is reached.
 */
extern u8 *gGamePhaseRuntime;
extern u8 data_020e8380[];
extern u8 data_020df9e8[];
extern u8 data_020dfa20[];

#ifdef __cplusplus
extern "C" {
#endif
extern void **GamePhaseRuntime_GetActorCollection(void *runtime, s32 collection);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(void *manager);
extern void Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt(void *effect, s32 kind, s32 x, s32 y, s32 variant);
#ifdef __cplusplus
}
#endif

/*
 * Iterate collection one from GamePhaseRuntime_GetActorCollection. Candidates must have type byte
 * +0x4d equal two, actor +0x10 bit four set, bit 0x01000000 clear, and input
 * threshold at least descriptor[index +0x4e].halfword(+0x2e) shifted down 12.
 * Skip the recovered special pair when +0x218 equals data_020df9e8+0x38 and
 * either +0x21c equals data_020dfa20+0x04 or +0x218 is zero. For each remaining
 * candidate, clear +0x1fc, require virtual +0xa8 to return zero, invoke virtual
 * +0x104, and emit effect kind one at X and Y-minus-Z (all shifted down 12)
 * with variant three. Returns no value; actor virtual calls and effect-manager
 * state change. The exact meanings of the two compared global words remain
 * unconfirmed.
 */
void ActorCollection_DispatchType2ThresholdEffects(s32 threshold)
{
    s32 index;

    for (index = 0;; ++index) {
        void **actors = GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1);
        u8 *actor;
        u16 descriptorIndex;
        s32 descriptorThreshold;
        s32 excluded;

        if (index >= *(s32 *)((u8 *)actors + 0x2e74))
            break;
        actor = (u8 *)actors[index];
        if (actor == 0 || actor[0x4d] != 2)
            continue;
        if ((*(u32 *)(actor + 0x10) & 4) == 0 ||
            (*(u32 *)(actor + 0x10) & 0x01000000) != 0)
            continue;

        descriptorIndex = *(u16 *)(actor + 0x4e);
        descriptorThreshold =
            *(s16 *)(data_020e8380 + descriptorIndex * 0x30 + 0x2e) >> 12;
        if (threshold < descriptorThreshold)
            continue;

        excluded = 0;
        if (*(u32 *)(actor + 0x218) == *(u32 *)(data_020df9e8 + 0x38) &&
            (*(u32 *)(actor + 0x21c) == *(u32 *)(data_020dfa20 + 4) ||
             *(u32 *)(actor + 0x218) == 0)) {
            excluded = 1;
        }
        if (excluded)
            continue;

        *(u32 *)(actor + 0x1fc) = 0;
        if ((*(s32 (**)(void *))(*(u8 **)actor + 0xa8))(actor) != 0)
            continue;
        (*(void (**)(void *))(*(u8 **)actor + 0x104))(actor);
        {
            void *effect = RuntimePresentationManager_GetGraphics3dPresentation(gGamePhaseRuntime + 0x2f7c);
            Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt(effect, 1,
                          *(s32 *)(actor + 0x1c) >> 12,
                          (*(s32 *)(actor + 0x20) >> 12) -
                              (*(s32 *)(actor + 0x24) >> 12),
                          3);
        }
    }
}
