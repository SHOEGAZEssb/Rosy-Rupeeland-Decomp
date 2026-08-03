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
void func_02072000(GraphicsResourceSet *set);
void func_02072048(GraphicsResourceSet *set, s32 value0, s32 value1);
void GraphicsResourceSet_Apply(GraphicsResourceSet *set, s32 value0,
                               s32 value1);

void func_020720c0(GraphicsResourceSet *set);
GraphicsResourceSet *func_020720d4(GraphicsResourceSet *set);
void func_020720e8(GraphicsResourceSet *set, void *archive, u32 resource0Id,
                   u32 resource1Id, u32 resource2Id);
void func_02072140(GraphicsResourceSet *set);

#ifdef __cplusplus
}
#endif

#endif
