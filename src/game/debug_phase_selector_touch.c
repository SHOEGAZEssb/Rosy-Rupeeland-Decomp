#include "tingle/debug_phase_selector.h"

/* Convert touch coordinates into phase-grid selection and restore sub BG2. */

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020befec(s32 dividend, s32 divisor);
#ifdef __cplusplus
}
#endif

/*
 * If point lies inside x=[9,249), y=[6,186), convert it to a 24-pixel column
 * and 20-pixel row, store both, and compute selectedPhase as page*90+row*10+
 * column. Always returns 0. Only selector state changes; division is delegated
 * to the recovered signed helper and no hardware is accessed.
 */
s32 func_0200c5b4(DebugPhaseSelector *self, const TouchPoint *point)
{
    if (point->y < 0xba && point->y >= 6 &&
        point->x >= 9 && point->x < 0xf9) {
        self->column = func_020befec((s32)point->x - 9, 24);
        self->row = func_020befec((s32)point->y - 6, 20);
        self->selectedPhase = self->grid.pageIndex * 90 +
                              self->row * 10 + self->column;
    }
    return 0;
}
