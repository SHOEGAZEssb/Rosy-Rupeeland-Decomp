#include "tingle/types.h"

/*
 * Overlay 39 full scene teardown and object placement. These recovered helpers
 * release the constructor's nested allocations/arrays and configure individual
 * scene objects' render flag, position, scale, orientation, and enable byte.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*Overlay039ArrayFn)(void *element);

extern const u8 data_ov039_022083d0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *allocation);
extern void func_02005058(void *object);
extern void __destroy_arr(void *array, s32 count, s32 stride,
                          Overlay039ArrayFn destructor);
extern void func_ov039_021fce5c(void);
extern void *func_ov039_021fd01c(void *object);
extern void func_02099fb0(void *scene);
extern void GraphicsSpriteState_SetAnimationIndex(void *renderObject, u8 orientation);
#ifdef __cplusplus
}
#endif

/*
 * Reinstall the scene vtable and free all thirty optional helper allocations
 * at +0xA0..+0x114 in descending order. Destroy +0x1DA0, then arrays +0x1D18
 * (10x12, no-op destructor), +0x158C and +0xB00 (90x16 SDK destructor), and
 * +0x6B0/+0x458 (50x12 no-op destructor). Tear down embedded object +0x118
 * through func_ov039_021fd01c, finalize the scene through func_02099fb0, and
 * return scene without freeing it. Heap, embedded SDK, array, and scene state
 * change in that confirmed order.
 */
extern "C" void *func_ov039_021fd71c(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov039_022083d0;
    for (s32 i = 29; i >= 0; i--) {
        void *helper = FIELD(void *, scene, 0xa0 + i * 4);
        if (helper != 0) {
            Heap_Free(helper);
        }
    }
    func_02005058((u8 *)scene + 0x1da0);
    __destroy_arr((u8 *)scene + 0x1d18, 10, 12,
                  (Overlay039ArrayFn)func_ov039_021fce5c);
    __destroy_arr((u8 *)scene + 0x158c, 90, 16, func_02005058);
    __destroy_arr((u8 *)scene + 0xb00, 90, 16, func_02005058);
    __destroy_arr((u8 *)scene + 0x6b0, 50, 12,
                  (Overlay039ArrayFn)func_ov039_021fce5c);
    __destroy_arr((u8 *)scene + 0x458, 50, 12,
                  (Overlay039ArrayFn)func_ov039_021fce5c);
    func_ov039_021fd01c((u8 *)scene + 0x118);
    func_02099fb0(scene);
    return scene;
}

/*
 * Configure object using x/y fixed-point coordinates and two stack-passed
 * bytes. The first byte is forwarded to GraphicsSpriteState_SetAnimationIndex for the render object at
 * object +0x0C. Set bit 1 in that render object's +0x24 halfword, store the
 * second byte at its +0x3A, write position (x,y,0) at object +0x30, and reset
 * scale/rotation halfwords to (0x100,0x100,0). The scene input is unused.
 * Returns no value; object and renderer state change.
 */
extern "C" void func_ov039_021fd7f0(void *scene, void *object, s32 x, s32 y,
                                     u8 orientation, u8 enabled)
{
    (void)scene;
    void *renderObject = FIELD(void *, object, 0x0c);
    GraphicsSpriteState_SetAnimationIndex(renderObject, orientation);
    FIELD(u16, renderObject, 0x24) |= 2;
    FIELD(u8, renderObject, 0x3a) = enabled;
    FIELD(s32, object, 0x30) = x;
    FIELD(s32, object, 0x34) = y;
    FIELD(s32, object, 0x38) = 0;
    FIELD(u16, object, 0x3c) = 0x100;
    FIELD(u16, object, 0x3e) = 0x100;
    FIELD(u16, object, 0x40) = 0;
}
