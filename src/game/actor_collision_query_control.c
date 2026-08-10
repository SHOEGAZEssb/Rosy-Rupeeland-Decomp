#include "tingle/types.h"

/* Reset actor motion and evaluate collision queries against actor geometry. */
#ifdef __cplusplus
extern "C" {
#endif
extern u32 func_02011738(const void *rectangle, s32 x, s32 y);
extern void BoundsCenterSnapshot_Init(void *center, const void *bounds);
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_02005058(void *vector);
extern u32 func_020573e4(void *resource);
extern void func_0205740c(void *output, void *resource, const void *position);
extern u32 Actor_TestQueryPoint(void *self, const void *query);
#ifdef __cplusplus
}
#endif

/*
 * Set actor flag 0x100 at +0xd0, invoke vtable slot 0x94 with argument zero,
 * then clear the two three-component motion vectors at +0x3c and +0x8c.
 * Returns no value; the virtual callback may update actor or presentation state.
 */
void func_020338e4(void *self)
{
    u8 *actor = (u8 *)self;
    void (*callback)(void *, s32);

    *(u32 *)(actor + 0xd0) |= 0x100;
    callback = *(void (**)(void *, s32))(*(u8 **)actor + 0x94);
    callback(actor, 0);
    *(s32 *)(actor + 0x3c) = 0;
    *(s32 *)(actor + 0x40) = 0;
    *(s32 *)(actor + 0x44) = 0;
    *(s32 *)(actor + 0x8c) = 0;
    *(s32 *)(actor + 0x90) = 0;
    *(s32 *)(actor + 0x94) = 0;
}

/* Empty recovered lifecycle hook; ignores self and returns no value. */
void func_02033928(void *self)
{
    (void)self;
}

/* Set actor flag 0x2000 at +0x10 and return zero. */
s32 func_0203392c(void *self)
{
    *(u32 *)((u8 *)self + 0x10) |= 0x2000;
    return 0;
}

/* Clear actor flag 0x2000 at +0x10 and return zero. */
s32 func_02033940(void *self)
{
    *(u32 *)((u8 *)self + 0x10) &= ~0x2000;
    return 0;
}

/*
 * Run Actor_TestQueryPoint with the supplied query. If it returns zero, clear actor
 * flag 0x2000 and return the resulting entire flags word; otherwise return the
 * nonzero query result unchanged. This unusual zero-path return is confirmed.
 */
u32 func_02033954(void *self, const void *query)
{
    u8 *actor = (u8 *)self;
    u32 result = Actor_TestQueryPoint(actor, query);

    if (result == 0) {
        *(u32 *)(actor + 0x10) &= ~0x2000;
        result = *(u32 *)(actor + 0x10);
    }
    return result;
}

/*
 * Test query coordinates at query+4/+8 against an s16 rectangle recovered
 * from actor+0x60..+0x66 and translated by X and by Y-minus-Z in 20.12 space.
 * If actor+0x1e0 names an active resource, also build the center of bounds+8,
 * ask that resource for a second rectangle, and OR its test result into the
 * first. Returns the combined nonzero/zero result. Vector and resource helpers
 * may manage SDK-owned temporary state; actor fields are not modified.
 */
u32 Actor_TestQueryPoint(void *self, const void *query)
{
    u8 *actor = (u8 *)self;
    const u8 *queryBytes = (const u8 *)query;
    s16 rectangle[4];
    u8 center[8];
    s32 position[4];
    s16 resourceRectangle[4];
    s32 x = *(s32 *)(actor + 0x1c) >> 12;
    s32 y = (*(s32 *)(actor + 0x20) >> 12) -
            (*(s32 *)(actor + 0x24) >> 12);
    void *resource;
    u32 result;

    rectangle[0] = *(s16 *)(actor + 0x60) + x;
    rectangle[1] = *(s16 *)(actor + 0x62) + y;
    rectangle[2] = *(s16 *)(actor + 0x64) + x;
    rectangle[3] = *(s16 *)(actor + 0x66) + y;
    result = func_02011738(rectangle, *(s32 *)(queryBytes + 4),
                           *(s32 *)(queryBytes + 8));

    resource = *(void **)(actor + 0x1e0);
    if (resource != 0 && func_020573e4(resource) != 0) {
        BoundsCenterSnapshot_Init(center, actor + 8);
        func_0200500c(position,
                      *(s32 *)(actor + 0x1c) + ((s8)center[4] << 12),
                      *(s32 *)(actor + 0x20) + ((s8)center[5] << 12) -
                          *(s32 *)(actor + 0x24),
                      0);
        func_0205740c(resourceRectangle, resource, position);
        func_02005058(position);
        result |= func_02011738(resourceRectangle, *(s32 *)(queryBytes + 4),
                                *(s32 *)(queryBytes + 8));
    }
    return result;
}
