#include "tingle/graphics_3d_render_object.h"

/*
 * Small render-object lifetime wrapper. It owns a heap-allocated paired
 * texture/palette binding and stores the initial polygon/render parameters
 * later consumed by the NDS geometry submission path.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void *Heap_Alloc(u32 size, const char *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern const char gGraphics3DResourceBindingAllocationTag[];
extern u8 gHeapContext[];

#ifdef __cplusplus
}
#endif

/*
 * Allocate and initialize a 0x18-byte resource binding from the supplied
 * archive, owner, and two resource IDs. Initialize the opaque word and depth
 * to zero, color to RGB555 white, and polygonId to 0x3f, then return object.
 * Retail records a null binding if allocation fails and otherwise assumes the
 * delegated binding construction succeeds.
 */
Graphics3DRenderObject *Graphics3DRenderObject_Init(
    Graphics3DRenderObject *object, void *archive,
    Graphics3DResourceOwner *owner, u32 textureResourceId,
    u16 paletteResourceId)
{
    Graphics3DResourceBinding *binding =
        (Graphics3DResourceBinding *)Heap_Alloc(
            sizeof(Graphics3DResourceBinding), gGraphics3DResourceBindingAllocationTag, 4,
            gHeapContext);

    if (binding != 0) {
        binding = Graphics3DResourceBinding_Init(
            binding, archive, owner, textureResourceId, paletteResourceId);
    }
    object->binding = binding;
    object->color = 0x7fff;
    object->field_04 = 0;
    object->polygonId = 0x3f;
    object->depth = 0;
    return object;
}

/*
 * If the owned binding exists, release its VRAM/archive resources and free its
 * storage. Return object. The binding pointer is deliberately not cleared and
 * is stale after this call; callers must not destroy or render the object twice.
 */
Graphics3DRenderObject *Graphics3DRenderObject_Destroy(
    Graphics3DRenderObject *object)
{
    Graphics3DResourceBinding *binding = object->binding;

    if (binding != 0) {
        Graphics3DResourceBinding_Destroy(binding);
        Heap_Free(binding);
    }
    return object;
}
