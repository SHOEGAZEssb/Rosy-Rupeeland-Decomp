#include "tingle/types.h"

/* Overlay 25 transient confirmation and runtime-result dispatch state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov025_02202e58[];
extern const u8 data_ov025_02202e80[];
extern const u8 data_ov025_02202ed0[];
extern void *gRuntimeContext;

typedef struct TransitionPair {
    u32 callback;
    u32 argument;
} TransitionPair;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0207f248(void *);
extern void func_0207ff90(void *, s32, s32);
extern void func_02092260(void *, s32);
extern void func_ov025_021ff254(void *, TransitionPair);
extern void func_ov025_02200178(void *);
extern void func_ov025_02200224(void *, s32, void *);
extern void func_ov025_022002f8(void *);
extern void func_ov025_02200438(void *, s32);
extern void func_ov025_02200468(void *);
extern s32 func_ov025_02200480(void *);
#ifdef __cplusplus
}
#endif

/*
 * Runs one frame of a three-state confirmation flow. It creates a transient
 * sprite, starts runtime work for selected row +0x54, dispatches failure result
 * 3 or 5 to modal 0x1D or 0x1E, and on successful completion emits UI command
 * 0x2D03 before selecting the next callback pair. Always maintains the scene
 * and returns zero; runtime, sprite, modal, and UI state may change.
 */
extern "C" s32 func_ov025_02201348(void *scene)
{
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_ov025_022002f8(scene);
        func_0207ff90(gRuntimeContext, FIELD(s32, scene, 0x54), 1);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* Setup intentionally falls through to the first runtime poll. */
    case 1: {
        s32 status = func_0207f248(gRuntimeContext);
        if (status == 0)
            break;
        if (status == -1) {
            func_ov025_02200438(scene, 1);
            s32 result = FIELD(s32, gRuntimeContext, 0x10);
            if (result == 3) {
                func_ov025_02200224(scene, 0x1d, 0);
                func_ov025_021ff254(scene,
                    *(const TransitionPair *)data_ov025_02202e58);
            } else if (result == 5) {
                func_ov025_02200224(scene, 0x1e, 0);
                func_ov025_021ff254(scene,
                    *(const TransitionPair *)data_ov025_02202ed0);
            }
        } else {
            func_ov025_02200468(scene);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 2:
        if (func_ov025_02200480(scene)) {
            func_02092260(scene, 0x2d03);
            func_ov025_021ff254(scene,
                *(const TransitionPair *)data_ov025_02202e80);
        }
        break;
    }
    func_ov025_02200178(scene);
    return 0;
}
