#include "tingle/heap.h"
#include "tingle/types.h"

/* Overlay 17 heap-backed panel/message object creation and destruction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const char data_ov017_022016bc[];
extern HeapContext gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsBgMapResource_UploadToMainBg(void *, s32, s32);
extern void *TitleScreenResourceCollection_Get(void *, s32);
extern void *func_020959d4(void *, s32, s32);
extern void func_02095bec(void *);
extern void ModalState_InitResources(void *, s32);
extern void ModalState_CopyAttachmentText(void *, void *);
#ifdef __cplusplus
}
#endif

/*
 * Select handle 0 or 1 from the manager at +0x1FC according to alternate,
 * configure that handle with mode 2, then allocate and construct a 0x2D0-byte
 * object from descriptor data_ov017_022016BC. Store it at +0x400, optionally
 * attach caller data, apply setting, and set flag bit 2 in +0x48. Manager, heap,
 * and SDK state change; returns void and performs no direct hardware access.
 */
extern "C" void func_ov017_021ffcc8(void *state, s32 setting, s32 alternate,
                                     void *attachment)
{
    void *object;
    void *handle = TitleScreenResourceCollection_Get((u8 *)state + 0x1fc, alternate != 0);

    GraphicsBgMapResource_UploadToMainBg(handle, 2, 0);
    object = Heap_Alloc(0x2d0, data_ov017_022016bc, 4, &gHeapContext);
    if (object != 0) {
        object = func_020959d4(object, 0, 0);
    }
    FIELD(void *, state, 0x400) = object;
    if (attachment != 0) {
        ModalState_CopyAttachmentText(object, attachment);
    }
    ModalState_InitResources(object, setting);
    FIELD(u32, state, 0x48) |= 4;
}

/*
 * Shut down the object at +0x400, invoke its vtable slot +4 when non-null, clear
 * the pointer, and clear flag bit 2 in +0x48. Heap/SDK ownership may change;
 * returns void and performs no direct hardware access.
 */
extern "C" void func_ov017_021ffd74(void *state)
{
    void *object = FIELD(void *, state, 0x400);
    func_02095bec(object);
    object = FIELD(void *, state, 0x400);
    if (object != 0) {
        typedef void (*Destructor)(void *);
        Destructor destructor = FIELD(Destructor *, object, 0)[1];
        destructor(object);
    }
    FIELD(void *, state, 0x400) = 0;
    FIELD(u32, state, 0x48) &= ~4U;
}
