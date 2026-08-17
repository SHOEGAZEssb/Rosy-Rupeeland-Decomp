#include "tingle/types.h"

/* Overlay 34 scene teardown, render dispatch, callback invocation, and ticking. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define REG16(address) (*(volatile u16 *)(address))
#define REG32(address) (*(volatile u32 *)(address))

extern void *data_020f4e18[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsArchive_ReleaseOwlvResource(void *resourceContext, void *resource);
extern void Sound_ReleaseGroup(void *sound, s32 id);
extern void Graphics3DLightSet_Destroy(void *descriptorArray);
extern void func_ov034_021fce00(void *object);
extern void Heap_Free(void *allocation);
extern void Graphics3DSceneState_Apply(void *object);
extern void Graphics3DLight_Apply(void *descriptor, s32 index);
extern void func_ov034_021fd90c(s32 lightMask, s32 mode, s32 cullMode,
                               s32 polygonId, s32 alpha, s32 miscBits);
extern void func_ov034_021fd938(s32 format, s32 transform, s32 sizeS, s32 sizeT,
                               s32 repeatS, s32 repeatT, s32 flip, u32 address);
extern void func_ov034_021fce50(void *object);
extern void func_ov034_021fd6f4(void *owner);
#ifdef __cplusplus
}
#endif

typedef void (*Overlay034VoidMethod)(void *object);

/* Calls the deleting virtual at vtable +4 when an owned pointer is non-null. */
static void destroy_owned(void *object)
{
    if (object != 0)
        FIELD(Overlay034VoidMethod, FIELD(void *, object, 0), 4)(object);
}

/*
 * Tears down the constructed scene: invokes deleting virtuals for owner +0 and
 * every render item +8.. according to count +0x1B0, releases resource +4,
 * clears display-control bits selected by mask 0xCFEF at 0x04000060, stops
 * sound 0x1CD, and destroys descriptor array +0x170. Returns `scene`; heap,
 * resource, audio, descriptor, and direct display MMIO state change.
 */
extern "C" void *func_ov034_021fdda4(void *scene)
{
    destroy_owned(FIELD(void *, scene, 0));
    for (s32 i = 0; i < FIELD(s32, scene, 0x1b0); ++i)
        destroy_owned(FIELD(void *, scene, 8 + i * 4));
    GraphicsArchive_ReleaseOwlvResource(data_020f4e18[0], FIELD(void *, scene, 4));
    REG16(0x04000060) &= 0xcfef;
    Sound_ReleaseGroup(gSoundContext, 0x1cd);
    Graphics3DLightSet_Destroy((u8 *)scene + 0x170);
    return scene;
}

/*
 * Deleting base wrapper: invokes the empty base hook, frees `object`, and
 * returns its now-invalid original address. Heap state changes; no MMIO occurs.
 */
extern "C" void *func_ov034_021fde50(void *object)
{
    func_ov034_021fce00(object);
    Heap_Free(object);
    return object;
}

/*
 * Renders the scene according to mode +0x1BC. It resets GXSTAT, updates
 * display-control register 0x04000060 by clearing bits 0x3000 and setting bit
 * 0x10, then for mode 1 renders transform +0x48, all four descriptors +0x170,
 * installs polygon/texture attributes, and draws every scene item. Modes 1/2
 * both render transform +0xDC and the owner at +0. It finally flushes GX through
 * 0x04000448. Returns no value and has direct display/GX MMIO effects.
 */
extern "C" void func_ov034_021fde6c(void *scene)
{
    REG32(0x04000444) = 0;
    REG16(0x04000060) = (REG16(0x04000060) & (u16)~0x3000) | 0x10;
    s32 mode = FIELD(s32, scene, 0x1bc);
    if (mode == 1) {
        Graphics3DSceneState_Apply((u8 *)scene + 0x48);
        for (s32 i = 0; i < 4; ++i)
            Graphics3DLight_Apply((u8 *)scene + 0x170 + i * 0x10, i);
        func_ov034_021fd90c(1, 0, 2, 0x23, 0x1f, 0);
        func_ov034_021fd938(0, 0, 0, 0, 0, 0, 0, 0);
        for (s32 i = 0; i < FIELD(s32, scene, 0x1b0); ++i)
            func_ov034_021fce50(FIELD(void *, scene, 8 + i * 4));
    }
    if (mode == 1 || mode == 2) {
        Graphics3DSceneState_Apply((u8 *)scene + 0xdc);
        func_ov034_021fd6f4(FIELD(void *, scene, 0));
    }
    REG32(0x04000448) = 1;
}

/*
 * Invokes the two-word callback representation at +0x1C0/+0x1C4. The low bit
 * of +0x1C4 selects a vtable lookup; the remaining bits arithmetically halved
 * adjust `scene`. Returns no explicit value; callback side effects are opaque.
 */
extern "C" void func_ov034_021fdf6c(void *scene)
{
    s32 encoded = FIELD(s32, scene, 0x1c4);
    void *adjusted = (u8 *)scene + (encoded >> 1);
    Overlay034VoidMethod method;
    if (encoded & 1)
        method = FIELD(Overlay034VoidMethod, FIELD(void *, adjusted, 0),
                       FIELD(s32, scene, 0x1c0));
    else
        method = FIELD(Overlay034VoidMethod, scene, 0x1c0);
    method(adjusted);
}

/*
 * Calls virtual update method +8 on the owner and every render item selected by
 * count +0x1B0. Returns no value; each object's engine/render state may change,
 * with no direct MMIO in this dispatcher.
 */
extern "C" void func_ov034_021fdf98(void *scene)
{
    void *owner = FIELD(void *, scene, 0);
    FIELD(Overlay034VoidMethod, FIELD(void *, owner, 0), 8)(owner);
    for (s32 i = 0; i < FIELD(s32, scene, 0x1b0); ++i) {
        void *item = FIELD(void *, scene, 8 + i * 4);
        FIELD(Overlay034VoidMethod, FIELD(void *, item, 0), 8)(item);
    }
}
