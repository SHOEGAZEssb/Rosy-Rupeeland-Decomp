#include "tingle/types.h"

/* Coordinate one frame of the active runtime 3D presentation manager. */

#ifdef __cplusplus
extern "C" {
#endif

extern void func_020a2da8(void *manager);
extern void func_020a6280(void *manager);
extern void func_0209b7a0(void *presentation, const void *position);
extern void func_020a219c(void *presentation);
extern void func_0209b7cc(void *presentation, s32 argument);

#ifdef __cplusplus
}
#endif

/*
 * Update an enabled presentation using a borrowed world position. The two
 * child managers, transform, interpolation, and frame-finalization stages run
 * synchronously in retail order; disabled presentations have no effects.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_020a214c(void *presentation, const void *position, s32 argument)
{
    u8 *bytes = (u8 *)presentation;

    if (bytes[0x50a] == 0)
        return;
    func_020a2da8(*(void **)(bytes + 0x4e4));
    func_020a6280(*(void **)(bytes + 0x4e8));
    func_0209b7a0(presentation, position);
    func_020a219c(presentation);
    func_0209b7cc(presentation, argument);
}
