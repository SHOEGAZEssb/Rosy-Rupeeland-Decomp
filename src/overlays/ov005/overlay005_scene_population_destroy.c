#include "tingle/types.h"

/*
 * Overlay 5 scene-population destruction. This recovered routine releases the
 * cached context and tears down the embedded counter and resource collections.
 */

typedef struct Overlay005ScenePopulation {
    u8 bytes[0x15c];
} Overlay005ScenePopulation;

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_ov005_021fcab0[];
extern void PresentationList_DeleteAll(void *state);
extern void GraphicsSpriteGroup_Destroy(void *context);
extern void __destroy_arr(void *array, s32 count, s32 elementSize,
                          void (*destructor)(void *));
extern void func_02071eb8(void *resource);
#ifdef __cplusplus
}
#endif

/*
 * Invoke PresentationList_DeleteAll for the embedded object at +0x148, release the cached
 * +0x04 context through GraphicsSpriteGroup_Destroy, restore data_ov005_021fcab0 at +0x148,
 * and invoke PresentationList_DeleteAll again. Destroy the three 0x0C-byte resources at
 * +0xA4 and eleven at +0x20 via __destroy_arr, then destroy standalone
 * resources +0x14 and +0x08. Return state. The repeated embedded teardown is
 * confirmed, though the distinction between its two phases remains unknown;
 * allocation and renderer effects are delegated to callees.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay005ScenePopulation *
func_ov005_021fbb78(Overlay005ScenePopulation *state)
{
    PresentationList_DeleteAll((u8 *)state + 0x148);
    GraphicsSpriteGroup_Destroy(*(void **)((u8 *)state + 0x04));
    *(const void **)((u8 *)state + 0x148) = data_ov005_021fcab0;
    PresentationList_DeleteAll((u8 *)state + 0x148);
    __destroy_arr((u8 *)state + 0xa4, 3, 0x0c, func_02071eb8);
    __destroy_arr((u8 *)state + 0x20, 11, 0x0c, func_02071eb8);
    func_02071eb8((u8 *)state + 0x14);
    func_02071eb8((u8 *)state + 0x08);
    return state;
}
