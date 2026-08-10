#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement the registered rising-position subclass of the auxiliary timed
 * sprite wrapper.  It forces runtime-manager registration and subtracts a
 * per-frame global height from the position passed to its child.
 */

typedef struct PresentationTrack {
    u8 bytes[0x10];
} PresentationTrack;

typedef struct RisingAuxiliaryPresentation {
    void **vtable;
    u32 field04;
    void *presentation08;
    void *auxiliary0c;
    s16 timer10;
    s16 spriteByte12;
} RisingAuxiliaryPresentation;

typedef s32 (*ChildUpdate)(void *child, const void *position);

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6180;
extern u8 *data_021052fc;
extern RisingAuxiliaryPresentation *func_0201f724(
    RisingAuxiliaryPresentation *self,
    const PresentationTrack *trackSource, void *spriteGroup, s32 auxiliaryFirst,
    s32 auxiliarySecond, s32 auxiliaryThird, s32 spriteValue, s32 offset,
    s32 spriteByte, s32 registerWithManager);
extern RisingAuxiliaryPresentation *func_0201fa44(
    RisingAuxiliaryPresentation *self);
extern void VecFx32Object_InitCopy(PresentationTrack *track, const void *source);
extern void VecFx32Object_Destroy(void *track);
extern void *ActorMotionAreaFollower_GetPosition(void *source);
extern s32 DisplayController_GetSubScreenVerticalOffset(void);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the auxiliary-owning base with the nine incoming values, force
 * its registration flag to one, install this subclass vtable, and return self.
 */
RisingAuxiliaryPresentation *func_0201fafc(
    RisingAuxiliaryPresentation *self,
    const PresentationTrack *trackSource, void *spriteGroup, s32 auxiliaryFirst,
    s32 auxiliarySecond, s32 auxiliaryThird, s32 spriteValue, s32 offset,
    s32 spriteByte)
{
    func_0201f724(self, trackSource, spriteGroup, auxiliaryFirst,
                  auxiliarySecond, auxiliaryThird, spriteValue, offset,
                  spriteByte, 1);
    self->vtable = (void **)data_020d6180;
    return self;
}

/* Run the shared non-freeing auxiliary teardown and return self. */
RisingAuxiliaryPresentation *func_0201fb54(
    RisingAuxiliaryPresentation *self)
{
    func_0201fa44(self);
    return self;
}

/* Run the shared teardown, free self, and return its old address. */
RisingAuxiliaryPresentation *func_0201fb68(
    RisingAuxiliaryPresentation *self)
{
    func_0201fa44(self);
    Heap_Free(self);
    return self;
}

/*
 * Construct a temporary position from global runtime offset 0x2fbc, subtract
 * DisplayController_GetSubScreenVerticalOffset's integer result in fx32 units from its field at offset 0x08,
 * and pass it to child vtable slot 2.  Ignore the child result, optionally write
 * spriteByte12 to nested sprite byte 0x3a, decrement timer10, destroy the
 * temporary position, and return whether the timer became negative.
 */
s32 func_0201fb84(RisingAuxiliaryPresentation *self)
{
    PresentationTrack position;
    s32 finished;

    VecFx32Object_InitCopy(&position, ActorMotionAreaFollower_GetPosition(data_021052fc + 0x2fbc));
    *(s32 *)&position.bytes[8] -= DisplayController_GetSubScreenVerticalOffset() << 12;
    ((ChildUpdate)(*(void ***)self->presentation08)[2])(
        self->presentation08, &position);
    if (self->spriteByte12 != -1) {
        u8 *sprite = *(u8 **)((u8 *)self->presentation08 + 4);
        sprite[0x3a] = (u8)self->spriteByte12;
    }
    self->timer10--;
    finished = self->timer10 < 0;
    VecFx32Object_Destroy(&position);
    return finished;
}
