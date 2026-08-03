#include "tingle/scene_touch.h"

/*
 * Vtables shared by the scene touch dispatcher and its coordinate object.
 * This data-only unit preserves the retail section order: these tables precede
 * scene.c's data even though the dispatcher code follows scene.c's text.
 */

extern u8 data_020d3d44[];

/*
 * Keep both tables in one aggregate. MWCC otherwise reorders standalone data,
 * changing the task constructor's literal target and the retail data layout.
 */
SceneTouchInitialData gSceneTouchInitialData = {
    {
        TouchPoint_Destroy,
        TouchPoint_DestroyAndFree,
        0,
        data_020d3d44,
    },
    {
        SceneTouchTask_Destroy,
        SceneTouchTask_DestroyAndFree,
        SceneTouchTask_Update,
    },
};
