#include "tingle/actor_runtime_scene.h"

/* Update the collection-created gameplay scene and its shared world contexts. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void *gLupyContext;
extern void func_02007908(void *context, u32 value, s32 mode);
extern void func_02007a24(void *context, u32 value, s32 mode);
extern void func_02008148(void *context, s32 index);
extern void func_020083c8(void *context);
extern void func_0200866c(void *context);
extern void func_02008b50(void *context);
extern void func_02008ed0(void *context);
extern void func_02010e68(void *context);
extern void func_0201dcec(void *context, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Tick the shared game context, then branch on Scene value08. State 0 performs
 * a one-time sequence using Scene value04 and mode 3; state 1 invokes the
 * scene's deleting destructor and returns 1. Other states, and state 0 after
 * setup, update shared context offset 0x2f7c plus the root and Lupy contexts,
 * then return 0. Indirect helpers may affect gameplay/rendering; no hardware
 * registers are written directly.
 */
s32 func_0200b6c4(ActorRuntimeScene *self)
{
    u8 *root = (u8 *)data_021052fc;

    func_02008ed0(root);
    if (self->base.value08 == 0) {
        func_020083c8(root);
        func_02007908(root, self->base.value04, 3);
        func_0200866c(root);
        func_02008148(root, 0);
        func_02008148(root, 1);
        func_02007a24(root, self->base.value04, 3);
    } else if (self->base.value08 == 1) {
        if (self != 0)
            self->base.vtable->destroyAndFree(&self->base);
        return 1;
    }

    func_0201dcec(root + 0x2f7c, 1);
    func_02008b50(root);
    func_02010e68(gLupyContext);
    return 0;
}
