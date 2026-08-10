#include "tingle/game_phase_state.h"
#include "tingle/game_work.h"

/* Apply phase descriptors to graphics, audio, GameWork, and runtime helpers. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *gLupyContext;
extern void *gSoundContext;
extern void OverlaySlot_LoadOverlay(void *object, u32 value);
extern void *func_0201e0ec(void *object);
extern void *func_0202751c(void *object, void *phaseObject);
extern void *func_020275b0(void);
extern void func_02027f2c(void);
extern void *func_02027f94(void);
extern void ActorCollection_SetSpriteMode(void *object, s32 value);
extern void func_0202d68c(void *object, s32 value);
extern void ActorDerivedType1_UpdateGameWorkRuntimeFlags(void *object, s32 enabled);
extern void ActorInteractionRuntime_Start(void);
extern void func_020598a0(void *sound, u16 value);
extern void func_0200e480(void);
extern void func_0200f0b4(GamePhaseState *self, const void *configuration);
extern void func_020a2348(void *object, s32 a, s32 b);
extern void func_020a23a8(void *object, s32 a, s32 b);
extern void func_020ae740(void);
extern void GX_DisableBankForLCDC(void);
extern void GX_SetBankForBG(s32 bank);
extern void GX_SetGraphicsMode(s32 displayMode, s32 bgMode, s32 bg0As3D);
#ifdef __cplusplus
}
#endif

typedef struct PhaseConfiguration {
    u32 phaseId;
    u8 unknown_04[0x0e];
    s16 field_12;
    u8 unknown_14[0x08];
    u32 helperValue1c;
    u32 field_20;
    void (*callback24)(s32 value);
    u8 unknown_28[0x18];
    u32 flags40;
} PhaseConfiguration;

/*
 * Configure the main BG bank and graphics mode according to configuration
 * flag bit 23, reset the phase-state render helpers, then apply the complete
 * descriptor through func_0200e780. Hardware writes affect main DISPCNT.
 */
void func_0200e650(GamePhaseState *self, const void *configuration)
{
    const PhaseConfiguration *config =
        (const PhaseConfiguration *)configuration;
    void *render;

    self->configuration = (void *)configuration;
    if ((s32)(config->flags40 << 8) < 0) {
        GX_SetBankForBG(0x10);
        GX_DisableBankForLCDC();
        GX_SetGraphicsMode(1, 0, 1);
        render = func_0201e0ec(self->helper_2f58);
        func_020a23a8(render, 1, 1);
    } else {
        func_020ae740();
        GX_SetBankForBG(2);
        render = func_0201e0ec(self->helper_2f58);
        func_020a2348(render, 1, 0);
        GX_SetGraphicsMode(1, 0, 0);
        *(volatile u32 *)0x04000000 =
            (*(volatile u32 *)0x04000000 & ~0x1f00) | 0x1000;
    }
    ActorCollection_SetSpriteMode(self->storage_0004, 1);
    func_0202d68c(self->storage_0004, 0);
    func_0200e780(self, configuration);
}

/*
 * Apply a descriptor, invoke its callback with zero, reset a global phase
 * service, and select a helper mode for phase IDs 2..4. If field_12 is
 * negative, also invoke helper_2eb4's first virtual method.
 */
void func_0200e714(GamePhaseState *self, const void *configuration)
{
    const PhaseConfiguration *config =
        (const PhaseConfiguration *)configuration;
    typedef void (*HelperMethod)(void *self);

    self->configuration = (void *)configuration;
    func_0200e780(self, configuration);
    config->callback24(0);
    ActorInteractionRuntime_Start();
    ActorDerivedType1_UpdateGameWorkRuntimeFlags(self->storage_0004 + 0x2e7c,
                  config->phaseId >= 2 && config->phaseId <= 4);
    if (config->field_12 < 0)
        (*(HelperMethod **)self->helper_2eb4)[0](self->helper_2eb4);
}

/*
 * Apply core descriptor fields and reset per-phase GameWork state. This clears
 * the pointer bank and 19 transient flags, updates current/previous phase IDs,
 * resets shared render/debug services, derives a signed mode from config bit
 * 25, seeds Lupy values 0xb4/3, and attaches owned_2eb0 to a new helper.
 */
void func_0200e780(GamePhaseState *self, const void *configuration)
{
    const PhaseConfiguration *config =
        (const PhaseConfiguration *)configuration;
    u8 *work = (u8 *)gGameWork;
    u8 *lupy = (u8 *)gLupyContext;
    static const u16 flags[] = {
        0x400, 0x3ee, 0x3fd, 0x403, 0x404, 0x402, 0x40a,
        0x35a, 0x11, 0x12, 0x3f4, 0x395, 0x39c, 0x16,
        0x417, 0x438, 0x419
    };
    u32 i;
    void *helper;

    func_020598a0(gSoundContext, (u16)config->phaseId);
    func_0200f0b4(self, configuration);
    OverlaySlot_LoadOverlay(self->helper_2ea4, config->helperValue1c);
    GameWork_ClearPointerBank(gGameWork, 0);
    *(u16 *)(work + 0x228) = 0;
    GameWork_SetFlag(gGameWork, 0x3ec);
    *(u16 *)(work + 0x20c) = 0;
    *(u16 *)(work + 0x20e) = 0;
    *(u16 *)(work + 0x246) = *(s16 *)(work + 0x248);
    *(u16 *)(work + 0x248) = (u16)config->phaseId;
    for (i = 0; i < sizeof(flags) / sizeof(flags[0]); i++)
        GameWork_ClearFlag(gGameWork, flags[i]);
    *(u16 *)(work + 0x19e) = 0x10;
    *(u16 *)(work + 0x218) = 0;
    func_02027f94();
    func_02027f2c();
    func_0200e480();
    *(s32 *)((u8 *)func_02027f94() + 8) =
        (s32)(config->flags40 << 6) >> 31;
    *(u16 *)(lupy + 0xcc) = 0xb4;
    *(u16 *)(lupy + 0xce) = 3;
    helper = func_020275b0();
    func_0202751c(helper, self->owned_2eb0);
}
