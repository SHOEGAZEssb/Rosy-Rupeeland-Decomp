#include "tingle/game_phase_area_scene.h"
#include "tingle/game_phase_region_table.h"
#include "tingle/heap.h"

/* Handle area-region entry effects and update the selected sub-screen renderer. */

#ifdef __cplusplus
extern "C" {
#endif
extern const char data_020d5690[];
extern void *data_021052fc;
extern void *func_02026f38(void *self, void *renderer, s32 left, s32 top,
                           s32 right, s32 bottom);
extern void *func_0201ded4(void *list, void *effect);
extern void func_ov056_0220ef34(void *object);
extern void func_ov056_0220ed9c(void *object);
#ifdef __cplusplus
}
#endif

typedef void (*AreaSceneVirtualOne)(void *self, s32 value);
typedef void (*AreaSceneVirtualNoArgs)(void *self);

/* Perform full area-scene cleanup, free self, and return its former address. */
GamePhaseAreaScene *func_02011f98(GamePhaseAreaScene *self)
{
    func_02011f24(self);
    Heap_Free(self);
    return self;
}

static s32 halfTowardZero(s16 value)
{
    return value < 0 ? -(-(s32)value / 2) : value / 2;
}

/*
 * Convert worldX/worldY from fx32 to integer coordinates and find their region.
 * A newly entered, previously unflagged region creates a 0x24-byte effect from
 * its bounds halved toward zero, assigns recovered flags 0xdc in the 0x3fc
 * field, registers it in phase list 0x37, and stores the handle at 0x2ed4.
 * The region's GameWork flag is then set and its low-five-bit index replaces
 * rendererFlags_2ea8 bits 0-4. Re-entering the current region does nothing.
 * Returns zero; heap, phase-list, region flags, and object state may change.
 */
s32 func_02012014(GamePhaseAreaScene *self, void *tablePointer,
                   s32 worldX, s32 worldY)
{
    GamePhaseRegionTable *table = (GamePhaseRegionTable *)tablePointer;
    s32 index = GamePhaseRegionTable_FindContainingRegion(table, worldX >> 12, worldY >> 12);
    if (index != -1 && index != (s32)(self->rendererFlags_2ea8 & 0x1f)) {
        GamePhaseRegion *region = GamePhaseRegionTable_GetRegion(table, index);
        if (!GamePhaseRegionTable_IsRegionEnabled(table, index) && self->subRenderer_04) {
            void *effect = Heap_Alloc(0x24, data_020d5690, 4,
                                      &gHeapContext);
            if (effect)
                effect = func_02026f38(
                    effect, self->subRenderer_04,
                    halfTowardZero(region->left),
                    halfTowardZero(region->top),
                    halfTowardZero(region->right),
                    halfTowardZero(region->bottom));
            *(u32 *)((u8 *)effect + 4) =
                (*(u32 *)((u8 *)effect + 4) & ~0x3fc) | 0xdc;
            self->field_2ed4 = (u32)func_0201ded4(
                (u8 *)data_021052fc + 0x2f7c, effect);
        }
        GamePhaseRegionTable_SetRegionEnabled(table, index, 1);
        self->rendererFlags_2ea8 =
            (self->rendererFlags_2ea8 & ~0x1f) | (index & 0x1f);
    }
    return 0;
}

/*
 * Forward value to subRenderer_04 virtual method 0x18 when it exists;
 * otherwise forward it to the overlay-owned object at field_2ed0 if present.
 */
void func_02012150(GamePhaseAreaScene *self, s32 value)
{
    if (self->subRenderer_04) {
        AreaSceneVirtualOne method =
            *(AreaSceneVirtualOne *)(*(u8 **)self->subRenderer_04 + 0x18);
        method(self->subRenderer_04, value);
    } else if (self->field_2ed0) {
        func_ov056_0220ef34((void *)self->field_2ed0);
    }
}

/*
 * When rendererFlags_2ea8 bit 5 is set, invoke subRenderer_04 virtual methods
 * 0x08 and 0x1c, update the optional overlay object at field_2ed0, and clear
 * the first sub-engine BG palette color at 0x05000400.
 */
void func_0201218c(GamePhaseAreaScene *self)
{
    if (!(self->rendererFlags_2ea8 & 0x20))
        return;
    if (self->subRenderer_04) {
        AreaSceneVirtualNoArgs update =
            *(AreaSceneVirtualNoArgs *)(*(u8 **)self->subRenderer_04 + 8);
        AreaSceneVirtualNoArgs draw =
            *(AreaSceneVirtualNoArgs *)(*(u8 **)self->subRenderer_04 + 0x1c);
        update(self->subRenderer_04);
        draw(self->subRenderer_04);
    }
    if (self->field_2ed0)
        func_ov056_0220ed9c((void *)self->field_2ed0);
    *(volatile u16 *)0x05000400 = 0;
}
