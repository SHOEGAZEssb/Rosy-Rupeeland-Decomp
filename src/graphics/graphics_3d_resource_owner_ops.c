#include "tingle/graphics_3d_resource_owner.h"

/*
 * Small owner-wide resource preparation and manager rendering dispatches for
 * the 3D animation subsystem. They compose previously recovered ownership and
 * rendering primitives without directly accessing graphics registers.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void func_020703d8(void *resource);

#ifdef __cplusplus
}
#endif

/*
 * Acquire the texture and palette resources in params fields 0/4, then invoke
 * the texture resource's preparation helper. Acquired descriptors are not
 * returned or released here, so the caller owns the resulting references.
 * Retail assumes both resources are valid and acquisition succeeds.
 */
void func_020779ac(Graphics3DResourceOwner *owner,
                   const GraphicsAnimationCreateParams *params)
{
    func_02077870(owner, (void *)params->field_00);
    func_02077918(owner, (void *)params->field_04);
    func_020703d8((void *)params->field_00);
}

/*
 * Render every manager from head to tail through func_020773e4 using the same
 * renderContext. The next manager is loaded after each callback, so mutation
 * of the owner list during rendering is outside the confirmed safe contract.
 */
void func_020779d8(Graphics3DResourceOwner *owner, void *renderContext)
{
    GraphicsAnimationInstanceManager *manager;

    for (manager = owner->managerHead; manager != 0; manager = manager->next) {
        func_020773e4(manager, renderContext);
    }
}
