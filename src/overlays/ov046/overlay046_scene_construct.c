#include "tingle/types.h"

/*
 * Overlay 46 scene construction and state-callback installation. The scene
 * owns a shared font state, a resource owner, a selection panel, and an
 * auxiliary data object. Matching-only assembly preserves constructor ABI
 * details and the large resource-selection control flow for the NDS build;
 * the definitions below are the canonical portable behavior.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef s32 (*Overlay046SceneCallback)(void *scene);

typedef struct Overlay046CallbackBinding {
    Overlay046SceneCallback callback;
    void *argument;
} Overlay046CallbackBinding;

extern "C" void *data_020f4e18;
extern "C" u8 data_020d780c[];
extern "C" Overlay046CallbackBinding data_ov046_0220ccf8;
extern "C" u8 data_ov046_0220cf28[];
extern "C" u8 data_ov046_0220cf3c[];
extern "C" u8 data_ov046_0220cf44[];
extern "C" void *gDebugFont;
extern "C" u8 gHeapContext[];

extern "C" void *SceneInputBase_Init(void *scene);
extern "C" void AnimationResourceState_InitEmbedded(void *state);
extern "C" void func_02071ee0(void *state, void *archive, s32 characterId,
                                s32 paletteId, s32 cellId);
extern "C" void *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
extern "C" void *GraphicsSpriteGroup_CreateStateFromSource(void *group,
                                                             void *source,
                                                             s32 count);
extern "C" void func_02073e48(void *sprite, s32 animation, s32 x, s32 y,
                                s32 priority, s32 palette, s32 flags);
extern "C" void *Heap_Alloc(s32 size, const void *tag, s32 alignment,
                              void *heap);
extern "C" s32 func_ov046_0220b740(s32 selector);
extern "C" s32 func_ov046_0220b77c(s32 selector);
extern "C" void *func_ov046_0220b7bc(void *panel, void *font, s32 mode);
extern "C" void *func_02027fe8(void *object, void *font);

/*
 * Install callback `callback` and argument `argument` at scene +0x24/+0x28,
 * then clear state and timer fields +4/+8. The scene changes, nothing is
 * returned, and no SDK or hardware operation occurs. The fourth ABI register
 * is unused but retained by the original compiler's argument-save sequence.
 */
extern "C" void func_ov046_0220c7b0(void *scene,
                                     Overlay046SceneCallback callback,
                                     void *argument, void *unused)
{
    (void)unused;
    FIELD(Overlay046SceneCallback, scene, 0x24) = callback;
    FIELD(void *, scene, 0x28) = argument;
    FIELD(s32, scene, 0x04) = 0;
    FIELD(s32, scene, 0x08) = 0;
}

/*
 * Construct the overlay scene in caller-owned `scene` storage for selector
 * `selection` and return that storage. The routine initializes the base scene
 * and vtable, owner +0x54, selects resources by scanning eleven game records,
 * loads the selector-dependent owner IDs, acquires font state +0x60, allocates
 * and constructs panel +0x70, creates/configures an auxiliary object +0x74,
 * installs initial positions and sprite state, and sets flag 0x400 at +0x20.
 * Heap, graphics-resource, sprite, and base-scene state change; allocation
 * failure handling follows the recovered SDK calls.
 */
extern "C" void *func_ov046_0220c7d8(void *scene, s32 selection)
{
    s32 category;
    s32 markerX;
    s32 markerY;
    void *panel;
    void *auxiliary;

    SceneInputBase_Init(scene);
    FIELD(void *, scene, 0x00) = data_ov046_0220cf28;
    AnimationResourceState_InitEmbedded((u8 *)scene + 0x54);
    FIELD(s32, scene, 0x68) = selection;
    FIELD(s32, scene, 0x6c) = -1;

    /* Each 0x34-byte category record points at a terminated 0x0c-byte list. */
    for (category = 0;
         category < 11 && FIELD(s32, scene, 0x6c) < 0;
         ++category) {
        FIELD(void *, scene, 0x78) =
            FIELD(void *, data_020d780c, category * 0x34 + 0x28);
        while (FIELD(s16, FIELD(void *, scene, 0x78), 0x00) != 3) {
            if (FIELD(u16, FIELD(void *, scene, 0x78), 0x0a) == selection) {
                FIELD(s32, scene, 0x6c) = category;
                break;
            }
            FIELD(u8 *, scene, 0x78) += 0x0c;
        }
    }

    if (selection == 0x503) {
        func_02071ee0((u8 *)scene + 0x54, data_020f4e18,
                      0x32c1, 0x32bb, 0x32c4);
    } else if (selection == 0x502) {
        func_02071ee0((u8 *)scene + 0x54, data_020f4e18,
                      0x32c1, 0x32bb, 0x32c3);
    } else if (selection == 0x501) {
        func_02071ee0((u8 *)scene + 0x54, data_020f4e18,
                      0x32c1, 0x32bb, 0x32c2);
    } else {
        func_02071ee0((u8 *)scene + 0x54, data_020f4e18,
                      0x32bd, 0x32bb, 0x32be);
    }

    FIELD(void *, scene, 0x60) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    markerX = FIELD(s16, FIELD(void *, scene, 0x78), 0x06)
              + func_ov046_0220b740(FIELD(s32, scene, 0x6c));
    markerY = FIELD(s16, FIELD(void *, scene, 0x78), 0x08)
              + func_ov046_0220b77c(FIELD(s32, scene, 0x6c));
    FIELD(void *, scene, 0x64) = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, scene, 0x60), (u8 *)scene + 0x54, 1);
    func_02073e48(FIELD(void *, scene, 0x64), 0, markerX, markerY, 0, 0, 4);

    panel = Heap_Alloc(0x118, data_ov046_0220cf3c, 4, gHeapContext);
    if (panel != 0) {
        panel = func_ov046_0220b7bc(panel, gDebugFont, 0);
    }
    FIELD(void *, scene, 0x70) = panel;

    auxiliary = Heap_Alloc(0x3c, data_ov046_0220cf44, 4, gHeapContext);
    if (auxiliary != 0) {
        auxiliary = func_02027fe8(auxiliary, gDebugFont);
    }
    FIELD(void *, scene, 0x74) = auxiliary;
    FIELD(u32, scene, 0x20) |= 0x400;
    func_ov046_0220c7b0(
        scene, data_ov046_0220ccf8.callback,
        data_ov046_0220ccf8.argument, 0);
    return scene;
}
