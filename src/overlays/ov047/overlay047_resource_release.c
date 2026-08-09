#include "tingle/types.h"

/*
 * Overlay 47 resource-pair teardown. The recovered helper releases optional
 * model and animation handles owned by the overlay's rendering controller.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *data_020f4e18;
extern "C" void func_02071bdc(void *resourceManager, void *model);
extern "C" void func_02071c38(void *resourceManager, void *animation);

/*
 * Release non-null model +0 and animation +4 through the shared resource
 * manager, then return the unchanged controller pointer. Resource-manager and
 * SDK graphics state change; storage is not freed and no direct MMIO occurs.
 */
extern "C" void *func_ov047_0220ba64(void *controller)
{
    if (FIELD(void *, controller, 0) != 0) {
        func_02071bdc(data_020f4e18, FIELD(void *, controller, 0));
    }
    if (FIELD(void *, controller, 4) != 0) {
        func_02071c38(data_020f4e18, FIELD(void *, controller, 4));
    }
    return controller;
}
