#include "tingle/types.h"

/*
 * Overlay 44 scene teardown. These recovered destructor variants release the
 * panel, debug-font wrapper, optional owned interfaces, and embedded resource
 * helpers; the deleting variant also frees the scene allocation itself.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" void *data_ov044_0220d31c;
extern "C" u32 data_020f4e14;
extern "C" void *gDebugFont;
extern "C" void func_ov044_0220b8e4(void *panel);
extern "C" void Heap_Free(void *allocation);
extern "C" void func_ov001_021fb7d4(void *debugFont);
extern "C" void func_0207419c(void *resource);
extern "C" void func_02075630(void *resource);
extern "C" void func_ov044_0220be34(void *component);
extern "C" void func_02071eb8(void *component);
extern "C" void func_020926f8(void *component);
extern "C" void func_020927b8(void *component);

typedef void (*DestroyMethod)(void *object);

static void destroy_owned_interface(void *owned, u32 methodOffset)
{
    if (owned) {
        void *vtable = FIELD(void *, owned, 0);
        FIELD(DestroyMethod, vtable, methodOffset)(owned);
    }
}

/*
 * Tear down a scene in place and return its original address. This clears
 * active flag 0x400, destroys and frees panel +0x228 and debug wrapper +0x22C,
 * invokes virtual slot +0x04 on +0x238 and slot +0x08 on +0x23C, releases the
 * shared text/font resources, then finalizes embedded helpers in reverse
 * construction order. The scene allocation remains owned by the caller.
 */
extern "C" void *func_ov044_0220bfd4(void *object)
{
    FIELD(void *, object, 0) = data_ov044_0220d31c;
    FIELD(u32, object, 0x20) &= ~0x400;
    void *panel = FIELD(void *, object, 0x228);
    if (panel) {
        func_ov044_0220b8e4(panel);
        Heap_Free(panel);
    }
    void *debug = FIELD(void *, object, 0x22c);
    if (debug) {
        func_ov001_021fb7d4(debug);
        Heap_Free(debug);
    }
    destroy_owned_interface(FIELD(void *, object, 0x238), 4);
    destroy_owned_interface(FIELD(void *, object, 0x23c), 8);
    func_0207419c(FIELD(void *, object, 0xbc));
    func_02075630((void *)data_020f4e14);
    func_02075630(gDebugFont);
    func_ov044_0220be34((u8 *)object + 0x17c);
    func_ov044_0220be34((u8 *)object + 0xd0);
    func_02071eb8((u8 *)object + 0xc0);
    func_020926f8((u8 *)object + 0x78);
    func_020927b8((u8 *)object + 0x54);
    return object;
}

/*
 * Perform the same teardown as func_ov044_0220bfd4, then free the scene
 * allocation and return its former address as required by the recovered ABI.
 * All resource and heap effects are otherwise identical to the in-place form.
 */
extern "C" void *func_ov044_0220c0b4(void *object)
{
    func_ov044_0220bfd4(object);
    Heap_Free(object);
    return object;
}
