#include "tingle/types.h"

/*
 * Recovered extended type-two actor scene-specific interaction dispatch. It
 * conditionally notifies two global actors before running the base update.
 */
extern void *gSceneManager;
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *SceneManager_GetCurrent(void *manager);
extern s32 ActorSelection_Contains(void *primary, void *actor);
extern void ActorDerivedType1_TrySetStateVector(void *primary, const void *position, s32 value, s32 extra);
extern void func_02048378(void *secondary, void *actor);
extern s32 func_0203392c(void *actor, s32 context);
#ifdef __cplusplus
}
#endif

/*
 * In current scene type one, resolve global actors at data_021052fc+0x2ea4 and
 * +0x2ea8. Continue the special path only when actor +0x260 bit one is set,
 * actor virtual +0xa8 reports inactive, the secondary actor exists and has
 * +0x268 bit 0x10, and ActorSelection_Contains(primary,actor) accepts. Then send actor
 * transform +0x18 with value 20 and extra zero through ActorDerivedType1_TrySetStateVector and notify
 * the secondary through func_02048378. Always finish with func_0203392c(actor,
 * context) and return its result. Scene, global actor, and base-update state may
 * change; no direct hardware access occurs.
 */
s32 ActorExtendedType2_UpdateSceneInteraction(void *self, s32 context)
{
    u8 *actor = (u8 *)self;
    u8 *scene = (u8 *)SceneManager_GetCurrent(gSceneManager);
    if (*(u32 *)(scene + 4) == 1) {
        u8 *secondary = *(u8 **)(data_021052fc + 0x2ea8);
        if ((*(u32 *)(actor + 0x260) & 2) != 0 &&
            (*(s32 (**)(void *))(*(u8 **)actor + 0xa8))(actor) == 0 &&
            secondary != 0 && (*(u32 *)(secondary + 0x268) & 0x10) != 0) {
            void *primary = *(void **)(data_021052fc + 0x2ea4);
            if (ActorSelection_Contains(primary, actor) != 0) {
                ActorDerivedType1_TrySetStateVector(primary, actor + 0x18, 20, 0);
                func_02048378(secondary, actor);
            }
        }
    }
    return func_0203392c(actor, context);
}
