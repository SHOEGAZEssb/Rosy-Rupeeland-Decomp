#include "tingle/types.h"

/* Overlay 26 panel-owner teardown, child submission, and control propagation. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18;
extern const u8 data_ov026_0220497c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void func_02071e04(void *, void *);
extern void func_020948d4(void *, s32);
extern void *func_ov026_021fce50(void *);
extern void func_ov026_021fd900(u32, u32, u32, u32, u32, u32, u32, u32);
extern void func_ov026_021fd964(u32, u32, u32, u32, u32, u32);
#ifdef __cplusplus
}
#endif

typedef void *(*ObjectMethod)(void *);

/* Calls virtual slot +4 when `child` is non-null; this is inferred to destroy it. */
static void destroy_child(void *child)
{
    if (child != 0)
        ((ObjectMethod *)FIELD(void *, child, 0))[1](child);
}

/* Calls virtual slot +0x14 on a non-null geometry child; it submits that child. */
static void submit_child(void *child)
{
    ((ObjectMethod *)FIELD(void *, child, 0))[5](child);
}

/*
 * Restores the panel-owner vtable, releases resource +0x9C through the global
 * resource manager, destroys children +0xA0/+0xA4/+0xA8 through virtual slot
 * +4, then tears down the shared base. Returns `object` without freeing it.
 */
extern "C" void *func_ov026_021feda4(void *object)
{
    FIELD(const void *, object, 0) = data_ov026_0220497c;
    func_02071e04(data_020f4e18, FIELD(void *, object, 0x9c));
    destroy_child(FIELD(void *, object, 0xa0));
    destroy_child(FIELD(void *, object, 0xa4));
    destroy_child(FIELD(void *, object, 0xa8));
    func_ov026_021fce50(object);
    return object;
}

/* Tears down the shared base, frees `object`, and returns its former address. */
extern "C" void *func_ov026_021fee24(void *object)
{
    func_ov026_021fce50(object);
    Heap_Free(object);
    return object;
}

/*
 * Performs the complete panel-owner teardown described by 0x021FEDA4, then
 * frees the owner allocation. Returns the former object address.
 */
extern "C" void *func_ov026_021fee40(void *object)
{
    FIELD(const void *, object, 0) = data_ov026_0220497c;
    func_02071e04(data_020f4e18, FIELD(void *, object, 0x9c));
    destroy_child(FIELD(void *, object, 0xa0));
    destroy_child(FIELD(void *, object, 0xa4));
    destroy_child(FIELD(void *, object, 0xa8));
    func_ov026_021fce50(object);
    Heap_Free(object);
    return object;
}

/*
 * Establishes common model state, submits children +0xA0 and +0xA4 with model
 * entry 0x16, changes to entry 0x1A, then submits +0xA8. The command arguments
 * are preserved address-for-address because their semantic names are unknown.
 * Returns void and affects the DS geometry command stream through the callees.
 */
extern "C" void func_ov026_021feec8(void *object)
{
    func_ov026_021fd900(0, 0, 0, 0, 0, 0, 0, 0);
    func_ov026_021fd964(0, 0, 2, 0x16, 0x1f, 0);
    submit_child(FIELD(void *, object, 0xa0));
    submit_child(FIELD(void *, object, 0xa4));
    func_ov026_021fd964(0, 0, 2, 0x1a, 0x10, 0);
    submit_child(FIELD(void *, object, 0xa8));
}

/*
 * Writes `control_id` to the +0x1C control subobject of children +0xA4 and
 * +0xA8. Returns void; child +0xA0 is intentionally unchanged.
 */
extern "C" void func_ov026_021fef70(void *object, s32 control_id)
{
    func_020948d4((u8 *)FIELD(void *, object, 0xa4) + 0x1c, control_id);
    func_020948d4((u8 *)FIELD(void *, object, 0xa8) + 0x1c, control_id);
}
