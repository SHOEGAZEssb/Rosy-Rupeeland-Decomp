#include "tingle/types.h"

/* Overlay 25 paired-engine effect teardown without storage release. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov025_02203354[];

#ifdef __cplusplus
extern "C" {
#endif
extern void __destroy_arr(void *, s32, s32, void *);
extern void AnimationResourceState_Destroy(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void func_ov025_021fdec8(void *);
#ifdef __cplusplus
}
#endif

/*
 * Install the teardown vtable, release both sprite-group owners and all four
 * resource descriptors, and run the base lifecycle hook. Caller-owned object
 * storage remains allocated and is returned; graphics/archive state changes.
 */
extern "C" void *func_ov025_021fe0c4(void *object)
{
    FIELD(const void *, object, 0) = data_ov025_02203354;
    GraphicsSpriteGroup_Destroy(FIELD(void *, object, 0xe0));
    GraphicsSpriteGroup_Destroy(FIELD(void *, object, 0xe4));
    AnimationResourceState_Destroy((u8 *)object + 0xd4);
    __destroy_arr((u8 *)object + 0xb0, 3, 0xc, (void *)AnimationResourceState_Destroy);
    func_ov025_021fdec8(object);
    return object;
}
