#include "tingle/types.h"

/* Overlay 17 full scene teardown, including owned objects, graphics state, and embedded SDK components. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const u32 data_ov017_02201628[];
extern const u32 data_ov017_02201638[];
extern u8 data_ov017_02201754[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void GX_SetGraphicsMode(s32, s32, s32);
extern void func_020597fc(void *, s32);
extern void func_02071eb8(void *);
extern void GraphicsResourceSetVariant_Destroy(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void func_02075290(void *);
extern void Graphics3DResourceOwner_Destroy(void *);
extern void Graphics3DLightSet_Destroy(void *);
extern void Graphics3DRenderObject_Destroy(void *);
extern void func_020923a0(void *);
extern void func_02092418(void *);
extern void func_02092638(s32, s32, s32, s32);
extern void func_020926f8(void *);
extern void func_020927b8(void *);
extern void func_02095308(void *);
extern void *func_ov017_021fd780(void *);
extern void func_ov017_021fd948(void *);
extern void *func_ov017_021fe58c(void *);
#ifdef __cplusplus
}
#endif

/* Invoke virtual slot +4 on object when non-null. Ownership effects depend on
 * the concrete type; the helper returns void and performs no direct MMIO. */
static void destroyVirtual(void *object)
{
    if (object != 0) {
        typedef void (*Destructor)(void *);
        FIELD(Destructor *, object, 0)[1](object);
    }
}

/*
 * Tear down all owned scene resources in confirmed order. Install scene vtable
 * data_ov017_02201638, clear bit 10 at +0x20, destroy optional +0x260/+0x400,
 * stop sound 0x82, destroy global and embedded scheduler objects, and free the
 * separately allocated grid, eight-sprite pool, 2D sprite group, object +0x2BC,
 * and graphics object +0x240. Tear down the main renderer, restore graphics
 * mode/background state, then destroy every embedded resource/controller from
 * +0x404 down through +0x5C. Return state without freeing it. Heap, audio,
 * graphics, and SDK state change; graphics helpers may write hardware MMIO.
 */
extern "C" void *func_ov017_021ff16c(void *state)
{
    void *owned;

    FIELD(const u32 *, state, 0) = data_ov017_02201638;
    FIELD(u32, state, 0x20) &= ~0x400U;
    destroyVirtual(FIELD(void *, state, 0x260));
    func_020597fc(gSoundContext, 0x82);
    func_02095308(data_ov017_02201754);
    func_02095308((u8 *)state + 0x3d8);
    func_02095308((u8 *)state + 0x3ec);
    destroyVirtual(FIELD(void *, state, 0x400));

    if (FIELD(void *, state, 0x2c0) != 0)
        Heap_Free(FIELD(void *, state, 0x2c0));
    owned = FIELD(void *, state, 0x254);
    if (owned != 0) {
        func_ov017_021fe58c(owned);
        Heap_Free(owned);
    }
    owned = FIELD(void *, state, 0x25c);
    if (owned != 0) {
        GraphicsSpriteGroup_Destroy(FIELD(void *, owned, 0));
        func_02071eb8((u8 *)owned + 0x10);
        func_02071eb8((u8 *)owned + 4);
        Heap_Free(owned);
    }
    owned = FIELD(void *, state, 0x2bc);
    if (owned != 0) {
        Graphics3DRenderObject_Destroy(owned);
        Heap_Free(owned);
    }
    owned = FIELD(void *, state, 0x240);
    if (owned != 0) {
        Graphics3DResourceOwner_Destroy(owned);
        Heap_Free(owned);
    }

    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 0x58));
    func_02092418((u8 *)state + 0x404);
    func_02075290(data_020f4e14);
    GX_SetGraphicsMode(1, 0, 0);
    func_02092638(0, 1, 2, 3);
    func_020923a0((u8 *)state + 0x404);
    FIELD(const u32 *, state, 0x3ec) = data_ov017_02201628;
    func_02095308((u8 *)state + 0x3ec);
    FIELD(const u32 *, state, 0x3d8) = data_ov017_02201628;
    func_02095308((u8 *)state + 0x3d8);
    Graphics3DLightSet_Destroy((u8 *)state + 0x2d0);
    func_ov017_021fd780((u8 *)state + 0x290);
    func_ov017_021fd780((u8 *)state + 0x264);
    GraphicsResourceSetVariant_Destroy((u8 *)state + 0x248);
    func_020926f8((u8 *)state + 0x1fc);
    func_020927b8((u8 *)state + 0x1d8);
    func_ov017_021fd948((u8 *)state + 0x12c);
    func_ov017_021fd948((u8 *)state + 0x80);
    func_02071eb8((u8 *)state + 0x74);
    func_02071eb8((u8 *)state + 0x68);
    func_02071eb8((u8 *)state + 0x5c);
    return state;
}

/*
 * Deleting variant of 0x021FF16C. Perform the identical ordered teardown, free
 * the containing scene object, and return its original pointer value. All side
 * effects are those documented for the non-deleting destructor plus heap
 * release; the returned address is no longer valid.
 */
extern "C" void *func_ov017_021ff354(void *state)
{
    func_ov017_021ff16c(state);
    Heap_Free(state);
    return state;
}
