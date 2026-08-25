#include "tingle/types.h"

/* Overlay 29 main scene construction, source selection, and UI allocation. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e18[];
extern void *gGamePhaseRuntime;
extern void *gGameWork;
extern void *gDebugFont;
extern void *gHeapContext;
extern const u8 data_ov029_021fecfc[];
extern const u8 data_ov029_021fed10[];
extern const u8 data_ov029_021fed18[];
extern const s32 data_ov029_021fec30[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void GameWork_ClearFlag(void *, s32);
extern u32 genrand_int32(void);
extern void RuntimePresentationManager_BroadcastSlot1C(void *, s32);
extern void *GraphicsArchive_AcquirePaletteResource(void *, s32);
extern void *RecordDescriptor_GetMessage(void *);
extern void SceneInputBase_Init(void *);
extern void TitleCharacterResourceCollection_Init(void *);
extern void func_02092814(void *, s32);
extern void func_020929b0(void *);
extern void *TitleDialog_Init(void *, void *, void *);
extern void func_02092f88(void *, s32, void *);
extern void func_020afd0c(void *, s32, s32, s32);
extern void func_ov029_021fce00(void *, void *);
extern void func_ov029_021fce34(void *, s32, s32, s32, s32);
extern void func_ov029_021fce4c(void *, s32, s32);
extern void func_ov029_021fd464(void *);
extern void func_ov029_021fd578(void *);
extern void *func_ov045_0220b83c(void *);
extern void func_ov045_0220c128(void *, s32);
extern void *func_ov045_0220c48c(s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the overlay scene using caller source `argument`. It initializes
 * the inherited base/vtable 0x021FECFC, manager +0x78, input state +0xEC, PRNG
 * seed +0xE4, clears game flag 0x38A, and resolves source metadata through a
 * temporary 0x021FECEC base object into fields +0x54..+0x68. Field +0x64 is
 * selected from the source for modes 0/2/5, game work +0x7CC for modes
 * 1/3/4/6, or zero for mode 7. It acquires resource 0xC007, loads manager IDs
 * 0x7007/0x7005, runs scene setup, creates the external object +0xA4, configures
 * main/sub blend hardware, clears the 16-color buffer +0xB0, allocates the
 * 0xEC-byte UI controller +0x9C and 0x70-byte child +0xD0, sets scene bit 0x400,
 * installs callback pair 0x021FEC30, and returns `state`. Heap, game-work,
 * graphics/UI, external overlay, and Nintendo DS blend-register state change.
 */
extern "C" void *func_ov029_021fce74(void *state, void *argument)
{
    SceneInputBase_Init(state);
    FIELD(const void *, state, 0) = data_ov029_021fecfc;
    TitleCharacterResourceCollection_Init((u8 *)state + 0x78);
    FIELD(u32, state, 0xe4) = 0;
    func_020929b0((u8 *)state + 0xec);
    RuntimePresentationManager_BroadcastSlot1C((u8 *)gGamePhaseRuntime + 0x2f7c, 1);
    FIELD(u32, state, 0xe4) = genrand_int32();
    GameWork_ClearFlag(gGameWork, 0x38a);
    FIELD(void *, state, 0x68) = argument;

    u8 temporary[16];
    func_ov029_021fce00(temporary, argument);
    void *source = FIELD(void *, temporary, 4);
    FIELD(s32, state, 0x54) = FIELD(u8, source, 0xc);
    FIELD(s32, state, 0x58) = FIELD(u16, source, 4);
    FIELD(s32, state, 0x5c) = FIELD(s32, source, 0x10);
    FIELD(s32, state, 0x60) = FIELD(s32, source, 0x18);
    FIELD(s32, state, 0x6c) = 0;
    FIELD(s32, state, 0x70) = -1;
    FIELD(s32, state, 0x74) = 0;
    switch (FIELD(s32, state, 0x5c)) {
    case 0:
    case 2:
    case 5:
        FIELD(s32, state, 0x64) = FIELD(s32, source, 0x14);
        break;
    case 1:
    case 3:
    case 4:
    case 6:
        FIELD(s32, state, 0x64) = FIELD(s32, gGameWork, 0x7cc);
        break;
    case 7:
        FIELD(s32, state, 0x64) = 0;
        break;
    }

    FIELD(void *, state, 0xe8) = GraphicsArchive_AcquirePaletteResource(data_020f4e18[0], 0xc007);
    func_02092814((u8 *)state + 0x78, 0x7007);
    func_02092814((u8 *)state + 0x78, 0x7005);
    func_ov029_021fd464(state);
    func_ov029_021fd578(state);
    void *external = func_ov045_0220c48c(
        FIELD(s32, state, 0x54), FIELD(s32, state, 0x58), 0);
    FIELD(void *, state, 0xa4) = external;
    if (FIELD(void *, external, 0x30) != 0)
        FIELD(u32, state, 0x4c) |= 2;
    u16 *identity = (u16 *)RecordDescriptor_GetMessage(temporary);
    if (identity[0] == 0xee0e)
        func_ov045_0220c128(external, identity[1]);

    func_020afd0c((void *)0x04000050, 4, 0x18, 8);
    func_020afd0c((void *)0x04001050, 4, 0x18, 8);
    for (s32 i = 0; i < 16; ++i)
        FIELD(u16, state, 0xb0 + i * 2) = 0;

    void *controller = Heap_Alloc(0xec, data_ov029_021fed10,
                                  4, gHeapContext);
    if (controller != 0)
        controller = TitleDialog_Init(controller, gDebugFont,
                                   FIELD(void *, state, 0x78));
    FIELD(void *, state, 0x9c) = controller;
    func_ov029_021fce34(controller, 0x50, 0x28, 0xa8, 0x84);
    FIELD(s32, controller, 0xbc) = -2;
    FIELD(s32, controller, 0xd0) = 0xd;
    FIELD(s32, controller, 0xd4) = 0;
    func_02092f88(controller, 6, (u8 *)state + 0xb0);
    FIELD(s32, state, 0xa8) = 0;
    FIELD(s32, state, 0xa0) = 0;
    void *child = Heap_Alloc(0x70, data_ov029_021fed18, 4, gHeapContext);
    if (child != 0)
        child = func_ov045_0220b83c(child);
    FIELD(void *, state, 0xd0) = child;
    FIELD(u32, state, 0x20) |= 0x400;
    func_ov029_021fce4c(state,
                        data_ov029_021fec30[0], data_ov029_021fec30[1]);
    return state;
}
