#ifndef TINGLE_FIELD_EFFECT_H
#define TINGLE_FIELD_EFFECT_H

#include "tingle/types.h"

/*
 * Base of the runtime field-effect hierarchy. The low two dispatch flags gate
 * manager callbacks; bits 2..9 hold the signed key used for list removal.
 */
typedef struct FieldEffect {
    void **vtable;
    u32 dispatchState;
} FieldEffect;

typedef char FieldEffectSizeCheck[sizeof(FieldEffect) == 0x08 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern u8 gFieldEffectVtable[];

void *FieldEffect_Init(void *self);
void *FieldEffect_Destroy(void *self);
void *FieldEffect_DestroyAndFree(void *self);
void *FieldEffect_DestroyBase(void *self);

#ifdef __cplusplus
}
#endif

#endif
