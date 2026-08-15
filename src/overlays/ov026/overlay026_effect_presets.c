#include "tingle/types.h"

/* Overlay 26 fixed position/control presets for composite companion effects. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void PresentationScalar_SetImmediate(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Writes `composite_y` to composite +0x160 control +0x1C and `mesh_y` to mesh
 * child +0x164 control +0x1C, then sets that child's +0x6C and +0xB8 values to
 * 0x6000. The middle input parameter is intentionally unused. Returns void.
 */
extern "C" void func_ov026_022013c0(void *scene, s32 composite_y,
                                      s32 mesh_y)
{
    PresentationScalar_SetImmediate((u8 *)FIELD(void *, scene, 0x160) + 0x1c, composite_y);
    void *mesh = FIELD(void *, scene, 0x164);
    PresentationScalar_SetImmediate((u8 *)mesh + 0x1c, mesh_y);
    PresentationScalar_SetImmediate((u8 *)mesh + 0x6c, 0x6000);
    FIELD(s32, mesh, 0xb8) = 0x6000;
}

/*
 * Applies the ring/effect child +0x168 preset: control +0x1C=-0x5000,
 * +0x6C=0x4000, and cached value +0xB4=0x4000. Returns void.
 */
extern "C" void func_ov026_02201400(void *scene)
{
    void *effect = FIELD(void *, scene, 0x168);
    PresentationScalar_SetImmediate((u8 *)effect + 0x1c, -0x5000);
    PresentationScalar_SetImmediate((u8 *)effect + 0x6c, 0x4000);
    FIELD(s32, effect, 0xb4) = 0x4000;
}
