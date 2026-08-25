#include "tingle/heap.h"

/*
 * Overlay 0 presentation-state construction. This unit initializes embedded
 * resource handles, creates a sprite-backed presentation object, installs its
 * layout, and caches a short localized UTF-16 label for later display.
 */

typedef struct Overlay000PresentationState {
    void *owner_00;
    void *spriteOwner_04;
    u8 resource_08[0x0c];
    u8 resource_14[0x0c];
    u8 rendererState_20[0x24];
    void *volatile presentation_44;
    u16 label_48[0x10];
} Overlay000PresentationState;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern u8 data_021f3ecc[];
extern char data_ov000_021fcd4c[];
extern void AnimationResourceState_InitEmbedded(void *resource);
extern void AnimationResourceState_ReplaceResources(void *resource, void *manager, s32 first,
                          s32 second, s32 third);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
extern u8 *RetailTextTable_FindRecordById(void *table, u16 resourceId);
extern void TitleCharacterResourceCollection_Init(void *state);
extern void TitleCharacterResourceCollection_Append(void *state, s32 resourceId);
extern void *TitleDialog_Init(void *object, void *owner, void *resource);
extern void func_ov000_021fb710(void *owner, s32 valueA, s32 valueB,
                                s32 valueC, s32 valueD);
#ifdef __cplusplus
}
#endif

/*
 * Initialize state for owner, returning state after all embedded resources and
 * the localized label are ready. Allocates a 0xEC-byte presentation object
 * from the root heap, configures IDs 0x7000/0x7005/0x7001, and assigns layout
 * values (0x38,0x58,0x98,0x40). It also loads resource 0x1BA and copies at
 * most 16 UTF-16 code units including a terminator. Allocation and resource
 * services mutate heap and graphics state but this wrapper touches no hardware
 * directly; retail assumes allocation succeeds before applying the layout.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay000PresentationState *func_ov000_021fb728(
    Overlay000PresentationState *state, void *owner)
{
    u16 *source;
    u16 character;
    s32 index;
    void *presentation;

    AnimationResourceState_InitEmbedded(state->resource_08);
    AnimationResourceState_InitEmbedded(state->resource_14);
    TitleCharacterResourceCollection_Init(state->rendererState_20);
    state->owner_00 = owner;
    state->spriteOwner_04 = GraphicsSpriteGroupOwner_CreateGroup(owner);
    TitleCharacterResourceCollection_Append(state->rendererState_20, 0x7000);
    TitleCharacterResourceCollection_Append(state->rendererState_20, 0x7005);
    TitleCharacterResourceCollection_Append(state->rendererState_20, 0x7001);

    presentation = Heap_Alloc(0xec, data_ov000_021fcd4c, 4, &gHeapContext);
    if (presentation != 0) {
        presentation = TitleDialog_Init(
            presentation, state->owner_00,
            *(void **)&state->rendererState_20[0]);
    }
    state->presentation_44 = presentation;
    func_ov000_021fb710((void *)state->presentation_44,
                        0x38, 0x58, 0x98, 0x40);

    AnimationResourceState_ReplaceResources(state->resource_08, data_020f4e18, 0x24, 0x22, 0x25);
    source = (u16 *)(RetailTextTable_FindRecordById(data_021f3ecc, 0x1ba) + 2);
    for (index = 0; index < 0x10; index++) {
        character = source[index];
        state->label_48[index] = character;
        if (character == 0) {
            break;
        }
    }
    return state;
}
