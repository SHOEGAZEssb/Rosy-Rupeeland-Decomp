#include "tingle/types.h"

/* Overlay 25 selection-event commit and accompanying audio dispatch. */

extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_SetFlag(void *, s32);
extern void func_02091b98(void *, s32);
extern s32 func_02091c7c(void *, s32);
extern void func_ov025_0220088c(void *);
#ifdef __cplusplus
}
#endif

/*
 * If event +0x5C4 is in state two, optionally commits `value` to event +0x5E0
 * when it is also in state two, sets GameWork flag 0x3D3, then dispatches the
 * selection sound. Persistent game, event, and audio state may change.
 */
extern "C" void func_ov025_02200824(void *scene, s32 value)
{
    if (!func_02091c7c((u8 *)scene + 0x5c4, 2))
        return;
    if (func_02091c7c((u8 *)scene + 0x5e0, 2)) {
        GameWork_SetFlag(gGameWork, 0x3d3);
        func_02091b98((u8 *)scene + 0x5e0, value);
    }
    func_ov025_0220088c(scene);
}
