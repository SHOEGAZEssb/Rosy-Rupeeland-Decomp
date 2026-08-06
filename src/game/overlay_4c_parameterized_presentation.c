#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Wrap an overlay-94 0x4c-byte component that requires two constructor
 * arguments.  The wrapper owns the component, manages a helper configured with
 * ID 0x5e, and forwards two presentation operations.
 */
typedef struct Overlay4cParameterizedPresentation {
    void **vtable00;
    u32 field04;
    void *component08;
    u8 helper0c[0x10];
} Overlay4cParameterizedPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d68bc;
extern const char data_020d69e4[];
extern void func_0201e250(void *);
extern void func_0201e28c(void *);
extern void func_02006268(void *);
extern void func_02006280(void *);
extern void func_020062a0(void *, s32);
extern void func_020062f8(void *);
extern void *func_ov094_02219568(void *, void *, void *);
extern void func_ov094_022196a4(void *);
extern s32 func_ov094_022196e8(void *);
extern s32 data_ov089_022198e8(void *);
#ifdef __cplusplus
}
#endif

/*
 * Initialize base/helper, set helper ID 0x5e, allocate the component, pass its
 * two recovered pointer arguments to the overlay constructor, and return self.
 */
Overlay4cParameterizedPresentation *func_0202432c(
    Overlay4cParameterizedPresentation *self, void *first, void *second)
{
    func_0201e250(self);self->vtable00=(void **)data_020d68bc;
    func_02006268(self->helper0c);func_020062a0(self->helper0c,0x5e);
    self->component08=Heap_Alloc(0x4c,data_020d69e4,4,&gHeapContext);
    if(self->component08)self->component08=func_ov094_02219568(self->component08,first,second);
    return self;
}

/* Destroy/free the component, tear down helper and base, and return self. */
Overlay4cParameterizedPresentation *func_020243a0(
    Overlay4cParameterizedPresentation *self)
{
    self->vtable00=(void **)data_020d68bc;
    if(self->component08){func_ov094_022196a4(self->component08);Heap_Free(self->component08);}
    func_020062f8(self->helper0c);func_02006280(self->helper0c);func_0201e28c(self);
    return self;
}

/* Perform func_020243a0 teardown, free self, and return its old address. */
Overlay4cParameterizedPresentation *func_020243f0(
    Overlay4cParameterizedPresentation *self)
{func_020243a0(self);Heap_Free(self);return self;}

/* Tail-forward the first operation to the owned overlay component. */
s32 func_02024448(Overlay4cParameterizedPresentation *self)
{return func_ov094_022196e8(self->component08);}

/*
 * Tail-forward the second operation.  The address-derived symbol is labeled as
 * data because overlays share its address; this call behavior is confirmed.
 */
s32 func_02024458(Overlay4cParameterizedPresentation *self)
{return data_ov089_022198e8(self->component08);}
