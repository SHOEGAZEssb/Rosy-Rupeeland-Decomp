#include "tingle/types.h"

/* Overlay 21 per-mode list construction and scene input/sprite widget setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void **data_021f5128;
extern const u8 data_ov021_02202f98[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern s32 func_0207abd8(void *, s32);
extern void func_02093d50(void *, s32);
extern void func_02093d7c(void *, s32);
extern void func_020957f0(void *, void *, s32, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_02095940(void *);
extern void *func_ov021_021fce18(void *, void *, s32, s32);
extern void *func_ov021_021fd0e8(void *, const void *);
extern void func_ov021_021fd254(void *);
#ifdef __cplusplus
}
#endif

/*
 * Select the mode record from data_021F5128 using scene +0x54. For each of two
 * supported list channels, test availability through func_0207ABD8. When
 * available, derive its capacity from record +8/+0x0C, allocate/construct a
 * 0xA4-byte list at +0x2A4+i*4 using the shared font and channel index, restore
 * controller first-visible/selection from +0x2AC/+0x2B4, append descriptors
 * from record pointer +0x18+i*4 at 0x10-byte stride, assign 24-pixel row
 * positions, and materialize visible sprites. Store null when unavailable.
 * Heap/list/font/sprite SDK state changes; returns void and no MMIO occurs.
 */
extern "C" void func_ov021_021fe520(void *state)
{
    u8 *record = (u8 *)data_021f5128[FIELD(s32, state, 0x54)];
    s32 channel;
    for (channel = 0; channel < 2; channel++) {
        if (func_0207abd8(record, channel) != 0) {
            s32 capacity;
            if (channel == 2)
                capacity = FIELD(s32, record, 8) +
                           FIELD(s32, record, 0xc);
            else
                capacity = FIELD(s32, record, 8 + channel * 4);
            void *list = Heap_Alloc(0xa4, data_ov021_02202f98,
                                    4, gHeapContext);
            if (list != 0)
                list = func_ov021_021fce18(list, data_020f4e14,
                                           capacity, channel);
            FIELD(void *, state, 0x2a4 + channel * 4) = list;
            void *controller = FIELD(void *, list, 0x58);
            func_02093d7c(controller,
                          FIELD(s32, state, 0x2ac + channel * 4));
            func_02093d50(controller,
                          FIELD(s32, state, 0x2b4 + channel * 4));

            const u8 *descriptors =
                FIELD(const u8 *, record, 0x18 + channel * 4);
            s32 i;
            for (i = 0; i < capacity; i++) {
                void *row = func_ov021_021fd0e8(
                    list, descriptors + i * 0x10);
                FIELD(s16, row, 8) = 0;
                FIELD(s16, row, 0xa) = (s16)(i * 0x18);
            }
            func_ov021_021fd254(list);
        } else {
            FIELD(void *, state, 0x2a4 + channel * 4) = 0;
        }
    }
}

/*
 * Construct two 0xAC-byte input helpers at +0x14C/+0x1F8 using sprites from
 * renderer +0x94/resource +0x7C and animations 0x16+i*2 when the corresponding
 * list exists or 0x17+i*2 otherwise. Initially place them at X=-64 and
 * Y=64+i*48; modes 9/12/13 disable the first and move the second to Y=96,
 * while mode 17 disables the second and moves the first. Create selector sprite
 * +0x98, input helper +0xA0, and label sprite +0x9C with the recovered fixed
 * animations/positions. Sprite/input/UI SDK state changes; returns void.
 */
extern "C" void func_ov021_021fe6b0(void *state)
{
    s32 i;
    for (i = 0; i < 2; i++) {
        s32 animation = i * 2 +
            (FIELD(void *, state, 0x2a4 + i * 4) != 0 ? 0x16 : 0x17);
        void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x94),
                                     (u8 *)state + 0x7c, 1);
        void *helper = (u8 *)state + 0x14c + i * 0xac;
        func_020957f0(helper, sprite, animation, 1, 0);
        func_02095820(helper, -64, 0x40 + i * 0x30);
    }
    s32 mode = FIELD(s32, state, 0x54);
    if (mode == 9 || mode == 12 || mode == 13) {
        func_02095940((u8 *)state + 0x14c);
        func_02095820((u8 *)state + 0x1f8, -64, 0x60);
    } else if (mode == 17) {
        func_02095940((u8 *)state + 0x1f8);
        func_02095820((u8 *)state + 0x14c, -64, 0x60);
    }

    FIELD(void *, state, 0x98) =
        GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x94), (u8 *)state + 0x7c, 1);
    func_02073e48(FIELD(void *, state, 0x98), 0x14, 0x86, 0x1c,
                  1, 0, 6);
    void *inputSprite =
        GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x94), (u8 *)state + 0x7c, 1);
    func_020957f0((u8 *)state + 0xa0, inputSprite, 2, 1, 0);
    func_02095820((u8 *)state + 0xa0, 0xe4, 0xaa);
    FIELD(void *, state, 0x9c) =
        GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x94), (u8 *)state + 0x88, 1);
    func_02073e48(FIELD(void *, state, 0x9c), 0, 0x54, 0xe,
                  1, 0, 4);
}
