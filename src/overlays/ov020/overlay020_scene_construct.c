#include "tingle/types.h"

/* Overlay 20 list-scene construction, record filtering, and initial graphics setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_020ea650[];
extern const u8 data_020ea9b0[];
extern void *data_020f4e14;
extern void *data_020f4e18[];
extern const u32 data_ov020_021fe460[];
extern const u32 data_ov020_021fe504[];
extern const u8 data_ov020_021fe530[];
extern const u8 data_ov020_021fe538[];
extern void *gDebugFont;
extern void *gGameWork;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern s32 GameWork_TestFlag(void *, u32);
extern void func_02071ea4(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void *func_02073ffc(void *, void *, s32);
extern void *func_020742cc(void *);
extern void func_02091e28(void *);
extern void func_02092798(void *);
extern void func_020957bc(void *);
extern void func_020957f0(void *, void *, s32, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void *func_ov020_021fce18(void *, void *, s32);
extern void *func_ov020_021fd038(void *, const void *);
extern void func_ov020_021fd0a0(void *);
extern void *func_ov020_021fd320(void *, void *);
extern void func_ov020_021fd81c(void *, u32, u32, s32);
extern void func_ov020_021fdca4(void *);
extern void func_ov020_021fdd88(void);
#ifdef __cplusplus
}
#endif

/*
 * Initialize a caller-provided scene, its two resource sets, input helper,
 * manager, font renderers, and initial transition. Scan 36 records at
 * data_020EA9B0 (stride 0x68), retaining entries whose +0x60 flag is set in
 * game work. Type 0x25A replaces a retained type-0x4D slot when present;
 * otherwise eligible records append. Sort retained indices by the signed
 * priority byte at data_020EA650[index*0x18+8], construct/populate the list at
 * +0x1DC and detail panel at +0x1E0, configure graphics, set scene flag bit 10,
 * and select data_ov020_021FE460. Returns state. Heap, game-work, UI, graphics,
 * input, and transition SDK state change; graphics helpers access DS hardware.
 */
extern "C" void *func_ov020_021fd844(void *state)
{
    s32 i;
    s32 count;
    func_02091e28(state);
    FIELD(const u32 *, state, 0) = data_ov020_021fe504;
    func_02071ea4((u8 *)state + 0x54);
    func_02071ea4((u8 *)state + 0x60);
    func_020957bc((u8 *)state + 0x70);
    func_02092798((u8 *)state + 0x1b8);
    FIELD(s32, state, 0x1e4) = 0;
    func_02071ee0((u8 *)state + 0x60, data_020f4e18[0], 0x38, 1, 0x39);
    func_02071ee0((u8 *)state + 0x54, data_020f4e18[0], 0x1f, 1, 0x20);
    FIELD(void *, state, 0x6c) = func_020742cc(gDebugFont);
    func_020957f0((u8 *)state + 0x70,
                  func_02073ffc(FIELD(void *, state, 0x6c),
                                 (u8 *)state + 0x60, 2),
                  6, 1, 0);
    func_02095820((u8 *)state + 0x70, 0xe8, 0xaa);
    FIELD(void *, state, 0x11c) =
        func_02073ffc(FIELD(void *, state, 0x6c), (u8 *)state + 0x54, 1);
    func_02073e48(FIELD(void *, state, 0x11c), 1, 0x84, 0x1e, 1, 0, 6);

    count = 0;
    for (i = 0; i < 36; i++) {
        const u8 *record = data_020ea9b0 + i * 0x68;
        if (FIELD(u32, record, 0x60) != 0 &&
            GameWork_TestFlag(gGameWork, FIELD(u32, record, 0x60)) != 0) {
            if (FIELD(s16, record, 0) == 0x25a) {
                s32 j;
                for (j = 0; j < count; j++) {
                    s32 saved = FIELD(s32, state, 0x124 + j * 4);
                    if (FIELD(s16, data_020ea9b0 + saved * 0x68, 0) == 0x4d) {
                        FIELD(s32, state, 0x124 + j * 4) = i;
                        break;
                    }
                }
                if (j != count)
                    continue;
            }
            FIELD(s32, state, 0x124 + count * 4) = i;
            count++;
        }
    }
    FIELD(s32, state, 0x120) = count;

    for (i = 0; i < count; i++) {
        s32 j;
        for (j = i + 1; j < count; j++) {
            s32 left = FIELD(s32, state, 0x124 + i * 4);
            s32 right = FIELD(s32, state, 0x124 + j * 4);
            if (FIELD(s8, data_020ea650 + left * 0x18, 8) >
                FIELD(s8, data_020ea650 + right * 0x18, 8)) {
                FIELD(s32, state, 0x124 + i * 4) = right;
                FIELD(s32, state, 0x124 + j * 4) = left;
            }
        }
    }

    void *list = Heap_Alloc(0x4c, data_ov020_021fe530, 4, gHeapContext);
    if (list != 0)
        list = func_ov020_021fce18(list, gDebugFont, count);
    FIELD(void *, state, 0x1dc) = list;
    for (i = 0; i < count; i++) {
        s32 entry = FIELD(s32, state, 0x124 + i * 4);
        void *row = func_ov020_021fd038(list, data_020ea650 + entry * 0x18);
        FIELD(s16, row, 8) = 0;
        FIELD(s16, row, 0xa) = i * 0x18;
    }
    func_ov020_021fd0a0(list);

    void *detail = Heap_Alloc(0x50, data_ov020_021fe538, 4, gHeapContext);
    if (detail != 0)
        detail = func_ov020_021fd320(detail, data_020f4e14);
    FIELD(void *, state, 0x1e0) = detail;
    func_ov020_021fdca4(state);
    func_ov020_021fdd88();
    FIELD(u32, state, 0x20) |= 0x400;
    func_ov020_021fd81c(state, data_ov020_021fe460[0],
                        data_ov020_021fe460[1], 0);
    return state;
}
