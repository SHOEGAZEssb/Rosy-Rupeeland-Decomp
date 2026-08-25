#include "tingle/types.h"

/*
 * Recovered forwarding layer for interaction handlers. Most entry points are
 * address-distinct aliases of one of two shared implementations.
 */
typedef struct InteractionCallbackPair {
    u32 first;
    u32 second;
} InteractionCallbackPair;

extern InteractionCallbackPair data_020e1738;

#ifdef __cplusplus
extern "C" {
#endif
extern u32 Type7Actor_SelectRandomCallback(u32 first, u32 second, u32 third, u32 fourth);
extern u32 Type7Actor_SelectRandomCallbackPair01(u32 first, u32 second, u32 third, u32 fourth);
extern u32 Type7Actor_SetCallbackPair(u32 first, InteractionCallbackPair pair, s32 fourth);

/* Forward four register inputs to Type7Actor_SelectRandomCallback and return its result/state effects. */
u32 InteractionCallbackForwarder01_SelectRandomCallback(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallback(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallback and return its result/state effects. */
u32 InteractionCallbackForwarder02_SelectRandomCallback(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallback(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallback and return its result/state effects. */
u32 InteractionCallbackForwarder03_SelectRandomCallback(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallback(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallback and return its result/state effects. */
u32 InteractionCallbackForwarder04_SelectRandomCallback(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallback(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallback and return its result/state effects. */
u32 InteractionCallbackForwarder05_SelectRandomCallback(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallback(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallback and return its result/state effects. */
u32 InteractionCallbackForwarder06_SelectRandomCallback(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallback(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallback and return its result/state effects. */
u32 InteractionCallbackForwarder07_SelectRandomCallback(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallback(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallbackPair01 and return its result/state effects. */
u32 InteractionCallbackForwarder08_SelectRandomCallbackPair01(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallbackPair01(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallbackPair01 and return its result/state effects. */
u32 InteractionCallbackForwarder09_SelectRandomCallbackPair01(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallbackPair01(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallbackPair01 and return its result/state effects. */
u32 InteractionCallbackForwarder10_SelectRandomCallbackPair01(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallbackPair01(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallback and return its result/state effects. */
u32 InteractionCallbackForwarder11_SelectRandomCallback(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallback(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallback and return its result/state effects. */
u32 InteractionCallbackForwarder12_SelectRandomCallback(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallback(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallback and return its result/state effects. */
u32 InteractionCallbackForwarder13_SelectRandomCallback(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallback(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallback and return its result/state effects. */
u32 InteractionCallbackForwarder14_SelectRandomCallback(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallback(a, b, c, d); }

/*
 * Preserve first, replace the next inputs with data_020e1738 words zero/one
 * and -1, forward them to Type7Actor_SetCallbackPair, and return its result/state effects.
 */
u32 InteractionCallbackForwarder15_SetGlobalCallbackPair(u32 first)
{
    return Type7Actor_SetCallbackPair(first, data_020e1738, -1);
}

/* Forward four register inputs to Type7Actor_SelectRandomCallback and return its result/state effects. */
u32 InteractionCallbackForwarder16_SelectRandomCallback(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallback(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallbackPair01 and return its result/state effects. */
u32 InteractionCallbackForwarder17_SelectRandomCallbackPair01(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallbackPair01(a, b, c, d); }
/* Forward four register inputs to Type7Actor_SelectRandomCallbackPair01 and return its result/state effects. */
u32 InteractionCallbackForwarder18_SelectRandomCallbackPair01(u32 a, u32 b, u32 c, u32 d) { return Type7Actor_SelectRandomCallbackPair01(a, b, c, d); }

#ifdef __cplusplus
}
#endif
