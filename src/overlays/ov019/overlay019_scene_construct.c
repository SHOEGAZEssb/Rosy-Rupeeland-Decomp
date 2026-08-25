#include "tingle/types.h"

/* Overlay 19 scene construction and overlay-2 presentation ownership setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *gDebugFont;
extern void *gGameWork;
extern u8 gHeapContext[];
extern const s32 data_ov019_021fd5f8[2];
extern const u8 data_ov019_021fd64c[];
extern const u32 data_ov019_021fd638[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *, u32);
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void SceneInputBase_Init(void *);
extern void *Overlay002_Presentation_Init(void *, void *, s32);
extern void func_ov019_021fce00(void *, s32, s32, s32);
extern void Overlay019_SetupGraphics(void *);
#ifdef __cplusplus
}
#endif

/*
 * Construct the scene with caller context +0x54 and mode/object +0x58. Run the
 * inherited initializer, install vtable data_ov019_021FD638, commit the main
 * resource and debug font, configure display resources, clear +0x60, allocate
 * the 0xB4-byte overlay-2 presentation at +0x5C and construct it with either
 * data_020F4E14 (mode null) or gDebugFont (mode nonnull), using initial value
 * zero. Clear GameWork flag 0x390, set scene flag bit 10, install transition
 * pair data_ov019_021FD5F8, and return state. Heap, GameWork, resource, graphics,
 * and presentation state change; display setup performs Nintendo DS MMIO.
 */
extern "C" void *func_ov019_021fce28(void *state, void *context, void *mode)
{
    SceneInputBase_Init(state);
    FIELD(const u32 *, state, 0) = data_ov019_021fd638;
    FIELD(void *, state, 0x54) = context;
    FIELD(void *, state, 0x58) = mode;
    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    Overlay019_SetupGraphics(state);
    FIELD(s32, state, 0x60) = 0;

    void *presentation =
        Heap_Alloc(0xb4, data_ov019_021fd64c, 4, gHeapContext);
    if (presentation != 0)
        presentation = Overlay002_Presentation_Init(
            presentation, mode == 0 ? data_020f4e14 : gDebugFont, 0);
    FIELD(void *, state, 0x5c) = presentation;

    GameWork_ClearFlag(gGameWork, 0x390);
    FIELD(u32, state, 0x20) |= 0x400;
    func_ov019_021fce00(state, data_ov019_021fd5f8[0],
                        data_ov019_021fd5f8[1], 0);
    return state;
}
