#include "tingle/types.h"

/* Overlay 16 six-slot dual-column panel construction. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18;
extern u8 gSystemState[];

#ifdef __cplusplus
extern "C" {
#endif
extern void __construct_array(void *, s32, s32, void (*)(void *), void (*)(void *));
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_Destroy(void *);
extern void AnimationResourceState_ReplaceResources(void *, void *, s32, s32, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void TitleInterpolatedValue_Init(void *);
extern void TitleCharacterResourceCollection_Init(void *);
extern void TitleCharacterResourceCollection_Append(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Construct the overlay's six-slot panel. Initialize resources +0x0C/+0x18,
 * six 0x0C-byte resources at +0x24, resources +0x6C/+0x78, state +0xD4, and
 * controller +0xF8. Acquire two owner children, queue 0x7000/0x7005/0x7006,
 * load confirmed resource triples 0x24/0x22/0x25, 0x60-0x62, and 0x21-0x23,
 * then create fixed sprites +0x84/+0x88 and three six-sprite arrays at +0x8C,
 * +0xA4, and +0xBC. The six slots form two columns of three; system byte +0x5F
 * shifts the first column left by 16 pixels. Return state. SDK graphics objects
 * are allocated/initialized, but the function performs no direct MMIO.
 */
extern "C" void *Overlay016_Panel_Init(void *state, void *owner)
{
    s32 i;
    s32 xOffset = gSystemState[0x5f] != 0 ? -0x10 : 0;
    s32 yOffset = 0;

    AnimationResourceState_InitEmbedded((u8 *)state + 0xc);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x18);
    __construct_array((u8 *)state + 0x24, 6, 0xc, AnimationResourceState_InitEmbedded, AnimationResourceState_Destroy);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x6c);
    AnimationResourceState_InitEmbedded((u8 *)state + 0x78);
    TitleCharacterResourceCollection_Init((u8 *)state + 0xd4);
    TitleInterpolatedValue_Init((u8 *)state + 0xf8);
    FIELD(void *, state, 0) = owner;
    FIELD(void *, state, 4) = GraphicsSpriteGroupOwner_CreateGroup(owner);
    FIELD(void *, state, 8) = GraphicsSpriteGroupOwner_CreateGroup(owner);
    TitleCharacterResourceCollection_Append((u8 *)state + 0xd4, 0x7000);
    TitleCharacterResourceCollection_Append((u8 *)state + 0xd4, 0x7005);
    TitleCharacterResourceCollection_Append((u8 *)state + 0xd4, 0x7006);
    AnimationResourceState_ReplaceResources((u8 *)state + 0xc, data_020f4e18, 0x24, 0x22, 0x25);
    AnimationResourceState_ReplaceResources((u8 *)state + 0x6c, data_020f4e18, 0x60, 0x61, 0x62);
    AnimationResourceState_ReplaceResources((u8 *)state + 0x78, data_020f4e18, 0x21, 0x22, 0x23);

    FIELD(void *, state, 0x84) = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 8),
                                               (u8 *)state + 0x6c, 1);
    GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, state, 0x84), 0, 0x23, 0x2e, 1, 0, 4);
    FIELD(void *, state, 0x88) = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 8),
                                               (u8 *)state + 0xc, 1);
    GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, state, 0x88), 6, 0x58, 0x37, 1, 0, 4);

    for (i = 0; i < 6; i++) {
        FIELD(void *, state, 0xa4 + i * 4) =
            GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 8), (u8 *)state + 0x78, 1);
        GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, state, 0xa4 + i * 4), 0,
                      xOffset + 0x48, yOffset + 0x67, 1, 0, 4);

        FIELD(void *, state, 0x8c + i * 4) =
            GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 8), (u8 *)state + 0x78, 1);
        GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, state, 0x8c + i * 4), 0xf,
                      xOffset + 0x26, yOffset + 0x60, 1, 0x100, 4);

        FIELD(void *, state, 0xbc + i * 4) =
            GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 8), (u8 *)state + 0x78, 1);
        GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, state, 0xbc + i * 4), 0x12,
                      xOffset + 0x3a, yOffset + 0x64, 1, 0x100, 4);

        yOffset += 0x22;
        if (i == 2) {
            xOffset += 0x6c;
            if (gSystemState[0x5f] != 0) {
                xOffset += 0x10;
            }
            yOffset = 0;
        }
    }
    return state;
}
