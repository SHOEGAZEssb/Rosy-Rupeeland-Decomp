.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern data_021052fc
.extern DebugSpriteText_SetTextResource
.extern GamePhaseMetadata_GetTextResourceId
.extern func_ov059_02210c24
.extern func_ov059_02210c60
.extern func_ov059_02211870

.global func_ov059_02211920
func_ov059_02211920:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, .L_022119d0
    mov r4, r1
    ldr r2, [r3, #0x0]
    ldr r1, .L_022119d4
    bic r2, r2, #0x1f00
    orr r2, r2, #0x1000
    str r2, [r3, #0x0]
    ldr r1, [r1, #0x0]
    mov r5, r0
    add r0, r1, #0x3000
    ldr r0, [r0, #0xe8]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, #0x1f
    ldr r3, [r3, #0xc]
    blx r3
    ldr r1, .L_022119d4
    mov r0, r5
    ldr r1, [r1, #0x0]
    add r1, r1, #0x3000
    ldr r2, [r1, #0xb8]
    orr r2, r2, #0x30
    str r2, [r1, #0xb8]
    bl func_ov059_02211870
    ldr r0, [r5, #0x3c]
    mov r1, r4
    bl func_ov059_02210c60
    mov r1, #0x1
    str r1, [r5, #0x34]
    ldr r0, [r5, #0x3c]
    bl func_ov059_02210c24
    ldr r0, .L_022119d4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    bl GamePhaseMetadata_GetTextResourceId
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    add r0, r5, #0x40
    bl DebugSpriteText_SetTextResource
    mov r0, #0x1
    str r0, [r5, #0x38]
    ldmia sp!, {r3, r4, r5, pc}
.L_022119d0: .word 0x4001000
.L_022119d4: .word data_021052fc
.size func_ov059_02211920, . - func_ov059_02211920
