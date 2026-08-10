#include "tingle/animation_resource.h"

/* Retail CkkAnmRes virtual destructor pair. */

AnimationResourceVTable gAnimationResourceVTable = {
    AnimationResource_Destroy,
    AnimationResource_DestroyAndFree,
};
