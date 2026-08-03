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

#ifdef __cplusplus
}
#endif

#endif
