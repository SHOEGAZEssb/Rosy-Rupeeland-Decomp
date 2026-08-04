#include "tingle/system.h"
#include "tingle/bg_scroll.h"

/*
 * Early game-runtime bootstrap. It establishes the NitroSDK operating-system,
 * thread, and tick services before clearing game-owned background-scroll state
 * and creating the heap used by subsequent subsystem constructors.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void OS_Init(void);
extern void OS_InitThread(void);
extern void OS_InitTick(void);

#ifdef __cplusplus
}
#endif

/*
 * Initialize required SDK services and then the two game-owned foundations.
 * The routine has no return value; failures follow the called SDK/heap policy.
 */
void InitRuntime(void)
{
    OS_Init();
    OS_InitThread();
    OS_InitTick();
    BgScroll_ClearDirty();
    InitHeap();
}
