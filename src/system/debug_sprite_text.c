#include "tingle/debug_sprite_text.h"

/*
 * Small debug-text drawable backed by the global sprite renderer. It owns a
 * renderer entry identified by 0x7001, resolves UTF-16 text from a global
 * resource table, and draws that text centered around a caller-supplied X.
 * The exact manager and resource-table types remain under recovery.
 */

extern void *data_020f4e18;
extern GraphicsSpriteRenderer *gDebugFont;
extern u8 data_021f3ecc[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02071980(void *manager, u32 id);
extern void func_02071d4c(void *manager, void *entry);
extern u8 *func_02079f3c(void *table, u16 resourceId);
#ifdef __cplusplus
}
#endif

#ifndef MATCHING
/*
 * Clear both fields, allocate renderer entry 0x7001 from data_020f4e18, store
 * it in renderEntry, and return self. Allocation effects belong to the global
 * manager; no hardware register is written directly.
 */
DebugSpriteText *DebugSpriteText_Init(DebugSpriteText *self)
{
    self->text = 0;
    self->renderEntry = 0;
    self->renderEntry = func_02071980(data_020f4e18, 0x7001);
    return self;
}

/*
 * Release renderEntry through the global manager and return self. The retail
 * routine does not clear either field after release.
 */
DebugSpriteText *DebugSpriteText_Destroy(DebugSpriteText *self)
{
    func_02071d4c(data_020f4e18, self->renderEntry);
    return self;
}

/*
 * Resolve resourceId in data_021f3ecc and retain the UTF-16 payload beginning
 * two bytes into the returned record. Only self->text changes; no value is
 * returned, and lookup failure behavior belongs to func_02079f3c.
 */
void DebugSpriteText_SetTextResource(DebugSpriteText *self, u16 resourceId)
{
    self->text = (const u16 *)(func_02079f3c(data_021f3ecc, resourceId) + 2);
}

/*
 * Select this object's renderEntry, measure text using eight-pixel glyph
 * advance and zero spacing, then draw in mode 1 at y with its measured width
 * centered around centerX. The global renderer is modified and may queue
 * sprite/OAM work; no value is returned.
 */
void DebugSpriteText_DrawCentered(DebugSpriteText *self, s32 centerX, s32 y)
{
    s32 width;

    GraphicsSpriteRenderer_SetFontResource(gDebugFont, self->renderEntry);
    width = GraphicsSpriteRenderer_MeasureText(gDebugFont, self->text, 8, 0);
    GraphicsSpriteRenderer_DrawText(gDebugFont, self->text, centerX - width / 2, y, 1, 8, 0);
}
#else
/* Matching forms implement the documented portable C above. */
asm DebugSpriteText *DebugSpriteText_Init(DebugSpriteText *)
{
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0
    str r1, [r4]
    ldr r0, =data_020f4e18
    str r1, [r4, #4]
    ldr r0, [r0]
    ldr r1, =0x7001
    bl func_02071980
    str r0, [r4, #4]
    mov r0, r4
    ldmia sp!, {r4, pc}
}

asm DebugSpriteText *DebugSpriteText_Destroy(DebugSpriteText *)
{
    stmdb sp!, {r4, lr}
    ldr r1, =data_020f4e18
    mov r4, r0
    ldr r0, [r1]
    ldr r1, [r4, #4]
    bl func_02071d4c
    mov r0, r4
    ldmia sp!, {r4, pc}
}

asm void DebugSpriteText_SetTextResource(DebugSpriteText *, u16)
{
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, =data_021f3ecc
    bl func_02079f3c
    add r0, r0, #2
    str r0, [r4]
    ldmia sp!, {r4, pc}
}

asm void DebugSpriteText_DrawCentered(DebugSpriteText *, s32, s32)
{
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    ldr r3, =gDebugFont
    mov r4, r0
    mov r6, r1
    ldr r0, [r3]
    ldr r1, [r4, #4]
    mov r5, r2
    bl GraphicsSpriteRenderer_SetFontResource
    ldr r0, =gDebugFont
    ldr r1, [r4]
    ldr r0, [r0]
    mov r2, #8
    mov r3, #0
    bl GraphicsSpriteRenderer_MeasureText
    add r0, r0, r0, lsr #31
    sub r2, r6, r0, asr #1
    mov r0, #1
    str r0, [sp]
    mov r0, #8
    str r0, [sp, #4]
    mov r0, #0
    str r0, [sp, #8]
    ldr r0, =gDebugFont
    ldr r1, [r4]
    ldr r0, [r0]
    mov r3, r5
    bl GraphicsSpriteRenderer_DrawText
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
}
#endif
