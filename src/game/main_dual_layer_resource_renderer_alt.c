#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement a second main-engine dual-layer renderer type. It has a distinct
 * vtable and lifecycle entry points, but its resource-loading and BG0/BG1
 * hardware setup body is equivalent to MainDualLayerResourceRenderer_LoadBgResources.
 */
typedef struct MainDualLayerResourceRendererAlt {
    void **vtable_00;
} MainDualLayerResourceRendererAlt;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gMainDualLayerResourceRendererAltVtable;
extern void DualLayerTileRendererBase_InitBase(void *self);
extern void DualLayerTileRendererBase_Destroy(void *self);
extern void DualLayerTileRenderer_LoadFromConfig(void *self,
                                                 const void *config,
                                                 s32 mode, s32 variant);
extern void DualLayerTileRenderer_ActivateLayers(void *self, s32 notify);
extern void MainDualLayerResourceRenderer_LoadBgResources(void *self);
void MainDualLayerResourceRendererAlt_LoadBgResources(MainDualLayerResourceRendererAlt *self);
#ifdef __cplusplus
}
#endif

/* Construct the common renderer, install this variant's vtable, and return self. */
MainDualLayerResourceRendererAlt *MainDualLayerResourceRendererAlt_Init(MainDualLayerResourceRendererAlt *self)
{
    DualLayerTileRendererBase_InitBase(self);
    self->vtable_00 = (void **)gMainDualLayerResourceRendererAltVtable;
    return self;
}

/* Run common renderer teardown and return self without freeing it. */
MainDualLayerResourceRendererAlt *MainDualLayerResourceRendererAlt_DestroyComplete(MainDualLayerResourceRendererAlt *self)
{
    DualLayerTileRendererBase_Destroy(self);
    return self;
}

/* Run common renderer teardown, free self, and return its former address. */
MainDualLayerResourceRendererAlt *MainDualLayerResourceRendererAlt_DestroyAndFree(MainDualLayerResourceRendererAlt *self)
{
    DualLayerTileRendererBase_Destroy(self);
    Heap_Free(self);
    return self;
}

/* Forward the caller-owned config and mode selectors through the first common
 * activation path, then perform this variant's resource setup. */
void MainDualLayerResourceRendererAlt_ActivatePrimary(
    MainDualLayerResourceRendererAlt *self, const void *config, s32 mode,
    s32 variant)
{
    DualLayerTileRenderer_LoadFromConfig(self, config, mode, variant);
    MainDualLayerResourceRendererAlt_LoadBgResources(self);
}

/* Forward the caller's notification flag through the second common activation
 * path, then perform this variant's resource setup. */
void MainDualLayerResourceRendererAlt_ActivateSecondary(
    MainDualLayerResourceRendererAlt *self, s32 notify)
{
    DualLayerTileRenderer_ActivateLayers(self, notify);
    MainDualLayerResourceRendererAlt_LoadBgResources(self);
}

/*
 * Perform the same confirmed setup as MainDualLayerResourceRenderer_LoadBgResources: configure main BG0 with
 * resource IDs 0xa006..0xa008, route palette bytes into the main BG palette
 * buffer, configure main BG1 with IDs 0xa000..0xa002, upload both tile maps,
 * and enable their DISPCNT planes. The retail body is duplicated rather than
 * called; the portable form delegates to the documented equivalent.
 */
void MainDualLayerResourceRendererAlt_LoadBgResources(MainDualLayerResourceRendererAlt *self)
{
    MainDualLayerResourceRenderer_LoadBgResources(self);
}
