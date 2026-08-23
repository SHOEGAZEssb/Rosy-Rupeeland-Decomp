#ifndef TINGLE_GRAPHICS_3D_PRESENTATION_H
#define TINGLE_GRAPHICS_3D_PRESENTATION_H

#include "tingle/types.h"
#include "tingle/vec_fx32.h"

struct PairedEntryManager;
struct SpriteEffectManager;

/* Fixed indexed mesh installed in every resident rupee instance. Its packed
 * data contains vertex-10 values, normal values, byte vertex indices, then
 * halfword normal indices; all four regions are borrowed immutable data. */
typedef struct RupeeMeshDescriptor {
    u32 opaque00;
    u32 vertexCount;
    u32 normalCount;
    u32 triangleCount;
    u32 packedData[1];
} RupeeMeshDescriptor;

/* Caller-owned transform state for the retained rupee mesh. The descriptor is
 * borrowed for the object's lifetime; translation and scale own no external
 * resources. renderVariant selects the presentation texture slot and texture
 * generation mode used by the retained submission path. */
typedef struct RupeeMeshInstance {
    const RupeeMeshDescriptor *meshDescriptor;
    u32 inactive;
    u32 renderVariant;
    VecFx32Object translation;
    VecFx32Object scale;
} RupeeMeshInstance;

typedef char RupeeMeshInstanceSizeCheck[
    sizeof(RupeeMeshInstance) == 0x2c ? 1 : -1];

/*
 * Shared 3D effect-presentation owner. The object owns the three manager
 * allocations at +0x4e0..+0x4e8 and borrows worldPosition only for the
 * duration of UpdateFrame. Clear destroys subordinate live effects without
 * releasing those managers or their VRAM resources; Destroy releases the
 * managers but not the caller-owned Graphics3dPresentation allocation.
 */
typedef struct Graphics3dPresentation {
    /* The renderer sublayout through +0x6f remains opaque here. */
    u8 rendererState[0x70];
    VecFx32Object lightingReference;
    fx32 lightStrength;
    VecFx32Object framePosition;
    /* Texture tables and other renderer state through +0x4cb stay opaque. */
    u8 rendererResourceState[0x438];
    u32 frameOpen;
    u32 resourcesLoaded;
    u32 textureVramCursor;
    u32 paletteVramCursor;
    /* +0x4dc is reset during resource loading but otherwise unresolved. */
    u8 opaqueResourceState[4];
    RupeeMeshInstance *rupeeMeshInstance;
    struct PairedEntryManager *pairedEntryManager;
    struct SpriteEffectManager *spriteEffectManager;
    VecFx32Object rupeePosition;
    fx32 rupeeScale;
    s32 rupeeHideRequested;
    s32 resourceProfile;
    u8 reserved508;
    u8 drawSuppressed;
    u8 enabled;
    u8 reserved50b;
} Graphics3dPresentation;

typedef char Graphics3dPresentationSizeCheck[
    sizeof(Graphics3dPresentation) == 0x50c ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

Graphics3dPresentation *Graphics3dPresentation_Init(
    Graphics3dPresentation *self, s32 resourceProfile);
Graphics3dPresentation *Graphics3dPresentation_Destroy(
    Graphics3dPresentation *self);
RupeeMeshInstance *RupeeMeshInstance_Init(RupeeMeshInstance *self);
RupeeMeshInstance *RupeeMeshInstance_Destroy(RupeeMeshInstance *self);
void RupeeMeshInstance_BindDefaultMesh(RupeeMeshInstance *self);
void RupeeMeshInstance_Deactivate(RupeeMeshInstance *self);
void RupeeMeshInstance_Activate(RupeeMeshInstance *self);
u32 RupeeMeshInstance_IsInactive(const RupeeMeshInstance *self);
void RupeeMeshInstance_Clear(RupeeMeshInstance *self);
void Graphics3dPresentation_UpdateFrame(
    Graphics3dPresentation *self, const VecFx32Object *worldPosition,
    s32 swapBuffers);
void Graphics3dPresentation_BeginFrame(
    Graphics3dPresentation *self, const VecFx32Object *worldPosition);
void Graphics3dPresentation_RenderContents(Graphics3dPresentation *self);
void Graphics3dPresentation_SubmitRetainedRupeeMesh(
    Graphics3dPresentation *self, const RupeeMeshInstance *instance);
void Graphics3dPresentation_SubmitRupeeMeshWithEffects(
    Graphics3dPresentation *self, const RupeeMeshInstance *instance,
    u32 appearanceFlags);
void Graphics3dPresentation_DrawRupeeWithEffects(
    Graphics3dPresentation *self, const VecFx32Object *translation,
    const VecFx32Object *scale, u32 appearanceFlags);
void Graphics3dPresentation_SetRupeeVisibleAt(
    Graphics3dPresentation *self, s32 visible, s32 x, s32 y);
u32 Graphics3dPresentation_CreatePresetSpriteEffectInBounds(
    Graphics3dPresentation *self, s32 presetKind, s32 presetParameter,
    s32 originX, s32 originZ, s32 extentX, s32 extentZ);
u32 Graphics3dPresentation_CreatePreset1To2SpriteEffectInBounds(
    Graphics3dPresentation *self, s32 presetOffset, s32 originX, s32 originZ,
    s32 extentX, s32 extentZ, s32 presetParameter);
u32 Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds(
    Graphics3dPresentation *self, s32 presetOffset, s32 originX, s32 originZ,
    s32 extentX, s32 extentZ, s32 presetParameter);
void Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt(
    Graphics3dPresentation *self, s32 variant, s32 x, s32 z,
    s32 presetParameter);
u32 Graphics3dPresentation_CreatePreset11To13SpriteEffectAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z);
u32 Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z,
    s32 horizontalVelocityMagnitude);
u32 Graphics3dPresentation_CreatePreset20To21ScaledPointSpriteEffectAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z,
    s32 scaleStep);
u32 Graphics3dPresentation_CreatePreset25To27TimedPointSpriteEffectAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z,
    s32 particleLifetime);
u32 Graphics3dPresentation_CreatePreset28To29PointSpriteEffectAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z);
u32 Graphics3dPresentation_CreatePreset30ColoredRegionSpriteEffectAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z,
    u16 primitiveColor);
u32 Graphics3dPresentation_CreatePreset31VariantRegionSpriteEffectAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z);
u32 Graphics3dPresentation_CreatePreset32CenteredAreaSpriteEffect(
    Graphics3dPresentation *self, s32 presetOffset, s32 centerX, s32 centerZ,
    s32 extentX, s32 extentZ);
void Graphics3dPresentation_CreatePreset22To24TimedPointSpriteEffectWithHorizontalVelocityAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z,
    s32 horizontalVelocityX, s32 horizontalVelocityZ,
    s32 particleLifetime);
void Graphics3dPresentation_EndFrame(Graphics3dPresentation *self,
                                     s32 swapBuffers);
void Graphics3dPresentation_ReloadResources(Graphics3dPresentation *self);
void Graphics3dPresentation_SuppressDrawing(Graphics3dPresentation *self);
void Graphics3dPresentation_ResumeDrawing(Graphics3dPresentation *self);
u32 Graphics3dPresentation_IsDrawingSuppressed(
    const Graphics3dPresentation *self);
void Graphics3dPresentation_RemoveSpriteEffect(
    Graphics3dPresentation *self, u32 effectHandle);
void Graphics3dPresentation_SetSpriteEffectAngularVelocityRange(
    Graphics3dPresentation *self, u32 effectHandle,
    u16 angularVelocityRange);
void Graphics3dPresentation_SetSpriteEffectParticleLifetime(
    Graphics3dPresentation *self, u32 effectHandle, s16 particleLifetime);
void Graphics3dPresentation_SetSpriteEffectMinimumEmissionInterval(
    Graphics3dPresentation *self, u32 effectHandle, s16 minimumInterval);
void Graphics3dPresentation_SetSpriteEffectVertexDepth(
    Graphics3dPresentation *self, u32 effectHandle, s16 vertexDepth);
s32 Graphics3dPresentation_SetPairedEntryModeAt(
    Graphics3dPresentation *self, s32 mode, s32 originX, s32 originY);
void Graphics3dPresentation_Clear(Graphics3dPresentation *self);
void Graphics3dPresentation_Disable(Graphics3dPresentation *self,
                                    s32 releaseResources,
                                    s32 configureDisplay);
void Graphics3dPresentation_Enable(Graphics3dPresentation *self,
                                   s32 loadResources,
                                   s32 configureDisplay);

#ifdef __cplusplus
}
#endif

#endif
