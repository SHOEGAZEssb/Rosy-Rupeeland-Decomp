#include "tingle/types.h"

/*
 * Manage a main- or sub-engine display fade presentation.  Construction loads
 * graphics resources, configures blend/background hardware and a palette row,
 * then a small state machine drives an SDK fade object and updates blend alpha
 * until a GameWork signal selects the next callback pair.
 */

typedef struct DisplayFadePresentation {
    void **vtable;
    u32 flags04;
    void *callbackBase08;
    s32 callbackTag0c;
    s32 state10;
    u8 fade14[0x1c];
    s32 subEngine30;
    s32 fadeParameter34;
    s32 alpha38;
    u8 scroll3c[0x20];
} DisplayFadePresentation;

typedef struct GraphicsResourceSet {
    void *first;
    void *second;
    void *third;
} GraphicsResourceSet;

typedef s32 (*TaggedCallback)(void *self);

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d6564;
extern void *data_020f4e18;
extern void *gGameWork;
extern void *TimedSpritePresentation_InitBase(void *self);
extern void func_02091b6c(void *fade);
extern void func_02091b98(void *fade, s32 duration);
extern s32 func_02091c7c(void *fade, s32 channel);
extern void func_02091bac(void *fade, s32 first, s32 second, s32 parameter,
                          s32 duration);
extern void func_020929b0(void *scroll);
extern s32 func_020929f4(void *scroll);
extern s32 func_02092b0c(void *scroll);
extern s32 func_02092b34(void *scroll, s32 argument);
extern s32 func_02092b60(void *scroll);
extern s32 func_02092b68(void *scroll);
extern void GraphicsResourceSet_Init(GraphicsResourceSet *set);
extern void GraphicsResourceSet_Load(GraphicsResourceSet *set, void *table,
                                     s32 first, s32 second, s32 third,
                                     s32 fourth);
extern void GraphicsResourceSet_Destroy(GraphicsResourceSet *set);
extern void func_020b44e8(void);
extern void func_020afd0c(volatile void *reg, s32 first, s32 second,
                          s32 third, s32 fourth);
extern void MainBg1_SetControl(s32, s32, s32, s32, s32);
extern void MainBg2_SetControl(s32, s32, s32, s32);
extern void SubBg1_SetControl(s32, s32, s32, s32, s32);
extern void SubBg2_SetControl(s32, s32, s32, s32);
extern void PairedReferenceState_SetReferencesAndReset(void *self,
                                                       void *first,
                                                       void *second);
extern void func_02070638(void *resource);
extern void func_020706c4(void *resource, s32 first, s32 second);
extern void func_02070e0c(void *resource, s32 first, s32 second);
extern void func_02070eac(void *resource, s32 first, s32 second);
extern void *GraphicsBgResourceData_GetDecoded(void *resource);
extern void func_020b2058(void *destination, s32 value, s32 size);
extern void func_020b1ff0(void *destination, s32 value, s32 size);
extern void GameWork_ClearFlag(void *gameWork, s32 flag);
extern s32 GameWork_TestFlag(void *gameWork, s32 flag);
extern const void *data_020d63c0[];
extern const void *data_020d63d8[];
#ifdef __cplusplus
}
#endif

/*
 * Initialize the base, fade and scroll helpers, retain engine selection and
 * fadeParameter, and load graphics IDs 0xc006..0xc008.  Configure the selected
 * display engine's blend/background registers and resource layers, clear one
 * 0x20-byte palette row selected by paletteIndex, enable recovered base flag
 * bits 0/1, clear GameWork flag 0x3d3, install the initial callback pair from
 * data_020d63c0, destroy the temporary resource set, and return self.  All
 * direct 0x04000000/0x04001000 writes are confirmed hardware effects.
 */
DisplayFadePresentation *DisplayFadePresentation_Init(
    DisplayFadePresentation *self, s32 subEngine, s32 paletteIndex,
    s32 fadeParameter)
{
    GraphicsResourceSet resources;
    void *palette;

    TimedSpritePresentation_InitBase(self);
    self->vtable = (void **)data_020d6564;
    func_02091b6c(self->fade14);
    func_020929b0(self->scroll3c);
    self->subEngine30 = subEngine;
    self->fadeParameter34 = fadeParameter;
    self->alpha38 = 0;
    GraphicsResourceSet_Init(&resources);
    GraphicsResourceSet_Load(&resources, data_020f4e18, 0xc006, 0xc007,
                             0xc008, 0xc008);
    func_020b44e8();
    if (subEngine == 0) {
        func_020afd0c((void *)0x04000050, 2, 4, 0, 0);
        MainBg1_SetControl(0, 0, 0x1a, 0, 1);
        MainBg2_SetControl(0, 0, 0x1c, 0);
        *(volatile u16 *)0x0400000a =
            (u16)((*(volatile u16 *)0x0400000a & ~3) | 1);
        *(volatile u16 *)0x0400000c =
            (u16)((*(volatile u16 *)0x0400000c & ~3) | 2);
        *(volatile u32 *)0x04000000 =
            (*(volatile u32 *)0x04000000 & ~0x1f00) |
            ((((*(volatile u32 *)0x04000000 & 0x1f00) >> 8) | 6) << 8);
        func_02070638(resources.first);
        func_02070e0c(resources.third, 1, 0);
        func_02070e0c(resources.third, 2, 0);
        palette = (u8 *)GraphicsBgResourceData_GetDecoded(resources.second) + paletteIndex * 0x20;
        func_020b2058(palette, 0, 0x20);
    } else {
        func_020afd0c((void *)0x04001050, 2, 4, 0, 0);
        SubBg1_SetControl(0, 0, 0x1a, 0, 1);
        SubBg2_SetControl(0, 0, 0x1c, 0);
        *(volatile u16 *)0x0400100a =
            (u16)((*(volatile u16 *)0x0400100a & ~3) | 1);
        *(volatile u16 *)0x0400100c =
            (u16)((*(volatile u16 *)0x0400100c & ~3) | 2);
        *(volatile u32 *)0x04001000 =
            (*(volatile u32 *)0x04001000 & ~0x1f00) |
            ((((*(volatile u32 *)0x04001000 & 0x1f00) >> 8) | 6) << 8);
        func_020706c4(resources.first, 1, 0);
        func_02070eac(resources.third, 1, 0);
        func_02070eac(resources.third, 2, 0);
        palette = (u8 *)GraphicsBgResourceData_GetDecoded(resources.second) + paletteIndex * 0x20;
        func_020b1ff0(palette, 0, 0x20);
    }
    self->flags04 = (self->flags04 | 2) & ~1;
    self->flags04 |= 1;
    GameWork_ClearFlag(gGameWork, 0x3d3);
    PairedReferenceState_SetReferencesAndReset(
        self, (void *)data_020d63c0[0], (void *)data_020d63c0[1]);
    GraphicsResourceSet_Destroy(&resources);
    return self;
}

/*
 * Dispatch through the recovered tagged callback representation at offsets
 * 0x08/0x0c.  A zero callback base returns zero; odd tags select a callback
 * through callbackBase08 while even tags read it directly from the adjusted
 * object address.  Return the callback's result.
 */
s32 DisplayFadePresentation_DispatchCallback(DisplayFadePresentation *self)
{
    u8 *adjusted;
    TaggedCallback callback;

    if (self->callbackBase08 == 0) {
        return 0;
    }
    adjusted = (u8 *)self + (self->callbackTag0c >> 1);
    if ((self->callbackTag0c & 1) != 0) {
        callback = *(TaggedCallback *)(*(u8 **)adjusted +
                                       (s32)self->callbackBase08);
    } else {
        callback = *(TaggedCallback *)self->callbackBase08;
    }
    return callback(adjusted);
}

/*
 * Drive the three-state fade sequence.  State zero starts a 30-step fade;
 * state one waits for channel 2 then starts channel 1 with fadeParameter34 and
 * duration 16; state two copies channel 1 to alpha38 and the selected blend
 * register.  When GameWork flag 0x3d3 is set, consume it and install the next
 * callback pair from data_020d63d8.  Always return zero.
 */
s32 DisplayFadePresentation_UpdateFade(DisplayFadePresentation *self)
{
    if (self->state10 == 0) {
        func_02091b98(self->fade14, 0x1e);
        self->state10++;
    }
    if (self->state10 == 1) {
        if (func_02091c7c(self->fade14, 2) != 0) {
            func_02091bac(self->fade14, 1, 0, self->fadeParameter34, 0x10);
            self->state10++;
        }
    } else if (self->state10 == 2) {
        self->alpha38 = func_02091c7c(self->fade14, 1);
        func_020afd0c(self->subEngine30 == 0 ? (void *)0x04000050
                                             : (void *)0x04001050,
                      2, 4, self->alpha38, self->alpha38);
        if (GameWork_TestFlag(gGameWork, 0x3d3) != 0) {
            GameWork_ClearFlag(gGameWork, 0x3d3);
            PairedReferenceState_SetReferencesAndReset(
                self, (void *)data_020d63d8[0],
                (void *)data_020d63d8[1]);
        }
    }
    return 0;
}

/* Return one unconditionally; no state or hardware is changed. */
s32 DisplayFadePresentation_ReportComplete(DisplayFadePresentation *self)
{
    (void)self;
    return 1;
}

/* Return func_020929f4's status for the embedded scroll helper. */
s32 DisplayFadePresentation_GetScrollStatus(DisplayFadePresentation *self)
{
    return func_020929f4(self->scroll3c);
}

/*
 * Ignore arguments at least 0xc0.  Otherwise sample four scroll components and
 * pack them into the selected engine's BG2/BG3 offset registers at 0x14..0x1b.
 * The low nine bits of each component are written directly to hardware.
 */
void DisplayFadePresentation_ApplyScrollOffsets(DisplayFadePresentation *self,
                                                s32 argument)
{
    volatile u32 *registers;
    u32 first;
    u32 second;
    u32 third;
    u32 fourth;

    if (argument >= 0xc0) {
        return;
    }
    first = (u32)func_02092b0c(self->scroll3c);
    second = (u32)func_02092b34(self->scroll3c, argument);
    third = (u32)func_02092b60(self->scroll3c);
    fourth = (u32)func_02092b68(self->scroll3c);
    registers = (volatile u32 *)(self->subEngine30 == 0 ? 0x04000014
                                                        : 0x04001014);
    registers[0] = (first & 0x1ff) | ((fourth & 0x1ff) << 16);
    registers[1] = (second & 0x1ff) | ((third & 0x1ff) << 16);
}
