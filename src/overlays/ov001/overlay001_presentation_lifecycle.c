#include "tingle/heap.h"

/*
 * Overlay 1 presentation-state construction. This recovered helper initializes
 * embedded resources, creates a presentation object, and installs its layout.
 */

typedef struct Overlay001PresentationState {
    void *owner_00;
    void *spriteOwner_04;
    u8 resource_08[0x0c];
    u8 resource_14[0x0c];
    u8 rendererState_20[0x24];
    void *volatile presentation_44;
} Overlay001PresentationState;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern char data_ov001_021fcc88[];
extern void func_02071ea4(void *resource);
extern void func_02071ee0(void *resource, void *manager, s32 first,
                          s32 second, s32 third);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
extern void func_02092798(void *state);
extern void func_02092814(void *state, s32 resourceId);
extern void *func_02092cc0(void *object, void *owner, void *resource);
extern void func_ov001_021fb6e0(void *owner, s32 first, s32 second,
                                s32 third, s32 fourth);
#ifdef __cplusplus
}
#endif

/*
 * Initialize state for owner and return state. Initialize resources at +8/+14
 * and renderer state +0x20, derive spriteOwner_04, register resource IDs
 * 0x7000/0x7005/0x7001, allocate a 0xEC-byte object tagged by
 * data_ov001_021fcc88, and construct it when allocation succeeds. Store the
 * result at +0x44, apply layout (0x60,0x5C,0x78,0x4C), and initialize resource
 * +8 from data_020f4e18 with (0x24,0x22,0x25). Heap/resource callees own SDK
 * effects; retail calls the layout helper even if allocation returned null.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay001PresentationState *func_ov001_021fb6f8(
    Overlay001PresentationState *state, void *owner)
{
    void *presentation;

    func_02071ea4(state->resource_08);
    func_02071ea4(state->resource_14);
    func_02092798(state->rendererState_20);
    state->owner_00 = owner;
    state->spriteOwner_04 = GraphicsSpriteGroupOwner_CreateGroup(owner);
    func_02092814(state->rendererState_20, 0x7000);
    func_02092814(state->rendererState_20, 0x7005);
    func_02092814(state->rendererState_20, 0x7001);
    presentation = Heap_Alloc(0xec, data_ov001_021fcc88, 4, &gHeapContext);
    if (presentation != 0) {
        presentation = func_02092cc0(
            presentation, state->owner_00,
            *(void **)&state->rendererState_20[0]);
    }
    state->presentation_44 = presentation;
    func_ov001_021fb6e0((void *)state->presentation_44,
                        0x60, 0x5c, 0x78, 0x4c);
    func_02071ee0(state->resource_08, data_020f4e18, 0x24, 0x22, 0x25);
    return state;
}
