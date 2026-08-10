#ifndef TINGLE_GRAPHICS_3D_COMMAND_H
#define TINGLE_GRAPHICS_3D_COMMAND_H

#include "tingle/types.h"

#ifdef __cplusplus
extern "C" {
#endif

void Graphics3DCommand_SetPolygonAttr(u32 lightMask, u32 polygonMode,
                                      u32 cullMode, u32 polygonId, u32 alpha,
                                      u32 miscFlags);

#ifdef __cplusplus
}
#endif

#endif
