#include "tingle/types.h"

/* Overlay 36 effect-controller resource selection and construction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205f2c[];
extern const u8 data_ov036_02206150[];
extern void *data_020f4e18;
/* The retail literal names the heap context itself, not its storage pointer. */
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov036_021fce00(void *controller, void *argument);
extern void GraphicsResourceSetVariant_Init(void *resourceSet);
extern void func_ov036_021fe218(void *list);
extern void GraphicsResourceSetVariant_Load(void *resourceSet, void *archive,
                          s32 firstId, s32 secondId, s32 thirdId);
extern void Graphics3DResourceOwner_PrepareResources(void *owner, void *resourceSet);
extern void *Graphics3DResourceOwner_CreateManager(void *owner);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov036_021fdf30(void *object, void *owner);
extern void PresentationList_Append(void *list, void *object);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void func_ov036_021fe9fc(void *record, s32 x, s32 y, s32 z);
extern void func_ov036_021fea04(void *record, s32 x, s32 y, s32 z);
#ifdef __cplusplus
}
#endif

/*
 * Selects the third ID of a consecutive three-resource group from the
 * controller key. The repeated triples are confirmed; their content semantics
 * remain unknown. This helper has no state effects.
 */
static s32 select_resource_id(s32 key)
{
    switch (key) {
    case 0x64: case 0x67: case 0x6a:
        return 0x60b0;
    case 0x65: case 0x68: case 0x6b:
        return 0x60a7;
    case 0x66: case 0x69: case 0x6c:
        return 0x609e;
    case 0xc8: case 0xcb: case 0xce:
        return 0x60b3;
    case 0xc9: case 0xcc: case 0xcf:
        return 0x60aa;
    case 0xca: case 0xcd: case 0xd0:
        return 0x60a1;
    case 0x12c: case 0x12f: case 0x132:
        return 0x60ad;
    case 0x12d: case 0x130: case 0x133:
        return 0x60a4;
    case 0x12e: case 0x131: case 0x134:
        return 0x609b;
    case 0x258:
        return 0x60bc;
    case 0x259:
        return 0x60b9;
    default:
        return 0x60b6;
    }
}

/*
 * Constructs an effect controller. argument becomes the common controller key
 * +4 while owner is retained indirectly by two registered resource sets. The
 * key chooses one consecutive resource triple for +0xEC; +0xE0 always loads
 * IDs 0x6096..0x6098. Embedded lists +0xF8/+0x108 are initialized, a manager
 * derived from owner is stored at +0xDC, and a 0xA0 resource-backed render
 * object is allocated, appended to +0xF8, and positioned at Z=-0x600. Vector
 * fields +0xC..+0x24 are initialized to (0,0,0x2000) and (0,0,0); +0x118 is
 * cleared. Returns controller; heap, resource-owner, embedded-list, and object
 * state change. The selected IDs are SDK/archive boundaries, not inferred
 * gameplay names.
 */
extern "C" void *func_ov036_021fea14(void *controller, void *owner,
                                      void *argument)
{
    func_ov036_021fce00(controller, argument);
    FIELD(const void *, controller, 0) = data_ov036_02205f2c;
    GraphicsResourceSetVariant_Init((u8 *)controller + 0xe0);
    GraphicsResourceSetVariant_Init((u8 *)controller + 0xec);
    func_ov036_021fe218((u8 *)controller + 0xf8);
    func_ov036_021fe218((u8 *)controller + 0x108);

    s32 id = select_resource_id(FIELD(s32, controller, 4));
    GraphicsResourceSetVariant_Load((u8 *)controller + 0xec, data_020f4e18,
                  id - 2, id - 1, id);
    Graphics3DResourceOwner_PrepareResources(owner, (u8 *)controller + 0xec);

    GraphicsResourceSetVariant_Load((u8 *)controller + 0xe0, data_020f4e18,
                  0x6096, 0x6097, 0x6098);
    Graphics3DResourceOwner_PrepareResources(owner, (u8 *)controller + 0xe0);
    FIELD(void *, controller, 0xdc) = Graphics3DResourceOwner_CreateManager(owner);

    void *renderObject = Heap_Alloc(0xa0, data_ov036_02206150,
                                    4, gHeapContext);
    if (renderObject != 0)
        renderObject = func_ov036_021fdf30(renderObject, owner);
    FIELD(void *, controller, 0x11c) = renderObject;
    PresentationList_Append((u8 *)controller + 0xf8, renderObject);
    Presentation_SetPosition(renderObject, 0, 0, -0x600);

    func_ov036_021fe9fc((u8 *)controller + 0xc, 0, 0, 0x2000);
    func_ov036_021fea04((u8 *)controller + 0xc, 0, 0, 0);
    FIELD(s32, controller, 0x118) = 0;
    return controller;
}
