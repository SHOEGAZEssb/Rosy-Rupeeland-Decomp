#include "tingle/util_animation_resource.h"

/* Retail CUtilAnmRes vtable; its RTTI descriptor remains in the original gap. */

extern const void *data_020d412c;

UtilAnimationResourceVTable data_020d4168 = {
    UtilAnimationResource_Destroy,
    UtilAnimationResource_DestroyAndFree,
    0,
    &data_020d412c,
};
