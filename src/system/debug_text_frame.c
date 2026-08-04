#include "tingle/debug_text_frame.h"

/*
 * Debug-text frame preparation. Two optional global renderer objects are
 * independently cleared at the start of a debug drawing pass.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void func_020755bc(void *renderer);
extern void *gDebugFont;
extern void *data_020f4e14;

#ifdef __cplusplus
}
#endif

/*
 * Clear each installed debug-text renderer. There are no inputs or return
 * value; null slots are skipped, and func_020755bc performs the observable
 * renderer reset for each non-null slot.
 */
void DebugText_BeginFrame(void)
{
    if (data_020f4e14 != 0)
        func_020755bc(data_020f4e14);

    if (gDebugFont != 0)
        func_020755bc(gDebugFont);
}
