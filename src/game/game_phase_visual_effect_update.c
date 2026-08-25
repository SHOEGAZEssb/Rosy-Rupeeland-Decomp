#include "tingle/game_phase_visual_effect.h"

/* Update BG1 placement and the randomized phase visual effect each frame. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGamePhaseRuntime;
extern void GamePhaseVisualEffect_ApplyBlend(GamePhaseVisualEffect *self);
extern u32 func_020af958(void);
extern void func_020b581c(u32 random, s32 value, s32 scale);
#ifdef __cplusplus
}
#endif

/*
 * If resources are loaded, flags bit 0 controls whether BG1 is enabled.
 * On first enable (bit 1), apply resource mode 1/0x1e0 and update BG1 priority.
 * Copy vector offsets 0x34/0x38 into BG1OFS, update the effect helper, and—when
 * runtime flag 0x30cc bit 2 is clear and randomToken/sequenceEnabled permit
 * it—cycle four signed nibble offsets on per-entry timers and dispatch a
 * randomized effect. Hardware effects touch DISPCNT, BG1CNT, and BG1OFS.
 */
void GamePhaseVisualEffect_Update(GamePhaseVisualEffect *self)
{
    volatile u32 *display = (volatile u32 *)0x04000000;
    if (self->resources.resource0 == 0)
        return;
    if (self->flags & 1) {
        u32 planes = (*display & 0x1f00) >> 8;
        *display = (*display & ~0x1f00) | ((planes | 2) << 8);
        if (self->flags & 2) {
            volatile u16 *bg1cnt = (volatile u16 *)0x0400000a;
            self->flags &= ~2;
            if (self->resources.resource0)
                GraphicsResourceSet_ApplyToMainBg(&self->resources, 1, 0x1e0);
            *bg1cnt = (u16)((*bg1cnt & ~3) | ((self->flags >> 4) & 0xf));
        }
        *(volatile u32 *)0x04000014 =
            (((u32)(self->vectors[GAME_PHASE_VISUAL_EFFECT_BACKGROUND_OFFSET]
                         .value.y >> 12) & 0x1ff) << 16) |
            ((u32)(self->vectors[GAME_PHASE_VISUAL_EFFECT_BACKGROUND_OFFSET]
                        .value.x >> 12) & 0x1ff);
        GamePhaseVisualEffect_ApplyBlend(self);
        if (*((u8 *)gGamePhaseRuntime + 0x30cc) & 4)
            return;
        if (!self->randomToken || !self->sequenceEnabled)
            return;
        if (--self->effectTimer >= 0)
            return;
        {
            s16 packed = self->effectEntries[(u32)self->effectEntryIndex];
            s32 base = *(s32 *)((u8 *)self->resources.resource0 + 0x24);
            self->effectTimer = packed >> 4;
            func_020b581c(func_020af958(),
                          base + ((s32)(packed << 28) >> 28) * 0x800,
                          0x800);
            self->effectEntryIndex++;
            if ((u32)self->effectEntryIndex >= 4)
                self->effectEntryIndex = 0;
        }
    } else {
        u32 planes = (*display & 0x1f00) >> 8;
        *display = (*display & ~0x1f00) | ((planes & ~2) << 8);
    }
}
