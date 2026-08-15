#include "tingle/types.h"

/* Overlay 22 moving sprite objects and the small randomized emitter that owns them. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov022_02200654[];
extern const u8 data_ov022_02200684[];
extern void *data_020f4e18;
extern void *gDebugFont;

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void func_02091b6c(void *);
extern void Presentation_AdvanceTransitions(void *);
extern void PresentationList_DeleteAll(void *);
extern void SpritePresentation_InitVariant(void *, void *);
extern void SpritePresentation_Destroy(void *);
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

extern "C" s32 func_ov022_021fceb0(const void *object);

/*
 * Constructs a 0xA4-byte moving sprite object in caller-provided storage.
 * The second argument is forwarded to the SDK/base constructor, the third is
 * retained at +0xA0, the overlay vtable is installed, and +0x88 is enabled.
 * Object state changes; no allocation occurs here. Returns the input object.
 */
extern "C" void *func_ov022_021fce00(void *object, void *resource, s32 variant)
{
    SpritePresentation_InitVariant(object, resource);
    FIELD(const void *, object, 0) = data_ov022_02200684;
    FIELD(s32, object, 0xa0) = variant;
    FIELD(s32, object, 0x88) = 1;
    return object;
}

/*
 * Runs the moving sprite's non-freeing base destructor. The object is passed
 * to SDK cleanup and returned; owned storage is not released.
 */
extern "C" void *func_ov022_021fce30(void *object)
{
    SpritePresentation_Destroy(object);
    return object;
}

/*
 * Runs the owning moving-sprite destructor. It performs SDK cleanup, frees the
 * object allocation, and returns the now-invalid pointer for ABI parity.
 */
extern "C" void *func_ov022_021fce44(void *object)
{
    SpritePresentation_Destroy(object);
    Heap_Free(object);
    return object;
}

/*
 * Advances one moving sprite. The SDK motion update modifies fixed-point
 * coordinates +0x10/+0x20; their integer portions are copied to halfwords
 * +0x2C/+0x2E in sprite +0x9C. Returns one once elapsed +0x80 reaches duration
 * +0x7C, otherwise zero. Sprite/OAM-facing state changes through the SDK.
 */
extern "C" s32 func_ov022_021fce60(void *object)
{
    Presentation_AdvanceTransitions(object);
    s32 x = FIELD(s32, object, 0x10);
    s32 y = FIELD(s32, object, 0x20);
    /* Bias negative 20.12 values so the shift truncates toward zero. */
    s32 ix = (x + ((x >> 11) >> 20)) >> 12;
    s32 iy = (y + ((y >> 11) >> 20)) >> 12;
    void *sprite = FIELD(void *, object, 0x9c);
    FIELD(u16, sprite, 0x2c) = (u16)ix;
    FIELD(u16, sprite, 0x2e) = (u16)iy;
    return func_ov022_021fceb0(object) != 0;
}

/*
 * Tests whether moving-sprite elapsed value +0x80 has reached duration +0x7C.
 * The object is read only and the result is one when complete, zero otherwise.
 */
extern "C" s32 func_ov022_021fceb0(const void *object)
{
    return FIELD(s32, object, 0x80) >= FIELD(s32, object, 0x7c);
}

/*
 * Initializes the emitter's embedded controller at the supplied address. It
 * installs vtable 0x02200654 and clears +4/+8/+C. Returns no value and performs
 * no allocation or direct hardware access.
 */
extern "C" void func_ov022_021fcec8(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov022_02200654;
    FIELD(s32, controller, 4) = 0;
    FIELD(s32, controller, 8) = 0;
    FIELD(s32, controller, 0xc) = 0;
}

/*
 * Destroys an embedded emitter controller without freeing its storage. It
 * restores vtable 0x02200654, invokes SDK controller cleanup, and returns the
 * input address.
 */
extern "C" void *func_ov022_021fcee8(void *controller)
{
    FIELD(const void *, controller, 0) = data_ov022_02200654;
    PresentationList_DeleteAll(controller);
    return controller;
}

/*
 * Constructs the randomized sprite emitter. It initializes font resource +4,
 * two interpolation objects at +0x10/+0x2C, controller +0x48, seeds +0x64,
 * acquires the debug-font handle at +0, loads resource IDs 0x1714..0x1716,
 * and clears counters +0x58/+0x5C. SDK/resource state changes; storage is
 * caller-owned and returned.
 */
extern "C" void *func_ov022_021fcf08(void *emitter)
{
    func_02071ea4((u8 *)emitter + 4);
    func_02091b6c((u8 *)emitter + 0x10);
    func_02091b6c((u8 *)emitter + 0x2c);
    func_ov022_021fcec8((u8 *)emitter + 0x48);
    FIELD(u32, emitter, 0x64) = 0;
    FIELD(u32, emitter, 0x64) = genrand_int32();
    FIELD(void *, emitter, 0) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    func_02071ee0((u8 *)emitter + 4, data_020f4e18,
                  0x1714, 0x1715, 0x1716);
    FIELD(s32, emitter, 0x58) = 0;
    FIELD(s32, emitter, 0x5c) = 0;
    return emitter;
}

/*
 * Tears down a caller-owned sprite emitter. It destroys controller +0x48,
 * releases the font handle and resource +4, and returns the emitter address.
 * The repeated controller cleanup is the recovered base-destructor sequence.
 */
extern "C" void *func_ov022_021fcf98(void *emitter)
{
    PresentationList_DeleteAll((u8 *)emitter + 0x48);
    GraphicsSpriteGroup_Destroy(FIELD(void *, emitter, 0));
    FIELD(const void *, emitter, 0x48) = data_ov022_02200654;
    PresentationList_DeleteAll((u8 *)emitter + 0x48);
    func_02071eb8((u8 *)emitter + 4);
    return emitter;
}
