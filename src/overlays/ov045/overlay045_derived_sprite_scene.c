#include "tingle/types.h"

/*
 * Overlay 45 derived sprite scene lifecycle. This recovered constructor builds
 * on the paired-sprite owner, temporarily loads a graphics resource set, and
 * derives one owner-ID triplet from a confirmed global descriptor.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

struct GraphicsResourceSet {
    void *field0;
    void *field4;
    void *field8;
};

struct SceneSpriteEntry {
    u8 unknown00[0x28];
    u16 field28;
    u8 unknown2A[0x10];
    u8 field3A;
};

extern "C" u8 data_ov045_0220d580[];
extern "C" void *data_020f4e18;
extern "C" u8 data_020ed9e0[];
extern "C" void *func_ov045_0220be10(void *object);
extern "C" void *func_ov045_0220bfa8(void *object);
extern "C" void func_ov045_0220c2e0(u32 bit14, u32 bit7, u32 bit8,
                                     u32 bits2, u32 bit13);
extern "C" void GraphicsResourceSet_Init(GraphicsResourceSet *set);
extern "C" void GraphicsResourceSet_Load(GraphicsResourceSet *set,
                                           void *archive, s32 first,
                                           s32 second, s32 third);
extern "C" void GraphicsResourceSet_Apply(GraphicsResourceSet *set,
                                            s32 engine, s32 size);
extern "C" void GraphicsResourceSet_Destroy(GraphicsResourceSet *set);
extern "C" void GraphicsResourceSet_ReleaseHandles(GraphicsResourceSet *set);
extern "C" void GraphicsBgMapResource_SetPaletteBank(void *resource, s32 value);
extern "C" void func_020b44e8(void);
extern "C" void func_02071ee0(void *owner, void *archive, s32 first,
                               s32 second, s32 third);
extern "C" void *GraphicsSpriteGroup_CreateStateFromSource(void *fontState, void *owner, s32 selector);
extern "C" void func_02073e48(void *sprite, s32 value, s32 x, s32 y,
                               s32 enabled, s32 zero1, s32 zero2);
extern "C" void Heap_Free(void *allocation);

/*
 * Construct the derived scene and return its storage. Run the paired-sprite
 * base constructor, install the derived vtable, set +0x30 to one, and program
 * sub-display control. Temporarily load/apply graphics IDs 0x9000..0x9002,
 * configure owner +4 from halfwords +0x38..+0x3C of data_020ed9e0, configure
 * owner +0x10 with IDs 0x49..0x4B, create sprites +0x20/+0x24, then destroy
 * the temporary resource set. Graphics, VRAM/resource, sprite, and MMIO state
 * change.
 */
extern "C" void *func_ov045_0220c314(void *object)
{
    func_ov045_0220be10(object);
    FIELD(void *, object, 0) = data_ov045_0220d580;
    FIELD(s32, object, 0x30) = 1;
    func_ov045_0220c2e0(0, 0, 0x1c, 4, 1);

    GraphicsResourceSet resources;
    GraphicsResourceSet_Init(&resources);
    GraphicsResourceSet_Load(&resources, data_020f4e18,
                              0x9000, 0x9001, 0x9002);
    GraphicsBgMapResource_SetPaletteBank(resources.field8, 8);
    func_020b44e8();
    GraphicsResourceSet_Apply(&resources, 1, 0x100);
    GraphicsResourceSet_ReleaseHandles(&resources);

    func_02071ee0((u8 *)object + 4, data_020f4e18,
                   FIELD(u16, data_020ed9e0, 0x38),
                   FIELD(u16, data_020ed9e0, 0x3a),
                   FIELD(u16, data_020ed9e0, 0x3c));
    func_02071ee0((u8 *)object + 0x10, data_020f4e18,
                   0x49, 0x4a, 0x4b);

    SceneSpriteEntry *firstSprite =
        (SceneSpriteEntry *)GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, object, 0x1c),
                                           (u8 *)object + 4, 2);
    FIELD(void *, object, 0x20) = firstSprite;
    firstSprite->field3A = 1;
    firstSprite->field28 = 0x10;
    FIELD(void *, object, 0x24) =
        GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, object, 0x1c),
                       (u8 *)object + 0x10, 1);
    func_02073e48(FIELD(void *, object, 0x24), 0,
                   0x54, 0x54, 1, 0, 0);
    GraphicsResourceSet_Destroy(&resources);
    return object;
}

/*
 * Run the paired-sprite non-freeing destructor and return the unchanged scene
 * pointer. Owned base resources are released; storage remains allocated.
 */
extern "C" void *func_ov045_0220c45c(void *object)
{
    func_ov045_0220bfa8(object);
    return object;
}

/*
 * Run the paired-sprite destructor, free the scene storage, and return its
 * former address. The returned address must not be dereferenced.
 */
extern "C" void *func_ov045_0220c470(void *object)
{
    func_ov045_0220bfa8(object);
    Heap_Free(object);
    return object;
}
