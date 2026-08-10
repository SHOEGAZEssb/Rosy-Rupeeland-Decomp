#include "tingle/types.h"

/*
 * Overlay 44 scene construction. This recovered constructor initializes the
 * scene's callback containers, text and sprite resources, debug-font helper,
 * gameplay flag, and base callback pair.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *data_ov044_0220d31c;
extern "C" u32 data_020f4e18;
extern "C" u32 data_020f4e14;
extern "C" const void *data_ov044_0220d340;
extern "C" u32 data_ov044_0220d2e0[2];
extern "C" void *gHeapContext;
extern "C" void *gDebugFont;
extern "C" void *gGameWork;
extern "C" void func_02091e28(void *object);
extern "C" void func_02092798(void *object);
extern "C" void func_020926d8(void *object);
extern "C" void func_02071ea4(void *object);
extern "C" void func_020957bc(void *object);
extern "C" void func_02092814(void *object, u32 id);
extern "C" void func_02092754(void *object, u32 id);
extern "C" void func_02071ee0(void *object, void *resource, s32 width,
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
    func_02091e28(object);
    FIELD(void *, object, 0) = data_ov044_0220d31c;
    func_02092798((u8 *)object + 0x54);
    func_020926d8((u8 *)object + 0x78);
    func_02071ea4((u8 *)object + 0xc0);
    func_020957bc((u8 *)object + 0xd0);
    func_020957bc((u8 *)object + 0x17c);
    FIELD(u32, object, 0x23c) = 0;
    FIELD(u32, object, 0x228) = 0;
    FIELD(u32, object, 0x238) = 0;
    func_02092814((u8 *)object + 0x54, 0x7001);
    func_02092814((u8 *)object + 0x54, 0x7005);
    func_02092754((u8 *)object + 0x78, 0x801b);
    func_02092754((u8 *)object + 0x78, 0x801c);
    func_02071ee0((u8 *)object + 0xc0, (void *)data_020f4e18,
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
