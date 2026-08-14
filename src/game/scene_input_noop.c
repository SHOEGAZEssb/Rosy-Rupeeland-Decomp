/* Default scene input hook used when no derived behavior is installed. */
#include "tingle/types.h"

/* Return the inactive result without inspecting caller-owned scene state. */
s32 func_02091e20(void *scene)
{
    (void)scene;
    return 0;
}
