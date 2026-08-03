#ifndef TINGLE_GRAPHICS_SYSTEM_H
#define TINGLE_GRAPHICS_SYSTEM_H

#include "tingle/types.h"

typedef struct GraphicsSystemTags {
    char resourceManager[8];
    char mainEngine[8];
    char subEngine[8];
} GraphicsSystemTags;

#ifdef __cplusplus
extern "C" {
#endif

extern GraphicsSystemTags gGraphicsSystemTags;
extern void *gGraphicsState020F4E08;

void GraphicsSystem_Init(void);
void GraphicsSystem_CreateEngine(int engine);

#ifdef __cplusplus
}
#endif

#endif
