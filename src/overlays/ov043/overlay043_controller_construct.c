#include "tingle/types.h"

/*
 * Overlay 43 controller construction. This recovered routine initializes the
 * debug-style presentation controller and its embedded touch/text resources.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *gGameWork;
extern "C" u8 data_ov043_0220c4bc[];
extern "C" u32 data_ov043_0220c480[];
extern "C" void SceneInputBase_Init(void *object);
extern "C" void TitleCharacterResourceCollection_Init(void *object);
extern "C" void AnimationResourceState_InitEmbedded(void *object);
extern "C" void func_020957bc(void *canvas);
extern "C" void OverlaySlot_Init(void *object);
extern "C" void func_02095820(void *canvas, s32 width, s32 height);
extern "C" void func_02092814(void *object, s32 resourceId);
extern "C" void func_ov043_0220ba28(void *object);
extern "C" void func_ov043_0220bc2c(void *object);
extern "C" void func_ov043_0220b744(void *object, u32 first, u32 second);

/*
 * Construct an overlay-43 controller in caller-provided storage and return the
 * same pointer. It initializes the common scene base, embedded objects at
 * +0x5C/+0x80/+0x2DC/+0x2E8, text canvases at +0x90/+0x13C/+0x1E8,
 * derives +0x54 from gGameWork+0x206, allocates graphics/touch resources,
 * enables flag 0x400, and installs the callback pair in data_ov043_0220c480.
 * SDK constructors and graphics setup are observable side effects.
 */
extern "C" void *func_ov043_0220b76c(void *object)
{
    SceneInputBase_Init(object);
    FIELD(void *, object, 0) = data_ov043_0220c4bc;
    TitleCharacterResourceCollection_Init((u8 *)object + 0x5c);
    AnimationResourceState_InitEmbedded((u8 *)object + 0x80);
    func_020957bc((u8 *)object + 0x90);
    func_020957bc((u8 *)object + 0x13c);
    func_020957bc((u8 *)object + 0x1e8);
    OverlaySlot_Init((u8 *)object + 0x2dc);
    OverlaySlot_Init((u8 *)object + 0x2e8);
    FIELD(void *, object, 0x2f4) = 0;
    FIELD(void *, object, 0x8c) = 0;
    FIELD(u32, object, 0x58) = 0;
    FIELD(u32, object, 0x298) = 0;
    FIELD(u32, object, 0x294) = 0;
    FIELD(s32, object, 0x54) = FIELD(s16, gGameWork, 0x206);
    func_02095820((u8 *)object + 0x13c, 0x48, 0x50);
    func_02095820((u8 *)object + 0x1e8, 0xb8, 0x50);
    func_02095820((u8 *)object + 0x90, 0xe8, 0xa0);
    func_02092814((u8 *)object + 0x5c, 0x7005);
    func_ov043_0220ba28(object);
    func_ov043_0220bc2c(object);
    FIELD(u32, object, 0x20) |= 0x400;
    func_ov043_0220b744(object, data_ov043_0220c480[0],
                         data_ov043_0220c480[1]);
    return object;
}
