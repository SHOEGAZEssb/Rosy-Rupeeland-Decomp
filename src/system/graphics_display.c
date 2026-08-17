#include "tingle/graphics_display.h"
#include "tingle/graphics_resources.h"

/*
 * Low-level display bootstrap for a sub-engine BG0 screen. It disables every
 * plane while modes and VRAM ownership are changed, clears both standard
 * palette entry zeroes, configures main/sub BG banks A/C, enables only sub
 * BG0, swaps the LCD routing, and applies one of the two fixed resource sets.
 */

#define REG_DISPCNT (*(volatile u32 *)0x04000000)
#define REG_DISPCNT_SUB (*(volatile u32 *)0x04001000)
#define REG_POWCNT1 (*(volatile u16 *)0x04000304)
#define REG_BG_PLTT0 (*(volatile u16 *)0x05000000)
#define REG_BG_PLTT0_SUB (*(volatile u16 *)0x05000400)
#define REG_MASTER_BRIGHT ((volatile u16 *)0x0400006c)
#define REG_MASTER_BRIGHT_SUB ((volatile u16 *)0x0400106c)
#define REG_BG0CNT_SUB (*(volatile u16 *)0x04001008)
#define REG_BG0_SCROLL_SUB (*(volatile u32 *)0x04001010)

#define DISPLAY_PLANE_MASK 0x1f00

#ifdef __cplusplus
extern "C" {
#endif

extern void Sound_SetMasterVolume(s32 volume);
extern void GXx_SetMasterBrightness_(volatile u16 *reg, s32 brightness);
extern void GX_SetGraphicsMode(u32 displayMode, u32 bgMode, u32 bg0Mode);
extern void GXS_SetGraphicsMode(u32 bgMode);
extern u32 func_020ae990(void); /* Resets one BG VRAM-bank assignment. */
extern u32 func_020ae934(void); /* Resets the other BG VRAM-bank assignment. */
extern void GX_SetBankForBG(u32 banks);
extern void GX_SetBankForSubBG(u32 banks);
extern void GraphicsResourceSet_Apply(GraphicsResourceSet *set, s32 value0,
                                      s32 value1);
extern void *gSoundContext;

#ifdef __cplusplus
}
#endif

/*
 * Reconfigure display hardware and apply resourceSetIndex (0 or 1). The first
 * argument is present in the recovered calling convention but is not read.
 */
#ifndef MATCHING
void GraphicsDisplay_SetupSubBg0(void *unused, s32 resourceSetIndex)
{
    GraphicsResourceSet *sets;

    REG_DISPCNT &= ~DISPLAY_PLANE_MASK;
    REG_DISPCNT_SUB &= ~DISPLAY_PLANE_MASK;
    *(u32 *)((u8 *)gSoundContext + 0xa4) = 0;
    Sound_SetMasterVolume(0);

    REG_BG_PLTT0 = 0;
    REG_BG_PLTT0_SUB = 0;
    GXx_SetMasterBrightness_(REG_MASTER_BRIGHT, 0);
    GXx_SetMasterBrightness_(REG_MASTER_BRIGHT_SUB, 0);
    GX_SetGraphicsMode(1, 0, 0);
    GXS_SetGraphicsMode(0);
    func_020ae990();
    func_020ae934();
    GX_SetBankForBG(1);    /* GX_VRAM_BG_128_A */
    GX_SetBankForSubBG(4); /* GX_VRAM_SUB_BG_128_C */

    REG_DISPCNT &= ~DISPLAY_PLANE_MASK;
    REG_DISPCNT_SUB = (REG_DISPCNT_SUB & ~DISPLAY_PLANE_MASK) | 0x100;
    REG_POWCNT1 |= 0x8000; /* Route the sub engine to the upper LCD. */
    REG_BG0CNT_SUB = (REG_BG0CNT_SUB & 0x43) | 0x1000;
    REG_BG0_SCROLL_SUB = 0;

    sets = GraphicsResourceSets_Get();
    GraphicsResourceSet_Apply(&sets[resourceSetIndex], 0, 0);
}
#else
/* MWCC otherwise reorders equivalent volatile accesses and register choices. */
asm void GraphicsDisplay_SetupSubBg0(void *unused, s32 resourceSetIndex)
{
    stmdb sp!, {r4, lr}
    mov r3, #0x04000000
    ldr r2, [r3]
    add r4, r3, #0x1000
    bic r2, r2, #0x1f00
    str r2, [r3]
    ldr r3, [r4]
    ldr r2, =gSoundContext
    bic r3, r3, #0x1f00
    str r3, [r4]
    ldr r2, [r2]
    mov r0, #0
    mov r4, r1
    str r0, [r2, #0xa4]
    bl Sound_SetMasterVolume
    mov r2, #0x05000000
    mov r1, #0
    strh r1, [r2]
    add r2, r2, #0x400
    ldr r0, =0x0400006c
    strh r1, [r2]
    bl GXx_SetMasterBrightness_
    ldr r0, =0x0400106c
    mov r1, #0
    bl GXx_SetMasterBrightness_
    mov r1, #0
    mov r2, r1
    mov r0, #1
    bl GX_SetGraphicsMode
    mov r0, #0
    bl GXS_SetGraphicsMode
    bl func_020ae990
    bl func_020ae934
    mov r0, #1
    bl GX_SetBankForBG
    mov r0, #4
    bl GX_SetBankForSubBG
    mov r2, #0x04000000
    ldr r0, [r2]
    add r1, r2, #0x1000
    bic r0, r0, #0x1f00
    str r0, [r2]
    ldr r0, [r1]
    add r3, r2, #0x304
    bic r0, r0, #0x1f00
    orr r0, r0, #0x100
    str r0, [r1]
    ldrh r1, [r3]
    ldr r2, =0x04001008
    mov r0, #0
    orr r1, r1, #0x8000
    strh r1, [r3]
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x1000
    strh r1, [r2]
    str r0, [r2, #8]
    bl GraphicsResourceSets_Get
    mov r1, #0xc
    mla r0, r4, r1, r0
    mov r1, #0
    mov r2, r1
    bl GraphicsResourceSet_Apply
    ldmia sp!, {r4, pc}
}
#endif
