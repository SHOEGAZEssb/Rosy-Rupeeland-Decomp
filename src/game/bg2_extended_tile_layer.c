#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement the color-mode-one BG2 tile-layer variant. It shares the common
 * 32x16 cache and BG2 transfer/scroll/display paths, but configures BG2CNT with
 * color bit one and retains the definition-base value established elsewhere.
 */
typedef struct Bg2ExtendedTileLayer {
    void **vtable_0000;
    u8 cache_0004[0x1000];
    u8 metadata_1004[0x2c];
    u8 status_1030;
    u8 engineMode_1031;
    u16 displayMask_1032;
    u16 definitionBase_1034;
    u8 field_1036[2];
    s32 characterBase_1038;
    s32 screenBase_103c;
} Bg2ExtendedTileLayer;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gBg2ExtendedTileLayerVtable;
extern void *gTileLayerStateVtable;
extern void *TileLayerState_Init(void *, s32, s32, s32);
extern void *OwnedTileBuffer_Destroy(void *);
extern void Bg2TileLayer_SetMainControl(s32, s32, s32, s32);
extern void Bg2TileLayer_SetSubControl(s32, s32, s32, s32);
extern void func_020b4554(void *, u32);
extern void func_020b44e8(void);
extern void func_020b1b94(const void *, s32, u32);
extern void func_020b1b2c(const void *, s32, u32);
extern void OS_Halt(void);
void Bg2ExtendedTileLayer_ConfigureControl(Bg2ExtendedTileLayer *);
/* Construct the common layer, install this variant's vtable, configure BG2CNT, and return self. */
Bg2ExtendedTileLayer *Bg2ExtendedTileLayer_Init(Bg2ExtendedTileLayer *self,
                                    s32 engineMode, s32 characterBase,
                                    s32 screenBase)
{
    TileLayerState_Init(self, engineMode, characterBase, screenBase);
    self->vtable_0000 = (void **)gBg2ExtendedTileLayerVtable;
    Bg2ExtendedTileLayer_ConfigureControl(self);
    return self;
}

/* Configure main/sub BG2CNT with size one, color mode one, and trailing bases. */
void Bg2ExtendedTileLayer_ConfigureControl(Bg2ExtendedTileLayer *self)
{
    if (self->engineMode_1031 == 1)
        Bg2TileLayer_SetMainControl(1, 1, self->screenBase_103c,
                      self->characterBase_1038);
    else if (self->engineMode_1031 == 2)
        Bg2TileLayer_SetSubControl(1, 1, self->screenBase_103c,
                      self->characterBase_1038);
}

/* Install the common base vtable, release source-map storage, and return self. */
Bg2ExtendedTileLayer *Bg2ExtendedTileLayer_DestroyComplete(Bg2ExtendedTileLayer *self)
{
    self->vtable_0000 = (void **)gTileLayerStateVtable;
    OwnedTileBuffer_Destroy((u8 *)self + 0x1008);
    return self;
}

/* Release source-map storage, free self, and return its old address. */
Bg2ExtendedTileLayer *Bg2ExtendedTileLayer_DestroyAndFree(Bg2ExtendedTileLayer *self)
{
    self->vtable_0000 = (void **)gTileLayerStateVtable;
    OwnedTileBuffer_Destroy((u8 *)self + 0x1008);
    Heap_Free(self);
    return self;
}

/* Flush/upload the cache through BG2, write wrapped scroll, and apply DISPCNT bit 0x400. */
void Bg2ExtendedTileLayer_UpdateHardware(Bg2ExtendedTileLayer *self)
{
    u8 *metadata = (u8 *)self + 0x1000;
    s32 x;
    s32 y;
    volatile u32 *scroll;
    volatile u32 *display;
    if (!(self->status_1030 & 1))
        return;
    func_020b4554(self->cache_0004, 0x1000);
    func_020b44e8();
    if (self->engineMode_1031 == 1) {
        func_020b1b94(self->cache_0004, 0, 0x1000);
        scroll = (volatile u32 *)0x04000018;
        display = (volatile u32 *)0x04000000;
    } else if (self->engineMode_1031 == 2) {
        func_020b1b2c(self->cache_0004, 0, 0x1000);
        scroll = (volatile u32 *)0x04001018;
        display = (volatile u32 *)0x04001000;
    } else {
        return;
    }
    x = *(s32 *)(metadata + 0x18) + *(s32 *)(metadata + 0x20);
    y = *(s32 *)(metadata + 0x1c) + *(s32 *)(metadata + 0x24);
    *scroll = (x & 0x1ff) | ((y & 0x1ff) << 16);
    *display = (*display & ~0x400u) | self->displayMask_1032;
}

/* Store 0x400 when enabled and zero when disabled for either valid engine. */
void Bg2ExtendedTileLayer_SetVisible(Bg2ExtendedTileLayer *self, s32 enabled)
{
    if (self->engineMode_1031 == 1 || self->engineMode_1031 == 2)
        self->displayMask_1032 = enabled ? 0x400 : 0;
}

/* Return the BG2 mask; invalid engine modes halt and return zero. */
s32 Bg2ExtendedTileLayer_IsVisible(Bg2ExtendedTileLayer *self)
{
    if (self->engineMode_1031 == 1 || self->engineMode_1031 == 2)
        return self->displayMask_1032 & 0x400;
    OS_Halt();
    return 0;
}

#ifdef __cplusplus
}
#endif
