/* Metrowerks two-word member-function dispatch for common scene input. */
#include "tingle/types.h"

typedef s32 (*SceneCallback)(void *scene);

typedef struct SceneMemberCallback {
    volatile u32 function;
    s32 adjustment;
} SceneMemberCallback;

typedef struct SceneCallbackPrefix {
    void *vtable;
    u8 reserved04[0x20];
    SceneMemberCallback callback;
} SceneCallbackPrefix;

/* Invoke a direct or virtual member callback, including its this adjustment. */
s32 Scene_InvokeInputCallback(SceneCallbackPrefix *scene)
{
    u8 *adjusted;
    SceneCallback callback;

    if (scene->callback.function != 0) {
        adjusted = (u8 *)scene + (scene->callback.adjustment >> 1);
        if (scene->callback.adjustment & 1) {
            u8 *vtable = *(u8 **)adjusted;
            callback = *(SceneCallback *)(vtable + scene->callback.function);
        } else {
            callback = (SceneCallback)scene->callback.function;
        }
        return callback(adjusted);
    }
    return 0;
}
