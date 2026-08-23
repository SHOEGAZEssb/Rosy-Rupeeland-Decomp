#include "tingle/types.h"

/*
 * Overlay 44 auxiliary creation. This recovered helper switches an embedded
 * graphics resource mode, allocates a scene-owned auxiliary interface, applies
 * optional configuration, and marks its display layer active.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" const u8 data_ov044_0220d350[];
extern "C" u8 gHeapContext[];
extern "C" void *TitleScreenResourceCollection_Get(void *resource, s32 enabled);
extern "C" void GraphicsBgMapResource_UploadToMainBg(void *resource, s32 destination, s32 offset);
extern "C" void *Heap_Alloc(u32 size, const void *tag, s32 alignment,
                              void *heap);
extern "C" void *func_020959d4(void *storage, s32 first, s32 second);
extern "C" void ModalState_CopyAttachmentText(void *auxiliary, void *configuration);
extern "C" void ModalState_InitResources(void *auxiliary, void *content);

/*
 * Set embedded resource +0x78 to the boolean mode supplied in the third
 * argument and apply its returned resource to destination/offset zero. Allocate
 * 0x2D0 bytes, construct the auxiliary object with zeroed options, store it at
 * +0x238, optionally apply the fourth-argument configuration, bind the second
 * argument as content, and set bit zero in scene layer flags +0x48. Heap and
 * graphics state change; no value is returned.
 */
extern "C" void func_ov044_0220c8d0(void *object, void *content,
                                     s32 enabled, void *configuration)
{
    void *resource = TitleScreenResourceCollection_Get((u8 *)object + 0x78, enabled ? 1 : 0);
    GraphicsBgMapResource_UploadToMainBg(resource, 0, 0);
    void *auxiliary = Heap_Alloc(0x2d0, data_ov044_0220d350, 4,
                                 gHeapContext);
    if (auxiliary)
        auxiliary = func_020959d4(auxiliary, 0, 0);
    FIELD(void *, object, 0x238) = auxiliary;
    if (configuration)
        ModalState_CopyAttachmentText(auxiliary, configuration);
    ModalState_InitResources(auxiliary, content);
    FIELD(u32, object, 0x48) |= 1;
}
