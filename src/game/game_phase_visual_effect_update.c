#include "tingle/game_phase_visual_effect.h"

/* Update BG1 placement and the randomized phase visual effect each frame. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void func_02010110(GamePhaseVisualEffect *self);
extern u32 func_020af958(void);
extern void func_020b581c(u32 random, s32 value, s32 scale);
#ifdef __cplusplus
}
#endif

/*
 * If resources are loaded, flags_94 bit 0 controls whether BG1 is enabled.
 * On first enable (bit 1), apply resource mode 1/0x1e0 and update BG1 priority.
 * Copy vector offsets 0x34/0x38 into BG1OFS, update the effect helper, and—when
 * runtime flag 0x30cc bit 2 is clear and fields 0x18/0x98 permit it—cycle four
 * signed nibble offsets on per-entry timers and dispatch a randomized effect.
 * Hardware effects touch DISPCNT, BG1CNT, and BG1OFS.
 */
void func_0200fc64(GamePhaseVisualEffect *self)
{
    volatile u32 *display = (volatile u32 *)0x04000000;
    if (self->resources.resource0 == 0)
        return;
    if (self->flags_94 & 1) {
        u32 planes = (*display & 0x1f00) >> 8;
        *display = (*display & ~0x1f00) | ((planes | 2) << 8);
        if (self->flags_94 & 2) {
            volatile u16 *bg1cnt = (volatile u16 *)0x0400000a;
            self->flags_94 &= ~2;
            if (self->resources.resource0)
                func_02072048(&self->resources, 1, 0x1e0);
            *bg1cnt = (u16)((*bg1cnt & ~3) | ((self->flags_94 >> 4) & 0xf));
        }
        *(volatile u32 *)0x04000014 =
            (((u32)(self->vectors[1].value.y >> 12) & 0x1ff) << 16) |
            ((u32)(self->vectors[1].value.x >> 12) & 0x1ff);
        func_02010110(self);
        if (*((u8 *)data_021052fc + 0x30cc) & 4)
            return;
        if (!self->field_18 || !self->field_98)
            return;
        if (--self->field_14 >= 0)
            return;
        {
            s16 *values = &self->field_9c;
            s16 packed = values[(u32)self->field_10];
            s32 base = *(s32 *)((u8 *)self->resources.resource0 + 0x24);
            self->field_14 = packed >> 4;
            func_020b581c(func_020af958(),
                          base + ((s32)(packed << 28) >> 28) * 0x800,
                          0x800);
            self->field_10++;
            if ((u32)self->field_10 >= 4)
                self->field_10 = 0;
        }
    } else {
        u32 planes = (*display & 0x1f00) >> 8;
        *display = (*display & ~0x1f00) | ((planes & ~2) << 8);
    }
}
