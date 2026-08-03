#include "tingle/frame_task.h"

/* Storage for the process-wide frame-task list used by the main loop. */

/* Its vtable is installed by the original static initializer at 0x020C1374. */
FrameTaskList gFrameTaskList;
