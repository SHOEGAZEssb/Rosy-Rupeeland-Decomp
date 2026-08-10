#include "tingle/game_phase_state.h"
#include "tingle/game_work.h"

/* Drive, query, reset, and reconfigure an active loaded phase object. */

#ifdef __cplusplus
extern "C" {
#endif
extern void DebugText_BeginFrame(void);
extern void *func_0200fc64(void *object);
extern void func_020100ac(void *object);
extern void func_0201155c(void *object);
extern void func_0201de4c(void *object);
extern void func_0201de8c(void *object, u16 vcount);
extern void *func_0201e0ec(void *object);
extern void *func_0202baec(void *object, s32 x, s32 y);
extern void func_0202d3cc(void *object);
extern void func_02039ba0(void *object);
extern void func_0203abb0(void);
extern void func_020a2324(void);
extern void func_020a2348(void *object, s32 a, s32 b);
extern void func_020a23a8(void *object, s32 a, s32 b);
extern void func_020ae9a4(GamePhaseState *self);
extern void GX_SetBankForBG(s32 bank);
extern void GX_SetGraphicsMode(s32 displayMode, s32 bgMode, s32 bg0As3D);
#ifdef __cplusplus
}
#endif

typedef void (*PhaseVirtualMethod)(void *self);
typedef void (*PhaseVirtualValueMethod)(void *self, s32 value);

static void *phaseVirtual(GamePhaseState *self, u32 offset)
{
    return *(void **)(*(u8 **)self->owned_2eb0 + offset);
}

/*
 * If flags_2f7c bit 1 is set, update the render helper, forward virtual method
 * 0x1c to owned_2eb0 when present, and update helper_2eb4. No value is returned.
 */
void GamePhaseState_UpdateRenderHelpers(GamePhaseState *self)
{
    if (!(self->flags_2f7c & 2))
        return;
    func_0201de4c(self->helper_2f58);
    if (self->owned_2eb0)
        ((PhaseVirtualMethod)phaseVirtual(self, 0x1c))(self->owned_2eb0);
    func_0200fc64(self->helper_2eb4);
}

/* Forward VCOUNT to the render helper at offset 0x2f58. */
void GamePhaseState_ForwardVCount(GamePhaseState *self, u16 vcount)
{
    func_0201de8c(self->helper_2f58, vcount);
}

/*
 * Reset phase-local GameWork fields and all graphics/runtime helpers, tell the
 * active object to disable itself through virtual method 0x24, destroy it,
 * reset the field-0x0004 and field-0x2e80 systems, and begin a debug-text frame.
 */
void func_0200ea48(GamePhaseState *self)
{
    u8 *work = (u8 *)gGameWork;
    *(u16 *)(work + 0x228) = 0;
    GameWork_SetFlag(gGameWork, 0x3ec);
    *(u16 *)(work + 0x20c) = 0;
    *(u16 *)(work + 0x20e) = 0;
    func_0201155c(self->helper_2f80);
    func_0201df64(self->helper_2f58);
    func_0201e0ec(self->helper_2f58);
    func_020a2324();
    func_0203abb0();
    ((PhaseVirtualValueMethod)phaseVirtual(self, 0x24))(self->owned_2eb0, 0);
    if (self->owned_2eb0)
        ((PhaseVirtualMethod)phaseVirtual(self, 4))(self->owned_2eb0);
    func_0202d3cc(self->storage_0004);
    func_02039ba0(self->storage_0004 + 0x2e7c);
    DebugText_BeginFrame();
}

/* Return the currently retained phase configuration pointer. */
void *func_0200eb0c(GamePhaseState *self)
{
    return self->configuration;
}

/*
 * Query the owned phase object's square grid when x/y are nonnegative and
 * below the low/high 16-bit dimensions stored in its field 0x20. Returns the
 * query result or null for out-of-range coordinates.
 */
void *func_0200eb14(GamePhaseState *self, s32 x, s32 y)
{
    u32 dimensions;
    if (x < 0 || y < 0)
        return 0;
    dimensions = *(u32 *)((u8 *)self->owned_2eb0 + 0x20);
    if (x >= (s32)(dimensions & 0xffff) || y >= (s32)(dimensions >> 16))
        return 0;
    return func_0202baec(self->owned_2eb0, x, y);
}

/*
 * Restore BG/graphics mode from configuration flag bit 23, clear DISPCNT
 * display-plane bits, select the 3D render helper only when requested, invoke
 * owned virtual methods 0x34/0x20/0x1c, and refresh helper_2eb4 when field_12
 * is nonnegative.
 */
void func_0200eb58(GamePhaseState *self, s32 use3dMode)
{
    const u8 *config = (const u8 *)self->configuration;
    void *render;
    func_020ae9a4(self);
    if ((s32)(*(u32 *)(config + 0x40) << 8) < 0) {
        GX_SetBankForBG(0x10);
        GX_SetGraphicsMode(6, 0, 1);
    } else {
        GX_SetBankForBG(2);
        GX_SetGraphicsMode(1, 0, 0);
    }
    *(volatile u32 *)0x04000000 &= ~0x38000000;
    render = func_0201e0ec(self->helper_2f58);
    if ((s32)(*(u32 *)(config + 0x40) << 8) < 0 && use3dMode)
        func_020a23a8(render, 1, 1);
    else
        func_020a2348(render, 1, 0);
    ((PhaseVirtualValueMethod)phaseVirtual(self, 0x34))(self->owned_2eb0, 1);
    ((PhaseVirtualValueMethod)phaseVirtual(self, 0x20))(self->owned_2eb0, 1);
    ((PhaseVirtualMethod)phaseVirtual(self, 0x1c))(self->owned_2eb0);
    if (*(s16 *)(config + 0x12) >= 0)
        func_020100ac(self->helper_2eb4);
}
