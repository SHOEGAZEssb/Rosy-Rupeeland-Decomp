/* Install the two-word Metrowerks member callback used by scene input bases. */
#include "tingle/types.h"

typedef struct MemberFunctionPointer {
    u32 function;
    s32 adjustment;
} MemberFunctionPointer;

typedef struct SceneCallbackPrefix {
    void *vtable;
    u32 field04;
    u32 field08;
    u8 reserved0c[0x18];
    MemberFunctionPointer callback;
} SceneCallbackPrefix;

/* Store callback ownership in the scene and reset its two base state words. */
void func_0206841c(SceneCallbackPrefix *scene, MemberFunctionPointer callback)
{
    scene->callback = callback;
    scene->field04 = 0;
    scene->field08 = 0;
}
