#include "tingle/types.h"

/* Overlay 30 board-result commit, return-to-menu state, and terminal callbacks. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14[];
extern void *gDebugFont;
extern const s32 data_ov030_021ff790[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_ov030_021fea00(void *);
extern void func_02092c8c(s32, s32, ...);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void func_02064e7c(void *, s32, u16);
extern void *func_ov030_021fd27c(void *);
extern void Heap_Free(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void func_ov030_021fe808(void *);
extern void func_ov030_021feb0c(void *);
extern void func_ov030_021fda14(void *, s32, s32);
extern void func_ov030_021fe768(void *);
#ifdef __cplusplus
}
#endif

/*
 * Board-exit handler. State 0 starts record transition (1,-16) and falls through
 * to state 1. Once the transition completes, it subtracts widget remaining value
 * +0x1B4 from the selected catalog count +0x384 or +0x38C, commits the truncated
 * 16-bit result through 0x02064E7C, destroys/frees widget +0x2C4, clears renderer
 * and debug-font canvases, disables board display bits 0/1, refreshes persistent
 * counts and menu sprites, reopens the count-dependent dialog, begins transition
 * (1,0), and targets coordinates 0x021FF790. Always services dialog input/frame
 * update and returns zero; catalog, heap, canvas, graphics, dialog, and scene
 * state change.
 */
extern "C" s32 func_ov030_021ff5a4(void *scene)
{
    (void)func_ov030_021fea00(scene);
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_02092c8c(1, -16);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* Recovered control flow intentionally continues into state 1. */
    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0) {
            void *board = FIELD(void *, scene, 0x2c4);
            s32 mode = FIELD(s32, scene, 0x390);
            s32 count = mode == 1 ? FIELD(s32, scene, 0x384)
                                  : FIELD(s32, scene, 0x38c);
            s32 index = mode == 1 ? FIELD(s32, scene, 0x380)
                                  : FIELD(s32, scene, 0x388);
            u16 remaining = (u16)(count - FIELD(s32, board, 0x1b4));
            func_02064e7c(FIELD(void *, scene, 0x37c), index, remaining);
            if (board != 0) {
                func_ov030_021fd27c(board);
                Heap_Free(board);
            }
            FIELD(void *, scene, 0x2c4) = 0;
            GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14[0]);
            GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
            FIELD(u32, scene, 0x48) &= ~3;
            func_ov030_021fe808(scene);
            FIELD(s32, FIELD(void *, scene, 0x78), 0x20) = 1;
            func_ov030_021feb0c(scene);
            func_02092c8c(1, 0);
            func_ov030_021fda14(scene, data_ov030_021ff790[0],
                                data_ov030_021ff790[1]);
        }
        break;
    }
    func_ov030_021fe768(scene);
    return 0;
}

/*
 * Terminal scene callback: services the normal frame once and returns 1 to its
 * caller. Scene/child/palette state may change through 0x021FE768.
 */
extern "C" s32 func_ov030_021ff6e4(void *scene)
{
    func_ov030_021fe768(scene);
    return 1;
}

/*
 * Frees `scene` and returns its original pointer value, matching the recovered
 * ABI. Heap state changes and the returned pointer is dangling.
 */
extern "C" void *func_ov030_021ff6f4(void *scene)
{
    Heap_Free(scene);
    return scene;
}
