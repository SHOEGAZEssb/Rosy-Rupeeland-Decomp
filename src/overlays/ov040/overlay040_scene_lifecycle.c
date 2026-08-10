#include "tingle/types.h"

/*
 * Overlay 40 scene lifecycle helpers. The recovered routines initialize small
 * array records, tear down the scene's embedded resource arrays, and configure
 * the transform and orientation of a loaded presentation object.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef void (*Overlay040ElementDestructor)(void *element);

extern const u8 data_ov040_022042a8[];
extern const u8 data_ov040_022042d4[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02072000(void *resourceSet);
extern void GraphicsResourceSet_Destroy(void *resourceSet);
extern void __destroy_arr(void *array, s32 count, s32 stride,
                          Overlay040ElementDestructor destructor);
extern void func_02005058(void *object);
extern void func_02099fb0(void *scene);
extern void GraphicsSpriteState_SetAnimationIndex(void *renderer, u8 orientation);
#ifdef __cplusplus
}
#endif

/*
 * Install the address-derived record vtable and clear words +4/+8. Returns no
 * meaningful value and changes only the supplied 12-byte record.
 */
extern "C" void func_ov040_021fd724(void *record)
{
    FIELD(const void *, record, 0) = data_ov040_022042d4;
    FIELD(u32, record, 4) = 0;
    FIELD(u32, record, 8) = 0;
}

/* No-op array-element destructor; it changes no state and returns no value. */
extern "C" void func_ov040_021fd740(void *element)
{
    (void)element;
}

/*
 * Tear down the large scene object. Restore its address-derived vtable,
 * release the resource set at +0x1B7C, destroy six 16-byte arrays and two
 * 12-byte record arrays using the confirmed counts below, release embedded
 * objects at +0x74/+0x5C/+0x4C, then invoke the common scene destructor.
 * Returns scene; resource, embedded-object, and base-scene state change.
 */
extern "C" void *func_ov040_021fd744(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov040_022042a8;
    func_02072000((u8 *)scene + 0x1b7c);
    GraphicsResourceSet_Destroy((u8 *)scene + 0x1b7c);
    __destroy_arr((u8 *)scene + 0x167c, 0x50, 0x10, func_02005058);
    __destroy_arr((u8 *)scene + 0xbdc, 0x50, 0x10, func_02005058);
    __destroy_arr((u8 *)scene + 0xb54, 2, 0x10, func_02005058);
    __destroy_arr((u8 *)scene + 0x8c4, 0x1e, 0x10, func_02005058);
    __destroy_arr((u8 *)scene + 0x894, 4, 0x0c, func_ov040_021fd740);
    __destroy_arr((u8 *)scene + 0x864, 4, 0x0c, func_ov040_021fd740);
    __destroy_arr((u8 *)scene + 0x660, 0x1e, 0x10, func_02005058);
    __destroy_arr((u8 *)scene + 0x84, 0x1e, 0x10, func_02005058);
    func_02005058((u8 *)scene + 0x74);
    func_02005058((u8 *)scene + 0x5c);
    func_02005058((u8 *)scene + 0x4c);
    func_02099fb0(scene);
    return scene;
}

/*
 * Configure object, ignoring the first scene/context argument. Apply the
 * caller's orientation byte to renderer +0x0C, set renderer flag 1, store the
 * three fixed-point coordinates at +0x30..+0x38, and reset transform values
 * +0x3C/+0x3E/+0x40 to 0x100, 0x100, and zero. Returns no value; renderer and
 * object state change.
 */
extern "C" void func_ov040_021fd858(void *scene, void *object, s32 x, s32 y,
                                      s32 z, u8 orientation)
{
    (void)scene;
    void *renderer = FIELD(void *, object, 0x0c);
    GraphicsSpriteState_SetAnimationIndex(renderer, orientation);
    FIELD(u16, renderer, 0x24) |= 2;
    FIELD(s32, object, 0x30) = x;
    FIELD(s32, object, 0x34) = y;
    FIELD(s32, object, 0x38) = z;
    FIELD(u16, object, 0x3c) = 0x100;
    FIELD(u16, object, 0x3e) = 0x100;
    FIELD(u16, object, 0x40) = 0;
}
