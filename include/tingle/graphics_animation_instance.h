#ifndef TINGLE_GRAPHICS_ANIMATION_INSTANCE_H
#define TINGLE_GRAPHICS_ANIMATION_INSTANCE_H

#include "tingle/types.h"
#include "tingle/graphics_sprite_runtime_lifecycle.h"

struct Graphics3DResourceOwner;

typedef struct GraphicsAnimationSetHeader {
    u32 field_00;
    s32 animationCount;
} GraphicsAnimationSetHeader;

typedef struct GraphicsAnimationSequenceInfo {
    u16 firstFrame;
    u16 frameCount;
    u16 duration;
    u16 field_06;
} GraphicsAnimationSequenceInfo;

typedef struct GraphicsAnimationFrameInfo {
    u16 field_00;
    u16 duration;
} GraphicsAnimationFrameInfo;

/* Confirmed animation-related tables within a larger resource object. */
typedef struct GraphicsAnimationResource {
    u8 field_00[0x20];
    GraphicsAnimationSetHeader *setHeader;
    GraphicsAnimationSequenceInfo *sequences;
    GraphicsAnimationFrameInfo *frames;
} GraphicsAnimationResource;

/* 0x5c-byte runtime instance; unknown fields retain offset-derived names. */
typedef struct GraphicsAnimationInstance {
    void *owner;
    struct GraphicsAnimationInstance *previous;
    struct GraphicsAnimationInstance *next;
    GraphicsSpriteRegion *textureRegion;
    GraphicsSpriteRegion *paletteRegion;
    void *textureResource;
    void *paletteResource;
    GraphicsAnimationResource *resource;
    u32 field_20;
    u32 field_24;
    u32 field_28;
    u32 field_2c;
    s32 animationTime;
    s32 scaleX;
    s32 scaleY;
    u32 field_3c;
    u32 field_40;
    u32 field_44;
    u16 field_48;
    u16 field_4a;
    u16 field_4c;
    u16 field_4e;
    u16 flags;
    u16 timeStep;
    u8 animationIndex;
    u8 frameIndex;
    u8 field_56;
    u8 field_57;
    u8 field_58;
    u8 field_59;
    u8 field_5a;
    u8 field_5b;
} GraphicsAnimationInstance;

typedef char GraphicsAnimationInstanceSizeCheck[
    sizeof(GraphicsAnimationInstance) == 0x5c ? 1 : -1];

typedef struct GraphicsAnimationCreateParams {
    u32 textureResource;
    u32 paletteResource;
    u32 animationResource;
} GraphicsAnimationCreateParams;

/* 0x28-byte owner/list manager for GraphicsAnimationInstance nodes. */
typedef struct GraphicsAnimationInstanceManager {
    void *owner;
    struct GraphicsAnimationInstanceManager *previous;
    struct GraphicsAnimationInstanceManager *next;
    GraphicsAnimationInstance *head;
    GraphicsAnimationInstance *tail;
    s32 count;
    u32 translationX;
    u32 translationY;
    u32 translationZ;
    u32 renderEnabled;
} GraphicsAnimationInstanceManager;

typedef char GraphicsAnimationInstanceManagerSizeCheck[
    sizeof(GraphicsAnimationInstanceManager) == 0x28 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void GraphicsAnimationInstance_Init(GraphicsAnimationInstance *instance,
                                    void *owner);
void GraphicsAnimationInstance_SetAnimation(
    GraphicsAnimationInstance *instance, s32 animationIndex);
void GraphicsAnimationInstance_SetFrame(GraphicsAnimationInstance *instance,
                                        s32 frameIndex);
void GraphicsAnimationInstance_Update(GraphicsAnimationInstance *instance);
void GraphicsAnimationInstance_Destroy(GraphicsAnimationInstance *instance);
u16 GraphicsAnimationInstance_GetSequenceDuration(
    GraphicsAnimationInstance *instance);
void GraphicsAnimationInstanceManager_Init(
    GraphicsAnimationInstanceManager *manager, void *owner);
void GraphicsAnimationInstanceManager_Append(
    GraphicsAnimationInstanceManager *manager,
    GraphicsAnimationInstance *instance);
void GraphicsAnimationInstanceManager_Unlink(
    GraphicsAnimationInstanceManager *manager,
    GraphicsAnimationInstance *instance);
GraphicsAnimationInstance *GraphicsAnimationInstanceManager_CreateInstance(
    GraphicsAnimationInstanceManager *manager,
    const GraphicsAnimationCreateParams *params);
void GraphicsAnimationInstanceManager_DestroyInstance(
    GraphicsAnimationInstanceManager *manager,
    GraphicsAnimationInstance *instance);
void GraphicsAnimationInstanceManager_Clear(
    GraphicsAnimationInstanceManager *manager);
void GraphicsAnimationInstanceManager_Update(
    GraphicsAnimationInstanceManager *manager);
void GraphicsAnimationInstanceManager_RebindInstance(
    GraphicsAnimationInstanceManager *manager,
    GraphicsAnimationInstance *instance,
    const GraphicsAnimationCreateParams *params);
void GraphicsAnimationInstanceManager_Render(
    GraphicsAnimationInstanceManager *manager, void *renderContext);
GraphicsAnimationInstance *Graphics3DResourceOwner_CreateAnimationInstance(
    struct Graphics3DResourceOwner *owner, void *textureResource,
    void *paletteResource, GraphicsAnimationResource *animationResource,
    GraphicsAnimationInstanceManager *manager);
void Graphics3DResourceOwner_DestroyAnimationInstance(
    struct Graphics3DResourceOwner *owner,
    GraphicsAnimationInstance *instance);
void Graphics3DResourceOwner_RebindAnimationInstance(
    struct Graphics3DResourceOwner *owner,
    GraphicsAnimationInstance *instance,
    const GraphicsAnimationCreateParams *params);

#ifdef __cplusplus
}
#endif

#endif
