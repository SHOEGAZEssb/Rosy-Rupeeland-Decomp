#include "tingle/graphics_resources.h"
#include "tingle/types.h"

/* Overlay 11 fixed sub-display resource application. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern void func_02070f34(void *resource, s32 value);
extern void func_020b44e8(void);
#ifdef __cplusplus
}
#endif

/*
 * Ignore the scene argument, load confirmed resource IDs 0xC003..0xC005 into
 * a temporary set, configure resource 2 with value 0xF, synchronize, apply
 * with arguments 0 and 0x1E0, then destroy the set. Returns no value; resource
 * loading/application owns all observable graphics effects.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov011_021fd3a8(void *state)
{
    GraphicsResourceSet set;

    (void)state;
    GraphicsResourceSet_Init(&set);
    GraphicsResourceSet_Load(&set, data_020f4e18, 0xc003, 0xc004, 0xc005);
    func_02070f34(set.resource2, 0x0f);
    func_020b44e8();
    GraphicsResourceSet_Apply(&set, 0, 0x1e0);
    GraphicsResourceSet_Destroy(&set);
}
