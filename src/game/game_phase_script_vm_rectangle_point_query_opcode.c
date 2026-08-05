#include "tingle/game_phase_script_vm.h"

/* Test a script-provided point against a script-provided signed rectangle. */

typedef struct RectS32 {
    s32 left;
    s32 top;
    s32 right;
    s32 bottom;
} RectS32;

#ifdef __cplusplus
extern "C" {
#endif
extern RectS32 *func_02016f14(RectS32 *result, s32 left, s32 top, s32 right,
                             s32 bottom);
extern s32 func_02016f28(const RectS32 *rect, s32 x, s32 y);
#ifdef __cplusplus
}
#endif

/*
 * Pop rectangle bottom/right/top/left followed by point Y/X, construct the
 * signed half-open rectangle, push whether the point lies inside, and return
 * zero.  The helper pair defines the recovered boundary behavior.
 */
s32 func_0201add4(GamePhaseActorScriptVm *self)
{
    s32 bottom = (s32)func_02012704(&self->base);
    s32 right = (s32)func_02012704(&self->base);
    s32 top = (s32)func_02012704(&self->base);
    s32 left = (s32)func_02012704(&self->base);
    s32 y = (s32)func_02012704(&self->base);
    s32 x = (s32)func_02012704(&self->base);
    RectS32 rect;

    func_02016f14(&rect, left, top, right, bottom);
    func_020127f8(&self->base, (u32)func_02016f28(&rect, x, y));
    return 0;
}
