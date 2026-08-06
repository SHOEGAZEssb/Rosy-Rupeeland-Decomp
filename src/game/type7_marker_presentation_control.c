#include "tingle/types.h"

/*
 * Recovered positioning, animation, and resource-reset controls for the
 * type-seven marker presentation object.
 */

extern void *data_020f4e18;

typedef struct Type7MarkerPresentation {
    const void *vtable;
    u8 *presentation;
    u8 *owner;
    s16 field0c;
    s16 field0e;
} Type7MarkerPresentation;

typedef struct Type7PositionObject {
    const void *vtable;
    s32 x;
    s32 y;
    s32 z;
} Type7PositionObject;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02071e60(void *resources, u32 id);
extern void *func_02071e70(void *resources, u32 id);
extern void *func_02071e80(void *resources, u32 id);
extern void func_02072b68(void *presentation, u32 index);
extern void func_020740c8(const void *presentationVtable, void *presentation,
                          void *first, void *second, void *third);
extern s16 func_020ae024(s32 y, s32 x);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are a marker object, reference position, target position, and a
 * zero/nonzero orientation selector. Compute screen-like X as target X minus
 * reference X and Y as target Y minus reference Y minus target Z, all shifted
 * from 20.12 fixed point. If X is outside [-0x20,0x11f] or Y outside
 * [-0x20,0xff], hide the presentation with +0x24 bit eight. Otherwise store X
 * and Y at presentation +0x2c/+0x2e, set +0x28 to 0x100, and clear that bit.
 * With orientation enabled, store atan2(target Y-owner Y, owner X-target X)
 * minus 0x4000 at +0x30; otherwise store zero. No value is returned. Object
 * and presentation state change and the angle SDK helper may run; there are no
 * direct hardware effects.
 */
void func_0204ce04(Type7MarkerPresentation *self,
                   const Type7PositionObject *reference,
                   const Type7PositionObject *target, s32 orient)
{
    s32 x = (target->x - reference->x) >> 12;
    s32 y = ((target->y - reference->y) >> 12) - (target->z >> 12);
    s16 angle;
    if (x < -0x20 || x >= 0x120 || y < -0x20 || y >= 0x100) {
        *(u16 *)(self->presentation + 0x24) |= 8;
    } else {
        *(s16 *)(self->presentation + 0x2c) = (s16)x;
        *(s16 *)(self->presentation + 0x2e) = (s16)y;
        *(u16 *)(self->presentation + 0x28) = 0x100;
        *(u16 *)(self->presentation + 0x24) &= (u16)~8;
    }
    if (orient == 0) {
        angle = 0;
    } else {
        angle = (s16)(func_020ae024(
            target->y - *(s32 *)(self->owner + 0x20),
            *(s32 *)(self->owner + 0x1c) - target->x) - 0x4000);
    }
    *(s16 *)(self->presentation + 0x30) = angle;
}

/*
 * Inputs are a marker presentation and animation index. Index -1 sets
 * presentation +0x24 bit four. Other indices are narrowed to a byte, selected
 * through func_02072b68 only when different from current byte +0x38, and then
 * bit four is cleared. No value is returned. Presentation state may change;
 * there are no direct hardware effects.
 */
void func_0204ced8(Type7MarkerPresentation *self, u32 index)
{
    if (index == 0xffffffff) {
        *(u16 *)(self->presentation + 0x24) |= 4;
        return;
    }
    index &= 0xff;
    if (index != self->presentation[0x38])
        func_02072b68(self->presentation, index);
    *(u16 *)(self->presentation + 0x24) &= (u16)~4;
}

/*
 * Input is a marker presentation. Reload resource IDs 0x138a/0x1078/0x138b
 * from data_020f4e18, pass them with the presentation and its leading word to
 * func_020740c8, then clear local halfword +0x0e. Resource/presentation state
 * may change through SDK-facing helpers; no value is returned and hardware is
 * not accessed directly.
 */
void func_0204cf28(Type7MarkerPresentation *self)
{
    void *first = func_02071e60(data_020f4e18, 0x138a);
    void *second = func_02071e70(data_020f4e18, 0x1078);
    void *third = func_02071e80(data_020f4e18, 0x138b);
    func_020740c8(*(const void **)self->presentation, self->presentation,
                  first, second, third);
    self->field0e = 0;
}
