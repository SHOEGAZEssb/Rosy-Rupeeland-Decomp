/* Portable reconstructions of assembly-selected ARM9 static-runtime helpers. */
#include "tingle/types.h"

#include <string.h>

/* Clear the thirteen-word display-resource snapshot exactly as 0x02092364. */
void func_02092364(void *snapshot)
{
    memset(snapshot, 0, 13 * sizeof(u32));
}

/* The retail destructor at 0x020923A0 has no state or observable effects. */
void func_020923a0(void *snapshot)
{
    (void)snapshot;
}

/* Initialize one 0x10-byte packed-timer record as 0x02059A48 does. */
void func_02059a48(void *record)
{
    u32 *words = (u32 *)record;

    words[0] = 0;
    words[1] = 0x0007f000;
    words[2] = 0x0007f000;
    words[3] = 0x0007f000;
}

/* Packed-timer records own no subordinate allocation at destruction. */
void func_02059a64(void *record)
{
    (void)record;
}

/* The array destructor thunk is registered separately by recovered startup. */
void func_02059a68(void *unused)
{
    (void)unused;
}

/* Clear the nineteen pointer slots at +0x29C exactly as 0x020645D8. */
void func_020645d8(void *object)
{
    memset((u8 *)object + 0x29c, 0, 19 * sizeof(u32));
}

/* Initialize the two-word owner at 0x0206F750. */
void func_0206f750(void *object)
{
    memset(object, 0, 2 * sizeof(u32));
}

/* Initialize the four-word owner at 0x0206FBB0. */
void func_0206fbb0(void *object)
{
    memset(object, 0, 4 * sizeof(u32));
}

extern u8 data_020e5048[];

/* Reconstruct the self-linked 0x44-byte owner initialized at 0x0206FD78. */
void func_0206fd78(void *object)
{
    u8 *bytes = (u8 *)object;

    memset(bytes, 0, 0x44);
    *(void **)(bytes + 0x00) = data_020e5048;
    *(u32 *)(bytes + 0x30) = (u32)(bytes + 0x1c);
    *(u32 *)(bytes + 0x34) = 1;
    *(u32 *)(bytes + 0x38) = (u32)(bytes + 0x1c);
}

/* The retail global at 0x021F38FC has an empty constructor. */
void func_020787bc(void *object)
{
    (void)object;
}

/* The matching destructor is also empty. */
void func_020787c0(void *object)
{
    (void)object;
}

/* Clear four two-word resource owners at the exact 0x0207A064 offsets. */
void func_0207a064(void *object)
{
    u8 *bytes = (u8 *)object;

    memset(bytes + 0x000, 0, 8);
    memset(bytes + 0x088, 0, 8);
    memset(bytes + 0x154, 0, 8);
    memset(bytes + 0x1b0, 0, 8);
}

/* Initialize each of the two smaller resource-owner globals. */
void func_0207a13c(void *object)
{
    memset(object, 0, 8);
}

void func_0207a16c(void *object)
{
    memset(object, 0, 8);
}

/* Clear the twelve-word singleton at 0x0207C38C. */
void func_0207c38c(void *object)
{
    memset(object, 0, 12 * sizeof(u32));
}

/* Actor runtime flags begin as a zero mask. */
void ActorRuntimeFlags_Init(void *object)
{
    *(u32 *)object = 0;
}

/* Actor runtime flags own no subordinate storage. */
void ActorRuntimeFlags_Destroy(void *object)
{
    (void)object;
}

/* Exact mask operations at retail 0x020828A0..0x020828D0. */
u32 ActorRuntimeFlags_Test(const void *object, u32 mask)
{
    return *(const u32 *)object & mask;
}

void ActorRuntimeFlags_Set(void *object, u32 mask)
{
    *(u32 *)object |= mask;
}

void ActorRuntimeFlags_Clear(void *object, u32 mask)
{
    *(u32 *)object &= ~mask;
}

extern void __construct_array(void *array, u32 count, u32 element_size,
                              void (*constructor)(void *),
                              void (*destructor)(void *));
extern void func_02098430(void *object);
extern void func_0209843c(void *object);
extern void func_02098440(void *object);
extern void func_0209844c(void *object);

/* Initialize one 0x58-byte record's recovered pointer field. */
void func_02098430(void *object)
{
    *(u32 *)((u8 *)object + 4) = 0;
}

/* The 0x58-byte record destructor is empty in retail. */
void func_0209843c(void *object)
{
    (void)object;
}

/* Initialize one eight-byte record's halfword field at +2. */
void func_02098440(void *object)
{
    *(u16 *)((u8 *)object + 2) = 0;
}

/* The eight-byte record destructor is empty in retail. */
void func_0209844c(void *object)
{
    (void)object;
}

/* Reconstruct the two embedded arrays and flags initialized at 0x020983C8. */
void func_020983c8(void *object)
{
    u8 *bytes = (u8 *)object;

    __construct_array(bytes, 10, 0x58, func_02098430, func_0209843c);
    __construct_array(bytes + 0x370, 30, 8, func_02098440, func_0209844c);
    *(u32 *)(bytes + 0x460) = 0;
    *(u32 *)(bytes + 0x464) = 0;
}

extern u8 data_021e9e68[];
extern u8 data_021e9e60[];
extern void *func_020a7310(void *start, u32 size, int options);

/* Create the fixed 0x4000-byte graphics scratch heap at 0x0207139C. */
void func_0207139c(void)
{
    *(void **)(data_021e9e60 + 4) =
        func_020a7310(data_021e9e68, 0x4000, 0);
}

extern u8 data_020f26c4[];
extern u8 data_020f26a8[];
extern u8 data_020f26fc[];

/* Initialize one 0x10-byte presentation transform component (0x020948BC). */
void PresentationScalar_Init(void *component)
{
    memset(component, 0, 0x10);
}

/* Assign the component's three scalar axes exactly as 0x020948D4. */
void PresentationScalar_SetImmediate(void *component, s32 value)
{
    u32 *words = (u32 *)component;
    words[1] = (u32)value;
    words[2] = (u32)value;
    words[3] = (u32)value;
}

/* Base presentation construction selected as ARM assembly in retail. */
void *Presentation_Init(void *object)
{
    u8 *bytes = (u8 *)object;
    u32 index;

    *(u32 *)bytes = (u32)(uintptr_t)data_020f26c4;
    for (index = 0; index < 7; ++index)
        PresentationScalar_Init(bytes + 0x0c + index * 0x10);
    *(u32 *)(bytes + 4) = 0;
    *(u32 *)(bytes + 8) = 0;
    *(u32 *)(bytes + 0x7c) = 0;
    *(u32 *)(bytes + 0x80) = 0;
    *(u32 *)(bytes + 0x88) = 0;
    *(u32 *)(bytes + 0x8c) = 0;
    *(u32 *)(bytes + 0x90) = 1;
    *(u16 *)(bytes + 0x84) = 0;
    *(u16 *)(bytes + 0x86) = 0;
    *(u16 *)(bytes + 0x94) = 0;
    *(u16 *)(bytes + 0x96) = 0;
    *(u16 *)(bytes + 0x98) = 0;
    memset(bytes + 0x0c, 0, 7 * 0x10);
    PresentationScalar_SetImmediate(bytes + 0x0c, 0);
    PresentationScalar_SetImmediate(bytes + 0x1c, 0);
    PresentationScalar_SetImmediate(bytes + 0x2c, 0);
    PresentationScalar_SetImmediate(bytes + 0x3c, 0);
    PresentationScalar_SetImmediate(bytes + 0x4c, 0);
    PresentationScalar_SetImmediate(bytes + 0x5c, 0);
    PresentationScalar_SetImmediate(bytes + 0x6c, 0x1000);
    return object;
}

/* Construct the equivalent base-presentation variant at 0x02094AD4. Retail
 * uses the same vtable and field initialization as Presentation_Init; the distinct
 * entry point exists so separate constructor references retain their ABI. */
void *Presentation_InitVariant(void *object)
{
    return Presentation_Init(object);
}

/* Sprite-backed presentation controller constructor at retail 0x020953F4. */
void *SpritePresentation_InitVariant(void *object, void *sprite)
{
    u8 *bytes = (u8 *)Presentation_Init(object);
    *(u32 *)bytes = (u32)(uintptr_t)data_020f26a8;
    *(u32 *)(bytes + 0x9c) = (u32)(uintptr_t)sprite;
    return object;
}

/* The retail base destructor at 0x020953f0 has no observable work. */
void Presentation_DestroyNoOp(void *object)
{
    (void)object;
}

extern void func_02073ef8(void *group);

/* Sprite-backed presentation destructor (retail 0x0209548C). Ownership of the
 * sprite group at +0x9C returns to its renderer before the inert base
 * presentation destructor runs. */
void *SpritePresentation_Destroy(void *object)
{
    u8 *bytes = (u8 *)object;

    *(u32 *)bytes = (u32)(uintptr_t)data_020f26a8;
    func_02073ef8(*(void **)(bytes + 0x9c));
    *(u32 *)(bytes + 0x9c) = 0;
    Presentation_DestroyNoOp(object);
    return object;
}

/* Equivalent presentation destructors selected by adjacent retail vtables.
 * 0x0209541C retains caller storage; 0x02095450 additionally frees it. */
void *SpritePresentation_DestroyInPlace(void *object)
{
    return SpritePresentation_Destroy(object);
}

extern void Heap_Free(void *allocation);

void *SpritePresentation_Delete(void *object)
{
    SpritePresentation_Destroy(object);
    Heap_Free(object);
    return object;
}

void *SpritePresentation_Init(void *object, void *sprite)
{
    u8 *bytes = (u8 *)Presentation_Init(object);
    *(u32 *)bytes = (u32)(uintptr_t)data_020f26a8;
    *(u32 *)(bytes + 0x9c) = (u32)(uintptr_t)sprite;
    return object;
}

/* Construct the alternate sprite-backed presentation at retail 0x020955D8.
 * Caller storage remains owned by the caller and the sprite pointer at +0x9C
 * is borrowed. The distinct vtable selects this subtype's recovered update
 * and destruction behavior; construction returns the original object. */
void *func_020955d8(void *object, void *sprite)
{
    u8 *bytes = (u8 *)Presentation_Init(object);

    *(u32 *)bytes = (u32)(uintptr_t)data_020f26fc;
    *(u32 *)(bytes + 0x9c) = (u32)(uintptr_t)sprite;
    return object;
}

/* Synchronize an alternate sprite presentation's position, rotation, and
 * scale fields at retail 0x020956A4. The presentation and its borrowed sprite
 * remain caller-owned; only the sprite's render-state fields are updated. */
void func_020956a4(void *object)
{
    u8 *bytes = (u8 *)object;
    u8 *sprite = *(u8 **)(bytes + 0x9c);
    s32 scale = *(s32 *)(bytes + 0x70);

    *(s32 *)(sprite + 0x20) = *(s32 *)(bytes + 0x10);
    *(s32 *)(sprite + 0x24) = *(s32 *)(bytes + 0x20);
    *(s32 *)(sprite + 0x28) = *(s32 *)(bytes + 0x30);
    *(u16 *)(sprite + 0x48) = (u16)*(s32 *)(bytes + 0x40);
    *(u16 *)(sprite + 0x4a) = (u16)*(s32 *)(bytes + 0x50);
    *(u16 *)(sprite + 0x4c) = (u16)*(s32 *)(bytes + 0x60);
    *(s32 *)(sprite + 0x38) = scale;
    *(s32 *)(sprite + 0x34) = scale;
}

/* Preserve the distinct retail 0x020956F0 entry point used by one subtype. */
void func_020956f0(void *object)
{
    func_020956a4(object);
}

extern void GraphicsAnimationInstance_Destroy(void *instance);

/* Delete the alternate sprite-backed presentation at retail 0x02095634.
 * The borrowed animation instance is unlinked and destroyed by its graphics
 * owner, the inert presentation base is finalized, and caller storage returns
 * to the heap. The former object address is returned as required by retail. */
void *func_02095634(void *object)
{
    u8 *bytes = (u8 *)object;

    *(u32 *)bytes = (u32)(uintptr_t)data_020f26fc;
    GraphicsAnimationInstance_Destroy(*(void **)(bytes + 0x9c));
    *(void **)(bytes + 0x9c) = 0;
    Presentation_DestroyNoOp(object);
    Heap_Free(object);
    return object;
}

/* Set the recovered presentation position triplet (retail 0x02094BBC). */
void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z)
{
    u8 *bytes = (u8 *)object;
    PresentationScalar_SetImmediate(bytes + 0x0c, x);
    PresentationScalar_SetImmediate(bytes + 0x1c, y);
    PresentationScalar_SetImmediate(bytes + 0x2c, z);
}

extern s32 Presentation_InterpolateSmoothStep(s32 start, s32 end, s32 duration, s32 elapsed);
extern s32 Presentation_InterpolateLinear(s32 start, s32 end, s32 duration, s32 elapsed);
extern s32 Presentation_InterpolateQuadraticPulse(s32 start, s32 end, s32 duration, s32 elapsed);
extern s32 Presentation_InterpolateEaseOutQuadratic(s32 start, s32 end, s32 duration, s32 elapsed);
extern s32 Presentation_InterpolateEaseInQuadratic(s32 start, s32 end, s32 duration, s32 elapsed);

/*
 * Select the retail presentation interpolation curve at 0x02094D28.
 * The caller retains the read-only presentation object; its +0x7C duration
 * and +0x80 elapsed fields use the same units as start/end interpolation.
 * Modes 1..5 select the five recovered curves, while all other modes return
 * zero. This helper performs no allocation or host I/O; its only observable
 * game effect is the interpolated scalar returned to the presentation update.
 */
s32 Presentation_InterpolateScalar(const void *object, s32 mode, s32 start, s32 end)
{
    const u8 *bytes = (const u8 *)object;
    s32 duration = *(const s32 *)(bytes + 0x7c);
    s32 elapsed = *(const s32 *)(bytes + 0x80);

    switch (mode) {
    case 1:
        return Presentation_InterpolateLinear(start, end, duration, elapsed);
    case 2:
        return Presentation_InterpolateSmoothStep(start, end, duration, elapsed);
    case 3:
        return Presentation_InterpolateQuadraticPulse(start, end, duration, elapsed);
    case 4:
        return Presentation_InterpolateEaseOutQuadratic(start, end, duration, elapsed);
    case 5:
        return Presentation_InterpolateEaseInQuadratic(start, end, duration, elapsed);
    default:
        return 0;
    }
}

/*
 * Retail presentation vtable no-op at 0x02095220. The caller retains the
 * borrowed presentation object; the callback reports no errors, consumes no
 * time units, performs no I/O, and has no observable game effect.
 */
void Presentation_NoOp(void *object)
{
    (void)object;
}

/* Publish fixed-point presentation position to its bound sprite state. */
void SpritePresentation_SyncPosition(void *object)
{
    u8 *bytes = (u8 *)object;
    s32 x = *(s32 *)(bytes + 0x10);
    s32 y = *(s32 *)(bytes + 0x20) + *(s32 *)(bytes + 0x30);
    u8 *sprite = (u8 *)(uintptr_t)*(u32 *)(bytes + 0x9c);

    *(s16 *)(sprite + 0x2c) = (s16)((x + (x < 0 ? 0xfff : 0)) >> 12);
    *(s16 *)(sprite + 0x2e) = (s16)((y + (y < 0 ? 0xfff : 0)) >> 12);
}

extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, u32 index);

/* Forward a presentation animation selection to its bound sprite. */
void SpritePresentation_SetAnimation(void *object, u32 animation)
{
    void *sprite = (void *)(uintptr_t)*(u32 *)((u8 *)object + 0x9c);
    GraphicsSpriteState_SetAnimationIndex(sprite, animation & 0xff);
}
