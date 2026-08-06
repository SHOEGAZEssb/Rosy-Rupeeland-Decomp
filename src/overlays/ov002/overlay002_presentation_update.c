#include "tingle/types.h"

/*
 * Overlay 2 presentation update. This recovered helper advances the two owner
 * resource contexts used by the subsystem's fixed sprite collection.
 */

typedef struct Overlay002PresentationUpdateState {
    u8 field_000[0x10];
    void *resourceA_010;
    void *resourceB_014;
} Overlay002PresentationUpdateState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020740a4(void *resource);
#ifdef __cplusplus
}
#endif

/*
 * Pass resourceA_010 and resourceB_014 to func_020740a4 in order. Returns no
 * value; any animation/rendering state changes occur in that callee, with no
 * direct hardware access here.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov002_021fba00(Overlay002PresentationUpdateState *state)
{
    func_020740a4(state->resourceA_010);
    func_020740a4(state->resourceB_014);
}
