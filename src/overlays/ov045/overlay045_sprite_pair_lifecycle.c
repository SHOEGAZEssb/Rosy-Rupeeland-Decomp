#include "tingle/types.h"

/*
 * Overlay 45 paired-sprite lifecycle. This recovered object owns two resource
 * groups, a shared debug-font state, two sprite pointers, mode counters, and a
 * private PRNG seed used by its later animation controller.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

struct SpritePairEntry {
    u8 unknown00[0x28];
    u16 field28;
    u8 unknown2A[0x10];
    u8 field3A;
};

struct SpritePairFields {
    u8 unknown00[0x20];
    SpritePairEntry *sprite20;
};

extern "C" u8 data_ov045_0220d594[];
extern "C" void *data_020f4e18;
extern "C" void *gDebugFont;
extern "C" void func_02071ea4(void *owner);
extern "C" void func_02071eb8(void *owner);
extern "C" void func_02071ee0(void *owner, void *archive, s32 first,
                               s32 second, s32 third);
extern "C" void *GraphicsSpriteGroupOwner_CreateGroup(void *font);
extern "C" void GraphicsSpriteGroup_Destroy(void *resource);
extern "C" void *GraphicsSpriteGroup_CreateStateFromSource(void *fontState, void *owner, s32 selector);
extern "C" void func_02073e48(void *sprite, s32 value, s32 x, s32 y,
                               s32 enabled, s32 zero1, s32 zero2);
extern "C" u32 genrand_int32(void);
extern "C" void Heap_Free(void *allocation);

/* Reset the paired-sprite runtime fields and seed; input storage is modified. */
extern "C" void func_ov045_0220bfdc(void *object);

/*
 * Construct the default paired-sprite object and return its storage. Install
 * the overlay vtable, initialize owners +4/+0x10, clear +0x34, then run the
 * common reset which acquires font state and seeds the PRNG-backed field.
 */
extern "C" void *func_ov045_0220be10(void *object)
{
    FIELD(void *, object, 0) = data_ov045_0220d594;
    func_02071ea4((u8 *)object + 4);
    func_02071ea4((u8 *)object + 0x10);
    FIELD(s32, object, 0x34) = 0;
    func_ov045_0220bfdc(object);
    return object;
}

/*
 * Construct and fully populate a paired-sprite object. The three resource IDs
 * configure owner +4; owner +0x10 always loads IDs 0x49..0x4B. Create sprites
 * +0x20/+0x24 from font state +0x1C, configure their flags and coordinates,
 * and return the storage. The fifth input supplies the second sprite's value;
 * resource, sprite, and PRNG state change.
 */
extern "C" void *func_ov045_0220be4c(void *object, s32 first, s32 second,
                                      s32 third, s32 spriteValue)
{
    FIELD(void *, object, 0) = data_ov045_0220d594;
    func_02071ea4((u8 *)object + 4);
    func_02071ea4((u8 *)object + 0x10);
    FIELD(s32, object, 0x34) = 0;
    func_ov045_0220bfdc(object);
    func_02071ee0((u8 *)object + 4, data_020f4e18,
                   first, second, third);
    func_02071ee0((u8 *)object + 0x10, data_020f4e18,
                   0x49, 0x4a, 0x4b);
    SpritePairFields *fields = (SpritePairFields *)object;
    SpritePairEntry *firstSprite = fields->sprite20 = (SpritePairEntry *)
        GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, object, 0x1c), (u8 *)object + 4, 2);
    firstSprite->field3A = 1;
    firstSprite->field28 = 0x10;
    FIELD(void *, object, 0x24) =
        GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, object, 0x1c), (u8 *)object + 0x10, 1);
    func_02073e48(FIELD(void *, object, 0x24), spriteValue,
                   0x54, 0x54, 1, 0, 0);
    return object;
}

/*
 * Release font state and both resource owners without freeing storage, then
 * return the unchanged pointer. The overlay vtable is restored first.
 */
extern "C" void *func_ov045_0220bf38(void *object)
{
    FIELD(void *, object, 0) = data_ov045_0220d594;
    GraphicsSpriteGroup_Destroy(FIELD(void *, object, 0x1c));
    func_02071eb8((u8 *)object + 0x10);
    func_02071eb8((u8 *)object + 4);
    return object;
}

/*
 * Release both resource groups and font state, free the object, and return its
 * former address. The returned address is not safe to dereference.
 */
extern "C" void *func_ov045_0220bf6c(void *object)
{
    FIELD(void *, object, 0) = data_ov045_0220d594;
    GraphicsSpriteGroup_Destroy(FIELD(void *, object, 0x1c));
    func_02071eb8((u8 *)object + 0x10);
    func_02071eb8((u8 *)object + 4);
    Heap_Free(object);
    return object;
}

/*
 * Alternate non-freeing destructor; it has the same observable release order
 * as func_ov045_0220bf38 and returns the unchanged storage pointer.
 */
extern "C" void *func_ov045_0220bfa8(void *object)
{
    FIELD(void *, object, 0) = data_ov045_0220d594;
    GraphicsSpriteGroup_Destroy(FIELD(void *, object, 0x1c));
    func_02071eb8((u8 *)object + 0x10);
    func_02071eb8((u8 *)object + 4);
    return object;
}

/*
 * Reset common runtime fields. Acquire debug-font state at +0x1C and set its
 * height/extent +0x1C to 0x60; clear sprite pointers +0x20/+0x24, set mode
 * +0x28 to one, clear timers +0x2C/+0x30, and replace seed +0x34 using the
 * shared PRNG. Font-resource and PRNG state change; no return value.
 */
extern "C" void func_ov045_0220bfdc(void *object)
{
    FIELD(void *, object, 0x1c) = GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    FIELD(s32, FIELD(void *, object, 0x1c), 0x1c) = 0x60;
    FIELD(void *, object, 0x20) = 0;
    FIELD(void *, object, 0x24) = 0;
    FIELD(s32, object, 0x28) = 1;
    FIELD(s32, object, 0x2c) = 0;
    FIELD(s32, object, 0x30) = 0;
    FIELD(u32, object, 0x34) = genrand_int32();
}
