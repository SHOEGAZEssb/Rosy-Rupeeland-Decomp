#include "tingle/types.h"

/* Overlay 94 sprite-group residency control used by the title name-entry path. */

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *group);
#ifdef __cplusplus
}
#endif

/*
 * With mode one, marks both sprite groups at +0x0C/+0x10 resident by storing
 * one at group +0x20. Other modes release their indexed entries. Returns no
 * value; sprite-resource residency changes but no direct hardware call occurs.
 */
extern "C" void func_ov094_022198e8(void *object, s32 mode)
{
    void *first = *(void **)((u8 *)object + 0x0c);
    if (mode == 1) {
        *(s32 *)((u8 *)first + 0x20) = 1;
        void *second = *(void **)((u8 *)object + 0x10);
        *(s32 *)((u8 *)second + 0x20) = 1;
        return;
    }
    GraphicsSpriteGroup_ReleaseIndexedEntries(first);
    GraphicsSpriteGroup_ReleaseIndexedEntries(
        *(void **)((u8 *)object + 0x10));
}
