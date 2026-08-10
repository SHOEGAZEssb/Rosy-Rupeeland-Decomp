#include "tingle/actor_motion.h"

/* Direction-angle calculation shared by actor-motion setup routines. */

#ifdef __cplusplus
extern "C" {
#endif
extern u32 func_020ae024(s32 y, s32 x);
#ifdef __cplusplus
}
#endif

/*
 * Return the SDK angle for the X/Y displacement from `from` to `to`. Neither
 * vector changes; Z is deliberately ignored and no hardware state is touched.
 */
u32 VecFx32_GetDirectionAngle(const VecFx32Object *from, const VecFx32Object *to)
{
    return func_020ae024(to->value.y - from->value.y,
                         to->value.x - from->value.x);
}
