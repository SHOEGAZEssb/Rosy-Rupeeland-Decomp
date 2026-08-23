/*
 * Portable reconstruction of the resident 3D presentation wrappers that
 * translate integer X/Z regions into fixed-point sprite-effect presets.  The
 * presentation owns the manager; returned handles identify manager-owned
 * effects and 0xff reports that all 30 slots are occupied.
 */
#include "tingle/graphics_3d_presentation.h"
#include "tingle/sprite_effect.h"
#include "tingle/types.h"

#define INTEGER_TO_FX32(value) ((s32)((u32)(value) << 12))

/* Create an arbitrary preset in the origin-plus-extent bounds supplied by the
 * caller. Coordinates and extents are integer X/Z pixels; the preset parameter
 * is forwarded unchanged and the returned byte-sized handle is manager-owned. */
u32 Graphics3dPresentation_CreatePresetSpriteEffectInBounds(
    Graphics3dPresentation *self, s32 presetKind, s32 presetParameter,
    s32 originX, s32 originZ, s32 extentX, s32 extentZ)
{
    SpriteEffectBounds bounds;

    bounds.minimumX = INTEGER_TO_FX32(originX);
    bounds.minimumZ = INTEGER_TO_FX32(originZ);
    bounds.maximumX = (s32)((u32)bounds.minimumX +
                            (u32)INTEGER_TO_FX32(extentX));
    bounds.maximumZ = (s32)((u32)bounds.minimumZ +
                            (u32)INTEGER_TO_FX32(extentZ));
    return SpriteEffectManager_CreatePresetEffect(
        self->spriteEffectManager, presetKind, &bounds, presetParameter);
}

/* Select preset 1 or 2 with presetOffset, construct origin-plus-extent X/Z
 * bounds in Q20.12, and return the manager-owned effect handle. */
u32 Graphics3dPresentation_CreatePreset1To2SpriteEffectInBounds(
    Graphics3dPresentation *self, s32 presetOffset, s32 originX, s32 originZ,
    s32 extentX, s32 extentZ, s32 presetParameter)
{
    SpriteEffectBounds bounds;

    bounds.minimumX = INTEGER_TO_FX32(originX);
    bounds.minimumZ = INTEGER_TO_FX32(originZ);
    bounds.maximumX = (s32)((u32)bounds.minimumX +
                            (u32)INTEGER_TO_FX32(extentX));
    bounds.maximumZ = (s32)((u32)bounds.minimumZ +
                            (u32)INTEGER_TO_FX32(extentZ));
    return SpriteEffectManager_CreatePresetEffect(
        self->spriteEffectManager, presetOffset + 1, &bounds,
        presetParameter);
}

/* Select preset 3, 4, or 5 with presetOffset, construct origin-plus-extent
 * X/Z bounds in Q20.12, and return the manager-owned effect handle. */
u32 Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds(
    Graphics3dPresentation *self, s32 presetOffset, s32 originX, s32 originZ,
    s32 extentX, s32 extentZ, s32 presetParameter)
{
    SpriteEffectBounds bounds;

    bounds.minimumX = INTEGER_TO_FX32(originX);
    bounds.minimumZ = INTEGER_TO_FX32(originZ);
    bounds.maximumX = (s32)((u32)bounds.minimumX +
                            (u32)INTEGER_TO_FX32(extentX));
    bounds.maximumZ = (s32)((u32)bounds.minimumZ +
                            (u32)INTEGER_TO_FX32(extentZ));
    return SpriteEffectManager_CreatePresetEffect(
        self->spriteEffectManager, presetOffset + 3, &bounds,
        presetParameter);
}

/* Create the preset-6-through-10 burst selected by variant at integer X/Z.
 * Variant 1 creates presets 7 and 8 together; invalid variants do nothing.
 * The optional preset parameter is consumed only by variants 1 and 4. */
void Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt(
    Graphics3dPresentation *self, s32 variant, s32 x, s32 z,
    s32 presetParameter)
{
    SpriteEffectBounds bounds;
    s32 fixedX;
    s32 fixedZ;

    if (variant == 0) {
        fixedX = INTEGER_TO_FX32(x);
        fixedZ = INTEGER_TO_FX32(z);
        bounds.minimumX = (s32)((u32)fixedX - 0x28000u);
        bounds.minimumZ = (s32)((u32)fixedZ - 0x32000u);
        bounds.maximumX = (s32)((u32)bounds.minimumX + 0x50000u);
        bounds.maximumZ = (s32)((u32)bounds.minimumZ + 0x3c000u);
        SpriteEffectManager_CreatePresetEffect(
            self->spriteEffectManager, 6, &bounds, 0);
    } else if (variant == 1) {
        fixedX = INTEGER_TO_FX32(x);
        fixedZ = INTEGER_TO_FX32(z);
        bounds.minimumX = (s32)((u32)fixedX - 0x2000u);
        bounds.minimumZ = (s32)((u32)fixedZ - 0x2000u);
        bounds.maximumX = (s32)((u32)bounds.minimumX + 0x4000u);
        bounds.maximumZ = (s32)((u32)bounds.minimumZ + 0x4000u);
        SpriteEffectManager_CreatePresetEffect(
            self->spriteEffectManager, 7, &bounds, presetParameter);
        SpriteEffectManager_CreatePresetEffect(
            self->spriteEffectManager, 8, &bounds, presetParameter);
    } else if (variant == 2) {
        fixedX = INTEGER_TO_FX32(x);
        fixedZ = INTEGER_TO_FX32(z);
        bounds.minimumX = (s32)((u32)fixedX - 0x14000u);
        bounds.minimumZ = (s32)((u32)fixedZ - 0x14000u);
        bounds.maximumX = (s32)((u32)bounds.minimumX + 0x28000u);
        bounds.maximumZ = (s32)((u32)bounds.minimumZ + 0x28000u);
        SpriteEffectManager_CreatePresetEffect(
            self->spriteEffectManager, 6, &bounds, 0);
    } else if (variant == 3) {
        fixedX = INTEGER_TO_FX32(x);
        fixedZ = INTEGER_TO_FX32(z);
        bounds.minimumX = (s32)((u32)fixedX - 0x28000u);
        bounds.minimumZ = (s32)((u32)fixedZ - 0x32000u);
        bounds.maximumX = (s32)((u32)bounds.minimumX + 0x50000u);
        bounds.maximumZ = (s32)((u32)bounds.minimumZ + 0x3c000u);
        SpriteEffectManager_CreatePresetEffect(
            self->spriteEffectManager, 10, &bounds, 0);
    } else if (variant == 4) {
        fixedX = INTEGER_TO_FX32(x);
        fixedZ = INTEGER_TO_FX32(z);
        bounds.minimumX = (s32)((u32)fixedX - 0x2000u);
        bounds.minimumZ = (s32)((u32)fixedZ - 0x2000u);
        bounds.maximumX = (s32)((u32)bounds.minimumX + 0x4000u);
        bounds.maximumZ = (s32)((u32)bounds.minimumZ + 0x4000u);
        SpriteEffectManager_CreatePresetEffect(
            self->spriteEffectManager, 9, &bounds, presetParameter);
    }
}

/* Select preset 11, 12, or 13 and create its variant-sized horizontal band at
 * integer X/Z. The returned handle identifies the manager-owned effect. */
u32 Graphics3dPresentation_CreatePreset11To13SpriteEffectAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z)
{
    SpriteEffectBounds bounds;
    s32 fixedX;
    s32 fixedZ;

    if ((u32)presetOffset <= 1u) {
        fixedX = INTEGER_TO_FX32(x);
        bounds.minimumX = (s32)((u32)fixedX - 0xa000u);
        fixedZ = INTEGER_TO_FX32(z);
        bounds.minimumZ = fixedZ;
        bounds.maximumX = (s32)((u32)bounds.minimumX + 0x14000u);
        bounds.maximumZ = (s32)((u32)fixedZ + 0x2000u);
    } else if (presetOffset == 2) {
        fixedX = INTEGER_TO_FX32(x);
        bounds.minimumX = (s32)((u32)fixedX - 0x14000u);
        fixedZ = INTEGER_TO_FX32(z);
        bounds.minimumZ = fixedZ;
        bounds.maximumX = (s32)((u32)bounds.minimumX + 0x28000u);
        bounds.maximumZ = (s32)((u32)fixedZ + 0x1000u);
    } else {
        fixedX = INTEGER_TO_FX32(x);
        bounds.minimumX = (s32)((u32)fixedX - 0x1e000u);
        fixedZ = INTEGER_TO_FX32(z);
        bounds.minimumZ = fixedZ;
        bounds.maximumX = (s32)((u32)bounds.minimumX + 0x3c000u);
        bounds.maximumZ = (s32)((u32)fixedZ + 0x1000u);
    }
    return SpriteEffectManager_CreatePresetEffect(
        self->spriteEffectManager, presetOffset + 11, &bounds, 0);
}

/* Select preset 14 through 19, center a 20-by-20 integer X/Z region, convert
 * the magnitude to Q20.12 horizontal velocity, and return the effect handle. */
u32 Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z,
    s32 horizontalVelocityMagnitude)
{
    SpriteEffectBounds bounds;
    s32 fixedX = INTEGER_TO_FX32(x);
    s32 fixedZ = INTEGER_TO_FX32(z);

    bounds.minimumX = (s32)((u32)fixedX - 0xa000u);
    bounds.minimumZ = (s32)((u32)fixedZ - 0xa000u);
    bounds.maximumX = (s32)((u32)bounds.minimumX + 0x14000u);
    bounds.maximumZ = (s32)((u32)bounds.minimumZ + 0x14000u);
    return SpriteEffectManager_CreatePresetEffect(
        self->spriteEffectManager, presetOffset + 14, &bounds,
        INTEGER_TO_FX32(horizontalVelocityMagnitude));
}

/* Select preset 20 or 21 at a degenerate point and convert scaleStep to the
 * Q20.12 scale 1.0 + scaleStep * 0x19a. Return the manager-owned handle. */
u32 Graphics3dPresentation_CreatePreset20To21ScaledPointSpriteEffectAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z,
    s32 scaleStep)
{
    SpriteEffectBounds bounds;
    s32 scale = (s32)((u32)scaleStep * 0x19au + 0x1000u);

    bounds.minimumX = INTEGER_TO_FX32(x);
    bounds.minimumZ = INTEGER_TO_FX32(z);
    bounds.maximumX = bounds.minimumX;
    bounds.maximumZ = bounds.minimumZ;
    return SpriteEffectManager_CreatePresetEffect(
        self->spriteEffectManager, presetOffset + 20, &bounds, scale);
}

/* Select preset 25 through 27 at a degenerate point and forward the requested
 * particle lifetime. Return the manager-owned effect handle. */
u32 Graphics3dPresentation_CreatePreset25To27TimedPointSpriteEffectAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z,
    s32 particleLifetime)
{
    SpriteEffectBounds bounds;

    bounds.minimumX = INTEGER_TO_FX32(x);
    bounds.minimumZ = INTEGER_TO_FX32(z);
    bounds.maximumX = bounds.minimumX;
    bounds.maximumZ = bounds.minimumZ;
    return SpriteEffectManager_CreatePresetEffect(
        self->spriteEffectManager, presetOffset + 25, &bounds,
        particleLifetime);
}

/* Select preset 28 or 29 at integer X/Z. Retail expands each maximum by one
 * Q20.12 least-significant unit, not by one integer coordinate unit. */
u32 Graphics3dPresentation_CreatePreset28To29PointSpriteEffectAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z)
{
    SpriteEffectBounds bounds;

    bounds.minimumX = INTEGER_TO_FX32(x);
    bounds.minimumZ = INTEGER_TO_FX32(z);
    bounds.maximumX = (s32)((u32)bounds.minimumX + 1u);
    bounds.maximumZ = (s32)((u32)bounds.minimumZ + 1u);
    return SpriteEffectManager_CreatePresetEffect(
        self->spriteEffectManager, presetOffset + 28, &bounds, 0);
}

/* Select preset 30 plus the caller's offset in a centered 20-by-20 integer
 * region. The low halfword of primitiveColor is forwarded to the factory. */
u32 Graphics3dPresentation_CreatePreset30ColoredRegionSpriteEffectAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z,
    u16 primitiveColor)
{
    SpriteEffectBounds bounds;

    bounds.minimumX = INTEGER_TO_FX32((s32)((u32)x - 10u));
    bounds.minimumZ = INTEGER_TO_FX32((s32)((u32)z - 10u));
    bounds.maximumX = (s32)((u32)bounds.minimumX + 0x14000u);
    bounds.maximumZ = (s32)((u32)bounds.minimumZ + 0x14000u);
    return SpriteEffectManager_CreatePresetEffect(
        self->spriteEffectManager, presetOffset + 30, &bounds,
        primitiveColor);
}

/* Select preset 31 plus the caller's offset in a centered 20-by-20 integer
 * X/Z region and return the manager-owned effect handle. */
u32 Graphics3dPresentation_CreatePreset31VariantRegionSpriteEffectAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z)
{
    SpriteEffectBounds bounds;

    bounds.minimumX = INTEGER_TO_FX32((s32)((u32)x - 10u));
    bounds.minimumZ = INTEGER_TO_FX32((s32)((u32)z - 10u));
    bounds.maximumX = (s32)((u32)bounds.minimumX + 0x14000u);
    bounds.maximumZ = (s32)((u32)bounds.minimumZ + 0x14000u);
    return SpriteEffectManager_CreatePresetEffect(
        self->spriteEffectManager, presetOffset + 31, &bounds, 0);
}

/* Select preset 32 plus the caller's offset in a centered integer X/Z area.
 * Arithmetic right shifts preserve retail's floor division for odd negative
 * extents. Return the manager-owned effect handle. */
u32 Graphics3dPresentation_CreatePreset32CenteredAreaSpriteEffect(
    Graphics3dPresentation *self, s32 presetOffset, s32 centerX, s32 centerZ,
    s32 extentX, s32 extentZ)
{
    SpriteEffectBounds bounds;
    s32 minimumX = centerX - (extentX >> 1);
    s32 minimumZ = centerZ - (extentZ >> 1);

    bounds.minimumX = INTEGER_TO_FX32(minimumX);
    bounds.minimumZ = INTEGER_TO_FX32(minimumZ);
    bounds.maximumX = (s32)((u32)bounds.minimumX +
                            (u32)INTEGER_TO_FX32(extentX));
    bounds.maximumZ = (s32)((u32)bounds.minimumZ +
                            (u32)INTEGER_TO_FX32(extentZ));
    return SpriteEffectManager_CreatePresetEffect(
        self->spriteEffectManager, presetOffset + 32, &bounds, 0);
}

/* Select timed point preset 22 through 24 and, when allocation succeeds, set
 * its explicit Q20.12 horizontal X/Z velocity. The manager owns the effect;
 * a full manager silently leaves state unchanged, matching retail. */
void Graphics3dPresentation_CreatePreset22To24TimedPointSpriteEffectWithHorizontalVelocityAt(
    Graphics3dPresentation *self, s32 presetOffset, s32 x, s32 z,
    s32 horizontalVelocityX, s32 horizontalVelocityZ, s32 particleLifetime)
{
    SpriteEffectBounds bounds;
    u32 effectHandle;

    bounds.minimumX = INTEGER_TO_FX32(x);
    bounds.minimumZ = INTEGER_TO_FX32(z);
    bounds.maximumX = bounds.minimumX;
    bounds.maximumZ = bounds.minimumZ;
    effectHandle = SpriteEffectManager_CreatePresetEffect(
        self->spriteEffectManager, presetOffset + 22, &bounds,
        particleLifetime);
    if (effectHandle != SPRITE_EFFECT_INVALID_HANDLE) {
        SpriteEffectManager_SetHorizontalVelocityXZ(
            self->spriteEffectManager, effectHandle,
            horizontalVelocityX, horizontalVelocityZ);
    }
}

#undef INTEGER_TO_FX32
