#include "tingle/animation_resource.h"
#include "tingle/heap.h"

/*
 * Three-part animation-resource wrapper identified by retail RTTI as
 * CkkAnmRes. It owns an embedded SDK resource-binding state, initializes or
 * rebinds that state through the shared animation-resource manager, and
 * supplies normal and deleting destructor variants.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void *data_020f4e18;
extern void func_02071e90(void *state);
extern void func_02071ee0(void *state, void *manager, void *resource0,
                          void *resource1, void *resource2);
extern void func_02071f38(void *state);
extern void func_02071ecc(void *state);

#ifdef __cplusplus
}
#endif

/*
 * Initialize the embedded 12-byte SDK state, install the class vtable, bind
 * three caller resources through the global manager at data_020f4e18, and
 * return self. The two SDK helpers perform all resource-manager side effects.
 */
AnimationResource *AnimationResource_Init(AnimationResource *self, void *resource0,
                                 void *resource1, void *resource2)
{
    func_02071e90(&self->entries[0]);
    self->vtable = &gAnimationResourceVTable;
    func_02071ee0(&self->entries[0], data_020f4e18, resource0, resource1,
                  resource2);
    return self;
}

/*
 * Restore the class vtable, release the embedded SDK bindings in the retail
 * two-step order, and return self. No object storage is freed here.
 */
AnimationResource *AnimationResource_Destroy(AnimationResource *self)
{
    self->vtable = &gAnimationResourceVTable;
    func_02071f38(&self->entries[0]);
    func_02071ecc(&self->entries[0]);
    return self;
}

/*
 * Release the embedded SDK bindings, free the wrapper through the game heap,
 * and return its former address for the deleting-destructor ABI.
 */
AnimationResource *AnimationResource_DestroyAndFree(AnimationResource *self)
{
    self->vtable = &gAnimationResourceVTable;
    func_02071f38(&self->entries[0]);
    func_02071ecc(&self->entries[0]);
    Heap_Free(self);
    return self;
}

/*
 * Rebind self from source. Each confirmed entry pointer contributes its
 * payload at offset 0x10; existing bindings are released first, then the three
 * payloads are registered through the global manager. No value is returned.
 */
void AnimationResource_RebindFrom(AnimationResource *self,
                   const AnimationResource *source)
{
    void *resource0 = source->entries[0]->payload10;
    void *resource1 = source->entries[1]->payload10;
    void *resource2 = source->entries[2]->payload10;

    func_02071f38(&self->entries[0]);
    func_02071ee0(&self->entries[0], data_020f4e18, resource0, resource1,
                  resource2);
}

/* Rebind from source unless assigning self, then return the destination. */
AnimationResource *AnimationResource_Assign(AnimationResource *self,
                                 const AnimationResource *source)
{
    if (self != source) {
        AnimationResource_RebindFrom(self, source);
    }
    return self;
}
