#include "tingle/types.h"

/*
 * Overlay 39 large scene-object construction. The recovered constructor builds
 * embedded base/resource/helper systems, clears its address-derived runtime
 * fields, selects one of two setup paths, and allocates thirty helper pairs.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*Overlay039ArrayFn)(void *element);

extern const u8 data_ov039_022083d0[];
extern const u8 data_ov039_02208404[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov039_021fce00(void *object);
extern void func_ov069_0220fd40(void *object);
extern void func_ov049_0220c124(void *object);
extern void func_ov069_022109c4(void *object);
extern void __construct_array(void *array, s32 count, s32 stride,
                              Overlay039ArrayFn constructor,
                              Overlay039ArrayFn destructor);
extern void func_ov039_021fce40(void *helper);
extern void func_ov039_021fce5c(void);
extern void func_02004fe0(void *object);
extern void func_ov039_021fd070(void *scene, void *argument);
extern void func_ov039_021fd254(void *scene, void *argument);
extern void *Heap_Alloc(s32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov039_021fce60(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Construct a scene from three caller values: owner/context is stored at
 * +0x48/+0x118/+0xAFC, the second value is forwarded to the selected setup
 * path, and the low halfword of the third is stored at +0x1CB2 and selects
 * func_ov039_021fd070 (zero) or func_ov039_021fd254 (nonzero). The helper
 * initializes embedded systems at +0x118/+0x454/+0xAFC, constructs ten
 * 12-byte records at +0x1D18, initializes +0x1D90/+0x1DA0, and clears the
 * numerous confirmed offset fields used by scene state. Position starts at
 * fixed-point (0x200000,0x118000,0), scale at (0x100,0x100), and +0x1CA8 is
 * 30. Finally allocate thirty 0x20-byte paired helpers into +0xA0..+0x114,
 * leaving null on allocation failure. Returns scene; heap and embedded SDK/
 * overlay subsystem state change. Field semantics beyond these uses remain
 * intentionally address-derived.
 */
extern "C" void *func_ov039_021fce84(void *scene, void *owner,
                                      void *setupArgument, u32 variant)
{
    func_ov039_021fce00(scene);
    FIELD(const void *, scene, 0) = data_ov039_022083d0;
    func_ov069_0220fd40((u8 *)scene + 0x118);
    func_ov049_0220c124((u8 *)scene + 0x454);
    func_ov069_022109c4((u8 *)scene + 0xafc);
    __construct_array((u8 *)scene + 0x1d18, 10, 12,
                      func_ov039_021fce40,
                      (Overlay039ArrayFn)func_ov039_021fce5c);
    func_ov039_021fce40((u8 *)scene + 0x1d90);
    func_02004fe0((u8 *)scene + 0x1da0);

    FIELD(void *, scene, 0x48) = owner;
    FIELD(void *, scene, 0x118) = owner;
    FIELD(void *, scene, 0xafc) = owner;
    FIELD(u16, scene, 0x1ca8) = 30;
    FIELD(u16, scene, 0x1cb2) = (u16)variant;
    FIELD(u16, scene, 0x1c94) = 0;
    FIELD(u16, scene, 0x1c96) = 0;
    FIELD(u16, scene, 0x1ca0) = 0;
    FIELD(u32, scene, 0x1c98) = 0;
    FIELD(u32, scene, 0x1c9c) = 0;
    FIELD(u16, scene, 0x1caa) = 0;
    FIELD(u16, scene, 0x1cac) = 0;
    FIELD(u16, scene, 0x1cae) = 0;
    FIELD(u32, scene, 0x1db0) = 0;
    FIELD(u16, scene, 0x1cb4) = 0;
    FIELD(u16, scene, 0x1cb8) = 0;
    FIELD(u16, scene, 0x1cb6) = 0;
    FIELD(u16, scene, 0x1cba) = 0;
    FIELD(u32, scene, 0x1ca4) = 0;
    FIELD(u16, scene, 0x1cc2) = 0;
    FIELD(u16, scene, 0x1cc0) = 0;
    FIELD(u16, scene, 0x1cbe) = 0;
    FIELD(u16, scene, 0x1d9c) = 0;
    FIELD(s32, scene, 0x30) = 0x200000;
    FIELD(s32, scene, 0x34) = 0x118000;
    FIELD(s32, scene, 0x38) = 0;
    FIELD(u16, scene, 0x3c) = 0x100;
    FIELD(u16, scene, 0x3e) = 0x100;
    FIELD(u16, scene, 0x40) = 0;
    FIELD(u32, scene, 0x1d98) = 0;
    FIELD(u32, scene, 0x1d94) = 0;

    if (FIELD(u16, scene, 0x1cb2) == 0) {
        func_ov039_021fd070(scene, setupArgument);
    } else {
        func_ov039_021fd254(scene, setupArgument);
    }
    for (s32 i = 29; i >= 0; i--) {
        void *helper = Heap_Alloc(0x20, data_ov039_02208404, 4, gHeapContext);
        if (helper != 0) {
            func_ov039_021fce60(helper);
        }
        FIELD(void *, scene, 0xa0 + i * 4) = helper;
    }
    return scene;
}
