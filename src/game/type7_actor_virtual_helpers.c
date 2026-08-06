#include "tingle/types.h"

/*
 * Recovered type-seven actor virtual helpers and scene predicate. They expose
 * fixed return values and forward an enable state to the embedded controller.
 */

extern void *gSceneManager;

#ifdef __cplusplus
extern "C" {
#endif
extern void *SceneManager_GetCurrent(void *manager);
extern void func_02035518(void *state, s32 enabled);
#ifdef __cplusplus
}
#endif

/*
 * No inputs. Query the current scene and return one when its word +0x04 is
 * scene ID 1 or 0x16, otherwise zero. Scene-manager state is read through its
 * SDK-facing helper; no state or hardware is changed directly.
 */
s32 func_0204c74c(void)
{
    u8 *scene = (u8 *)SceneManager_GetCurrent(gSceneManager);
    s32 sceneId = *(s32 *)(scene + 4);
    return sceneId == 1 || sceneId == 0x16;
}

/*
 * Recovered constant virtual callback. Any register arguments are ignored;
 * return zero without changing state or invoking SDK/hardware operations.
 */
s32 func_0204c778(void)
{
    return 0;
}

/*
 * Inputs are a type-seven actor and an enable value. Forward the value to
 * func_02035518 for embedded controller +0x2a8. The controller may change;
 * no value is returned and there are no direct hardware effects.
 */
void func_0204c780(void *self, s32 enabled)
{
    func_02035518((u8 *)self + 0x2a8, enabled);
}

/*
 * Recovered constant virtual callback. Any register arguments are ignored;
 * return mask 0x80000 without changing state or touching SDK/hardware state.
 */
u32 func_0204c790(void)
{
    return 0x80000;
}
