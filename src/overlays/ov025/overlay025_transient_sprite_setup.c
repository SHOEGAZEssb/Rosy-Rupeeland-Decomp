#include "tingle/types.h"

/* Overlay 25 creation and positioning of the title screen's transient prompt sprite. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02070e0c(void *, s32, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
extern void *TitleScreenResourceCollection_Get(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Select touch resource one, create transient sprite +0xB8 with animation one
 * at (56,68), clear the font rectangle (48,64)..(208,96), and set scene flag
 * bit one. Sprite, BG-resource, and font-canvas state change; returns no value.
 */
extern "C" void func_ov025_022002f8(void *scene)
{
    func_02070e0c(TitleScreenResourceCollection_Get((u8 *)scene + 0x530, 1), 1, 0);
    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xb0),
                                  (u8 *)scene + 0x68, 2);
    FIELD(void *, scene, 0xb8) = sprite;
    func_02073e48(FIELD(void *, scene, 0xb8), 1, 0x38, 0x44, 0, 0, 2);
    GraphicsSpriteCanvas_FillRect(data_020f4e14, 0x30, 0x40, 0xd0, 0x60, 0);
    FIELD(u32, scene, 0x48) |= 2;
}

/*
 * Select the caller's touch resource, create transient sprite +0xB8 with the
 * requested animation at (57,60), clear (48,56)..(208,128), and set scene flag
 * bit one. Sprite, BG-resource, and font-canvas state change; returns no value.
 */
extern "C" void func_ov025_02200398(void *scene, s32 mode, s32 animation)
{
    func_02070e0c(TitleScreenResourceCollection_Get((u8 *)scene + 0x530, mode), 1, 0);
    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xb0),
                                  (u8 *)scene + 0x68, 2);
    FIELD(void *, scene, 0xb8) = sprite;
    func_02073e48(FIELD(void *, scene, 0xb8), animation, 0x39, 0x3c, 0, 0, 2);
    GraphicsSpriteCanvas_FillRect(data_020f4e14, 0x30, 0x38, 0xd0, 0x80, 0);
    FIELD(u32, scene, 0x48) |= 2;
}
