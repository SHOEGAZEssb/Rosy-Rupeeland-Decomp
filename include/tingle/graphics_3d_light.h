#ifndef TINGLE_GRAPHICS_3D_LIGHT_H
#define TINGLE_GRAPHICS_3D_LIGHT_H

#include "tingle/types.h"

typedef struct Graphics3DLight {
    s32 x;
    s32 y;
    s32 z;
    u16 color;
    u16 enabled;
} Graphics3DLight;

typedef char Graphics3DLightSizeCheck[sizeof(Graphics3DLight) == 0x10 ? 1 : -1];

typedef struct Graphics3DLightSet {
    Graphics3DLight lights[4];
} Graphics3DLightSet;

#ifdef __cplusplus
extern "C" {
#endif

void Graphics3DLight_Init(Graphics3DLight *light);
void Graphics3DLight_DestroyNoOp(Graphics3DLight *light);
void Graphics3DLight_Apply(const Graphics3DLight *light, u32 lightId);
Graphics3DLightSet *Graphics3DLightSet_Init(Graphics3DLightSet *set);
Graphics3DLightSet *Graphics3DLightSet_Destroy(Graphics3DLightSet *set);

#ifdef __cplusplus
}
#endif

#endif
