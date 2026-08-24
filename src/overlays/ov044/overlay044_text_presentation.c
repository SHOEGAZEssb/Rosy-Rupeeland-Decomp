#include "tingle/types.h"

/*
 * Overlay 44 text presentation. These recovered helpers allocate and configure
 * two embedded presentation objects backed by the scene font resource, then
 * reset their runtime pointers when the shared backing resource is cleared.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *GraphicsSpriteGroup_CreateStateFromSource(void *resource, void *descriptor, s32 mode);
extern "C" void GraphicsSpriteState_ApplyRenderConfig(void *binding, s32 x, s32 y, s32 palette,
                                s32 mode, s32 flags, s32 finalMode);
extern "C" void func_020957f0(void *presentation, void *binding, s32 index,
                                s32 mode, s32 flags);
extern "C" void func_02095820(void *presentation, s32 x, s32 y);
extern "C" void func_02095940(void *presentation);
extern "C" void GraphicsSpriteGroup_Clear(void *resource);

/*
 * Create a binding from resource +0xBC and descriptor +0xC0, store it at
 * +0xCC, configure its 0x84-by-0x20 region with palette/mode values 2/0/2,
 * then create embedded presentations +0xD0 (index 9 at 232,170) and +0x17C
 * (index 7 at 128,170). The latter is immediately activated. Resource and
 * presentation state changes through the called graphics helpers; no value is
 * returned.
 */
extern "C" void func_ov044_0220c610(void *object)
{
    void *binding = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, object, 0xbc),
                                  (u8 *)object + 0xc0, 1);
    FIELD(void *, object, 0xcc) = binding;
    GraphicsSpriteState_ApplyRenderConfig(binding, 0, 0x84, 0x20, 2, 0, 2);
    binding = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, object, 0xbc),
                            (u8 *)object + 0xc0, 1);
    func_020957f0((u8 *)object + 0xd0, binding, 9, 2, 0);
    func_02095820((u8 *)object + 0xd0, 0xe8, 0xaa);
    binding = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, object, 0xbc),
                            (u8 *)object + 0xc0, 1);
    func_020957f0((u8 *)object + 0x17c, binding, 7, 2, 0);
    func_02095820((u8 *)object + 0x17c, 0x80, 0xaa);
    func_02095940((u8 *)object + 0x17c);
}

/*
 * Clear the resource at +0xBC through GraphicsSpriteGroup_Clear and reset cached binding
 * +0xCC plus presentation-owned pointers +0x16C/+0x218 to null. The resource
 * helper has its normal graphics lifetime effects; no value is returned.
 */
extern "C" void func_ov044_0220c6dc(void *object)
{
    GraphicsSpriteGroup_Clear(FIELD(void *, object, 0xbc));
    FIELD(void *, object, 0xcc) = 0;
    FIELD(void *, object, 0x218) = 0;
    FIELD(void *, object, 0x16c) = 0;
}
