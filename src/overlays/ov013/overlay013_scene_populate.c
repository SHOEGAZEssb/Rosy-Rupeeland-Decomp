#include "tingle/types.h"

/*
 * Overlay 13 scene population and graphics setup. The recovered routine builds
 * two table-driven record groups, applies GameWork-dependent activation, and
 * initializes the Nintendo DS background/resource configuration.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay013ResourceSet {
    u32 words[3];
} Overlay013ResourceSet;

extern void *gGameWork;
extern u8 *data_021052fc;
extern void *data_020f4e14;
extern void *gDebugFont;
extern void *data_020f4e18;
extern const u8 data_ov013_021fec18[];
extern const u8 data_ov013_021febb4[];
#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_SetFlag(void *, s32);
extern s32 GameWork_TestFlag(void *, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void func_020957f0(void *, void *, s32, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void func_020948d4(void *, s32);
extern void func_020948e4(void *, s32, s32);
extern void func_020954f4(void *);
extern void func_02095940(void *);
extern void func_020958d8(void *);
extern void func_02095988(void *, s32);
extern void func_0202844c(void *);
extern void func_ov013_021fda28(void *, s32);
extern void func_ov013_021fdb50(void *, s32);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void func_020925a4(s32);
extern void func_020925f8(void);
extern void func_02092638(s32, s32, s32, s32);
extern void GraphicsResourceSet_Init(Overlay013ResourceSet *);
extern void GraphicsResourceSet_Load(Overlay013ResourceSet *, void *, s32,
                                     s32, s32);
extern void GraphicsResourceSet_Destroy(Overlay013ResourceSet *);
extern void func_020b44e8(void);
extern void func_02072048(Overlay013ResourceSet *, s32, s32);
extern void func_02070f34(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Populate the scene in state. Set GameWork flags 0x394/0x39B. For seven
 * 24-byte descriptors at data_ov013_021fec18, bind a 0xAC-byte record at +0x8C
 * and an associated object at +0x950[index] to resource +0x54, copy descriptor
 * fields +0x08/+0x0C, configure render parameters, and use flags +0x10/+0x12/
 * +0x14 to activate, hide, or stop each record. Activated records set +0x974,
 * set related-object value 6, enable record bit 0, configure its +0x1C member,
 * set a 120-frame counter, and refresh controller +0x948. Several confirmed
 * global mode/flag gates additionally activate indexes 0, 1, and 3.
 *
 * GameWork flag 0x889 selects a single record at +0x89C using resource +0x6C;
 * otherwise five 20-byte descriptors at data_ov013_021febb4 populate records
 * +0x540 using resource +0x60. Their +0x0C/+0x0E/+0x10 flags similarly choose
 * activation, alternate selection, or stopping. Store the shared associated
 * object at +0x94C and configure it for the selected branch.
 *
 * Finally clear graphics/debug managers, write BG control registers at
 * 0x0400000A/0x0400000E, configure display layers, load resource triplets
 * 0xB000..0xB002 and 0x8000..0x8002 through a temporary resource set, apply
 * them, and destroy the temporary set. Return void. Table offsets, flags,
 * calls, MMIO writes, and resource IDs are confirmed; record/render naming is
 * inferred from the invoked graphics interfaces.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov013_021fd310(void *state)
{
    s32 i;
    Overlay013ResourceSet resources;
    volatile u16 *bg0cnt = (volatile u16 *)0x0400000a;

    GameWork_SetFlag(gGameWork, 0x394);
    GameWork_SetFlag(gGameWork, 0x39b);
    for (i = 0; i < 7; ++i) {
        const u8 *descriptor = data_ov013_021fec18 + i * 0x18;
        u8 *record = (u8 *)state + 0x8c + i * 0xac;
        void *selected = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x84),
                                       (u8 *)state + 0x54, 2);
        void *associated;

        func_020957f0(record, selected, FIELD(s32, descriptor, 0), 3, 8);
        func_02095820(record, FIELD(s32, descriptor, 8),
                     FIELD(s32, descriptor, 0x0c));
        associated = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x84),
                                   (u8 *)state + 0x54, 2);
        FIELD(void *, state, 0x950 + i * 4) = associated;
        func_02073e48(associated, FIELD(s32, descriptor, 4),
                      FIELD(s32, descriptor, 8),
                      FIELD(s32, descriptor, 0x0c), 3, 7, 0);
        if (GameWork_TestFlag(gGameWork, FIELD(u16, descriptor, 0x14))) {
            void *related = FIELD(void *, record, 0x9c);
            FIELD(s32, state, 0x974) = 1;
            FIELD(u16, related, 0x28) = 6;
            FIELD(u16, record, 0x98) |= 1;
            func_020948d4(record + 0x1c, 0xe0000);
            func_020948e4(record + 0x1c, 2,
                          FIELD(s32, descriptor, 0x0c) << 12);
            func_ov013_021fda28(record, 0x78);
            if (i >= 4) {
                void *manager = FIELD(void *, state, 0x84);
                FIELD(s32, manager, 0x18) = -256;
                FIELD(s32, manager, 0x1c) = 0;
            }
            func_020954f4(FIELD(void *, state, 0x948));
        } else if (GameWork_TestFlag(gGameWork,
                                     FIELD(u16, descriptor, 0x10))) {
            if (GameWork_TestFlag(gGameWork,
                                  FIELD(u16, descriptor, 0x12)))
                func_ov013_021fdb50(state, i);
            else
                FIELD(u16, associated, 0x24) |= 4;
        } else {
            func_02095940(record);
        }
        func_020958d8(record);
    }

    if (FIELD(s32, state, 0x97c) != 0) {
        func_ov013_021fdb50(state, 3);
        func_02095988((u8 *)state + 0x138, 7);
        FIELD(u32, state, 0x20) |= 0x400;
    }

    if (GameWork_TestFlag(gGameWork, 0x889)) {
        u8 *record = (u8 *)state + 0x89c;
        void *selected = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x84),
                                       (u8 *)state + 0x6c, 2);
        func_020957f0(record, selected, 0, 3, 8);
        func_02095820(record, 0x80, 0x92);
        FIELD(void *, state, 0x94c) = GraphicsSpriteGroup_CreateStateFromSource(
            FIELD(void *, state, 0x84), (u8 *)state + 0x6c, 2);
        func_02073e48(FIELD(void *, state, 0x94c), 2, 0x80, 0xb2,
                      3, 0, 4);
    } else {
        for (i = 0; i < 5; ++i) {
            const u8 *descriptor = data_ov013_021febb4 + i * 0x14;
            u8 *record = (u8 *)state + 0x540 + i * 0xac;
            void *selected = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x84),
                                           (u8 *)state + 0x60, 2);
            func_020957f0(record, selected, FIELD(s32, descriptor, 0), 3, 8);
            func_02095820(record, FIELD(s32, descriptor, 8), 0x9c);
            if (FIELD(u16, descriptor, 0x10) != 0 &&
                GameWork_TestFlag(gGameWork,
                                  FIELD(u16, descriptor, 0x10))) {
                void *related = FIELD(void *, record, 0x9c);
                FIELD(s32, state, 0x974) = 1;
                FIELD(u16, related, 0x28) = 6;
                FIELD(u16, record, 0x98) |= 1;
                func_020948d4(record + 0x1c, 0xe0000);
                func_020948e4(record + 0x1c, 2, 0x9c000);
                func_ov013_021fda28(record, 0x78);
                func_020954f4(FIELD(void *, state, 0x948));
            } else {
                func_02095940(record);
            }
        }
        FIELD(void *, state, 0x94c) = GraphicsSpriteGroup_CreateStateFromSource(
            FIELD(void *, state, 0x84), (u8 *)state + 0x60, 2);
        func_02073e48(FIELD(void *, state, 0x94c), 15, 0x80, 0xb2,
                      3, 0, 4);
    }

    GraphicsSpriteRenderer_ClearTextBuffer(data_020f4e14);
    if (FIELD(s32, state, 0x97c) == 0)
        GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);
    FIELD(s32, state, 0x48) = 0x18;
    func_020925a4(0);
    *bg0cnt = (*bg0cnt & 0x43) | 0x3c00;
    bg0cnt[2] = (bg0cnt[2] & 0x43) | 0x1e10;
    func_020925f8();
    func_02092638(0, 1, 2, 3);

    GraphicsResourceSet_Init(&resources);
    GraphicsResourceSet_Load(&resources, data_020f4e18,
                             0xb000, 0xb001, 0xb002);
    func_020b44e8();
    func_02072048(&resources, 3, 0);
    GraphicsResourceSet_Load(&resources, data_020f4e18,
                             0x8000, 0x8001, 0x8002);
    func_02070f34((void *)resources.words[2], 8);
    func_020b44e8();
    func_02072048(&resources, 1, 0x100);
    GraphicsResourceSet_Destroy(&resources);
}
