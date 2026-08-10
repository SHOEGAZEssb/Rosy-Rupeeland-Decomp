#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement the color-mode-one BG3 tile-layer variant. It selects BG3CNT,
 * BG3 cache-transfer/scroll paths, and DISPCNT mask 0x800 while sharing the
 * common 0x1040-byte layer layout.
 */
typedef struct Bg3ExtendedTileLayer {
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
} Bg3ExtendedTileLayer;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020deabc;
extern void *gTileLayerStateVtable;
extern void *TileLayerState_Init(void *, s32, s32, s32);
extern void *OwnedTileBuffer_Destroy(void *);
extern void func_0202ac4c(s32, s32, s32, s32);
extern void func_0202ac78(s32, s32, s32, s32);
extern void func_020b4554(void *, u32);
extern void func_020b44e8(void);
extern void func_020b1ac4(const void *, s32, u32);
extern void func_020b1a5c(const void *, s32, u32);
extern void OS_Halt(void);
void func_0202b164(Bg3ExtendedTileLayer *);
#ifdef __cplusplus
}
#endif

/* Construct the common layer, install this variant's vtable, configure BG3CNT, and return self. */
Bg3ExtendedTileLayer *func_0202b134(Bg3ExtendedTileLayer *self,
                                    s32 engineMode, s32 characterBase,
                                    s32 screenBase)
{
    TileLayerState_Init(self, engineMode, characterBase, screenBase);
    self->vtable_0000 = (void **)data_020deabc;
    func_0202b164(self);
    return self;
}

/* Configure main/sub BG3CNT with size one, color mode one, and trailing bases. */
void func_0202b164(Bg3ExtendedTileLayer *self)
{
    if (self->engineMode_1031 == 1)
        func_0202ac4c(1, 1, self->screenBase_103c,
                      self->characterBase_1038);
    else if (self->engineMode_1031 == 2)
        func_0202ac78(1, 1, self->screenBase_103c,
                      self->characterBase_1038);
}

/* Install the common base vtable, release source-map storage, and return self. */
Bg3ExtendedTileLayer *func_0202b1b4(Bg3ExtendedTileLayer *self)
{
    self->vtable_0000 = (void **)gTileLayerStateVtable;
    OwnedTileBuffer_Destroy((u8 *)self + 0x1008);
    return self;
}

/* Release source-map storage, free self, and return its old address. */
Bg3ExtendedTileLayer *func_0202b1dc(Bg3ExtendedTileLayer *self)
{
    self->vtable_0000 = (void **)gTileLayerStateVtable;
    OwnedTileBuffer_Destroy((u8 *)self + 0x1008);
    Heap_Free(self);
    return self;
}

/* Flush/upload the cache through BG3, write wrapped scroll, and apply DISPCNT bit 0x800. */
void func_0202b20c(Bg3ExtendedTileLayer *self)
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
        func_020b1ac4(self->cache_0004, 0, 0x1000);
        scroll = (volatile u32 *)0x0400001c;
        display = (volatile u32 *)0x04000000;
    } else if (self->engineMode_1031 == 2) {
        func_020b1a5c(self->cache_0004, 0, 0x1000);
        scroll = (volatile u32 *)0x0400101c;
        display = (volatile u32 *)0x04001000;
    } else {
        return;
    }
    x = *(s32 *)(metadata + 0x18) + *(s32 *)(metadata + 0x20);
    y = *(s32 *)(metadata + 0x1c) + *(s32 *)(metadata + 0x24);
    *scroll = (x & 0x1ff) | ((y & 0x1ff) << 16);
    *display = (*display & ~0x800u) | self->displayMask_1032;
}

/* Store 0x800 when enabled and zero when disabled for either valid engine. */
void func_0202b320(Bg3ExtendedTileLayer *self, s32 enabled)
{
    if (self->engineMode_1031 == 1 || self->engineMode_1031 == 2)
        self->displayMask_1032 = enabled ? 0x800 : 0;
}

/* Return the BG3 mask; invalid engine modes halt and return zero. */
s32 func_0202b378(Bg3ExtendedTileLayer *self)
{
    if (self->engineMode_1031 == 1 || self->engineMode_1031 == 2)
        return self->displayMask_1032 & 0x800;
    OS_Halt();
    return 0;
}
