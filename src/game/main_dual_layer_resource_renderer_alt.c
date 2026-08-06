#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement a second main-engine dual-layer renderer type. It has a distinct
 * vtable and lifecycle entry points, but its resource-loading and BG0/BG1
 * hardware setup body is equivalent to func_0202bf4c.
 */
typedef struct MainDualLayerResourceRendererAlt {
    void **vtable_00;
} MainDualLayerResourceRendererAlt;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020ded3c;
extern void func_020291b8(void *self);
extern void func_020292f0(void *self);
extern void func_02029370(void *self);
extern void func_02029648(void *self);
extern void func_0202bf4c(void *self);
void func_0202c388(MainDualLayerResourceRendererAlt *self);
#ifdef __cplusplus
}
#endif

/* Construct the common renderer, install this variant's vtable, and return self. */
MainDualLayerResourceRendererAlt *func_0202c308(MainDualLayerResourceRendererAlt *self)
{
    func_020291b8(self);
    self->vtable_00 = (void **)data_020ded3c;
    return self;
}

/* Run common renderer teardown and return self without freeing it. */
MainDualLayerResourceRendererAlt *func_0202c328(MainDualLayerResourceRendererAlt *self)
{
    func_020292f0(self);
    return self;
}

/* Run common renderer teardown, free self, and return its former address. */
MainDualLayerResourceRendererAlt *func_0202c33c(MainDualLayerResourceRendererAlt *self)
{
    func_020292f0(self);
    Heap_Free(self);
    return self;
}

/* Run the first common activation path, then perform this variant's resource setup. */
void func_0202c358(MainDualLayerResourceRendererAlt *self)
{
    func_02029370(self);
    func_0202c388(self);
}

/* Run the second common activation path, then perform this variant's resource setup. */
void func_0202c370(MainDualLayerResourceRendererAlt *self)
{
    func_02029648(self);
    func_0202c388(self);
}

/*
 * Perform the same confirmed setup as func_0202bf4c: configure main BG0 with
 * resource IDs 0xa006..0xa008, route palette bytes into the main BG palette
 * buffer, configure main BG1 with IDs 0xa000..0xa002, upload both tile maps,
 * and enable their DISPCNT planes. The retail body is duplicated rather than
 * called; the portable form delegates to the documented equivalent.
 */
void func_0202c388(MainDualLayerResourceRendererAlt *self)
{
    func_0202bf4c(self);
}
