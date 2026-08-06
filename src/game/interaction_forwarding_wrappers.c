#include "tingle/types.h"

/*
 * Recovered forwarding layer for interaction handlers. Most entry points are
 * address-distinct aliases of one of two shared implementations.
 */
extern u32 data_020e1738[];

#ifdef __cplusplus
extern "C" {
#endif
extern u32 func_02048000(u32 first, u32 second, u32 third, u32 fourth);
extern u32 func_020480c8(u32 first, u32 second, u32 third, u32 fourth);
extern u32 func_020481dc(u32 first, u32 second, u32 third, s32 fourth);
#ifdef __cplusplus
}
#endif

/* Forward four register inputs to func_02048000 and return its result/state effects. */
u32 func_02045410(u32 a, u32 b, u32 c, u32 d) { return func_02048000(a, b, c, d); }
/* Forward four register inputs to func_02048000 and return its result/state effects. */
u32 func_0204541c(u32 a, u32 b, u32 c, u32 d) { return func_02048000(a, b, c, d); }
/* Forward four register inputs to func_02048000 and return its result/state effects. */
u32 func_02045428(u32 a, u32 b, u32 c, u32 d) { return func_02048000(a, b, c, d); }
/* Forward four register inputs to func_02048000 and return its result/state effects. */
u32 func_02045434(u32 a, u32 b, u32 c, u32 d) { return func_02048000(a, b, c, d); }
/* Forward four register inputs to func_02048000 and return its result/state effects. */
u32 func_02045440(u32 a, u32 b, u32 c, u32 d) { return func_02048000(a, b, c, d); }
/* Forward four register inputs to func_02048000 and return its result/state effects. */
u32 func_0204544c(u32 a, u32 b, u32 c, u32 d) { return func_02048000(a, b, c, d); }
/* Forward four register inputs to func_02048000 and return its result/state effects. */
u32 func_02045458(u32 a, u32 b, u32 c, u32 d) { return func_02048000(a, b, c, d); }
/* Forward four register inputs to func_020480c8 and return its result/state effects. */
u32 func_02045464(u32 a, u32 b, u32 c, u32 d) { return func_020480c8(a, b, c, d); }
/* Forward four register inputs to func_020480c8 and return its result/state effects. */
u32 func_02045470(u32 a, u32 b, u32 c, u32 d) { return func_020480c8(a, b, c, d); }
/* Forward four register inputs to func_020480c8 and return its result/state effects. */
u32 func_0204547c(u32 a, u32 b, u32 c, u32 d) { return func_020480c8(a, b, c, d); }
/* Forward four register inputs to func_02048000 and return its result/state effects. */
u32 func_02045488(u32 a, u32 b, u32 c, u32 d) { return func_02048000(a, b, c, d); }
/* Forward four register inputs to func_02048000 and return its result/state effects. */
u32 func_02045494(u32 a, u32 b, u32 c, u32 d) { return func_02048000(a, b, c, d); }
/* Forward four register inputs to func_02048000 and return its result/state effects. */
u32 func_020454a0(u32 a, u32 b, u32 c, u32 d) { return func_02048000(a, b, c, d); }
/* Forward four register inputs to func_02048000 and return its result/state effects. */
u32 func_020454ac(u32 a, u32 b, u32 c, u32 d) { return func_02048000(a, b, c, d); }

/*
 * Preserve first, replace the next inputs with data_020e1738 words zero/one
 * and -1, forward them to func_020481dc, and return its result/state effects.
 */
u32 func_020454b8(u32 first)
{
    return func_020481dc(first, data_020e1738[0], data_020e1738[1], -1);
}

/* Forward four register inputs to func_02048000 and return its result/state effects. */
u32 func_020454d4(u32 a, u32 b, u32 c, u32 d) { return func_02048000(a, b, c, d); }
/* Forward four register inputs to func_020480c8 and return its result/state effects. */
u32 func_020454e0(u32 a, u32 b, u32 c, u32 d) { return func_020480c8(a, b, c, d); }
/* Forward four register inputs to func_020480c8 and return its result/state effects. */
u32 func_020454ec(u32 a, u32 b, u32 c, u32 d) { return func_020480c8(a, b, c, d); }
