#include "tingle/types.h"

/* Overlay 35 top-level presentation teardown and display-state maintenance. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*Destructor)(void *);

extern const u8 data_ov035_02203bb4[];
extern void *data_020f4e14[];
extern void *gDebugFont[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Graphics3DResourceOwner_Destroy(void *owner);
extern void Heap_Free(void *allocation);
extern void GraphicsSpriteRenderer_Resume(void *resource);
extern void GraphicsBankStateSnapshot_Restore(void *state);
extern void GX_SetGraphicsMode(s32 mode, s32 bgMode, s32 bg0Mode);
extern void SoundPhaseManager_Update(void *soundContext, s32 first, s32 second);
extern void func_ov048_0220b7b4(void *state);
extern void GraphicsBankStateSnapshot_Destroy(void *state);
extern void GraphicsResourceSetVariant_Destroy(void *state);
extern void func_ov048_0220ba90(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Performs common top-level presentation teardown. It clears flag 0x400,
 * invokes child +0x60's vtable slot +4 when present, destroys/frees resource
 * owner +0x5C, releases both global resource/font handles, tears down embedded
 * state +0x64/+0x98, resets graphics mode to (1,0,0), clears halfword registers
 * 0x04000050 and 0x04001050, and stops/resets sound through SoundPhaseManager_Update(0,0).
 * Returns object without freeing its storage; heap, resources, sound, renderer,
 * and display hardware state change.
 */
static void *teardown_presentation(void *object)
{
    FIELD(const void *, object, 0) = data_ov035_02203bb4;
    FIELD(s32, object, 0x20) &= ~0x400;
    void *child = FIELD(void *, object, 0x60);
    if (child != 0) {
        Destructor *vtable = FIELD(Destructor *, child, 0);
        vtable[1](child);
    }
    void *owner = FIELD(void *, object, 0x5c);
    if (owner != 0) {
        Graphics3DResourceOwner_Destroy(owner);
        Heap_Free(owner);
    }
    GraphicsSpriteRenderer_Resume(data_020f4e14[0]);
    GraphicsSpriteRenderer_Resume(gDebugFont[0]);
    GraphicsBankStateSnapshot_Restore((u8 *)object + 0x64);
    GX_SetGraphicsMode(1, 0, 0);
    *(volatile u16 *)0x04000050 = 0;
    *(volatile u16 *)0x04001050 = 0;
    SoundPhaseManager_Update(gSoundContext, 0, 0);
    func_ov048_0220b7b4((u8 *)object + 0x98);
    GraphicsBankStateSnapshot_Destroy((u8 *)object + 0x64);
    return object;
}

/*
 * Tears down the top-level presentation and returns its still-allocated address.
 * Inputs and effects are described by teardown_presentation.
 */
extern "C" void *func_ov035_022026ac(void *object)
{
    return teardown_presentation(object);
}

/*
 * Constructor-failure cleanup for an object containing resource state +0xCC.
 * It destroys that state, frees the object, and returns the original now-invalid
 * address. The narrow ownership role is inferred from placement; operations are
 * confirmed. Heap and resource state change.
 */
extern "C" void *func_ov035_0220277c(void *object)
{
    GraphicsResourceSetVariant_Destroy((u8 *)object + 0xcc);
    Heap_Free(object);
    return object;
}

/*
 * Performs full top-level teardown, frees the presentation allocation, and
 * returns the original now-invalid address to preserve the binary ABI. Heap,
 * resources, sound, renderer, and display hardware state change.
 */
extern "C" void *func_ov035_0220279c(void *object)
{
    teardown_presentation(object);
    Heap_Free(object);
    return object;
}

/*
 * Updates display state only while flag 0x400 is set in field +0x20. It advances
 * embedded renderer +0x98, then replaces bits 8..12 of main DISPCNT at
 * 0x04000000 with field +0x48 shifted by eight. Always returns 0; embedded
 * renderer and display hardware state may change.
 */
extern "C" s32 func_ov035_02202874(void *object)
{
    if ((FIELD(s32, object, 0x20) & 0x400) != 0) {
        func_ov048_0220ba90((u8 *)object + 0x98);
        volatile u32 *displayControl = (volatile u32 *)0x04000000;
        *displayControl = (*displayControl & ~0x1f00) |
                          (FIELD(s32, object, 0x48) << 8);
    }
    return 0;
}
