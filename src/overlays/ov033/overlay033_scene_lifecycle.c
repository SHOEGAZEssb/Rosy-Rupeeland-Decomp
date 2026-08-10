#include "tingle/types.h"

/* Overlay 33 scene teardown, callback dispatch, and camera-relative placement. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_Destroy(void *spriteContext);
extern void func_020927b8(void *resourceOwner);
extern void func_02005058(void *embeddedObject);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *spriteContext);
extern void func_ov033_021fcff4(void *group);
#ifdef __cplusplus
}
#endif

typedef void (*Overlay033VoidMethod)(void *object);

/* Calls the deleting/destruction virtual at vtable offset +4 when `object` exists. */
static void destroy_owned_object(void *object)
{
    if (object != 0)
        FIELD(Overlay033VoidMethod, FIELD(void *, object, 0), 4)(object);
}

/*
 * Tears down the scene's owned sprite group (+0x48) and dialog (+0xC4), clears
 * suppression bit 0x10 on the primary object's sprites +0x54/+0xA8, releases
 * the sprite context and resource owner, and destroys embedded objects +0x24
 * and +0x14. Returns the original scene pointer; heap/resource/engine state
 * changes, but no direct hardware register is touched.
 */
extern "C" void *func_ov033_021fd260(void *scene)
{
    destroy_owned_object(FIELD(void *, scene, 0x48));
    destroy_owned_object(FIELD(void *, scene, 0xc4));

    void *primary = FIELD(void *, scene, 4);
    FIELD(u16, FIELD(void *, primary, 0x54), 0x24) &= (u16)~0x10;
    FIELD(u16, FIELD(void *, primary, 0xa8), 0x24) &= (u16)~0x10;
    GraphicsSpriteGroup_Destroy(FIELD(void *, scene, 0));
    func_020927b8((u8 *)scene + 0xa0);
    func_02005058((u8 *)scene + 0x24);
    func_02005058((u8 *)scene + 0x14);
    return scene;
}

/*
 * Forwards the scene's sprite context at +0 to GraphicsSpriteGroup_AdvanceAnimations and returns that
 * callee's result according to the ABI. Sprite-engine state may change; there
 * is no direct MMIO in this wrapper.
 */
extern "C" void func_ov033_021fd2e8(void *scene)
{
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, scene, 0));
}

/*
 * Invokes the two-word callback representation at +0xC8/+0xCC. The low bit of
 * +0xCC selects virtual dispatch: the remaining bits, arithmetically halved,
 * adjust `scene`; +0xC8 is then either a direct code pointer or a byte offset
 * in the adjusted object's vtable. Returns no explicit value. The callback may
 * change arbitrary scene/engine state; this dispatcher performs no direct MMIO.
 */
extern "C" void func_ov033_021fd2f8(void *scene)
{
    s32 encodedAdjustment = FIELD(s32, scene, 0xcc);
    void *adjusted = (u8 *)scene + (encodedAdjustment >> 1);
    Overlay033VoidMethod method;

    if ((encodedAdjustment & 1) != 0) {
        void *vtable = FIELD(void *, adjusted, 0);
        method = FIELD(Overlay033VoidMethod, vtable,
                       FIELD(s32, scene, 0xc8));
    } else {
        method = FIELD(Overlay033VoidMethod, scene, 0xc8);
    }
    method(adjusted);
}

/*
 * Converts the primary object's fixed-point position (+0x1C/+0x20/+0x24) and
 * the supplied camera/reference fixed-point coordinates (+4/+8) to pixels,
 * applies scene offsets +0x40/+0x44, writes the result to sprite-context fields
 * +0x18/+0x1C, and synchronizes the nine-sprite group at +0x48. Returns no
 * value; render positions change without direct hardware access.
 */
extern "C" void func_ov033_021fd324(void *scene, const void *reference)
{
    void *primary = FIELD(void *, scene, 4);
    void *spriteContext = FIELD(void *, scene, 0);
    s32 x = (FIELD(s32, primary, 0x1c) >> 12) -
            (FIELD(s32, reference, 4) >> 12) + FIELD(s32, scene, 0x40);
    s32 y = (FIELD(s32, primary, 0x20) >> 12) -
            (FIELD(s32, reference, 8) >> 12) -
            (FIELD(s32, primary, 0x24) >> 12) + FIELD(s32, scene, 0x44);
    FIELD(s32, spriteContext, 0x18) = x;
    FIELD(s32, spriteContext, 0x1c) = y;
    func_ov033_021fcff4(FIELD(void *, scene, 0x48));
}
