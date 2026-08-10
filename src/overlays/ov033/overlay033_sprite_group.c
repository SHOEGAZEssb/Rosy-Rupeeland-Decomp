#include "tingle/types.h"

/* Overlay 33 construction and visibility control for a nine-sprite UI group. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_021052fc;
extern void *data_020f4e18[];
extern const u8 data_ov033_021fdda8[];
extern const u8 data_ov033_021fde9c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020949ec(void *object);
extern void func_02071ea4(void *descriptor);
extern void func_02071eb8(void *descriptor);
extern void __construct_array(void *base, s32 count, s32 size,
                              void *constructor, void *destructor);
extern void func_02071ee0(void *descriptor, void *resourceContext,
                         s32 first, s32 second, s32 third);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *spriteContext, void *descriptor, s32 mode);
extern void func_02073e48(void *sprite, s32 animation, s32 x, s32 y,
                         s32 initialFrame, s32 attribute, s32 priority);
#ifdef __cplusplus
}
#endif

/*
 * One confirmed 0x18-byte record from the sprite setup table at 0x021FDDA8.
 * The exact meanings of the resource IDs and final sprite arguments remain
 * unconfirmed, so their address-derived roles are retained here.
 */
typedef struct Overlay033SpriteSpec {
    u16 resourceFirst;
    u16 resourceSecond;
    u16 resourceThird;
    u16 animation;
    s32 attribute;
    s32 x;
    s32 y;
    s32 mode;
} Overlay033SpriteSpec;

/*
 * Base destructor hook for the overlay-33 sprite group. It accepts the group,
 * changes no observable state, returns no value, and performs no SDK or
 * hardware operations.
 */
extern "C" void func_ov033_021fce00(void *group)
{
    (void)group;
}

/*
 * Sets bit 2 in the halfword at +0x24 of sprite `index` from the group's nine
 * pointers at +0x108. The recovered effect is a visibility/state toggle; the
 * precise engine meaning of the bit is not yet confirmed. Returns no value
 * and performs no direct hardware access.
 */
extern "C" void func_ov033_021fce04(void *group, s32 index)
{
    void *sprite = FIELD(void *, group, 0x108 + index * 4);
    FIELD(u16, sprite, 0x24) |= 4;
}

/*
 * Constructs the overlay-33 sprite group in `group` using `spriteContext`.
 * It initializes nine embedded 0x0C-byte resource descriptors at +0x9C,
 * creates/configures nine sprites into +0x108, clears position accumulators
 * +0x12C/+0x130, and writes the recovered vtable pointer. Entry eight may use
 * three IDs supplied by the active object's +0x29C record; otherwise all IDs
 * and placement values come from the table at 0x021FDDA8. The sprite at +0x124
 * receives vertical offset -0x1000, and +0x128 is marked with bit 2 when no
 * active object exists. Returns `group`; resource and sprite engine state
 * changes, but there is no direct MMIO.
 */
extern "C" void *func_ov033_021fce1c(void *group, void *spriteContext)
{
    const Overlay033SpriteSpec *specs =
        (const Overlay033SpriteSpec *)data_ov033_021fdda8;
    void *activeObject;

    func_020949ec(group);
    FIELD(const void *, group, 0) = data_ov033_021fde9c;
    __construct_array((u8 *)group + 0x9c, 9, 0xc,
                      (void *)func_02071ea4, (void *)func_02071eb8);
    FIELD(s32, group, 0x12c) = 0;
    FIELD(s32, group, 0x130) = 0;

    activeObject = FIELD(void *, (u8 *)data_021052fc + 0x2000, 0xea8);
    for (s32 i = 0; i < 9; ++i) {
        void *descriptor = (u8 *)group + 0x9c + i * 0xc;
        const Overlay033SpriteSpec *spec = &specs[i];

        if (i == 8 && activeObject != 0) {
            void *record = FIELD(void *, activeObject, 0x29c);
            func_02071ee0(descriptor, data_020f4e18[0],
                          FIELD(u16, record, 0x18),
                          FIELD(u16, record, 0x14),
                          FIELD(u16, record, 0x16));
        } else {
            func_02071ee0(descriptor, data_020f4e18[0],
                          spec->resourceFirst, spec->resourceSecond,
                          spec->resourceThird);
        }

        void *sprite = GraphicsSpriteGroup_CreateStateFromSource(spriteContext, descriptor,
                                     spec->mode & 0xff);
        FIELD(void *, group, 0x108 + i * 4) = sprite;
        func_02073e48(sprite, spec->animation, spec->x, spec->y,
                      0, spec->attribute, 0x42);
    }

    FIELD(s16, FIELD(void *, group, 0x124), 0x30) = -0x1000;
    if (activeObject == 0)
        FIELD(u16, FIELD(void *, group, 0x128), 0x24) |= 4;
    return group;
}
