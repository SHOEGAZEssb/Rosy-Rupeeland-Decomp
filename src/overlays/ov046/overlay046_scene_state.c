#include "tingle/types.h"

/*
 * Overlay 46 scene-state callbacks. These recovered routines enter the active
 * panel state, advance its timed presentation, and perform the final refresh.
 * Exact assembly retains switch layout and callback-installation sequences.
 */

/*
 * Enter the active state for `scene` and return zero. On first entry, invoke
 * the global transition helper, update auxiliary object +0x74, refresh and
 * populate panel +0x70, derive its table position, set the GameWork flag keyed
 * by scene +0x68, install the next callback via func_ov046_0220c7b0, and sync
 * rendering. Scene, GameWork, sprite, and renderer state change.
 */
extern "C" s32 func_ov046_0220cb88(void *scene);

/*
 * Advance the scene's phase at +4 and timer at +8 and return zero until the
 * callback changes. Early phases normalize the counter; after 60 frames the
 * marker sprite +0x64 is revealed and the phase advances; after another 180
 * frames the terminal callback is installed and rendering is synchronized.
 * Scene and sprite visibility change; SDK renderer effects occur indirectly.
 */
extern "C" s32 func_ov046_0220cc18(void *scene);

/*
 * Perform one final scene/panel refresh through func_ov046_0220cb4c and return
 * one to signal callback completion. Renderer state changes through the
 * callee; the scene is otherwise unchanged and no direct MMIO occurs.
 */
extern "C" s32 func_ov046_0220ccc0(void *scene);
