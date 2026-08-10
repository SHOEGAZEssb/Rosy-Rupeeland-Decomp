#include "tingle/types.h"

/* Overlay 30 pointer-path rasterization, collision probing, and slot selection. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov030_021ff7cc[];
extern const s32 data_ov030_021ff820[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
extern u32 func_ov030_021fd6ac(void *, s32, s32);
extern void func_ov030_021fd680(void *);
extern void func_ov030_021fd694(void *, const void *);
extern s32 func_ov030_021fd520(void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Walks a Bresenham-style integer line from saved board position +0x1BC/
 * +0x1C0 to coordinate record `target` (+4/+8), incorporating vertical scroll
 * +0x1C4. At every point it probes 21 offsets in the packed collision map,
 * arms timer +0x1E8 on contact, stamps a five-pixel cross into canvas +0, and
 * asks the slot hit tester to select a slot. If three slots become selected it
 * saves the stopping point and returns early; otherwise it copies `target` into
 * embedded record +0x1B8 after reaching the endpoint. Returns void; canvas,
 * selection, timers, and saved pointer state can change through engine helpers.
 */
extern "C" void func_ov030_021fd720(void *board, const void *target)
{
    s32 x = FIELD(s32, board, 0x1bc);
    s32 scroll = FIELD(s32, board, 0x1c4);
    s32 y = FIELD(s32, board, 0x1c0) + scroll;
    s32 targetX = FIELD(s32, target, 4);
    s32 targetY = FIELD(s32, target, 8) + scroll;
    s32 dx = targetX - x;
    s32 dy = targetY - y;
    s32 stepX = 1;
    s32 stepY = 1;
    if (dx < 0) {
        dx = -dx;
        stepX = -1;
    }
    if (dy < 0) {
        dy = -dy;
        stepY = -1;
    }

    s32 major = dx > dy ? dx : dy;
    s32 error = -major;
    for (s32 count = 0; count <= major; ++count) {
        u32 collision = 0;
        for (s32 probe = 0; probe < 21 && collision == 0; ++probe)
            collision += func_ov030_021fd6ac(
                board, x + data_ov030_021ff7cc[probe],
                y + data_ov030_021ff820[probe]);
        if (collision != 0)
            func_ov030_021fd680((u8 *)board + 0x1e8);

        GraphicsSpriteCanvas_FillRect(FIELD(void *, board, 0), x - 1, y - 2,
                      x + 1, y - 2, 0);
        GraphicsSpriteCanvas_FillRect(FIELD(void *, board, 0), x - 2, y - 1,
                      x + 2, y + 1, 0);
        GraphicsSpriteCanvas_FillRect(FIELD(void *, board, 0), x - 1, y + 2,
                      x + 1, y + 2, 0);
        if (func_ov030_021fd520(board, x, y) != 0) {
            FIELD(s32, board, 0x1bc) = x;
            FIELD(s32, board, 0x1c0) = y - scroll;
            return;
        }

        if (dx > dy) {
            x += stepX;
            error += dy * 2;
            if (error >= 0) {
                error -= dx * 2;
                y += stepY;
            }
        } else {
            y += stepY;
            error += dx * 2;
            if (error >= 0) {
                error -= dy * 2;
                x += stepX;
            }
        }
    }
    func_ov030_021fd694((u8 *)board + 0x1b8, target);
}
