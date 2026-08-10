#include "tingle/types.h"

/* Apply one of five actor resource variants and rebuild runtime resource 0xec. */
extern void *gGameWork;
extern u8 gActorRuntimeCollection[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_SavePrimaryAttachmentState(void *);
extern void ActorRuntimeCollection_AttachObject(void *, void *);
extern void *Actor_GetCollection(void *);
extern void GamePhaseActorScriptVm_InitWithScript(void *, void *, void *, void *);
extern void GamePhaseActorScriptVm_Assign(void *, const void *);
extern void GamePhaseActorScriptVm_Destroy(void *);
extern void GamePhaseActorScriptVm_Activate(void *);
#ifdef __cplusplus
}
#endif

/*
 * Store variant in byte 0xe8. If actor flag 0x40 is set, first snapshot the
 * attachment through Actor_SavePrimaryAttachmentState. A nonzero variant sets
 * actor flag 0x100 and notifies gActorRuntimeCollection. Construct a temporary resource from actor pointer
 * 0x180+variant*4 and GameWork offset 0x3cc when collection mode 0x2e84 is one,
 * otherwise offset 0x5cc. Assign it to actor resource 0xec, destroy the
 * temporary, then activate the new state at 0xec. Returns no value; called
 * resource helpers may allocate or update SDK-managed presentation state.
 */
void Actor_SetResourceVariant(void *self, s32 variant)
{
    u8 *actor = (u8 *)self;
    u8 temporary[0x94];
    void *collection;
    void *gameData;

    actor[0xe8] = (u8)variant;
    if (*(u32 *)(actor + 0x10) & 0x40)
        Actor_SavePrimaryAttachmentState(actor);
    if (variant) {
        *(u32 *)(actor + 0x10) |= 0x100;
        ActorRuntimeCollection_AttachObject(gActorRuntimeCollection, actor);
    }
    collection = Actor_GetCollection(actor);
    gameData = (u8 *)gGameWork +
               (*(s32 *)((u8 *)collection + 0x2e84) == 1 ? 0x3cc : 0x5cc);
    GamePhaseActorScriptVm_InitWithScript(temporary, actor,
                  *(void **)(actor + 0x180 + variant * 4), gameData);
    GamePhaseActorScriptVm_Assign(actor + 0xec, temporary);
    GamePhaseActorScriptVm_Destroy(temporary);
    GamePhaseActorScriptVm_Activate(actor + 0xec);
}
