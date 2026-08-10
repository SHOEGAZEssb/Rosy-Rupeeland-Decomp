#include "tingle/types.h"

/* Overlay 32 child motion updates and low-level sprite/controller wrapper lifecycle. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *GraphicsSpriteGroup_CreateStateFromSource(...);
extern void GraphicsSpriteGroup_ReleaseState(...);
extern void func_02070934(void *);
extern void func_02073e48(...);
#ifdef __cplusplus
}
#endif

/*
 * Advances a child's 40-frame horizontal motion. A zero timer or absent object
 * at +0x18 is treated as complete. Otherwise +0x5C accumulates fixed-point step
 * +0x58 and drives X from base +0x48 in direction +0x60; Y remains +0x4C.
 * The final frame snaps to target +0x68. Returns one when complete, else zero.
 */
extern "C" s32 func_ov032_02201390(void *child)
{
    s32 frames = FIELD(s32, child, 0x64);
    if (frames == 0 || FIELD(void *, child, 0x18) == 0) return 1;
    FIELD(s32, child, 0x64) = --frames;
    FIELD(s32, child, 0x5c) += FIELD(s32, child, 0x58);
    void *object = FIELD(void *, child, 0x18);
    if (frames == 0) {
        FIELD(u16, object, 0x2c) = (u16)FIELD(s32, child, 0x68);
        FIELD(u16, object, 0x2e) = (u16)FIELD(s32, child, 0x4c);
        return 1;
    }
    FIELD(u16, object, 0x2c) = (u16)(FIELD(s32, child, 0x48) +
        (FIELD(s32, child, 0x5c) >> 12) * FIELD(s32, child, 0x60));
    FIELD(u16, object, 0x2e) = (u16)FIELD(s32, child, 0x4c);
    return 0;
}

/*
 * Clears controller pointers/state +0x00/+0x04/+0x08, sets mode +0x0C to one,
 * and initializes fixed-point scale +0x18 to 0x100000. Returns void.
 */
extern "C" void func_ov032_0220142c(void *controller)
{
    FIELD(s32, controller, 0) = 0;
    FIELD(s32, controller, 4) = 0;
    FIELD(s32, controller, 8) = 0;
    FIELD(s32, controller, 0xc) = 1;
    FIELD(s32, controller, 0x18) = 0x100000;
}

/*
 * Stores `resource` at +0x04, creates an SDK object from `renderer`, `resource`
 * and mode 2 at +0x00, and stores `renderer` at +0x08. Returns the created SDK
 * object.
 */
extern "C" void *func_ov032_02201450(void *controller, void *renderer, void *resource)
{
    FIELD(void *, controller, 4) = resource;
    void *object = GraphicsSpriteGroup_CreateStateFromSource(renderer, resource, 2);
    FIELD(void *, controller, 0) = object;
    FIELD(void *, controller, 8) = renderer;
    return object;
}

/*
 * Detaches the SDK object at +0x00 through renderer +0x08, clears the object
 * pointer, then resets the map/resource held at [+0x04]+4 when present. Returns
 * void; renderer and resource owner pointers remain stored.
 */
extern "C" void func_ov032_0220147c(void *controller)
{
    void *renderer = FIELD(void *, controller, 8);
    void *object = FIELD(void *, controller, 0);
    if (renderer != 0 && object != 0) GraphicsSpriteGroup_ReleaseState(renderer, object);
    FIELD(void *, controller, 0) = 0;
    void *resource = FIELD(void *, controller, 4);
    if (resource != 0 && FIELD(void *, resource, 4) != 0)
        func_02070934(FIELD(void *, resource, 4));
}

/*
 * Stores `arg1`/`arg2` at +0x10/+0x14, forwards position/configuration arguments
 * through `arg7` to SDK function 0x02073E48 for object +0x00, and stores `arg8`
 * at +0x2C. Returns void; the exact semantic names of the SDK arguments remain
 * unconfirmed.
 */
extern "C" void func_ov032_022014c0(void *controller, s32 arg1, s32 arg2, s32 arg3,
                                     s32 arg4, s32 arg5, s32 arg6, s32 arg7, s32 arg8)
{
    FIELD(s32, controller, 0x10) = arg1;
    FIELD(s32, controller, 0x14) = arg2;
    func_02073e48(FIELD(void *, controller, 0), arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    FIELD(s32, controller, 0x2c) = arg8;
}
