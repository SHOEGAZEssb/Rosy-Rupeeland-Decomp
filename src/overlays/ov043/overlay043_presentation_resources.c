#include "tingle/types.h"

/*
 * Overlay 43 presentation resources. These recovered routines create, reset,
 * and maintain the controller's touch object and three text canvases.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *data_020f4e18;
extern "C" void *data_020f4e14;
extern "C" void func_02071ee0(void *owner, void *archive, s32 first,
                               s32 second, s32 third, s32 fourth);
extern "C" void *GraphicsSpriteGroupOwner_CreateGroup(void *font);
extern "C" void *GraphicsSpriteGroup_CreateStateFromSource(void *fontObject, void *owner, s32 value);
extern "C" void func_020957f0(void *canvas, void *fontBinding,
                               s32 engine, s32 mode, s32 flags);
extern "C" void GraphicsSpriteGroup_Destroy(void *object);
extern "C" void func_02071f38(void *owner);
extern "C" void func_020958d8(void *canvas);
extern "C" void GraphicsSpriteGroup_AdvanceAnimations(void *object);

/*
 * Create the embedded presentation resources for object. Initialize owner
 * +0x80 from archive data_020f4e18 using IDs 0x16..0x18, allocate the font
 * object at +0x8C from data_020f4e14, and bind three canvas regions at
 * +0x13C/+0x1E8/+0x90 to engines/modes 0/1/2. The resource managers and heap
 * are modified; no value is returned.
 */
extern "C" void func_ov043_0220bc2c(void *object)
{
    func_02071ee0((u8 *)object + 0x80, data_020f4e18,
                   0x16, 0x17, 0x18, 0x18);
    FIELD(void *, object, 0x8c) = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    void *binding = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, object, 0x8c),
                                   (u8 *)object + 0x80, 1);
    func_020957f0((u8 *)object + 0x13c, binding, 0, 2, 0);
    binding = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, object, 0x8c),
                             (u8 *)object + 0x80, 1);
    func_020957f0((u8 *)object + 0x1e8, binding, 1, 2, 0);
    binding = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, object, 0x8c),
                             (u8 *)object + 0x80, 1);
    func_020957f0((u8 *)object + 0x90, binding, 2, 2, 0);
}

/*
 * Release font object +0x8C, clear it and the three offset-derived canvas
 * handles +0x12C/+0x1D8/+0x284, then reset owner +0x80. Heap/resource state is
 * changed and the routine returns no value.
 */
extern "C" void func_ov043_0220bcf4(void *object)
{
    GraphicsSpriteGroup_Destroy(FIELD(void *, object, 0x8c));
    FIELD(void *, object, 0x8c) = 0;
    FIELD(u32, object, 0x1d8) = 0;
    FIELD(u32, object, 0x284) = 0;
    FIELD(u32, object, 0x12c) = 0;
    func_02071f38((u8 *)object + 0x80);
}

/*
 * Flush/update all three canvases and, when font object +0x8C exists, update
 * that object as well. Canvas/VRAM transfer state may change. There is no
 * return value and no controller fields are directly written.
 */
extern "C" void func_ov043_0220bd24(void *object)
{
    func_020958d8((u8 *)object + 0x13c);
    func_020958d8((u8 *)object + 0x1e8);
    func_020958d8((u8 *)object + 0x90);
    if (FIELD(void *, object, 0x8c))
        GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, object, 0x8c));
}
