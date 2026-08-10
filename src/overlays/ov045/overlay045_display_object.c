#include "tingle/types.h"

/*
 * Overlay 45 display-object lifecycle. This recovered class wraps a shared
 * positioned runtime object, one resource owner, and a debug-font sprite whose
 * animation modes are selected by four small callbacks.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u8 data_ov045_0220d5a8[];
extern "C" void *data_020f4e18;
extern "C" void *gDebugFont;
extern "C" void func_020949ec(void *object);
extern "C" void func_02071ea4(void *owner);
extern "C" void func_02071eb8(void *owner);
extern "C" void func_02071ee0(void *owner, void *archive, s32 first,
                               s32 second, s32 third);
extern "C" void *func_020742cc(void *font);
extern "C" void *func_02073ffc(void *fontState, void *owner, s32 selector);
extern "C" void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern "C" void func_0207419c(void *resource);
extern "C" void *func_020740a4(void *resource);
extern "C" void GraphicsSpriteState_SetAnimationIndex(void *sprite, s32 mode);
extern "C" void Heap_Free(void *allocation);

class DisplayObjectVirtual {
public:
    virtual void slot0();
    virtual void slot1();
    virtual void slot2();
    virtual void slot3();
    virtual void slot4();
};

/* Return the pointer stored at +0x54 without changing object state. */
extern "C" void *func_ov045_0220bc34(void *object)
{
    return FIELD(void *, object, 0x54);
}

/* No-op lifecycle hook. Its input is ignored and it has no observable effects. */
extern "C" void func_ov045_0220bc3c(void *object)
{
    (void)object;
}

/*
 * Construct a display object and return its storage. Initialize the shared
 * base and owner +0x9C, install the overlay vtable, load resources
 * 0x1560..0x1562, acquire debug-font state +0xA8 and sprite +0xAC, enable the
 * sprite flags, position the base at (0x160,0x60,0), then invoke virtual slot
 * +0x10. Resource, display, and virtual object state change.
 */
extern "C" void *func_ov045_0220bc40(void *object)
{
    func_020949ec(object);
    FIELD(void *, object, 0) = data_ov045_0220d5a8;
    func_02071ea4((u8 *)object + 0x9c);
    func_02071ee0((u8 *)object + 0x9c, data_020f4e18,
                   0x1560, 0x1561, 0x1562);
    FIELD(void *, object, 0xa8) = func_020742cc(gDebugFont);
    FIELD(void *, object, 0xac) =
        func_02073ffc(FIELD(void *, object, 0xa8), (u8 *)object + 0x9c, 2);
    FIELD(u16, FIELD(void *, object, 0xac), 0x24) |= 2;
    FIELD(u8, FIELD(void *, object, 0xac), 0x3a) = 1;
    func_02094bbc(object, 0x160, 0x60, 0);
    ((DisplayObjectVirtual *)object)->slot4();
    return object;
}

/*
 * Destroy owned display resources without freeing object storage, call the
 * no-op base hook, and return the unchanged pointer. The overlay vtable is
 * restored before resource release.
 */
extern "C" void *func_ov045_0220bcfc(void *object)
{
    FIELD(void *, object, 0) = data_ov045_0220d5a8;
    func_0207419c(FIELD(void *, object, 0xa8));
    func_02071eb8((u8 *)object + 0x9c);
    func_ov045_0220bc3c(object);
    return object;
}

/*
 * Destroy owned display resources, free object storage, and return its former
 * address. The returned address must not be dereferenced after Heap_Free.
 */
extern "C" void *func_ov045_0220bd30(void *object)
{
    FIELD(void *, object, 0) = data_ov045_0220d5a8;
    func_0207419c(FIELD(void *, object, 0xa8));
    func_02071eb8((u8 *)object + 0x9c);
    func_ov045_0220bc3c(object);
    Heap_Free(object);
    return object;
}

/*
 * Copy integer position words +0x10/+0x20 into the sprite halfwords at
 * +0x2C/+0x2E, then tail-call the shared font-resource update. Sprite and
 * display state change; the callee's return value is forwarded implicitly.
 */
extern "C" void *func_ov045_0220bd6c(void *object)
{
    s32 y = FIELD(s32, object, 0x20);
    void *sprite = FIELD(void *, object, 0xac);
    FIELD(s16, sprite, 0x2c) = FIELD(s32, object, 0x10);
    FIELD(s16, sprite, 0x2e) = y;
    return func_020740a4(FIELD(void *, object, 0xa8));
}

/* Select sprite animation mode 1 unless it is already active. */
extern "C" void func_ov045_0220bd90(void *object)
{
    void *sprite = FIELD(void *, object, 0xac);
    if (FIELD(u8, sprite, 0x38) != 1)
        GraphicsSpriteState_SetAnimationIndex(sprite, 1);
}

/* Select sprite animation mode 2 unless it is already active. */
extern "C" void func_ov045_0220bdb0(void *object)
{
    void *sprite = FIELD(void *, object, 0xac);
    if (FIELD(u8, sprite, 0x38) != 2)
        GraphicsSpriteState_SetAnimationIndex(sprite, 2);
}

/* Select sprite animation mode 3 unless it is already active. */
extern "C" void func_ov045_0220bdd0(void *object)
{
    void *sprite = FIELD(void *, object, 0xac);
    if (FIELD(u8, sprite, 0x38) != 3)
        GraphicsSpriteState_SetAnimationIndex(sprite, 3);
}

/* Select sprite animation mode 4 unless it is already active. */
extern "C" void func_ov045_0220bdf0(void *object)
{
    void *sprite = FIELD(void *, object, 0xac);
    if (FIELD(u8, sprite, 0x38) != 4)
        GraphicsSpriteState_SetAnimationIndex(sprite, 4);
}
