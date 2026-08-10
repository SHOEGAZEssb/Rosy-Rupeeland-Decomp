#include "tingle/util_animation_resource.h"

/* Retail CUtilAnmRes vtable; its RTTI descriptor remains in the original gap. */

extern const void *data_020d412c;

UtilAnimationResourceVTable gUtilAnimationResourceVTable = {
    UtilAnimationResource_Destroy,
    UtilAnimationResource_DestroyAndFree,
    0,
    &data_020d412c,
};
