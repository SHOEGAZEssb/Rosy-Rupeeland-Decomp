#include "tingle/types.h"

/*
 * Overlay 39 variant-specific scene asset setup. These recovered routines
 * create fifteen archive-backed objects, place eleven of them, and delegate
 * the remaining shared scene initialization to func_ov039_021fd438.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov039_022083b0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0209a208(void *scene, s32 firstId, s32 secondId,
                           s32 thirdId, void *argument, s32 mode);
extern void func_ov039_021fd7f0(void *scene, void *object, s32 x, s32 y,
                                u32 orientation, u32 enabled);
extern void func_ov039_021fd438(void *scene, void *argument);
#ifdef __cplusplus
}
#endif

static void setupVariant(void *scene, void *argument, s32 alternate)
{
    if (FIELD(u16, scene, 0x1cb2) > 1) {
        return;
    }

    /* Eight mirrored objects share IDs 0x1282/0x1283; the middle ID differs. */
    s32 middleId = alternate ? 0x1289 : 0x1275;
    for (s32 i = 0; i < 8; i++) {
        void *object = func_0209a208(scene, 0x1282, middleId, 0x1283,
                                     argument, 1);
        FIELD(void *, scene, 0x4c + i * 4) = object;
        s32 x = i < 4 ? 0x35000 : -0x33000;
        u32 orientation = (i == 0 || i == 4) ? 0 : 2;
        func_ov039_021fd7f0(scene, object, x, 0x1d000, orientation, 1);
    }

    /* Two unplaced objects use mode 2 and are retained at +0x6C/+0x70. */
    middleId = alternate ? 0x128a : 0x1278;
    FIELD(void *, scene, 0x6c) =
        func_0209a208(scene, 0x1277, middleId, 0x1279, argument, 2);
    FIELD(void *, scene, 0x70) =
        func_0209a208(scene, 0x1277, middleId, 0x1279, argument, 2);

    /* Three centered objects use table-provided vertical coordinates. */
    middleId = alternate ? 0x1286 : 0x126f;
    for (s32 i = 0; i < 3; i++) {
        void *object = func_0209a208(scene, 0x126e, middleId, 0x1270,
                                     argument, 1);
        FIELD(void *, scene, 0x74 + i * 4) = object;
        u32 orientation = 1 - ((i + ((u32)i >> 31)) >> 1);
        func_ov039_021fd7f0(scene, object, 0, data_ov039_022083b0[i],
                            orientation & 0xff, 1);
    }
    func_ov039_021fd438(scene, argument);
}

/*
 * Configure the baseline asset set, using middle resource IDs 0x1275,
 * 0x1278, and 0x126F. Inputs are scene and the opaque loader argument passed
 * to every object creation. Returns no value; object slots +0x4C..+0x7C,
 * placement state, heap/resource state, and shared scene setup change. Scenes
 * with variant halfword +0x1CB2 greater than one are ignored.
 */
extern "C" void func_ov039_021fd070(void *scene, void *argument)
{
    setupVariant(scene, argument, 0);
}

/*
 * Configure the alternate asset set. Behavior matches func_ov039_021fd070,
 * but middle resource IDs are 0x1289, 0x128A, and 0x1286. Returns no value and
 * has the same object/resource/placement effects and +0x1CB2 guard.
 */
extern "C" void func_ov039_021fd254(void *scene, void *argument)
{
    setupVariant(scene, argument, 1);
}
