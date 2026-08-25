#include "tingle/types.h"

/* Overlay 35 top-level presentation construction and scene-family dispatch. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov035_02203bb4[];
extern void *data_020f4e14[];
extern void *gDebugFont[];
extern const u8 data_ov035_02203d78[];
extern const u8 data_ov035_02203d80[];
extern void *data_ov035_022038e8[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void SceneInputBase_Init(void *object);
extern void GraphicsBankStateSnapshot_Init(void *state);
extern void func_ov043_0220b740(void *state);
extern void G3X_Init(void);
extern void func_020923a4(void *state);
extern void GraphicsSpriteRenderer_Suspend(void *resource);
extern void GraphicsSpriteRenderer_HideAllSprites(void *resource);
extern void func_020ae6dc(void);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *Graphics3DResourceOwner_Init(void *object, s32 first, s32 second);
extern void func_ov048_0220b7b8(void *state);
extern void TitlePalette_SetMainBackdrop(s32 value);
extern void func_020b0300(s32 first, s32 second, s32 third, s32 fourth,
                         s32 fifth);
extern void *func_ov035_021fdd88(void *, void *, void *);
extern void *func_ov035_021feb7c(void *, void *, void *);
extern void *func_ov035_021ff478(void *, void *, void *);
extern void *func_ov035_021fff38(void *, void *, void *);
extern void *func_ov035_022008d0(void *, void *, void *);
extern void *func_ov035_022016e8(void *, void *, void *);
extern void func_ov035_02202350(void *record, void *first, void *second,
                               void *unused);
#ifdef __cplusplus
}
#endif

/*
 * Allocates and constructs the scene family selected by absolute selection.
 * IDs 0xC8..0xD0 cycle through primary/secondary/tertiary constructors;
 * 0x12C/0x12F/0x132 select quaternary, 0x12D/0x130/0x133 quinary, and
 * 0x12E/0x131/0x134 senary. Other IDs use the primary family. Returns the
 * constructed scene, including null on allocation failure.
 */
static void *create_scene(void *resourceOwner, s32 selection)
{
    u32 size;
    s32 family;
    switch (selection) {
    case 0xc9: case 0xcc: case 0xcf:
        size = 0x144;
        family = 1;
        break;
    case 0xca: case 0xcd: case 0xd0:
        size = 0x194;
        family = 2;
        break;
    case 0x12c: case 0x12f: case 0x132:
        size = 0x180;
        family = 3;
        break;
    case 0x12d: case 0x130: case 0x133:
        size = 0x178;
        family = 4;
        break;
    case 0x12e: case 0x131: case 0x134:
        size = 0x168;
        family = 5;
        break;
    default:
        size = 0x150;
        family = 0;
        break;
    }

    void *scene = Heap_Alloc(size, data_ov035_02203d80, 4, gHeapContext);
    if (scene == 0)
        return 0;
    switch (family) {
    case 1: return func_ov035_021feb7c(scene, resourceOwner, (void *)selection);
    case 2: return func_ov035_021ff478(scene, resourceOwner, (void *)selection);
    case 3: return func_ov035_021fff38(scene, resourceOwner, (void *)selection);
    case 4: return func_ov035_022008d0(scene, resourceOwner, (void *)selection);
    case 5: return func_ov035_022016e8(scene, resourceOwner, (void *)selection);
    default: return func_ov035_021fdd88(scene, resourceOwner, (void *)selection);
    }
}

/*
 * Constructs the top-level overlay-35 presentation from signed selection.
 * It initializes common base state, embedded display state +0x64 and +0x98,
 * stores abs(selection) at +0x54, and records a negative input at +0x58. It
 * resets the 3D engine, initializes two global resource/font handles, allocates
 * a 0x624-byte resource owner at +0x5C, and establishes global GX color state.
 * Nonnegative selections allocate the appropriate child scene at +0x60;
 * negative selections intentionally omit it. Flag 0x400 is set in field +0x20
 * and two callback-record inputs come from data_ov035_022038e8. Returns object;
 * heap, global resource, renderer, G3X/GX, and presentation state change.
 */
extern "C" void *func_ov035_02202378(void *object, s32 selection)
{
    SceneInputBase_Init(object);
    FIELD(const void *, object, 0) = data_ov035_02203bb4;
    GraphicsBankStateSnapshot_Init((u8 *)object + 0x64);
    func_ov043_0220b740((u8 *)object + 0x98);
    FIELD(s32, object, 0x54) = selection;
    FIELD(s32, object, 0x58) = 0;
    if (selection < 0) {
        FIELD(s32, object, 0x54) = -selection;
        FIELD(s32, object, 0x58) = 1;
    }

    G3X_Init();
    FIELD(s32, object, 0x50) = 0;
    func_020923a4((u8 *)object + 0x64);
    GraphicsSpriteRenderer_Suspend(data_020f4e14[0]);
    GraphicsSpriteRenderer_HideAllSprites(data_020f4e14[0]);
    GraphicsSpriteRenderer_Suspend(gDebugFont[0]);
    GraphicsSpriteRenderer_HideAllSprites(gDebugFont[0]);
    func_020ae6dc();

    void *owner = Heap_Alloc(0x624, data_ov035_02203d78, 4, gHeapContext);
    if (owner != 0)
        owner = Graphics3DResourceOwner_Init(owner, 4, 2);
    FIELD(void *, object, 0x5c) = owner;
    func_ov048_0220b7b8((u8 *)object + 0x98);
    FIELD(s32, object, 0x48) = 0x11;
    TitlePalette_SetMainBackdrop(0);
    func_020b0300(0, 0x1f, 0x7fff, 0x3f, 0);
    FIELD(void *, object, 0x60) = 0;
    if (FIELD(s32, object, 0x58) != 1)
        FIELD(void *, object, 0x60) =
            create_scene(owner, FIELD(s32, object, 0x54));

    FIELD(s32, object, 0x20) |= 0x400;
    func_ov035_02202350(object, data_ov035_022038e8[0],
                        data_ov035_022038e8[1], 0);
    return object;
}
