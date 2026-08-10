#include "tingle/types.h"

/* Overlay 25 release, flag control, and completion query for the transient prompt sprite. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_ReleaseFromGroup(void *);
#ifdef __cplusplus
}
#endif

/*
 * Release transient sprite +0xB8, clear its scene pointer, and optionally clear
 * scene flag bit one. Sprite-group ownership and scene flags change; returns no value.
 */
extern "C" void func_ov025_02200438(void *scene, s32 clearMode)
{
    GraphicsSpriteState_ReleaseFromGroup(FIELD(void *, scene, 0xb8));
    FIELD(void *, scene, 0xb8) = 0;
    if (clearMode)
        FIELD(u32, scene, 0x48) &= ~2u;
}

/*
 * Clear transient sprite +0xB8 flag bit one when the sprite exists. The sprite
 * flags may change; a null pointer is ignored and the function returns no value.
 */
extern "C" void func_ov025_02200468(void *scene)
{
    void *sprite = FIELD(void *, scene, 0xb8);
    if (sprite)
        FIELD(u16, sprite, 0x24) &= ~2;
}

/*
 * Return transient sprite +0xB8 flag bit zero, or one when no transient sprite
 * exists. This query does not change sprite or scene state.
 */
extern "C" s32 func_ov025_02200480(void *scene)
{
    void *sprite = FIELD(void *, scene, 0xb8);
    return sprite ? (FIELD(u16, sprite, 0x24) & 1) : 1;
}
