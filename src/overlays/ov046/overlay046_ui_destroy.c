#include "tingle/types.h"

/*
 * Overlay 46 UI-object teardown. This recovered routine releases the shared
 * font state and three resource-owner regions initialized by the constructor.
 */

extern "C" void GraphicsSpriteGroup_Destroy(void *fontState);
extern "C" void func_02071eb8(void *owner);
extern "C" void __destroy_arr(void *array, s32 count, s32 stride,
                               void (*destroy)(void *));

/*
 * Release font state +4, owner +0x2C, both 0x0C-byte owners at +0x14, then
 * owner +8, and return the unchanged storage pointer. Resource ownership state
 * changes; storage is not freed and no direct hardware access occurs.
 */
extern "C" void *func_ov046_0220ba80(void *object)
{
    GraphicsSpriteGroup_Destroy(*(void **)((u8 *)object + 4));
    func_02071eb8((u8 *)object + 0x2c);
    __destroy_arr((u8 *)object + 0x14, 2, 0x0c, func_02071eb8);
    func_02071eb8((u8 *)object + 8);
    return object;
}
