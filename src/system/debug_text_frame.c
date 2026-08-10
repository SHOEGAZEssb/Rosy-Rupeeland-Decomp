#include "tingle/debug_text_frame.h"

/*
 * Debug-text frame preparation. Two optional global renderer objects are
 * independently cleared at the start of a debug drawing pass.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void GraphicsSpriteRenderer_ClearTextBuffer(void *renderer);
extern void *gDebugFont;
extern void *data_020f4e14;

#ifdef __cplusplus
}
#endif

/*
 * Clear each installed debug-text renderer. There are no inputs or return
 * value; null slots are skipped, and GraphicsSpriteRenderer_ClearTextBuffer performs the observable
 * renderer reset for each non-null slot.
 */
void DebugText_BeginFrame(void)
{
    if (data_020f4e14 != 0)
        GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);

    if (gDebugFont != 0)
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
}
