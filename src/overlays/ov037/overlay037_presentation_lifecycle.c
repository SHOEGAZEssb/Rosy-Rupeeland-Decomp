#include "tingle/types.h"

/* Overlay 37 top-level presentation resource release and deleting thunk. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG16(address) (*(volatile u16 *)(address))

typedef void (*Overlay037DeleteFn)(void *object);

extern const u8 data_ov037_021fee94[];
extern void *data_020f4e14[];
extern void *gDebugFont[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DResourceOwner_Destroy(void *owner);
extern void Heap_Free(void *allocation);
extern void func_02075020(void *resource);
extern void func_02092418(void *camera);
extern void GX_SetGraphicsMode(s32 displayMode, s32 bgMode, s32 bg0As3D);
extern void func_ov048_0220b7b4(void *state);
extern void func_020923a0(void *camera);
#ifdef __cplusplus
}
#endif

/*
 * Reinstalls the presentation vtable, clears active flag 0x400, deletes the
 * main scene at +0x5C through vtable slot +4, destroys/frees resource owner
 * +0x58, releases shared graphics and debug-font resources, tears down the
 * camera, resets display mode and both brightness registers, then releases
 * the +0x94 subsystem. Returns presentation without freeing it. Heap, shared
 * resources, display hardware, and camera/graphics state change.
 */
extern "C" void *func_ov037_021fe648(void *presentation)
{
    FIELD(const void *, presentation, 0) = data_ov037_021fee94;
    FIELD(u32, presentation, 0x20) &= ~0x400u;
    void *scene = FIELD(void *, presentation, 0x5c);
    if (scene != 0) {
        Overlay037DeleteFn *vtable = FIELD(Overlay037DeleteFn *, scene, 0);
        vtable[1](scene);
    }
    void *owner = FIELD(void *, presentation, 0x58);
    if (owner != 0) {
        Graphics3DResourceOwner_Destroy(owner);
        Heap_Free(owner);
    }
    func_02075020(data_020f4e14[0]);
    func_02075020(gDebugFont[0]);
    func_02092418((u8 *)presentation + 0x60);
    GX_SetGraphicsMode(1, 0, 0);
    REG16(0x04000050) = 0;
    REG16(0x04001050) = 0;
    func_ov048_0220b7b4((u8 *)presentation + 0x94);
    func_020923a0((u8 *)presentation + 0x60);
    return presentation;
}

/*
 * Frees presentation and returns its former address for ABI compatibility.
 * It assumes non-deleting teardown already ran; only heap state changes.
 */
extern "C" void *func_ov037_021fe704(void *presentation)
{
    Heap_Free(presentation);
    return presentation;
}
