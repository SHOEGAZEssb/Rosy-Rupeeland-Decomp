#include "tingle/types.h"

/* Overlay 25 selectable-record row construction and sprite population. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern u8 data_ov025_02202de8[];
extern s32 data_ov025_02202f28[];
extern void *gRuntimeContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void AnimationResourceState_InitEmbedded(void *);
extern void AnimationResourceState_ReplaceResources(void *, void *, s32, s32, s32);
extern s64 func_020befec(s32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern void GraphicsSpriteState_ApplyRenderConfig(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void TitleCharacterResourceCollection_Init(void *);
extern void TitleCharacterResourceCollection_Append(void *, s32);
#ifdef __cplusplus
}
#endif

/* Retail expands this sprite creation sequence at each owned field. */
#define CREATE_SPRITE(widget, slot, animation, x, y)                          \
    do {                                                                       \
        slot =                                                                 \
            GraphicsSpriteGroup_CreateStateFromSource(                         \
                FIELD(void *, widget, 0xc), widget, 1);                        \
        GraphicsSpriteState_ApplyRenderConfig(slot, animation, x, y, 1, 15, 0);                        \
    } while (0)

/* Indexed slots are addressed after creation, matching retail evaluation. */
#define CREATE_INDEXED_SPRITE(widget, slot_index, animation, x, y)            \
    do {                                                                       \
        void *created_sprite = GraphicsSpriteGroup_CreateStateFromSource(      \
            FIELD(void *, widget, 0xc), widget, 1);                            \
        void **sprite_slot =                                                   \
            (void **)((u8 *)widget + ((slot_index) << 2) + 0x14);              \
        *sprite_slot = created_sprite;                                         \
        GraphicsSpriteState_ApplyRenderConfig(*sprite_slot, animation, x, y, 1, 15, 0);                \
    } while (0)

/*
 * Constructs one record row for `index` from runtime-context table +0x38
 * (0x34-byte records). It loads resource triplet 0x4F..0x51, initializes input
 * +0x30, creates the row/controller sprites, copies an eight-code-unit label,
 * and builds either a short three-part value or a clamped decimal sprite run.
 * Record type 1 is active, type 2 is marked unavailable, and other types stay
 * inert. Resources 0x7001/0x7005 are registered with input state. Graphics,
 * archive, and widget state change; the widget pointer is returned.
 */
extern "C" void *func_ov025_021fd5dc(void *widget, s32 index)
{
    AnimationResourceState_InitEmbedded(widget);
    TitleCharacterResourceCollection_Init((u8 *)widget + 0x30);
    u8 *record = (u8 *)gRuntimeContext + 0x38 + index * 0x34;
    FIELD(s32, widget, 0x78) = index;
    for (s32 i = 0; i < 16; ++i)
        FIELD(u16, (u32)widget + (i << 1), 0x54) = 0;
    for (s32 i = 0; i < 6; ++i)
        FIELD(void *, (u32)widget + (i << 2), 0x14) = 0;
    FIELD(void *, widget, 0x2c) = 0;
    FIELD(s32, widget, 0x8c) = 0;

    AnimationResourceState_ReplaceResources(widget, data_020f4e18, 0x4f, 0x50, 0x51);
    void *owner = GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    FIELD(void *, widget, 0xc) = owner;
    FIELD(s32, owner, 0x18) = 0x58;
    FIELD(s32, owner, 0x1c) = 0x28 + index * 0x3c;
    FIELD(void *, widget, 0x10) = GraphicsSpriteGroup_CreateStateFromSource(
        FIELD(void *, widget, 0xc), widget, 1);

    u16 type = FIELD(u16, record, 0);
    if (type == 1) {
        for (s32 i = 0; i < 8; ++i)
            FIELD(u16, (u32)widget + (i << 1), 0x54) =
                FIELD(u16, (u32)record + (i << 1), 0x14);
        FIELD(s32, widget, 0x7c) = FIELD(s32, record, 4);
        FIELD(s32, widget, 0x84) = FIELD(s32, record, 0x10);
        FIELD(s32, widget, 0x74) = 1;
        FIELD(s32, widget, 0x88) = 1;
        GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, widget, 0x10), 2, 0, 0, 1, 16, 0);
        FIELD(s32, widget, 0x80) = FIELD(u8, record, 3);

        if (FIELD(s32, widget, 0x80) != 0) {
            bool started;
            s32 divisor;
            s32 digit;
            s32 slot;
            if (FIELD(s32, widget, 0x7c) < 10) {
                CREATE_SPRITE(widget, FIELD(void *, widget, 0x14),
                              FIELD(s32, widget, 0x7c) + 10,
                              FIELD(s32, data_ov025_02202de8, 0xf8), 12);
                CREATE_SPRITE(widget, FIELD(void *, widget, 0x18), 0x30,
                              FIELD(s32, data_ov025_02202de8, 0xfc), 12);
                CREATE_SPRITE(widget, FIELD(void *, widget, 0x1c), 10,
                              FIELD(s32, data_ov025_02202de8, 0x100), 12);
            } else {
                s32 value = FIELD(s32, widget, 0x7c);
                started = false;
                if (value < 0) value = 0;
                if (value > 99999) value = 99999;
                divisor = 10000;
                const s32 *positions = data_ov025_02202f28;
                for (slot = 0; slot < 6; ++slot) {
                    if (slot == 2) {
                        if (started)
                            CREATE_INDEXED_SPRITE(widget, slot, 30,
                                                  positions[slot], 12);
                        continue;
                    }
                    digit = (s32)func_020befec(value, divisor);
                    if (digit || started || divisor == 1) {
                        started = true;
                        CREATE_INDEXED_SPRITE(widget, slot, digit + 10,
                                              positions[slot], 12);
                        value =
                            (s32)(func_020befec(value, divisor) >> 32);
                    }
                    divisor = (s32)func_020befec(divisor, 10);
                }
            }
        } else {
            GraphicsSpriteState_SetAnimationIndex(
                FIELD(void *, widget, 0x10), 0x2e);
        }
        CREATE_SPRITE(widget, FIELD(void *, widget, 0x2c), index * 2 + 4, 0,
                      0);
    } else {
        if (type == 2) FIELD(s32, widget, 0x8c) = 1;
        FIELD(s32, widget, 0x74) = 0;
        GraphicsSpriteState_ApplyRenderConfig(FIELD(void *, widget, 0x10), 0, 0, 0, 1, 16, 0);
    }
    TitleCharacterResourceCollection_Append((u8 *)widget + 0x30, 0x7001);
    TitleCharacterResourceCollection_Append((u8 *)widget + 0x30, 0x7005);
    GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, widget, 0xc));
    return widget;
}
