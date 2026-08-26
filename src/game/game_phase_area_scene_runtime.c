#include "tingle/game_phase_area_scene.h"
#include "tingle/game_phase_region_table.h"
#include "tingle/heap.h"

/* Handle area-region entry effects and update the selected sub-screen renderer. */

#ifdef __cplusplus
extern "C" {
#endif
extern const char gGamePhaseAreaRegionEffectAllocationTag[];
extern void *gGamePhaseRuntime;
extern void *FourStageCommandPresentation_Init(void *self, void *renderer, s32 left, s32 top,
                           s32 right, s32 bottom);
extern void *RuntimePresentationManager_AppendFirstListEffect(void *list, void *effect);
extern void func_ov056_0220ef34(void *object, const void *state);
extern void func_ov056_0220ed9c(void *object);
#ifdef __cplusplus
}
#endif

typedef void (*AreaSceneVirtualOne)(void *self, const void *state);
typedef void (*AreaSceneVirtualNoArgs)(void *self);

/* Perform full area-scene cleanup, free self, and return its former address. */
GamePhaseAreaScene *GamePhaseAreaScene_DestroyAndFree(GamePhaseAreaScene *self)
{
    GamePhaseAreaScene_Destroy(self);
    Heap_Free(self);
    return self;
}

static s32 halfTowardZero(s16 value)
{
    return value < 0 ? -(-(s32)value / 2) : value / 2;
}

/*
 * Convert worldX/worldY from fx32 to integer coordinates and find their region.
 * A newly entered, previously unrevealed region creates a 0x24-byte effect from
 * its bounds halved toward zero, assigns recovered flags 0xdc in the 0x3fc
 * field, registers it in phase list 0x37, and stores the handle at 0x2ed4.
 * The region's reveal flag is then set and its low-five-bit index replaces
 * stateFlags bits 0-4. Re-entering the current region does nothing.
 * Returns zero; heap, phase-list, reveal flags, and object state may change.
 */
s32 GamePhaseAreaScene_UpdateRegionAtPosition(
    GamePhaseAreaScene *self, GamePhaseRegionTable *table,
    s32 worldX, s32 worldY)
{
    s32 index = GamePhaseRegionTable_FindContainingRegion(
        table, worldX >> 12, worldY >> 12);
    if (index != -1 && index != (s32)(self->stateFlags & 0x1f)) {
        GamePhaseRegion *region = GamePhaseRegionTable_GetRegion(table, index);
        if (!GamePhaseRegionTable_IsRegionRevealed(table, index) &&
            self->subRenderer) {
            void *effect = Heap_Alloc(0x24, gGamePhaseAreaRegionEffectAllocationTag, 4,
                                      &gHeapContext);
            if (effect)
                effect = FourStageCommandPresentation_Init(
                    effect, self->subRenderer,
                    halfTowardZero(region->left),
                    halfTowardZero(region->top),
                    halfTowardZero(region->right),
                    halfTowardZero(region->bottom));
            *(u32 *)((u8 *)effect + 4) =
                (*(u32 *)((u8 *)effect + 4) & ~0x3fc) | 0xdc;
            self->regionEffectHandle = RuntimePresentationManager_AppendFirstListEffect(
                (u8 *)gGamePhaseRuntime + 0x2f7c, effect);
        }
        GamePhaseRegionTable_SetRegionRevealed(table, index, 1);
        self->stateFlags =
            (self->stateFlags & ~0x1f) | (index & 0x1f);
    }
    return 0;
}

/*
 * Forward state to subRenderer virtual method 0x18 when it exists; otherwise
 * notify the overlay-owned object if present. The state is borrowed.
 */
void GamePhaseAreaScene_ApplyPlacementState(GamePhaseAreaScene *self,
                                            const void *state)
{
    if (self->subRenderer) {
        AreaSceneVirtualOne method =
            *(AreaSceneVirtualOne *)(*(u8 **)self->subRenderer + 0x18);
        method(self->subRenderer, state);
    } else if (self->overlayObject) {
        func_ov056_0220ef34(self->overlayObject, state);
    }
}

/*
 * When stateFlags bit 5 is set, invoke subRenderer virtual methods
 * 0x08 and 0x1c, update the optional overlay object at overlayObject, and clear
 * the first sub-engine BG palette color at 0x05000400.
 */
void GamePhaseAreaScene_Update(GamePhaseAreaScene *self)
{
    if (!(self->stateFlags & 0x20))
        return;
    if (self->subRenderer) {
        AreaSceneVirtualNoArgs update =
            *(AreaSceneVirtualNoArgs *)(*(u8 **)self->subRenderer + 8);
        AreaSceneVirtualNoArgs draw =
            *(AreaSceneVirtualNoArgs *)(*(u8 **)self->subRenderer + 0x1c);
        update(self->subRenderer);
        draw(self->subRenderer);
    }
    if (self->overlayObject)
        func_ov056_0220ed9c(self->overlayObject);
    *(volatile u16 *)0x05000400 = 0;
}
