#include "tingle/field_effect.h"
#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Dispatch four timed commands through one retained context.  The presentation
 * waits five updates before each dispatch, reuses four caller arguments, and
 * supplies trailing command IDs 0x1fd, 0x1fe, 0x1ff, and finally zero.
 */
typedef struct FourStageCommandPresentation {
    void **vtable00;
    u32 dispatchState;
    s32 argument08;
    s32 argument0c;
    s32 argument10;
    s32 argument14;
    s32 stage18;
    s32 timer1c;
    void *context20;
} FourStageCommandPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gFourStageCommandPresentationVtable;

extern void DualLayerTileRenderer_FillTileRectangle(void *context, s32 mode, s32 argument08,
                          s32 argument0c, s32 argument10, s32 argument14,
                          s32 commandId);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the FieldEffect base, retain context from r1, arguments at offsets
 * 8/12 from r2/r3 and offsets 16/20 from the two stack arguments, zero stage
 * and timer, install the recovered vtable, and return self.
 */
FourStageCommandPresentation *FourStageCommandPresentation_Init(
    FourStageCommandPresentation *self, void *context,
    s32 argument08, s32 argument0c, s32 argument10, s32 argument14)
{
    FieldEffect_Init(self);
    self->vtable00 = (void **)gFourStageCommandPresentationVtable;
    self->argument08 = argument08;
    self->argument0c = argument0c;
    self->argument10 = argument10;
    self->argument14 = argument14;
    self->stage18 = 0;
    self->timer1c = 0;
    self->context20 = context;
    return self;
}

/* Tear down the FieldEffect base and return self; retained arguments are not owned. */
FourStageCommandPresentation *FourStageCommandPresentation_Destroy(
    FourStageCommandPresentation *self)
{
    FieldEffect_DestroyBase(self);
    return self;
}

/* Perform FieldEffect base teardown, free self, and return its old address. */
FourStageCommandPresentation *FourStageCommandPresentation_DestroyAndFree(
    FourStageCommandPresentation *self)
{
    FieldEffect_DestroyBase(self);
    Heap_Free(self);
    return self;
}

/*
 * Increment timer in stages zero through three.  While timer <= 4, return zero.
 * Thereafter dispatch mode 1 with all four retained arguments and the stage's
 * trailing ID (0x1fd,0x1fe,0x1ff,0).  For the first three, advance stage, reset
 * timer, and return zero; after the final dispatch return one.
 */
s32 FourStageCommandPresentation_Update(FourStageCommandPresentation *self)
{
    static const s32 commandIds[4] = {0x1fd, 0x1fe, 0x1ff, 0};
    if ((u32)self->stage18 > 3) return 0;
    self->timer1c++;
    if (self->timer1c <= 4) return 0;
    DualLayerTileRenderer_FillTileRectangle(self->context20, 1, self->argument08, self->argument0c,
                  self->argument10, self->argument14,
                  commandIds[self->stage18]);
    if (self->stage18 == 3) return 1;
    self->stage18++;
    self->timer1c = 0;
    return 0;
}
