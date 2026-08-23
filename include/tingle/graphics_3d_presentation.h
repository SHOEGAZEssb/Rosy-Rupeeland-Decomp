#ifndef TINGLE_GRAPHICS_3D_PRESENTATION_H
#define TINGLE_GRAPHICS_3D_PRESENTATION_H

#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/*
 * Shared 3D effect-presentation owner. The object owns the three manager
 * allocations at +0x4e0..+0x4e8 and borrows worldPosition only for the
 * duration of UpdateFrame. Clear destroys subordinate live effects without
 * releasing those managers or their VRAM resources; Destroy releases the
 * managers but not the caller-owned Graphics3dPresentation allocation.
 */
typedef struct Graphics3dPresentation {
    /* The renderer/resource sublayout through +0x4df remains opaque here. */
    u8 rendererAndResourceState[0x4e0];
    void *transformManager;
    void *pairedEntryManager;
    void *slotManager;
    VecFx32Object transformOffset;
    fx32 scale;
    s32 hideRequested;
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
void Graphics3dPresentation_UpdateFrame(
    Graphics3dPresentation *self, const VecFx32Object *worldPosition,
    s32 swapBuffers);
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
