#include "tingle/animation_binding.h"

/*
 * SDK animation binding and handle owner. The object embeds a three-pointer
 * resource-binding state, retains the external owner used to create a manager
 * handle, marks that handle active, and releases both pieces in reverse order.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void *data_020f4e18;
extern void func_02071ea4(void *state);
extern void func_02071ee0(void *state, void *manager, void *resource0,
                          void *resource1, void *resource2);
extern void func_02071eb8(void *state);
extern AnimationBindingHandle *GraphicsSpriteGroup_CreateStateFromSource(void *owner, void *state,
                                             u8 variant);
extern void GraphicsSpriteGroup_ReleaseState(void *owner, AnimationBindingHandle *handle);

#ifdef __cplusplus
}
#endif

/*
 * Initialize the embedded SDK state, retain owner, bind the three caller
 * resources through the global manager, and request a handle using variant.
 * Bit 2 is set in the returned handle's flags, and self is returned. The SDK
 * helpers perform all manager-visible allocation and registration effects.
 */
AnimationBinding *AnimationBinding_Init(AnimationBinding *self, void *owner,
                                void *resource0, void *resource1,
                                void *resource2, u8 variant)
{
    func_02071ea4(&self->resources[0]);
    self->owner = owner;
    func_02071ee0(&self->resources[0], data_020f4e18, resource0, resource1,
                  resource2);
    self->handle = GraphicsSpriteGroup_CreateStateFromSource(self->owner, &self->resources[0], variant);
    self->handle->flags24 |= 4;
    return self;
}

/*
 * Release the manager handle using the retained owner, destroy the embedded
 * SDK binding state, and return self. Object storage itself is not freed.
 */
AnimationBinding *AnimationBinding_Destroy(AnimationBinding *self)
{
    GraphicsSpriteGroup_ReleaseState(self->owner, self->handle);
    func_02071eb8(&self->resources[0]);
    return self;
}
