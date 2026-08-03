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
    struct GraphicsAnimationInstance *field_04;
    struct GraphicsAnimationInstance *field_08;
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
    u16 field_52;
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
    u32 field_00;
    u32 field_04;
    u32 field_08;
} GraphicsAnimationCreateParams;

/* 0x28-byte owner/list manager for GraphicsAnimationInstance nodes. */
typedef struct GraphicsAnimationInstanceManager {
    void *owner;
    struct GraphicsAnimationInstanceManager *previous;
    struct GraphicsAnimationInstanceManager *next;
    GraphicsAnimationInstance *head;
    GraphicsAnimationInstance *tail;
    s32 count;
    u32 field_18;
    u32 field_1c;
    u32 field_20;
    u32 field_24;
} GraphicsAnimationInstanceManager;

typedef char GraphicsAnimationInstanceManagerSizeCheck[
    sizeof(GraphicsAnimationInstanceManager) == 0x28 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void func_02076b48(GraphicsAnimationInstance *instance, void *owner);
void func_02076be8(GraphicsAnimationInstance *instance, s32 animationIndex);
void func_02076c20(GraphicsAnimationInstance *instance, s32 frameIndex);
void func_02076ca0(GraphicsAnimationInstance *instance);
void func_02077220(GraphicsAnimationInstance *instance);
u16 func_02077248(GraphicsAnimationInstance *instance);
void func_02077260(GraphicsAnimationInstanceManager *manager, void *owner);
void func_02077294(GraphicsAnimationInstanceManager *manager,
                   GraphicsAnimationInstance *instance);
void func_020772d0(GraphicsAnimationInstanceManager *manager,
                   GraphicsAnimationInstance *instance);
GraphicsAnimationInstance *func_02077308(
    GraphicsAnimationInstanceManager *manager,
    const GraphicsAnimationCreateParams *params);
void func_0207733c(GraphicsAnimationInstanceManager *manager,
                   GraphicsAnimationInstance *instance);
void func_0207735c(GraphicsAnimationInstanceManager *manager);
void func_020773a8(GraphicsAnimationInstanceManager *manager);
void func_020773cc(GraphicsAnimationInstanceManager *manager,
                   GraphicsAnimationInstance *instance,
                   const GraphicsAnimationCreateParams *params);
void func_020773e4(GraphicsAnimationInstanceManager *manager,
                   void *renderContext);
GraphicsAnimationInstance *func_02077734(
    struct Graphics3DResourceOwner *owner, void *textureResource,
    void *paletteResource, GraphicsAnimationResource *animationResource,
    GraphicsAnimationInstanceManager *manager);
void func_020777ac(struct Graphics3DResourceOwner *owner,
                   GraphicsAnimationInstance *instance);
void func_020777e8(struct Graphics3DResourceOwner *owner,
                   GraphicsAnimationInstance *instance,
                   const GraphicsAnimationCreateParams *params);

#ifdef __cplusplus
}
#endif

#endif
