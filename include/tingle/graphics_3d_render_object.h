#ifndef TINGLE_GRAPHICS_3D_RENDER_OBJECT_H
#define TINGLE_GRAPHICS_3D_RENDER_OBJECT_H

#include "tingle/graphics_3d_resource_binding.h"
#include "tingle/types.h"

/* 0x10-byte render configuration owning one heap resource binding. */
typedef struct Graphics3DRenderObject {
    Graphics3DResourceBinding *binding;
    u32 field_04;
    u32 depth;
    u16 color;
    u16 polygonId;
} Graphics3DRenderObject;

typedef char Graphics3DRenderObjectSizeCheck[
    sizeof(Graphics3DRenderObject) == 0x10 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

Graphics3DRenderObject *Graphics3DRenderObject_Init(
    Graphics3DRenderObject *object, void *archive,
    Graphics3DResourceOwner *owner, u32 textureResourceId,
    u16 paletteResourceId);
Graphics3DRenderObject *Graphics3DRenderObject_Destroy(
    Graphics3DRenderObject *object);
void Graphics3DRenderObject_Draw(Graphics3DRenderObject *object);

#ifdef __cplusplus
}
#endif

#endif
