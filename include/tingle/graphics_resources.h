#ifndef TINGLE_GRAPHICS_RESOURCES_H
#define TINGLE_GRAPHICS_RESOURCES_H

#include "tingle/types.h"

/* Three related handles returned by the graphics-resource loader family. */
typedef struct GraphicsResourceSet {
    void *resource0;
    void *resource1;
    void *resource2;
} GraphicsResourceSet;

typedef char GraphicsResourceSetSizeCheck[
    sizeof(GraphicsResourceSet) == 0x0c ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern GraphicsResourceSet gGraphicsResourceSets[2];

GraphicsResourceSet *GraphicsResourceSets_Destroy(GraphicsResourceSet *sets);
void GraphicsResourceSets_Load(GraphicsResourceSet *sets);
GraphicsResourceSet *GraphicsResourceSets_Get(void);

void GraphicsResourceSet_Init(GraphicsResourceSet *set);
GraphicsResourceSet *GraphicsResourceSet_Destroy(GraphicsResourceSet *set);
void GraphicsResourceSet_Load(GraphicsResourceSet *set, void *archive,
                              u32 resource0Id, u32 resource1Id,
                              u32 resource2Id);
void GraphicsResourceSet_ReleaseHandles(GraphicsResourceSet *set);
void GraphicsResourceSet_ApplyToMainBg(GraphicsResourceSet *set, s32 value0, s32 value1);
void GraphicsResourceSet_Apply(GraphicsResourceSet *set, s32 value0,
                               s32 value1);

void GraphicsResourceSetVariant_Init(GraphicsResourceSet *set);
GraphicsResourceSet *GraphicsResourceSetVariant_Destroy(
    GraphicsResourceSet *set);
void GraphicsResourceSetVariant_Load(GraphicsResourceSet *set, void *archive,
                                     u32 resource0Id, u32 resource1Id,
                                     u32 resource2Id);
void GraphicsResourceSetVariant_ReleaseHandles(GraphicsResourceSet *set);

#ifdef __cplusplus
}
#endif

#endif
