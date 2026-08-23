#include "tingle/game_phase_visual_effect.h"

/* Configure resources, hardware blending, and offsets for the phase visual effect. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern u32 func_020af958(void);
extern void func_020afd0c(volatile u16 *registerAddress, s32 mode,
                         u32 planeMask, u16 first, u16 second);
extern void GraphicsBgMapResource_SetPaletteBank(void *resource, s32 value);
extern void func_020b44e8(void);
#ifdef __cplusplus
}
#endif

/* Replace flags bit 0 with enabled's low bit; no value is returned. */
void GamePhaseVisualEffect_SetEnabled(GamePhaseVisualEffect *self, s32 enabled)
{
    self->flags = (self->flags & ~1) | (enabled & 1);
}

/*
 * If resources are loaded, configure BG1 as an affine 256-color background,
 * seed randomToken from the SDK random source, request first-use setup with flag
 * bit 1, and clear the half-speed position flag (bit 2).
 */
void GamePhaseVisualEffect_PrepareBackground(GamePhaseVisualEffect *self)
{
    volatile u16 *bg1cnt = (volatile u16 *)0x0400000a;
    if (!self->resources.resource0)
        return;
    *bg1cnt = (u16)((*bg1cnt & 0x43) | 0x1a08);
    self->randomToken = func_020af958();
    self->flags = (self->flags | 2) & ~4;
}

/* Store the two blend coefficients used by GamePhaseVisualEffect_ApplyBlend. */
void GamePhaseVisualEffect_SetBlendCoefficients(GamePhaseVisualEffect *self, u16 first, u16 second)
{
    self->firstBlend = first;
    self->secondBlend = second;
}

/*
 * Apply alpha blending for the effect when flags bit 3 is set; otherwise
 * clear BLDCNT. This directly changes the main engine's blending hardware.
 */
void GamePhaseVisualEffect_ApplyBlend(GamePhaseVisualEffect *self)
{
    if (!(self->flags & 8)) {
        *(volatile u16 *)0x04000050 = 0;
        return;
    }
    func_020afd0c((volatile u16 *)0x04000050, 2, 0x3d,
                  self->firstBlend, self->secondBlend);
}

/*
 * Replace the three owned graphics resources from data_020f4e18, configure
 * resource2 with value 15, and notify the graphics backend. No value returns.
 */
void GamePhaseVisualEffect_LoadResources(GamePhaseVisualEffect *self, u32 resource0Id,
                   u32 resource1Id, u32 resource2Id)
{
    GraphicsResourceSet_ReleaseHandles(&self->resources);
    GraphicsResourceSet_Load(&self->resources, data_020f4e18,
                             resource0Id, resource1Id, resource2Id);
    GraphicsBgMapResource_SetPaletteBank(self->resources.resource2, 0xf);
    func_020b44e8();
}

/*
 * Load the effect resource IDs, initialize BG1, enable blending, store both
 * blend coefficients and the low-nibble BG priority, and copy the five-word
 * runtime effect configuration. The resource2 ID and first coefficient share
 * the same recovered argument; this relationship is confirmed by the calls.
 */
void GamePhaseVisualEffect_Configure(GamePhaseVisualEffect *self, u32 resource0Id,
                   u32 resource1Id, u32 resource2Id, u16 firstBlend,
                   u16 secondBlend, u32 bgPriority,
                   const GamePhaseVisualEffectConfig *config)
{
    self->flags = (self->flags & ~0xf0) | ((bgPriority & 0xf) << 4);
    GamePhaseVisualEffect_LoadResources(self, resource0Id, resource1Id, resource2Id);
    GamePhaseVisualEffect_PrepareBackground(self);
    self->flags |= 8;
    self->firstBlend = firstBlend;
    self->secondBlend = secondBlend;
    self->sequenceEnabled = config->enabled;
    self->effectEntries[0] = config->entries[0];
    self->effectEntries[1] = config->entries[1];
    self->effectEntries[2] = config->entries[2];
    self->effectEntries[3] = config->entries[3];
}

/* Copy offset into vectors[3], the target consumed by position tracking. */
void GamePhaseVisualEffect_SetBaseOffset(GamePhaseVisualEffect *self,
                                         const VecFx32Object *offset)
{
    VecFx32Object_Assign(&self->vectors[3], offset);
}
