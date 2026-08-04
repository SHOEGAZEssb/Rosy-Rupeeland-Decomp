#include "tingle/game_phase_visual_effect.h"

/* Configure resources, hardware blending, and offsets for the phase visual effect. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern u32 func_020af958(void);
extern void func_020afd0c(volatile u16 *registerAddress, s32 mode,
                         u32 planeMask, u16 first, u16 second);
extern void func_02070f34(void *resource, s32 value);
extern void func_020b44e8(void);
#ifdef __cplusplus
}
#endif

/* Replace flags_94 bit 0 with enabled's low bit; no value is returned. */
void func_02010094(GamePhaseVisualEffect *self, s32 enabled)
{
    self->flags_94 = (self->flags_94 & ~1) | (enabled & 1);
}

/*
 * If resources are loaded, configure BG1 as an affine 256-color background,
 * seed field_18 from the SDK random source, request first-use setup with flag
 * bit 1, and clear the half-speed position flag (bit 2).
 */
void func_020100ac(GamePhaseVisualEffect *self)
{
    volatile u16 *bg1cnt = (volatile u16 *)0x0400000a;
    if (!self->resources.resource0)
        return;
    *bg1cnt = (u16)((*bg1cnt & 0x43) | 0x1a08);
    self->field_18 = func_020af958();
    self->flags_94 = (self->flags_94 | 2) & ~4;
}

/* Store the two blend coefficients used by func_02010110. */
void func_02010104(GamePhaseVisualEffect *self, u16 first, u16 second)
{
    self->field_1c = first;
    self->field_1e = second;
}

/*
 * Apply alpha blending for the effect when flags_94 bit 3 is set; otherwise
 * clear BLDCNT. This directly changes the main engine's blending hardware.
 */
void func_02010110(GamePhaseVisualEffect *self)
{
    if (!(self->flags_94 & 8)) {
        *(volatile u16 *)0x04000050 = 0;
        return;
    }
    func_020afd0c((volatile u16 *)0x04000050, 2, 0x3d,
                  self->field_1c, self->field_1e);
}

/*
 * Replace the three owned graphics resources from data_020f4e18, configure
 * resource2 with value 15, and notify the graphics backend. No value returns.
 */
void func_02010154(GamePhaseVisualEffect *self, u32 resource0Id,
                   u32 resource1Id, u32 resource2Id)
{
    func_02072000(&self->resources);
    GraphicsResourceSet_Load(&self->resources, data_020f4e18,
                             resource0Id, resource1Id, resource2Id);
    func_02070f34(self->resources.resource2, 0xf);
    func_020b44e8();
}

/*
 * Load the effect resource IDs, initialize BG1, enable blending, store both
 * blend coefficients and the low-nibble BG priority, and copy the five-word
 * runtime effect configuration. The resource2 ID and first coefficient share
 * the same recovered argument; this relationship is confirmed by the calls.
 */
void func_020101a4(GamePhaseVisualEffect *self, u32 resource0Id,
                   u32 resource1Id, u32 resource2Id, u16 firstBlend,
                   u16 secondBlend, u32 bgPriority,
                   const GamePhaseVisualEffectConfig *config)
{
    self->flags_94 = (self->flags_94 & ~0xf0) | ((bgPriority & 0xf) << 4);
    func_02010154(self, resource0Id, resource1Id, resource2Id);
    func_020100ac(self);
    self->flags_94 |= 8;
    self->field_1c = firstBlend;
    self->field_1e = secondBlend;
    self->field_98 = config->enabled;
    self->field_9c = config->entries[0];
    self->field_9e = config->entries[1];
    self->field_a0 = config->entries[2];
    self->field_a2 = config->entries[3];
}

/* Copy offset into vectors[3], the target consumed by position tracking. */
void func_0201021c(GamePhaseVisualEffect *self, const VecFx32Object *offset)
{
    func_020050a4(&self->vectors[3], offset);
}
