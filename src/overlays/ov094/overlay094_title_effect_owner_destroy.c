#include "tingle/types.h"

/* Overlay 94 destruction for the title/menu's auxiliary sprite-effect owner. */

extern const u8 data_ov094_02219e70[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02071eb8(void *resourceSet);
extern void GraphicsSpriteGroup_Destroy(void *group);
extern void func_02095308(void *effectList);
#ifdef __cplusplus
}
#endif

/*
 * Destroys the effect list at +0x34 and both sprite groups, restores the
 * list's retail dispatch record while running its base destructor, then
 * releases the resource set at object base. Returns the same object pointer;
 * owned graphics and list state are destroyed without direct GX writes.
 */
extern "C" void *func_ov094_022196a4(void *object)
{
    func_02095308((u8 *)object + 0x34);
    GraphicsSpriteGroup_Destroy(*(void **)((u8 *)object + 0x0c));
    GraphicsSpriteGroup_Destroy(*(void **)((u8 *)object + 0x10));
    *(const void **)((u8 *)object + 0x34) = data_ov094_02219e70;
    func_02095308((u8 *)object + 0x34);
    func_02071eb8(object);
    return object;
}
