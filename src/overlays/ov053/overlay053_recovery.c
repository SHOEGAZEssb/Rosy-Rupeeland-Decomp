#include "tingle/types.h"

/*
 * Overlay 53 field-effect scene lifecycle, graphics setup, and static callback
 * initialization. Exact assembly preserves cleanup, GameWork, and MMIO ordering.
 */

/* Construct the caller-owned field-effect scene and return it; heap, task, graphics, sound, and GameWork state change. */
extern "C" void *func_ov053_0220d624(void *scene, u32 mode);
/* Destroy scene-owned resources without freeing `scene`, return it, and update graphics/task/SDK state. */
extern "C" void *func_ov053_0220d7fc(void *scene);
/* Destroy and free `scene`, return its former identity, and update heap/graphics/task/SDK state. */
extern "C" void *func_ov053_0220d850(void *scene);
/* Advance input, audio, GameWork, transition, and effect state; return the recovered scene status. */
extern "C" s32 func_ov053_0220d8ac(void *scene);
/* Allocate, construct, and register a scene; return the allocation and update heap/scene-manager state. */
extern "C" void *func_ov053_0220da0c(u32 mode);
/* Configure/load/apply temporary graphics resources and BG scroll state; VRAM, display MMIO, and SDK state change. */
extern "C" void func_ov053_0220da60(void *scene);
/* Construct and register five static coordinate callback objects during overlay initialization; global runtime state changes. */
extern "C" void __sinit_ov053_0220dbb4(void);
