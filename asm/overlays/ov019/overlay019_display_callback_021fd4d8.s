    .text
/* Exact fallback; see src/overlays/ov019/overlay019_display_callback.c. */
    .extern gGamePhaseRuntime
    .extern GamePhaseState_UpdateRenderHelpers
    .extern GamePhaseAreaScene_Update

.global Overlay019_UpdateDisplay
Overlay019_UpdateDisplay:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x15
    movs r0, r0, asr #0x1f
    beq L_021fd574
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    bne L_021fd53c
    ldr r0, L_021fd57c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_Update
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r4, #0x48]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    ldr r1, [r4, #0x60]
    ldr r0, L_021fd580
    and r0, r0, r1, lsl #0x10
    str r0, [r2, #0x14]
    b L_021fd574
L_021fd53c:
    ldr r0, L_021fd57c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_UpdateRenderHelpers
    ldr r3, L_021fd584
    ldr r1, [r4, #0x4c]
    ldr r2, [r3, #0x0]
    ldr r0, L_021fd580
    bic r2, r2, #0x1f00
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    ldr r1, [r4, #0x60]
    and r0, r0, r1, lsl #0x10
    str r0, [r3, #0x14]
L_021fd574:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fd57c: .word gGamePhaseRuntime
L_021fd580: .word 0x1ff0000
L_021fd584: .word 0x4001000
    .size Overlay019_UpdateDisplay, . - Overlay019_UpdateDisplay
