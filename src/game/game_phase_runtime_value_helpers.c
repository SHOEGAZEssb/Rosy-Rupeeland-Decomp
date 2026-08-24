#include "tingle/game_phase_runtime.h"
#include "tingle/touch_region.h"
#include "tingle/vec_fx32.h"

/* Compact placement-value helpers used by actor synchronization. */

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020adff0(const VecFx32Value *left,
                          const VecFx32Value *right,
                          VecFx32Value *destination);
#ifdef __cplusplus
}
#endif

/* Copy four signed halfwords from source to destination; changes no other state. */
void RectS16_Assign(RectS16 *destination, const RectS16 *source)
{
    destination->left = source->left;
    destination->top = source->top;
    destination->right = source->right;
    destination->bottom = source->bottom;
}

/*
 * Initialize destination, then add the three-component payloads beginning at
 * offset four of left and right. Null inputs remain null. Returns no value;
 * initialization and the external vector addition mutate destination.
 */
void VecFx32Object_InitSum(void *destination, const void *left, const void *right)
{
    VecFx32Object_Init((VecFx32Object *)destination);
    if (right != 0)
        right = (const u8 *)right + 4;
    if (left != 0)
        left = (const u8 *)left + 4;
    func_020adff0((const VecFx32Value *)left,
                  (const VecFx32Value *)right,
                  (VecFx32Value *)((u8 *)destination + 4));
}

/* Store four inputs as truncated signed halfwords; returns no value. */
void RectS16_InitComponents(RectS16 *destination, s32 left, s32 top,
                            s32 right, s16 bottom)
{
    destination->left = (s16)left;
    destination->top = (s16)top;
    destination->right = (s16)right;
    destination->bottom = bottom;
}
