#include "tingle/frame_task.h"

/* Heap tags kept separate to reproduce their position in the retail data. */

/* Both insertion paths allocate list nodes with the tag "NODE". */
FrameTaskTags gFrameTaskTags = {
    "NODE",
    "NODE",
};
