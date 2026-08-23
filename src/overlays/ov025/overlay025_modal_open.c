#include "tingle/types.h"

/* Overlay 25 modal allocation, initialization, and scene attachment. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov025_022033ac[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void GraphicsBgMapResource_UploadToMainBg(void *, s32, s32);
extern void *TitleScreenResourceCollection_Get(void *, s32);
extern void *func_020959d4(void *, s32, s32);
extern void ModalState_InitResources(void *, s32);
extern void ModalState_CopyAttachmentText(void *, void *);
#ifdef __cplusplus
}
#endif

/*
 * Select the scene's related BG state, allocate and initialize a 0x2D0-byte
 * modal at +0x59C, optionally attach `payload`, select the requested modal
 * entry, and set scene display flag bit 1. Returns void; heap, UI, and scene
 * ownership state change. `gHeapContext` is the SDK-side heap context address.
 */
extern "C" void func_ov025_02200224(void *scene, s32 selection, void *payload)
{
    GraphicsBgMapResource_UploadToMainBg(TitleScreenResourceCollection_Get((u8 *)scene + 0x530, 0), 1, 0);
    void *modal = Heap_Alloc(0x2d0, data_ov025_022033ac, 4, gHeapContext);
    if (modal)
        modal = func_020959d4(modal, 0, 0);
    FIELD(void *, scene, 0x59c) = modal;
    if (payload)
        ModalState_CopyAttachmentText(FIELD(void *, scene, 0x59c), payload);
    ModalState_InitResources(FIELD(void *, scene, 0x59c), selection);
    FIELD(u32, scene, 0x48) |= 2;
}
