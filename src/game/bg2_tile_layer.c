#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement the common tile layer on main- or sub-engine BG2. The subclass
 * programs BG2CNT, transfers the 0x1000-byte circular cache, publishes wrapped
 * nine-bit scroll coordinates, and controls the BG2 enable bit in DISPCNT.
 */
typedef struct Bg2TileLayer {
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
} Bg2TileLayer;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020dea9c;
extern void *gTileLayerStateVtable;
extern void *TileLayerState_Init(void *, s32, s32, s32);
extern void *OwnedTileBuffer_Destroy(void *);
extern void func_020b4554(void *, u32);
extern void func_020b44e8(void);
extern void func_020b1b94(const void *, s32, u32);
extern void func_020b1b2c(const void *, s32, u32);
extern void OS_Halt(void);
void func_0202a8e4(Bg2TileLayer *);
void func_0202a950(s32, s32, s32, s32);
void func_0202a97c(s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/* Construct the common layer, install the BG2 vtable, configure BG2CNT, and return self. */
Bg2TileLayer *func_0202a8b4(Bg2TileLayer *self, s32 engineMode,
                            s32 characterBase, s32 screenBase)
{
    TileLayerState_Init(self, engineMode, characterBase, screenBase);
    self->vtable_0000 = (void **)data_020dea9c;
    func_0202a8e4(self);
    return self;
}

/* Configure main/sub BG2CNT from trailing parameters and reset definition base to zero. */
void func_0202a8e4(Bg2TileLayer *self)
{
    if (self->engineMode_1031 == 1)
        func_0202a950(1, 0, self->screenBase_103c,
                      self->characterBase_1038);
    else if (self->engineMode_1031 == 2)
        func_0202a97c(1, 0, self->screenBase_103c,
                      self->characterBase_1038);
    else
        return;
    self->definitionBase_1034 = 0;
}

/* Write main BG2CNT fields while preserving priority/character low bits selected by mask 0x43. */
void func_0202a950(s32 size, s32 colorMode, s32 screenBase, s32 characterBase)
{
    volatile u16 *control = (volatile u16 *)0x0400000c;
    *control = (*control & 0x43) | (u16)(size << 14) |
               (u16)(colorMode << 7) | (u16)(screenBase << 8) |
               (u16)(characterBase << 2);
}

/* Write sub BG2CNT using the same recovered field packing as func_0202a950. */
void func_0202a97c(s32 size, s32 colorMode, s32 screenBase, s32 characterBase)
{
    volatile u16 *control = (volatile u16 *)0x0400100c;
    *control = (*control & 0x43) | (u16)(size << 14) |
               (u16)(colorMode << 7) | (u16)(screenBase << 8) |
               (u16)(characterBase << 2);
}

/* Install the base-layer vtable, release its source-map buffer, and return self. */
Bg2TileLayer *func_0202a9a8(Bg2TileLayer *self)
{
    self->vtable_0000 = (void **)gTileLayerStateVtable;
    OwnedTileBuffer_Destroy((u8 *)self + 0x1008);
    return self;
}

/* Release source-map storage, free the BG2 layer, and return its old address. */
Bg2TileLayer *func_0202a9d0(Bg2TileLayer *self)
{
    self->vtable_0000 = (void **)gTileLayerStateVtable;
    OwnedTileBuffer_Destroy((u8 *)self + 0x1008);
    Heap_Free(self);
    return self;
}

/*
 * When status bit zero is set, flush and upload the 0x1000-byte cache, write
 * wrapped (pixel+offset) BG2 scroll values, and replace DISPCNT's BG2 bit with
 * the stored display mask. Unsupported engine modes perform no upload.
 */
void func_0202aa00(Bg2TileLayer *self)
{
    u8 *metadata = (u8 *)self + 0x1000;
    s32 x;
    s32 y;
    u32 packed;
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
    packed = (x & 0x1ff) | ((y & 0x1ff) << 16);
    *scroll = packed;
    *display = (*display & ~0x400u) | self->displayMask_1032;
}

/* Store 0x400 when enabled and zero when disabled for valid engine modes. */
void func_0202ab14(Bg2TileLayer *self, s32 enabled)
{
    if (self->engineMode_1031 == 1 || self->engineMode_1031 == 2)
        self->displayMask_1032 = enabled ? 0x400 : 0;
}

/* Return the stored BG2 enable bit; halt and return zero for an invalid engine mode. */
s32 func_0202ab6c(Bg2TileLayer *self)
{
    if (self->engineMode_1031 == 1 || self->engineMode_1031 == 2)
        return self->displayMask_1032 & 0x400;
    OS_Halt();
    return 0;
}
