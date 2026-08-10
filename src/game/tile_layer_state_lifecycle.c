#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Construct and reset the common 0x1040-byte tile-layer implementation used by
 * the dual-layer renderer. The first 0x1000 bytes after its vtable are a tile
 * cache; offset 0x1008 owns a separately allocated buffer, and the final 0x3c
 * bytes hold dimensions, offsets, flags, and two constructor parameters.
 */
typedef struct TileLayerState {
    void **vtable_0000;
    u8 cache_0004[0x1000];
    u8 flags_1004;
    u8 flags_1005;
    u8 field_1006[2];
    void *ownedBytes_1008;
    u32 ownedCount_100c;
    u32 field_1010;
    u32 field_1014;
    u32 field_1018;
    u32 field_101c;
    u32 field_1020;
    u32 field_1024;
    s16 offsetX_1028;
    s16 offsetY_102a;
    u16 width_102c;
    u16 height_102e;
    u8 status_1030;
    u8 mode_1031;
    u16 field_1032;
    u16 field_1034;
    u8 field_1036[2];
    s32 parameter0_1038;
    s32 parameter1_103c;
} TileLayerState;

typedef char TileLayerStateSizeCheck[sizeof(TileLayerState) == 0x1040 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif
extern void *gTileLayerStateVtable;
extern void MIi_CpuClearFast(void *, u32, u32);
extern void *OwnedTileBuffer_Destroy(void *);
void TileLayerState_Reset(TileLayerState *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Install the base vtable, clear the owned-buffer pointer/count, reset all
 * cache/metadata through TileLayerState_Reset, store the two trailing parameters,
 * and return self.
 */
TileLayerState *TileLayerState_Init(TileLayerState *self, s32 mode,
                              s32 parameter0, s32 parameter1)
{
    self->vtable_0000 = (void **)gTileLayerStateVtable;
    self->ownedBytes_1008 = 0;
    self->ownedCount_100c = 0;
    TileLayerState_Reset(self, mode);
    self->parameter0_1038 = parameter0;
    self->parameter1_103c = parameter1;
    return self;
}

/* Install the base vtable, release offset-0x1008 storage, and return self. */
TileLayerState *TileLayerState_DestroyComplete(TileLayerState *self)
{
    self->vtable_0000 = (void **)gTileLayerStateVtable;
    OwnedTileBuffer_Destroy(&self->ownedBytes_1008);
    return self;
}

/* Release owned storage, free the layer, and return its old address. */
TileLayerState *TileLayerState_DestroyAndFree(TileLayerState *self)
{
    self->vtable_0000 = (void **)gTileLayerStateVtable;
    OwnedTileBuffer_Destroy(&self->ownedBytes_1008);
    Heap_Free(self);
    return self;
}

/*
 * Preserve the supplied mode at 0x1031, clear exactly 0x1000 bytes beginning
 * at offset four, reset all recovered metadata fields, and set status bit zero.
 */
void TileLayerState_Reset(TileLayerState *self, s32 mode)
{
    self->mode_1031 = (u8)mode;
    MIi_CpuClearFast(self->cache_0004, 0, 0x1000);
    self->flags_1004 &= (u8)~0x1f;
    self->flags_1005 &= (u8)~0x0f;
    self->field_1010 = 0;
    self->field_1018 = 0;
    self->field_101c = 0;
    self->field_1020 = 0;
    self->field_1024 = 0;
    self->offsetX_1028 = 0;
    self->offsetY_102a = 0;
    self->width_102c = 0;
    self->height_102e = 0;
    self->field_1014 = 0;
    self->status_1030 = 0;
    self->field_1032 = 0;
    self->field_1034 = 0;
    self->status_1030 |= 1;
}
