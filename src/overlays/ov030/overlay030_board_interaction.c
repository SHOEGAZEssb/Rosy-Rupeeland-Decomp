#include "tingle/types.h"

/* Overlay 30 board reset, slot selection, timers, and collision-map queries. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_ov030_021ff708[];
extern const s32 data_ov030_021ff7cc[];
extern const s32 data_ov030_021ff820[];
extern const u8 data_ov030_021ff8c4[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void Heap_Free(void *);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *);
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
extern s32 GraphicsSpriteState_HitTestOpaquePixel(void *, s32, s32);
extern void SpriteMotionController_Hide(void *);
extern void *func_ov030_021fce00(void *);
extern void func_ov030_021fd3e8(void *);
extern void func_ov030_021fd680(void *);
#ifdef __cplusplus
}
#endif

/*
 * Replaces allocation +0x1B0 with a freshly randomized 0x24-byte seven-slot
 * record, decrements remaining value +0x1B4, clears the owner canvas, and makes
 * each slot sprite visible exactly when its randomized flag is set. It redraws
 * the seven table-defined slot rectangles, refreshes the numeric sprites, and
 * hides both control sprites. Returns void; heap ownership, canvas contents,
 * sprite flags, and controller state change through engine helpers.
 */
extern "C" void func_ov030_021fd434(void *board)
{
    if (FIELD(void *, board, 0x1b0) != 0)
        Heap_Free(FIELD(void *, board, 0x1b0));
    void *slots = Heap_Alloc(0x24, data_ov030_021ff8c4, 4, gHeapContext);
    if (slots != 0)
        slots = func_ov030_021fce00(slots);
    FIELD(void *, board, 0x1b0) = slots;
    --FIELD(s32, board, 0x1b4);
    GraphicsSpriteRenderer_ClearTextBuffer(FIELD(void *, board, 0));

    for (s32 i = 0; i < 7; ++i) {
        void *sprite = FIELD(void *, board, 0x34 + i * 4);
        u16 flags = FIELD(u16, sprite, 0x24);
        if (FIELD(u16, slots, 0xa + i * 4) != 0)
            flags &= (u16)~4;
        else
            flags |= 4;
        FIELD(u16, sprite, 0x24) = flags;
        const s16 *bounds = &data_ov030_021ff708[i * 4];
        GraphicsSpriteCanvas_FillRect(FIELD(void *, board, 0), bounds[0], bounds[1],
                      bounds[2], bounds[3], 1);
    }
    func_ov030_021fd3e8(board);
    SpriteMotionController_Hide((u8 *)board + 0x58);
    SpriteMotionController_Hide((u8 *)board + 0x104);
}

/*
 * Tests pointer coordinates (`x`, `y`) against each still-unselected slot and
 * then against 21 table-defined probe offsets using the slot sprite collision
 * helper. On a hit it marks that slot, increments the selected count and, for
 * an enabled slot, the success count, and arms one of timers +0x1D0/+0x1D8/
 * +0x1E0 according to successful or failed progress. Returns 1 once three
 * slots have been selected, otherwise 0; slot records, counts, and timer state
 * may change through engine collision/timer helpers.
 */
extern "C" s32 func_ov030_021fd520(void *board, s32 x, s32 y)
{
    s32 completed = 0;
    for (s32 slot = 0; slot < 7; ++slot) {
        void *records = FIELD(void *, board, 0x1b0);
        if (FIELD(u16, records, 8 + slot * 4) != 0)
            continue;
        const s16 *bounds = &data_ov030_021ff708[slot * 4];
        if (x < bounds[0] - 1 || x > bounds[2] + 1 ||
            y < bounds[1] - 1 || y > bounds[3] + 1)
            continue;
        void *sprite = FIELD(void *, board, 0x34 + slot * 4);
        for (s32 probe = 0; probe < 21; ++probe) {
            s32 probeX = x + data_ov030_021ff7cc[probe];
            s32 probeY = y + data_ov030_021ff820[probe] -
                         FIELD(s32, board, 0x1c4);
            if (GraphicsSpriteState_HitTestOpaquePixel(sprite, probeX, probeY) == 0)
                continue;
            records = FIELD(void *, board, 0x1b0);
            if (FIELD(s32, records, 0) < 3) {
                if (FIELD(u16, records, 0xa + slot * 4) != 0) {
                    ++FIELD(s32, records, 4);
                    func_ov030_021fd680((u8 *)board + 0x1d0);
                } else {
                    func_ov030_021fd680((u8 *)board + 0x1d8);
                }
            } else {
                func_ov030_021fd680((u8 *)board + 0x1e0);
            }
            FIELD(u16, records, 8 + slot * 4) = 1;
            ++FIELD(s32, records, 0);
            if (FIELD(s32, records, 0) == 3)
                completed = 1;
            break;
        }
    }
    return completed;
}

/*
 * Arms the timer-like pair at `timer` by copying reload word +4 to current
 * word +0 only when current is zero. Returns void; timer memory may change.
 */
extern "C" void func_ov030_021fd680(void *timer)
{
    if (FIELD(s32, timer, 0) == 0)
        FIELD(s32, timer, 0) = FIELD(s32, timer, 4);
}

/*
 * Copies words +4 and +8 from `source` to `destination` unless both pointers
 * are identical. Returns void; destination coordinate/state words may change.
 */
extern "C" void func_ov030_021fd694(void *destination, const void *source)
{
    if (destination != source) {
        FIELD(s32, destination, 4) = FIELD(s32, source, 4);
        FIELD(s32, destination, 8) = FIELD(s32, source, 8);
    }
}

/*
 * Queries the packed collision map at board +0x1CC for screen coordinate
 * (`x`, `y`). Coordinates outside 256x192 return zero. In-bounds coordinates
 * select a 64x64 macro-tile, an 8x8 cell, and one of eight 4-bit nibbles in a
 * row word. Returns that nibble; no state or hardware changes occur. The exact
 * storage layout is established by the address arithmetic, while nibble meaning
 * is not yet identified.
 */
extern "C" u32 func_ov030_021fd6ac(void *board, s32 x, s32 y)
{
    if (x < 0 || x >= 0x100 || y < 0 || y >= 0xc0)
        return 0;
    s32 macro = (x >> 6) + (y >> 6) * 4;
    s32 cell = (y & 0x38) + ((x & 0x3f) >> 3);
    const u8 *map = FIELD(const u8 *, board, 0x1cc);
    const u32 *row = (const u32 *)(map + (cell + macro * 0x40) * 0x20);
    return (row[y & 7] >> ((x & 7) * 4)) & 0xf;
}
