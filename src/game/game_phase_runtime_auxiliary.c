#include "tingle/game_phase_runtime.h"
#include "tingle/heap.h"

/*
 * Replace the area-dependent auxiliary overlay object at runtime offset 0x30ec.
 * The retail hardware/overlay schedule is retained in matching assembly.
 */

extern u8 data_020d4370[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GX_VBlankIntr(s32 enabled);
extern void func_ov056_0220e79c(void *object);
extern void func_02012528(void *actor, void *object);
extern s32 func_0202844c(void *area);
extern s32 func_020022dc(void);
extern void func_0200222c(s32 overlay, s32 mode, s32 mask);
extern s32 func_0202852c(s32 variant);
extern void *func_ov054_0220e400(void *object, s32 variant, s32 enabled);
extern void func_ov056_0220f054(void *object, const void *value);
#ifdef __cplusplus
}
#endif

/*
 * Disable VBlank handling, destroy/free the current auxiliary object at
 * 0x30ec, and detach it from the optional actor. For eligible orientation-one
 * areas, clear sub-display mode bit 3, load overlay mask 0x38, allocate and
 * construct a tagged 0x8ac-byte replacement, attach it, and provide scaled
 * area data from func_02008b6c. VBlank handling is always re-enabled. Returns
 * no value; display-register, overlay, heap, and interrupt effects are ordered.
 */
void func_02008bb8(GamePhaseRuntime *self, void *area, s32 enabled)
{
    u8 *b = (u8 *)self;
    void *object;
    s32 variant;
    u8 areaValue[12];

    GX_VBlankIntr(0);
    object = *(void **)(b + 0x30ec);
    if (object != 0) {
        func_ov056_0220e79c(object);
        Heap_Free(object);
        *(void **)(b + 0x30ec) = 0;
        func_02012528(*(void **)(b + 0x2fb8), 0);
    }

    if (((*(u32 *)((u8 *)area + 0x40) << 12) >> 30) == 1 &&
        func_0202844c(area)) {
        volatile u32 *subDisplay = (volatile u32 *)0x04001000;
        u32 mode = (*subDisplay & 0x1f00) >> 8;
        *subDisplay = (*subDisplay & ~0x1f00) | ((mode & ~8) << 8);
        func_0200222c(func_020022dc(), 1, 0x38);
        variant = func_0202852c(*(s8 *)((u8 *)area + 0x4c));
        object = Heap_Alloc(0x8ac, (const char *)data_020d4370, 4,
                            &gHeapContext);
        if (object != 0)
            object = func_ov054_0220e400(object, variant, enabled);
        *(void **)(b + 0x30ec) = object;
        func_02012528(*(void **)(b + 0x2fb8), object);
        func_02008b6c(areaValue, self, area);
        func_ov056_0220f054(*(void **)(b + 0x30ec), areaValue);
    }
    GX_VBlankIntr(1);
}
