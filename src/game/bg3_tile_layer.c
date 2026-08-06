#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Implement the common tile layer on main- or sub-engine BG3. This is the BG3
 * sibling of the recovered BG2 class: it uses BG3CNT, BG3 map-transfer paths,
 * BG3 scroll registers, and DISPCNT bit 0x800.
 */
typedef struct Bg3TileLayer {
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
} Bg3TileLayer;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020deafc;
extern void *data_020deb1c;
extern void *func_02029e90(void *, s32, s32, s32);
extern void *func_02029e44(void *);
extern void func_020b4554(void *, u32);
extern void func_020b44e8(void);
extern void func_020b1ac4(const void *, s32, u32);
extern void func_020b1a5c(const void *, s32, u32);
extern void OS_Halt(void);
void func_0202abe0(Bg3TileLayer *);
void func_0202ac4c(s32, s32, s32, s32);
void func_0202ac78(s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/* Construct the common layer, install the BG3 vtable, configure BG3CNT, and return self. */
Bg3TileLayer *func_0202abb0(Bg3TileLayer *self, s32 engineMode,
                            s32 characterBase, s32 screenBase)
{
    func_02029e90(self, engineMode, characterBase, screenBase);
    self->vtable_0000 = (void **)data_020deafc;
    func_0202abe0(self);
    return self;
}

/* Configure main/sub BG3CNT from trailing parameters and reset definition base to zero. */
void func_0202abe0(Bg3TileLayer *self)
{
    if (self->engineMode_1031 == 1)
        func_0202ac4c(1, 0, self->screenBase_103c,
                      self->characterBase_1038);
    else if (self->engineMode_1031 == 2)
        func_0202ac78(1, 0, self->screenBase_103c,
                      self->characterBase_1038);
    else
        return;
    self->definitionBase_1034 = 0;
}

/* Pack the recovered size/color/screen/character fields into main BG3CNT. */
void func_0202ac4c(s32 size, s32 colorMode, s32 screenBase, s32 characterBase)
{
    volatile u16 *control = (volatile u16 *)0x0400000e;
    *control = (*control & 0x43) | (u16)(size << 14) |
               (u16)(colorMode << 7) | (u16)(screenBase << 8) |
               (u16)(characterBase << 2);
}

/* Pack the same recovered fields into sub BG3CNT. */
void func_0202ac78(s32 size, s32 colorMode, s32 screenBase, s32 characterBase)
{
    volatile u16 *control = (volatile u16 *)0x0400100e;
    *control = (*control & 0x43) | (u16)(size << 14) |
               (u16)(colorMode << 7) | (u16)(screenBase << 8) |
               (u16)(characterBase << 2);
}

/* Install the base-layer vtable, release its source-map buffer, and return self. */
Bg3TileLayer *func_0202aca4(Bg3TileLayer *self)
{
    self->vtable_0000 = (void **)data_020deb1c;
    func_02029e44((u8 *)self + 0x1008);
    return self;
}

/* Release source-map storage, free the BG3 layer, and return its old address. */
Bg3TileLayer *func_0202accc(Bg3TileLayer *self)
{
    self->vtable_0000 = (void **)data_020deb1c;
    func_02029e44((u8 *)self + 0x1008);
    Heap_Free(self);
    return self;
}

/*
 * When status bit zero is set, flush/upload the circular cache through the BG3
 * transfer path, write wrapped scroll coordinates, and replace DISPCNT's BG3
 * enable bit with the stored mask.
 */
void func_0202acfc(Bg3TileLayer *self)
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

/* Store 0x800 when enabled and zero when disabled for valid engine modes. */
void func_0202ae10(Bg3TileLayer *self, s32 enabled)
{
    if (self->engineMode_1031 == 1 || self->engineMode_1031 == 2)
        self->displayMask_1032 = enabled ? 0x800 : 0;
}

/* Return the stored BG3 enable bit; halt and return zero for an invalid engine mode. */
s32 func_0202ae68(Bg3TileLayer *self)
{
    if (self->engineMode_1031 == 1 || self->engineMode_1031 == 2)
        return self->displayMask_1032 & 0x800;
    OS_Halt();
    return 0;
}
