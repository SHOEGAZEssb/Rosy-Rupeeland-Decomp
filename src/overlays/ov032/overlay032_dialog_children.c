#include "tingle/types.h"
#include "tingle/heap.h"

/* Overlay 32 dialog allocation/teardown and orchestration of its five 0x6C-byte child objects. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14[];
extern void *data_020f4e18[];
extern void *gSoundContext;
extern const u8 data_020c7ba8[];
extern const u8 data_ov032_02202340[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02071980(...);
extern void *func_02092cc0(...);
extern void func_ov032_021fce08(...);
extern void func_020939d8(void *);
extern void func_02071d4c(...);
extern void Sound_Play(...);
extern void func_02071f38(void *);
extern void func_ov032_0220147c(void *);
extern void func_ov032_02201020(...);
extern void func_ov032_02201188(...);
#ifdef __cplusplus
}
#endif

typedef void (*VirtualDestructor)(void *);

static void destroy_owned(void *object)
{
    if (object != 0) {
        void **vtable = FIELD(void **, object, 0);
        ((VirtualDestructor)vtable[1])(object);
    }
}

/*
 * Loads archive resource 0x7006 into +0x0C and allocates two 0xEC-byte dialog
 * objects at +0x18 and +0x14. Their rectangles are respectively
 * (64,26)-(160,30) and (92,152)-(140,30); confirmed control fields +0xB4,
 * +0xBC, +0xD0 and +0xD4 are initialized. Allocation failure leaves the
 * corresponding pointer null; returns void.
 */
extern "C" void func_ov032_021fe6b0(void *scene)
{
    FIELD(void *, scene, 0xc) = func_02071980(data_020f4e18[0], 0x7006);

    void *upper = Heap_Alloc(0xec, (const char *)data_ov032_02202340, 4,
                             &gHeapContext);
    if (upper != 0) upper = func_02092cc0(upper, data_020f4e14[0], FIELD(void *, scene, 0xc));
    FIELD(void *, scene, 0x18) = upper;
    func_ov032_021fce08(upper, 0x40, 0x1a, 0xa0, 0x1e);
    FIELD(s32, upper, 0xb4) = 0;
    FIELD(s32, upper, 0xbc) = 0;
    FIELD(s32, upper, 0xd0) = 0xd;
    FIELD(s32, upper, 0xd4) = 0;

    void *lower = Heap_Alloc(0xec, (const char *)data_ov032_02202340, 4,
                             &gHeapContext);
    if (lower != 0) lower = func_02092cc0(lower, data_020f4e14[0], FIELD(void *, scene, 8));
    FIELD(void *, scene, 0x14) = lower;
    func_ov032_021fce08(lower, 0x5c, 0x98, 0x8c, 0x1e);
    FIELD(s32, lower, 0xb4) = 0;
    FIELD(s32, lower, 0xbc) = -2;
    FIELD(s32, lower, 0xd0) = 0xd;
    FIELD(s32, lower, 0xd4) = 0;
}

/*
 * Closes and virtually destroys the dialogs at +0x14/+0x18, releases archive
 * resource +0x0C, and plays sound 0x81 with parameter 5. Scene fields are not
 * cleared and storage ownership is handled by the virtual destructors; returns
 * void.
 */
extern "C" void func_ov032_021fe7d0(void *scene)
{
    func_020939d8(FIELD(void *, scene, 0x14));
    func_020939d8(FIELD(void *, scene, 0x18));
    destroy_owned(FIELD(void *, scene, 0x14));
    destroy_owned(FIELD(void *, scene, 0x18));
    func_02071d4c(data_020f4e18[0], FIELD(void *, scene, 0xc));
    Sound_Play(gSoundContext, 0x81, 5);
}

/*
 * Configures each of the five children at +0xC44. Every call receives the
 * selected record index +0xC1C, secondary selection +0xC24, the corresponding
 * 0x208-byte record at 0x020C7BA8, and caller value `mode`. Returns void.
 */
extern "C" void func_ov032_021fe848(void *scene, s32 mode)
{
    u32 record = FIELD(u32, scene, 0xc1c);
    for (s32 i = 0; i < 5; ++i) {
        func_ov032_02201020((u8 *)scene + 0xc44 + i * 0x6c, record,
                            FIELD(u32, scene, 0xc24), data_020c7ba8 + record * 0x208, mode);
    }
}

/*
 * Resets the embedded resource set at +0x0C and controller at +0x18 for all
 * five children. SDK graphics/controller state changes; returns void.
 */
extern "C" void func_ov032_021fe8a0(void *scene)
{
    for (s32 i = 0; i < 5; ++i) {
        u8 *child = (u8 *)scene + 0xc44 + i * 0x6c;
        func_02071f38(child + 0xc);
        func_ov032_0220147c(child + 0x18);
    }
}

/*
 * Stores `value` at +0xC28 and applies it to all five children together with
 * selections +0xC1C/+0xC24 and the selected 0x208-byte record. Returns void.
 */
extern "C" void func_ov032_021fe8d8(void *scene, s32 value)
{
    FIELD(s32, scene, 0xc28) = value;
    u32 record = FIELD(u32, scene, 0xc1c);
    for (s32 i = 0; i < 5; ++i) {
        func_ov032_02201188((u8 *)scene + 0xc44 + i * 0x6c, value,
                            FIELD(u32, scene, 0xc24), data_020c7ba8 + record * 0x208);
    }
}
