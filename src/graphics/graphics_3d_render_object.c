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
extern const char data_020e6a0c[];
extern u8 gHeapContext[];

#ifdef __cplusplus
}
#endif

/*
 * Allocate and initialize a 0x18-byte resource binding from the supplied
 * archive, owner, and two resource IDs. Initialize the object's opaque words
 * to zero, field_0c to 0x7fff, and field_0e to 0x3f, then return object.
 * Retail records a null binding if allocation fails and otherwise assumes the
 * delegated binding construction succeeds.
 */
Graphics3DRenderObject *func_02077d7c(Graphics3DRenderObject *object,
                                      void *archive,
                                      Graphics3DResourceOwner *owner,
                                      u32 textureResourceId,
                                      u16 paletteResourceId)
{
    Graphics3DResourceBinding *binding =
        (Graphics3DResourceBinding *)Heap_Alloc(
            sizeof(Graphics3DResourceBinding), data_020e6a0c, 4,
            gHeapContext);

    if (binding != 0) {
        binding = func_02077ca0(binding, archive, owner, textureResourceId,
                                paletteResourceId);
    }
    object->binding = binding;
    object->field_0c = 0x7fff;
    object->field_04 = 0;
    object->field_0e = 0x3f;
    object->field_08 = 0;
    return object;
}

/*
 * If the owned binding exists, release its VRAM/archive resources and free its
 * storage. Return object. The binding pointer is deliberately not cleared and
 * is stale after this call; callers must not destroy or render the object twice.
 */
Graphics3DRenderObject *func_02077df8(Graphics3DRenderObject *object)
{
    Graphics3DResourceBinding *binding = object->binding;

    if (binding != 0) {
        func_02077d08(binding);
        Heap_Free(binding);
    }
    return object;
}
