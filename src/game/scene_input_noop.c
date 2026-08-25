/* Default scene input hook used when no derived behavior is installed. */
#include "tingle/types.h"

/* Return the inactive result without inspecting caller-owned scene state. */
s32 SceneInput_DefaultInactive(void *scene)
{
    (void)scene;
    return 0;
}
