#include "tingle/field_effect.h"
#include "tingle/types.h"

/*
 * Overlay 54 owns two related field presentations. The first builds a
 * scanline window around a moving world-space point; the second follows a
 * configured actor position with a rotating and damped vector. Both objects
 * use the shared timed-presentation lifetime and GameWork flags.
 */
#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov054_0220f0e0[], data_ov054_0220f108[];
extern const u8 data_ov054_0220f130[], data_ov054_0220f150[];
extern void *gGamePhaseRuntime, *data_020f4e18[], *gGameWork;
extern u8 gSystemState[], gHeapContext[];
extern const s16 gFx32CosSinTable[];
extern u8 gMainBgPaletteBuffer[];
extern void *data_ov054_0220f160;

#ifdef __cplusplus
extern "C" {
#endif


extern void *VecFx32Object_Init(void *);
extern void *VecFx32Object_InitComponents(void *, s32, s32, s32);
extern void *VecFx32Object_Assign(void *, const void *);
extern void *VecFx32Object_Add(void *, const void *);
extern void *VecFx32Object_Destroy(void *);
extern void OverlaySlot_Init(void *);
extern void OverlaySlot_Destroy(void *);
extern void *OverlayManager_GetGlobal(void);
extern void OverlayManager_UnloadOverlay(void *, s32);
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void Heap_Free(void *);
extern void *RuntimePresentationManager_AppendSecondListEffect(void *, void *);
extern void RuntimePresentationManager_AppendFirstListEffect(void *, void *);
extern s32 GameWork_TestFlag(void *, s32);
extern void GameWork_ClearFlag(void *, s32);
extern void *GamePhaseState_GetConfiguration(void *);
extern void func_02056f00(void *, const void *);
extern s32 func_020adc40(s32);
extern s32 func_020ae024(s32, s32);
extern u32 genrand_int32(void);
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_Destroy(void *);
extern void GraphicsResourceSet_Init(void *);
extern void GraphicsResourceSet_Load(void *, void *, s32, s32, s32);
extern void GraphicsResourceSet_Destroy(void *);
extern void GraphicsBgMapResource_SetPaletteBank(void *, s32);
extern void func_02070638(void *, s32, s32);
extern void GraphicsBgMapResource_UploadToMainBg(void *, s32, s32);
extern void *GraphicsBgResourceData_GetDecoded(void *);
extern void PaletteBuffer_Write(void *, const void *, u32, u32);
extern void func_020b44e8(void);
extern void func_020afd0c(volatile u16 *, s32, s32, s32, s32);

void func_ov054_0220e52c(s32, s32, s32, s32);
void func_ov054_0220e4f8(void *, s32);
void func_ov054_0220e96c(s32, s32);
void func_ov054_0220e994(s32, s32);
void func_ov054_0220eb1c(s32, s32, s32, s32, s32);
void func_ov054_0220ea34(void *);

static s32 fx_mul(s32 left, s32 right)
{
    return (s32)(((s64)left * right + 0x800) >> 12);
}

/* Construct the scanline effect and initialize its vector and slot owners. */
void *func_ov054_0220e400(void *object, s32 variant, s32 enabled)
{
    u8 initial[16];
    s32 i;
    FieldEffect_Init(object);
    FIELD(const void *, object, 0) = data_ov054_0220f0e0;
    FIELD(s32, object, 8) = variant;
    FIELD(s32, object, 0xc) = enabled;
    FIELD(s32, object, 0x10) = 0;
    VecFx32Object_Init((u8 *)object + 0x194);
    FIELD(s32, object, 0x1a4) = 0x1000;
    OverlaySlot_Init((u8 *)object + 0x1a8);
    for (i = 0; i < 0xc0; ++i) {
        FIELD(u8, object, 0x14 + i * 2) = (u8)i;
        FIELD(u8, object, 0x15 + i * 2) = 0;
    }
    VecFx32Object_InitComponents(initial, 0, -0x14000, 0);
    VecFx32Object_Assign((u8 *)object + 0x194, initial);
    VecFx32Object_Destroy(initial);
    return object;
}

/* Release the scanline effect's embedded owners without freeing the object. */
void *func_ov054_0220e4a0(void *object)
{
    OverlaySlot_Destroy((u8 *)object + 0x1a8);
    VecFx32Object_Destroy((u8 *)object + 0x194);
    FieldEffect_DestroyBase(object);
    return object;
}

/* Release the scanline effect and free its heap allocation. */
void *func_ov054_0220e4c8(void *object)
{
    func_ov054_0220e4a0(object);
    Heap_Free(object);
    return object;
}

/* Submit one indexed scanline-window coordinate while the effect is active. */
void func_ov054_0220e4f8(void *object, s32 index)
{
    if (index < 0xc0 && FIELD(s32, object, 0x10) == 0) {
        func_ov054_0220e52c(FIELD(u8, object, 0x15 + index * 2), 0,
                            FIELD(u8, object, 0x14 + index * 2), 0xc0);
    }
}

/* Pack main-window horizontal and vertical bounds into the DS window MMIO. */
void func_ov054_0220e52c(s32 x1, s32 y1, s32 x2, s32 y2)
{
    volatile u16 *window = (volatile u16 *)0x04000040;
    window[0] = (u16)(((x1 << 8) & 0xff00) | (x2 & 0xff));
    window[2] = (u16)(((y1 << 8) & 0xff00) | (y2 & 0xff));
}

/* Rebuild all 192 scanline bounds around a fixed-point circular profile. */
void func_ov054_0220e560(void *object, u8 *bounds, const void *position)
{
    u8 converted[16];
    s32 radius, radiusSquared, centerX, centerY, low, high, x;
    func_02056f00(converted, position);
    radius = fx_mul((s32)FIELD(s16, gGameWork, 0x218) << 12,
                    FIELD(s32, object, 0x1a4));
    radiusSquared = fx_mul(radius, radius);
    centerX = FIELD(s32, converted, 8) + FIELD(s32, object, 0x19c);
    centerY = FIELD(s32, converted, 4) + FIELD(s32, object, 0x198);
    low = centerX - radius;
    high = centerX + radius;
    for (x = 0; x < 0xc0; ++x) {
        if (x <= (low >> 12) || x > (high >> 12)) {
            FIELD(u16, bounds, x * 2) = 0;
        } else {
            s32 delta = (x << 12) - centerX;
            s32 height = func_020adc40(radiusSquared - fx_mul(delta, delta));
            s32 lower = centerY - height;
            s32 upper = centerY + height;
            if (lower < 0x1000) lower = 0x1000;
            if (lower > 0xff000) lower = 0xff000;
            if (upper < 0x1000) upper = 0x1000;
            if (upper > 0xff000) upper = 0xff000;
            bounds[x * 2 + 1] = (u8)(lower >> 12);
            bounds[x * 2] = (u8)(upper >> 12);
        }
    }
    VecFx32Object_Destroy(converted);
}

/* Construct the first scene variant and install its derived vtable/state. */
void *func_ov054_0220e68c(void *object, s32 variant, s32 enabled)
{
    func_ov054_0220e400(object, variant, enabled);
    FIELD(const void *, object, 0) = data_ov054_0220f130;
    FIELD(s32, object, 0x1b4) = 0;
    return object;
}

static void Overlay054_DisableWindow(void)
{
    volatile u32 *display = (volatile u32 *)0x04000000;
    *display &= ~0xe000u;
}

/* Tear down the first scene, including its dynamically loaded overlay slot. */
void *func_ov054_0220e6b4(void *object)
{
    FIELD(const void *, object, 0) = data_ov054_0220f130;
    Overlay054_DisableWindow();
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 1);
    return func_ov054_0220e4a0(object);
}

/* Tear down and free the first scene. */
void *func_ov054_0220e704(void *object)
{
    func_ov054_0220e6b4(object);
    Heap_Free(object);
    return object;
}

/* Advance the flag-gated scanline-window presentation. */
s32 func_ov054_0220e75c(void *object)
{
    u8 relative[16];
    s32 state = FIELD(s32, object, 0x1b4);
    if (state == 0) {
        if (!GameWork_TestFlag(gGameWork, 0x40a)) return 0;
        func_ov054_0220ea34(object);
        func_ov054_0220e96c(0x1d, 0);
        func_ov054_0220e994(0x1f, 1);
        *(volatile u32 *)0x04000000 =
            (*(volatile u32 *)0x04000000 & ~0xe000u) | 0x2000;
        *(volatile u16 *)0x04000040 = 0;
        *(volatile u16 *)0x04000044 = 0xc0;
        FIELD(u32, object, 4) |= 3;
        FIELD(s32, object, 0x1b4) = 1;
    }
    if (FIELD(s32, object, 0x1b4) == 1) {
        s32 phase, blend;
        s32 amplitude = -205;
        s32 base = -amplitude + 0x1000;
        void *current = FIELD(void *, object, 8);
        void *origin = FIELD(void *, object, 0xc);
        FIELD(s16, gGameWork, 0x198) = (s16)(FIELD(s32, current, 4) >> 12);
        FIELD(s16, gGameWork, 0x19a) = (s16)(FIELD(s32, current, 8) >> 12);
        FIELD(s16, gGameWork, 0x19c) = (s16)(FIELD(s32, current, 0xc) >> 12);
        VecFx32Object_InitComponents(relative,
            (FIELD(s32, current, 4) - FIELD(s32, origin, 4)) & -0x1000,
            (FIELD(s32, current, 8) - FIELD(s32, origin, 8)) & -0x1000,
            FIELD(s32, current, 0xc) & -0x1000);
        func_ov054_0220e560(object, (u8 *)object + 0x14, relative);
        VecFx32Object_Destroy(relative);
        phase = (s32)(((u32)(0x222 * FIELD(u32, gSystemState, 0x64)) & 0xffff) >> 4);
        FIELD(s32, object, 0x1a4) =
            base + fx_mul(gFx32CosSinTable[phase * 2 + 1], amplitude);
        blend = FIELD(s16, gGameWork, 0x19e);
        if (blend > 0x10) blend = 0x10;
        if (blend < 0) blend = 0;
        func_020afd0c((volatile u16 *)0x04000050, 2, 0x1f, blend,
                      0x10 - blend);
    }
    return 0;
}

/* Update the main-window input mask, optionally selecting outside the window. */
void func_ov054_0220e96c(s32 mask, s32 outside)
{
    volatile u16 *control = (volatile u16 *)0x04000048;
    *control = (u16)((*control & ~0x3fu) | mask | (outside ? 0x20 : 0));
}

/* Update the main-window output mask, optionally selecting outside the window. */
void func_ov054_0220e994(s32 mask, s32 outside)
{
    volatile u16 *control = (volatile u16 *)0x0400004a;
    *control = (u16)((*control & ~0x3fu) | mask | (outside ? 0x20 : 0));
}

/* Allocate, construct, and register the first presentation object. */
void func_ov054_0220e9bc(s32 variant, s32 enabled)
{
    void *object = Heap_Alloc(0x1b8, data_ov054_0220f150, 4, gHeapContext);
    if (object != 0) object = func_ov054_0220e68c(object, variant, enabled);
    RuntimePresentationManager_AppendSecondListEffect((u8 *)gGamePhaseRuntime + 0x2f7c, object);
}

/* Forward one scanline index to the first presentation. */
void func_ov054_0220ea18(void *object, s32 index)
{
    func_ov054_0220e4f8(object, index);
}

/* Forward scanline zero to the first presentation. */
void func_ov054_0220ea24(void *object)
{
    func_ov054_0220e4f8(object, 0);
}

/* Load the first scene's background resources, palette, and display state. */
void func_ov054_0220ea34(void *object)
{
    u8 resources[12];
    (void)object;
    GraphicsResourceSet_Init(resources);
    GraphicsResourceSet_Load(resources, data_020f4e18[0], 0x8023, 0x8024,
                             0x8025);
    GraphicsBgMapResource_SetPaletteBank(FIELD(void *, resources, 8), 0xf);
    func_ov054_0220eb1c(0, 0, 0x1a, 2, 0);
    func_020b44e8();
    func_02070638(FIELD(void *, resources, 0), 1, 0);
    GraphicsBgMapResource_UploadToMainBg(FIELD(void *, resources, 8), 1, 0);
    PaletteBuffer_Write(gMainBgPaletteBuffer,
        GraphicsBgResourceData_GetDecoded(FIELD(void *, resources, 4)),
        0x1e0, 0x20);
    *(volatile u16 *)0x0400000a =
        (u16)(*(volatile u16 *)0x0400000a & 0xfffcu);
    *(volatile u32 *)0x04000000 =
        (*(volatile u32 *)0x04000000 & ~0x1f00u) |
        ((((*(volatile u32 *)0x04000000 & 0x1f00u) >> 8) | 2u) << 8);
    GraphicsResourceSet_Destroy(resources);
}

/* Compose the main BG1 control register from its recovered fields. */
void func_ov054_0220eb1c(s32 overflow, s32 mosaic, s32 screenBase,
                         s32 priority, s32 size)
{
    volatile u16 *control = (volatile u16 *)0x0400000a;
    *control = (u16)((*control & 0x43u) | (overflow << 14) | (mosaic << 7) |
                     (screenBase << 8) | (priority << 2) | (size << 13));
}

/* Toggle the window effect after its GameWork gate becomes active. */
void func_ov054_0220eb50(void *object, s32 disabled)
{
    volatile u32 *display = (volatile u32 *)0x04000000;
    if (!GameWork_TestFlag(gGameWork, 0x40a)) return;
    if (disabled == 1) {
        FIELD(s32, object, 0x10) = 1;
        FIELD(u32, object, 4) &= ~1u;
        *display &= ~0xe000u;
        func_020afd0c((volatile u16 *)0x04000050, 0, 0, 0, 0);
    } else {
        FIELD(s32, object, 0x10) = 0;
        FIELD(u32, object, 4) |= 1;
        *display = (*display & ~0xe000u) | 0x2000;
        *display = (*display & ~0x1f00u) |
                   ((((*display & 0x1f00u) >> 8) | 2u) << 8);
    }
}

/* Load graphics unless called for the teardown callback phase. */
void func_ov054_0220ec14(void *object, s32 phase)
{
    volatile u32 *display = (volatile u32 *)0x04000000;
    if (phase == 1) return;
    func_ov054_0220ea34(object);
    *display = (*display & ~0x1f00u) |
               ((((*display & 0x1f00u) >> 8) | 2u) << 8);
}

/* Return the angle from an object's y/z position to a target vector. */
s32 func_ov054_0220ec4c(const void *object, const void *target)
{
    return func_020ae024(FIELD(s32, target, 4) - FIELD(s32, object, 4),
                         FIELD(s32, target, 8) - FIELD(s32, object, 8));
}

/* Construct the second, actor-following presentation and seed its position. */
void *func_ov054_0220ec6c(void *object, void *owner)
{
    FieldEffect_Init(object);
    FIELD(const void *, object, 0) = data_ov054_0220f108;
    VecFx32Object_Init((u8 *)object + 8);
    FIELD(void *, object, 0x18) = owner;
    AnimationResourceState_InitEmbedded((u8 *)object + 0x24);
    VecFx32Object_Init((u8 *)object + 0x30);
    VecFx32Object_Init((u8 *)object + 0x40);
    (void)genrand_int32();
    FIELD(s32, object, 0x34) = (s32)FIELD(s16, gGameWork, 0x1a0) << 12;
    FIELD(s32, object, 0x38) = (s32)FIELD(s16, gGameWork, 0x1a2) << 12;
    FIELD(s32, object, 0x3c) = (s32)FIELD(s16, gGameWork, 0x1a4) << 12;
    FIELD(s16, gGameWork, 0x196) = 0xcd;
    return object;
}

static void Overlay054_DestroySecondMembers(void *object)
{
    data_ov054_0220f160 = 0;
    VecFx32Object_Destroy((u8 *)object + 0x40);
    VecFx32Object_Destroy((u8 *)object + 0x30);
    AnimationResourceState_Destroy((u8 *)object + 0x24);
    VecFx32Object_Destroy((u8 *)object + 8);
    FieldEffect_DestroyBase(object);
}

/* Destroy the second presentation without freeing its allocation. */
void *func_ov054_0220ed0c(void *object)
{
    Overlay054_DestroySecondMembers(object);
    return object;
}

/* Destroy and free the second presentation. */
void *func_ov054_0220ed54(void *object)
{
    Overlay054_DestroySecondMembers(object);
    Heap_Free(object);
    return object;
}

/* Follow the configured actor point with rotating and damped local vectors. */
s32 func_ov054_0220eda4(void *object)
{
    void *configuration =
        GamePhaseState_GetConfiguration((u8 *)gGamePhaseRuntime + 0x24);
    u32 type = (FIELD(u32, configuration, 0x40) >> 18) & 3;
    u8 orbit[16], damping[16];
    s32 angle, phase, radius;
    if (type != 2) return 0;
    if (GameWork_TestFlag(gGameWork, 0x40d)) {
        GameWork_ClearFlag(gGameWork, 0x40d);
        return 1;
    }
    FIELD(s32, object, 0xc) = (s32)FIELD(s16, gGameWork, 0x1a0) << 12;
    FIELD(s32, object, 0x10) =
        ((s32)FIELD(s16, gGameWork, 0x1a2) -
         FIELD(s16, gGameWork, 0x1a4)) << 12;
    angle = func_ov054_0220ec4c((u8 *)object + 0x30, (u8 *)object + 8);
    radius = FIELD(s16, gGameWork, 0x196);
    VecFx32Object_Init(orbit);
    phase = angle >> 4;
    FIELD(s32, orbit, 4) = fx_mul(gFx32CosSinTable[phase * 2 + 1], radius);
    FIELD(s32, orbit, 8) = fx_mul(gFx32CosSinTable[phase * 2], radius);
    FIELD(s32, orbit, 0xc) = 0;
    VecFx32Object_Add((u8 *)object + 0x40, orbit);
    VecFx32Object_Init(damping);
    FIELD(s32, damping, 4) = fx_mul(-FIELD(s32, object, 0x44), 0x333);
    FIELD(s32, damping, 8) = fx_mul(-FIELD(s32, object, 0x48), 0x333);
    VecFx32Object_Add((u8 *)object + 0x40, damping);
    VecFx32Object_Add((u8 *)object + 0x30, (u8 *)object + 0x40);
    VecFx32Object_Destroy(damping);
    VecFx32Object_Destroy(orbit);
    return 0;
}

/* Return the second presentation's current position vector. */
void *func_ov054_0220ef78(void *object)
{
    return (u8 *)object + 0x30;
}

/* Allocate, construct, globally retain, and register the second presentation. */
void func_ov054_0220ef80(void *owner)
{
    void *object = Heap_Alloc(0x50, data_ov054_0220f150, 4, gHeapContext);
    if (object != 0) object = func_ov054_0220ec6c(object, owner);
    data_ov054_0220f160 = object;
    RuntimePresentationManager_AppendFirstListEffect((u8 *)gGamePhaseRuntime + 0x2f7c, object);
}

/* Intentional no-op callback; the presentation remains unchanged. */
void func_ov054_0220efe0(void *object) { (void)object; }

/* Intentional no-op callback; the presentation remains unchanged. */
void func_ov054_0220efe4(void *object) { (void)object; }

/* Intentional no-op callback; the presentation remains unchanged. */
void func_ov054_0220efe8(void *object) { (void)object; }

/* Intentional no-op callback; the presentation remains unchanged. */
void func_ov054_0220efec(void *object) { (void)object; }

/* Intentional no-op callback; the presentation remains unchanged. */
void func_ov054_0220eff0(void *object) { (void)object; }

#ifdef __cplusplus
}
#endif
