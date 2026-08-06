#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Draw a short-lived two-layer rectangle at an actor's camera-relative screen
 * position.  Instances register themselves with the global presentation list,
 * count down each update, and mark the runtime renderer dirty after drawing.
 */
typedef struct TimedActorRectanglePresentation {
    void **vtable00;
    u32 field04;
    u8 *actor08;
    s16 firstExtent0c;
    s16 secondExtent0e;
    s32 remaining10;
} TimedActorRectanglePresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6a24;
extern u8 *data_021052fc;
extern void *data_020f4e14;
extern void func_0201e250(void *);
extern void func_0201e28c(void *);
extern void func_0201ded4(void *, void *);
extern const s32 *func_02009d78(void *);
extern s32 func_020befec(s32, s32);
extern void func_02076428(void *, s32, s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Initialize base state, retain actor and two signed 16-bit extents plus the
 * stack-provided lifetime, register self in the runtime list at offset 0x2f7c,
 * and return self.
 */
TimedActorRectanglePresentation *func_02025120(
    TimedActorRectanglePresentation *self, void *actor, s32 firstExtent,
    s32 secondExtent, s32 lifetime)
{
    func_0201e250(self);
    self->vtable00 = (void **)data_020d6a24;
    self->actor08 = (u8 *)actor;
    self->firstExtent0c = (s16)firstExtent;
    self->secondExtent0e = (s16)secondExtent;
    self->remaining10 = lifetime;
    func_0201ded4(data_021052fc + 0x2f7c, self);
    return self;
}

/* Tear down the common base and return self; this object owns no actor data. */
TimedActorRectanglePresentation *func_0202517c(
    TimedActorRectanglePresentation *self)
{
    func_0201e28c(self);
    return self;
}

/* Perform base teardown, free self, and return its old address. */
TimedActorRectanglePresentation *func_02025190(
    TimedActorRectanglePresentation *self)
{
    func_0201e28c(self);
    Heap_Free(self);
    return self;
}

/*
 * Decrement lifetime and return one at zero.  Otherwise project actor offsets
 * 0x1c/0x20/0x24 through camera position from runtime offset 0x2fbc, including
 * the recovered vertical adjustment 7*(s16[0x6e]-s16[0x6a])/10.  When the
 * result lies inside x (-64,320), y (-128,320), divide both stored extents by
 * 200, draw outer color 14 and inner color 2 rectangles through func_02076428,
 * set runtime flags 0x30 at offset 0x30b8, and return zero.
 */
s32 func_020251ac(TimedActorRectanglePresentation *self)
{
    const s32 *camera;
    s32 x;
    s32 y;
    s32 first;
    s32 second;
    s32 verticalAdjustment;

    if (--self->remaining10 <= 0) return 1;
    camera = func_02009d78(data_021052fc + 0x2fbc);
    x = (*(s32 *)(self->actor08 + 0x1c) >> 12) - (camera[1] >> 12);
    verticalAdjustment =
        func_020befec(7 * (*(s16 *)(self->actor08 + 0x6e) -
                            *(s16 *)(self->actor08 + 0x6a)), 10);
    y = ((*(s32 *)(self->actor08 + 0x20) >> 12) -
         (*(s32 *)(self->actor08 + 0x24) >> 12) -
         (camera[2] >> 12)) - verticalAdjustment;
    if (x > -64 && x < 320 && y > -128 && y < 320) {
        first = func_020befec(self->firstExtent0c, 200);
        second = func_020befec(self->secondExtent0e, 200);
        x -= (second + (second < 0)) / 2;
        func_02076428(data_020f4e14, x - 1, y - 1, x + second + 1,
                      y + 3, 14);
        func_02076428(data_020f4e14, x, y, x + first, y + 2, 2);
        *(u32 *)(data_021052fc + 0x30b8) |= 0x30;
    }
    return 0;
}
