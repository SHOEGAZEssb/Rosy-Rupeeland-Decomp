#include "tingle/graphics_3d_presentation.h"
#include "tingle/paired_entry_manager.h"
#include "tingle/sprite_effect.h"

/* Coordinate one frame of the active runtime 3D presentation manager. */

#ifdef __cplusplus
extern "C" {
#endif

extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32_TerminateNoOp(void *vector);
extern void func_020050a4(void *destination, const void *source);
extern void Graphics3dPresentation_ConfigureOrthographicState(void *presentation);
#ifndef MATCHING
extern void TingleNativeG3_Begin(u32 primitive);
extern void TingleNativeG3_End(void);
extern void TingleNativeG3_Color(u32 color);
extern void TingleNativeG3_Translate(s32 x, s32 y, s32 z);
extern void TingleNativeG3_Vertex16(u32 xy, u32 z);
extern void TingleNativeG3_VertexXY(u32 xy);
#endif

#ifdef __cplusplus
}
#endif

/*
 * Update an enabled presentation using a borrowed world position. The two
 * child managers, transform, interpolation, and frame-finalization stages run
 * synchronously in retail order; disabled presentations have no effects.
 */
#ifdef __cplusplus
extern "C"
#endif
void Graphics3dPresentation_UpdateFrame(
    Graphics3dPresentation *presentation,
    const VecFx32Object *worldPosition,
    s32 swapBuffers)
{
    if (presentation->enabled == 0)
        return;
    PairedEntryManager_Update(presentation->pairedEntryManager);
    SpriteEffectManager_Update(presentation->spriteEffectManager);
    Graphics3dPresentation_BeginFrame(presentation, worldPosition);
    Graphics3dPresentation_RenderContents(presentation);
    Graphics3dPresentation_EndFrame(presentation, swapBuffers);
}

/* The remaining recovered functions occupy non-contiguous retail objects.
 * Keep their matching ROM slices on the exact assembly gaps while exposing
 * these portable bodies to the host recompilation. */
#ifndef MATCHING

/* Render the contents of one enabled 3D presentation frame. Child managers
 * draw first. Once the small manager becomes active, its uniform scale
 * approaches the selected endpoint, its retained transform is refreshed, and
 * recovered geometry submission consumes the borrowed manager synchronously.
 */
void Graphics3dPresentation_RenderContents(
    Graphics3dPresentation *presentation)
{
    RupeeMeshInstance *instance;
    s32 scale;
    s32 remaining;
    s32 vector[4];

    if (presentation->drawSuppressed != 0)
        return;
    PairedEntryManager_Render(presentation->pairedEntryManager);
    SpriteEffectManager_Render(presentation->spriteEffectManager);
    instance = presentation->rupeeMeshInstance;
    if (RupeeMeshInstance_IsInactive(instance) != 0)
        return;

    scale = presentation->rupeeScale;
    remaining = 0x1000 - scale;
    if (presentation->rupeeHideRequested == 0) {
        scale += (remaining >> 2) + 0x29;
        if (scale > 0x1000)
            scale = 0x1000;
    } else {
        scale -= (remaining >> 2) + 0x29;
        if (scale < 1) {
            scale = 1;
            RupeeMeshInstance_Deactivate(instance);
        }
    }
    presentation->rupeeScale = scale;
    VecFx32Object_Assign(&instance->translation,
                         &presentation->rupeePosition);
    func_0200500c(vector, scale, scale, scale);
    VecFx32Object_Assign(&instance->scale, (const VecFx32Object *)vector);
    VecFx32_TerminateNoOp(vector);
    Graphics3dPresentation_SubmitRetainedRupeeMesh(presentation, instance);
}

/* Multiply signed Q20.12 values with retail's positive-half-unit rounding. */
static s32 MultiplyFx32Rounded(s32 lhs, s32 rhs)
{
    return (s32)(((s64)lhs * rhs + 0x800) >> 12);
}

/* Update the paired 15-entry presentation table. The manager owns no child
 * allocations here: it toggles the working page, establishes retail 3D draw
 * state through its owner, and emits quads only for entries whose page marker
 * differs from the new page. Coordinates are converted from fx32 to pixels. */
void PairedEntryManager_Render(PairedEntryManager *manager)
{
    Graphics3dPresentation *renderContext = manager->renderContext;
    s32 index;
    s32 base_x;
    s32 base_y;
    s32 translation_x;
    s32 translation_y;

    manager->renderParity ^= 1;
    Graphics3dPresentation_ConfigureOrthographicState(renderContext);
    base_x = renderContext->framePosition.value.x + 0x80000;
    base_y = renderContext->framePosition.value.y + 0x60000;
    translation_x = (s16)((u32)base_x >> 12);
    translation_y = (s16)((u32)base_y >> 12);
    *(volatile s32 *)0x04000470 = -translation_x;
    *(volatile s32 *)0x04000470 = -translation_y;
    *(volatile s32 *)0x04000470 = 0;
#ifndef MATCHING
    TingleNativeG3_Translate(-translation_x, -translation_y, 0);
#endif

    for (index = PAIRED_ENTRY_CAPACITY - 1; index >= 0; --index) {
        s32 center;
        s32 extent;
        s32 origin_x;
        s32 origin_y;
        s32 coordinates[8];

        if (manager->entryHorizontalVelocityOrGrowthState[index] == 0 ||
            manager->renderParity == manager->entryExcludedRenderPages[index])
            continue;
        center = (s32)manager->entryPoints[index].x;
        extent = manager->entryHalfWidths[index];
        origin_x = manager->origin.value.x;
        origin_y = manager->origin.value.y >> 12;
        coordinates[0] = (origin_x + center + extent) >> 12;
        coordinates[1] = origin_y;
        coordinates[2] = (origin_x + center - extent) >> 12;
        coordinates[3] = origin_y;
        coordinates[4] =
            (origin_x + MultiplyFx32Rounded(center - extent, 0x219a)) >> 12;
        coordinates[5] = origin_y + 0x6c;
        coordinates[6] =
            (origin_x + MultiplyFx32Rounded(center + extent, 0x219a)) >> 12;
        coordinates[7] = origin_y + 0x6c;
        PairedEntryManager_SubmitColoredQuad(
            manager, coordinates, gPairedEntryGradientColors);
    }
}

/* Truncate two signed coordinates into the geometry engine's packed XY word. */
static u32 PackSignedXY(s32 x, s32 y)
{
    return (u32)(u16)(s16)x | ((u32)(u16)(s16)y << 16);
}

/* Submit one untextured QUADS primitive at depth zero. The manager argument is
 * retained by the retail member-function ABI but is not inspected. Each pair
 * of signed coordinates is truncated to the geometry engine's packed s16 XY
 * format, and the first vertex explicitly establishes z through VTX_16. */
void PairedEntryManager_SubmitColoredQuad(
    PairedEntryManager *manager, const s32 coordinates[8],
    const u16 colors[4])
{
    u32 packed;

    (void)manager;
    *(volatile u32 *)0x04000500 = 1;
    *(volatile u32 *)0x04000480 = colors[0];
    packed = PackSignedXY(coordinates[0], coordinates[1]);
    *(volatile u32 *)0x0400048c = packed;
    *(volatile u32 *)0x0400048c = 0;
    *(volatile u32 *)0x04000480 = colors[1];
    *(volatile u32 *)0x04000494 =
        PackSignedXY(coordinates[2], coordinates[3]);
    *(volatile u32 *)0x04000480 = colors[2];
    *(volatile u32 *)0x04000494 =
        PackSignedXY(coordinates[4], coordinates[5]);
    *(volatile u32 *)0x04000480 = colors[3];
    *(volatile u32 *)0x04000494 =
        PackSignedXY(coordinates[6], coordinates[7]);
    *(volatile u32 *)0x04000504 = 0;
#ifndef MATCHING
    TingleNativeG3_Begin(1);
    TingleNativeG3_Color(colors[0]);
    TingleNativeG3_Vertex16(packed, 0);
    TingleNativeG3_Color(colors[1]);
    TingleNativeG3_VertexXY(
        PackSignedXY(coordinates[2], coordinates[3]));
    TingleNativeG3_Color(colors[2]);
    TingleNativeG3_VertexXY(
        PackSignedXY(coordinates[4], coordinates[5]));
    TingleNativeG3_Color(colors[3]);
    TingleNativeG3_VertexXY(
        PackSignedXY(coordinates[6], coordinates[7]));
    TingleNativeG3_End();
#endif
}

#endif
