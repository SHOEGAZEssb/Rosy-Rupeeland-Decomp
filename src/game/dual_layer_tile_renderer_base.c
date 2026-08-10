#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Provide lifecycle state shared by a two-layer tile renderer. The recovered
 * object owns up to two polymorphic layer objects at offsets 0x28/0x2c, one
 * embedded vector at 0x50, and a large renderer subobject at 0x60. Loading and
 * drawing operations follow in later address ranges.
 */
typedef struct DualLayerTileRendererBase {
    u8 base_00[0x28];
    void *layers_28[2];
    u8 field_30[0x14];
    s32 field_44;
    s32 width_48;
    s32 height_4c;
    u8 vector_50[0x10];
    u8 renderer_60[1];
} DualLayerTileRendererBase;

typedef void (*LayerDestructor)(void *);

#ifdef __cplusplus
extern "C" {
#endif
extern void *gDualLayerTileRendererBaseVtable;
extern void ByteTileMapOwner_Init(void *);
extern void ByteTileMapOwner_Destroy(void *);
extern void VecFx32Object_Init(void *);
extern void VecFx32Object_Destroy(void *);
extern void AnimatedTileStagingBuffer_Init(void *);
extern void AnimatedTileStagingBuffer_Destroy(void *);
void DualLayerTileRendererBase_DestroyOwnedLayers(DualLayerTileRendererBase *);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the renderer base, vector, and offset-0x60 subobject; clear both
 * layer pointers and field 0x44; set default dimensions 28 by 30; return self.
 */
DualLayerTileRendererBase *DualLayerTileRendererBase_InitBase(DualLayerTileRendererBase *self)
{
    ByteTileMapOwner_Init(self);
    *(void ***)self = (void **)gDualLayerTileRendererBaseVtable;
    VecFx32Object_Init(self->vector_50);
    AnimatedTileStagingBuffer_Init(self->renderer_60);
    self->layers_28[0] = 0;
    self->layers_28[1] = 0;
    self->field_44 = 0;
    self->width_48 = 28;
    self->height_4c = 30;
    return self;
}

/* Construct the same default renderer state for the alternate recovered entry point. */
DualLayerTileRendererBase *DualLayerTileRendererBase_Init(DualLayerTileRendererBase *self)
{
    ByteTileMapOwner_Init(self);
    *(void ***)self = (void **)gDualLayerTileRendererBaseVtable;
    VecFx32Object_Init(self->vector_50);
    AnimatedTileStagingBuffer_Init(self->renderer_60);
    self->layers_28[0] = 0;
    self->layers_28[1] = 0;
    self->field_44 = 0;
    self->width_48 = 28;
    self->height_4c = 30;
    return self;
}

/* Destroy layers, embedded renderer/vector state, and the base; return self. */
DualLayerTileRendererBase *DualLayerTileRendererBase_DestroyComplete(DualLayerTileRendererBase *self)
{
    *(void ***)self = (void **)gDualLayerTileRendererBaseVtable;
    DualLayerTileRendererBase_DestroyOwnedLayers(self);
    AnimatedTileStagingBuffer_Destroy(self->renderer_60);
    VecFx32Object_Destroy(self->vector_50);
    ByteTileMapOwner_Destroy(self);
    return self;
}

/* Perform full teardown, free self, and return its old address. */
DualLayerTileRendererBase *DualLayerTileRendererBase_DestroyAndFree(DualLayerTileRendererBase *self)
{
    *(void ***)self = (void **)gDualLayerTileRendererBaseVtable;
    DualLayerTileRendererBase_DestroyOwnedLayers(self);
    AnimatedTileStagingBuffer_Destroy(self->renderer_60);
    VecFx32Object_Destroy(self->vector_50);
    ByteTileMapOwner_Destroy(self);
    Heap_Free(self);
    return self;
}

/* Alternate non-freeing teardown entry; effects match DualLayerTileRendererBase_DestroyComplete. */
DualLayerTileRendererBase *DualLayerTileRendererBase_Destroy(DualLayerTileRendererBase *self)
{
    *(void ***)self = (void **)gDualLayerTileRendererBaseVtable;
    DualLayerTileRendererBase_DestroyOwnedLayers(self);
    AnimatedTileStagingBuffer_Destroy(self->renderer_60);
    VecFx32Object_Destroy(self->vector_50);
    ByteTileMapOwner_Destroy(self);
    return self;
}

/* Invoke vtable slot one on each non-null owned layer object. */
void DualLayerTileRendererBase_DestroyOwnedLayers(DualLayerTileRendererBase *self)
{
    s32 i;
    for (i = 0; i < 2; i++) {
        void *layer = self->layers_28[i];
        if (layer)
            ((LayerDestructor)(*(void ***)layer)[1])(layer);
    }
}

/* Store the renderer's field 0x44 and its width/height values. */
void DualLayerTileRendererBase_SetLayoutParameters(DualLayerTileRendererBase *self, s32 field44,
                   s32 width, s32 height)
{
    self->field_44 = field44;
    self->width_48 = width;
    self->height_4c = height;
}
