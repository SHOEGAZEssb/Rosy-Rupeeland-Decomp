#include "tingle/types.h"

/* Overlay 53 embedded field-effect record initialization. */

extern "C" void AnimationResourceState_Init(void *record);
extern "C" u32 gAnimationResourceVTable[];

/*
 * Initialize the embedded record at offset four, install its confirmed SDK
 * descriptor, and return `object`. Object/SDK state changes; no MMIO occurs.
 */
extern "C" void *func_ov053_0220d600(void *object)
{
    AnimationResourceState_Init((u8 *)object + 4);
    *(u32 **)object = gAnimationResourceVTable;
    return object;
}
