#include "tingle/game_phase_state.h"
#include "tingle/game_work.h"

/* Drive, query, reset, and reconfigure an active loaded phase object. */

#ifdef __cplusplus
extern "C" {
#endif
extern void DebugText_BeginFrame(void);
extern void *GamePhaseVisualEffect_Update(void *object);
extern void GamePhaseVisualEffect_PrepareBackground(void *object);
extern void GamePhaseRegionTable_Destroy(void *object);
extern void RuntimePresentationManager_DispatchVBlankCallbacks(void *manager);
extern void RuntimePresentationManager_DispatchHBlankCallbacks(
    void *manager, u16 vcount);
extern void RuntimePresentationManager_DestroyAllEffects(void *object);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(void *object);
extern s32 ByteTileMapOwner_GetCell(void *object, s32 x, s32 y);
extern void ActorCollectionActivation_DestroyReservedSlot(void *object);
extern void ActorDerivedType1_ClearFailureCounter(void *object);
extern void ActorFeedback_DestroyPresentations(void);
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
    return *(void **)(*(u8 **)self->phaseObject + offset);
}

/*
 * If renderFlags bit 1 is set, update the render helper, forward virtual method
 * 0x1c to phaseObject when present, and update helper_2eb4. No value is
 * returned.
 */
void GamePhaseState_UpdateRenderHelpers(GamePhaseState *self)
{
    if (!(self->renderFlags & 2))
        return;
    RuntimePresentationManager_DispatchVBlankCallbacks(self->renderHelperStorage);
    if (self->phaseObject)
        ((PhaseVirtualMethod)phaseVirtual(self, 0x1c))(self->phaseObject);
    GamePhaseVisualEffect_Update(self->helper_2eb4);
}

/* Forward VCOUNT to the render helper at offset 0x2f58. */
void GamePhaseState_ForwardVCount(GamePhaseState *self, u16 vcount)
{
    RuntimePresentationManager_DispatchHBlankCallbacks(self->renderHelperStorage, vcount);
}

/*
 * Reset phase-local GameWork fields and all graphics/runtime helpers, tell the
 * active object to disable itself through virtual method 0x24, destroy it,
 * reset the field-0x0004 and field-0x2e80 systems, and begin a debug-text frame.
 */
void GamePhaseState_ResetActivePhase(GamePhaseState *self)
{
    u8 *work = (u8 *)gGameWork;
    *(u16 *)(work + 0x228) = 0;
    GameWork_SetFlag(gGameWork, 0x3ec);
    *(u16 *)(work + 0x20c) = 0;
    *(u16 *)(work + 0x20e) = 0;
    GamePhaseRegionTable_Destroy(self->helper_2f80);
    RuntimePresentationManager_DestroyAllEffects(self->renderHelperStorage);
    RuntimePresentationManager_GetGraphics3dPresentation(self->renderHelperStorage);
    func_020a2324();
    ActorFeedback_DestroyPresentations();
    ((PhaseVirtualValueMethod)phaseVirtual(self, 0x24))(self->phaseObject, 0);
    if (self->phaseObject)
        ((PhaseVirtualMethod)phaseVirtual(self, 4))(self->phaseObject);
    ActorCollectionActivation_DestroyReservedSlot(self->actorCollectionStorage);
    ActorDerivedType1_ClearFailureCounter(self->actorCollectionStorage + 0x2e7c);
    DebugText_BeginFrame();
}

/* Return the currently retained phase configuration pointer. */
void *GamePhaseState_GetConfiguration(GamePhaseState *self)
{
    return self->configuration;
}

/*
 * Query the owned phase object's square grid when x/y are nonnegative and
 * below the low/high 16-bit dimensions stored in its field 0x20. Returns the
 * terrain height or zero for out-of-range coordinates.
 */
s32 GamePhaseState_QueryTerrainHeight(GamePhaseState *self, s32 x, s32 y)
{
    u32 dimensions;
    if (x < 0 || y < 0)
        return 0;
    dimensions = *(u32 *)((u8 *)self->phaseObject + 0x20);
    if (x >= (s32)(dimensions & 0xffff) || y >= (s32)(dimensions >> 16))
        return 0;
    return ByteTileMapOwner_GetCell(self->phaseObject, x, y);
}

/*
 * Restore BG/graphics mode from configuration flag bit 23, clear DISPCNT
 * display-plane bits, select the 3D render helper only when requested, invoke
 * owned virtual methods 0x34/0x20/0x1c, and refresh helper_2eb4 when field_12
 * is nonnegative.
 */
void GamePhaseState_ConfigureMainDisplay(GamePhaseState *self, s32 use3dMode)
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
    render = RuntimePresentationManager_GetGraphics3dPresentation(self->renderHelperStorage);
    if ((s32)(*(u32 *)(config + 0x40) << 8) < 0 && use3dMode)
        func_020a23a8(render, 1, 1);
    else
        func_020a2348(render, 1, 0);
    ((PhaseVirtualValueMethod)phaseVirtual(self, 0x34))(self->phaseObject, 1);
    ((PhaseVirtualValueMethod)phaseVirtual(self, 0x20))(self->phaseObject, 1);
    ((PhaseVirtualMethod)phaseVirtual(self, 0x1c))(self->phaseObject);
    if (*(s16 *)(config + 0x12) >= 0)
        GamePhaseVisualEffect_PrepareBackground(self->helper_2eb4);
}
