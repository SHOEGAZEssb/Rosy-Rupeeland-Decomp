#include "tingle/types.h"

/*
 * Overlay 44 scene construction. This recovered constructor initializes the
 * scene's callback containers, text and sprite resources, debug-font helper,
 * gameplay flag, and base callback pair.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 data_ov044_0220d31c[];
extern "C" u32 data_020f4e18;
extern "C" u32 data_020f4e14;
extern "C" const u8 data_ov044_0220d340[];
extern "C" u32 data_ov044_0220d2e0[2];
extern "C" u8 gHeapContext[];
extern "C" void *gDebugFont;
extern "C" void *gGameWork;
extern "C" void SceneInputBase_Init(void *object);
extern "C" void TitleCharacterResourceCollection_Init(void *object);
extern "C" void TitleScreenResourceCollection_Init(void *object);
extern "C" void AnimationResourceState_InitEmbedded(void *object);
extern "C" void SpriteMotionController_Init(void *object);
extern "C" void TitleCharacterResourceCollection_Append(void *object, u32 id);
extern "C" void TitleScreenResourceCollection_Append(void *object, u32 id);
extern "C" void AnimationResourceState_ReplaceResources(void *object, void *resource, s32 width,
                                s32 height, s32 palette);
extern "C" void *GraphicsSpriteGroupOwner_CreateGroup(void *resource);
extern "C" void func_ov044_0220c610(void *object);
extern "C" void func_ov044_0220c19c(void *object);
extern "C" void func_ov044_0220c2e4(void *object);
extern "C" void func_ov044_0220c440(void *object);
extern "C" void *Heap_Alloc(u32 size, const void *tag, s32 alignment,
                              void *heap);
extern "C" void *func_ov001_021fb6f8(void *storage, void *font);
extern "C" void GameWork_ClearFlag(void *work, u32 flag);
extern "C" void func_ov044_0220be38(void *object, u32 first, u32 second);

/*
 * Initialize a scene object and return it. The constructor installs the
 * recovered vtable at +0x00; initializes embedded helpers at +0x54, +0x78,
 * +0xC0, +0xD0, and +0x17C; registers message IDs 0x7001/0x7005 and
 * 0x801B/0x801C; creates a debug-font wrapper; clears game-work flag 0x3B0;
 * and enables object flag 0x400. Allocation and resource helper calls have
 * their normal heap/SDK-visible effects.
 */
extern "C" void *func_ov044_0220be60(void *object)
{
    SceneInputBase_Init(object);
    FIELD(void *, object, 0) = data_ov044_0220d31c;
    TitleCharacterResourceCollection_Init((u8 *)object + 0x54);
    TitleScreenResourceCollection_Init((u8 *)object + 0x78);
    AnimationResourceState_InitEmbedded((u8 *)object + 0xc0);
    SpriteMotionController_Init((u8 *)object + 0xd0);
    SpriteMotionController_Init((u8 *)object + 0x17c);
    FIELD(u32, object, 0x23c) = 0;
    FIELD(u32, object, 0x228) = 0;
    FIELD(u32, object, 0x238) = 0;
    TitleCharacterResourceCollection_Append((u8 *)object + 0x54, 0x7001);
    TitleCharacterResourceCollection_Append((u8 *)object + 0x54, 0x7005);
    TitleScreenResourceCollection_Append((u8 *)object + 0x78, 0x801b);
    TitleScreenResourceCollection_Append((u8 *)object + 0x78, 0x801c);
    AnimationResourceState_ReplaceResources((u8 *)object + 0xc0, (void *)data_020f4e18,
                  13, 14, 15);
    FIELD(void *, object, 0xbc) = GraphicsSpriteGroupOwner_CreateGroup((void *)data_020f4e14);
    func_ov044_0220c610(object);
    func_ov044_0220c19c(object);
    func_ov044_0220c2e4(object);
    FIELD(u32, object, 0x230) = 0;
    FIELD(u32, object, 0x234) = 1;
    func_ov044_0220c440(object);
    void *debug = Heap_Alloc(0x48, data_ov044_0220d340, 4, gHeapContext);
    if (debug)
        debug = func_ov001_021fb6f8(debug, gDebugFont);
    FIELD(void *, object, 0x22c) = debug;
    GameWork_ClearFlag(gGameWork, 0x3b0);
    FIELD(u32, object, 0x20) |= 0x400;
    func_ov044_0220be38(object, data_ov044_0220d2e0[0],
                        data_ov044_0220d2e0[1]);
    return object;
}
