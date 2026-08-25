#ifndef TINGLE_FIELD_EFFECT_H
#define TINGLE_FIELD_EFFECT_H

#include "tingle/types.h"

/*
 * Base of the runtime field-effect hierarchy. Dispatch-state bit zero gates
 * HBlank callbacks, bit one gates VBlank callbacks, and bits 2..9 hold the
 * signed key used to detach matching list nodes.
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
void FieldEffect_VBlankCallbackNoOp(FieldEffect *self);
void FieldEffect_HBlankCallbackNoOp(FieldEffect *self, s32 vcount);
void FieldEffect_ScreenModeChangedCallbackNoOp(FieldEffect *self,
                                                s32 screenMode);
void FieldEffect_SetEnabledNoOp(FieldEffect *self, s32 enabled);
void FieldEffect_Slot1CCallbackNoOp(void);

#ifdef __cplusplus
}
#endif

#endif
