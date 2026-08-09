.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern Scene_GetEmbedded10
.extern TouchRegionManager_NotifyAll
.extern TouchRegionManager_SetEnabled
.extern TouchRegionManager_Tick
.extern data_021052fc
.extern func_02008e10
.extern func_0200f5b8
.extern func_0200f824
.extern func_020740a4
.extern func_ov060_02210584

.global func_ov060_022102f0
func_ov060_022102f0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0x2c]
    sub r0, r0, #0x1
    str r0, [r4, #0x2c]
    bl func_0200f824
    mov r1, #0x0
    bl func_0200f5b8
    ldr r1, [r4, #0x28]
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    cmp r1, #0x0
    blt .L_02210358
    mov r0, r4
    bl func_ov060_02210584
    cmp r0, #0x0
    beq .L_02210384
    cmp r4, #0x0
    beq .L_02210350
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210350:
    mov r0, #0x1
    b .L_02210424
.L_02210358:
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq .L_02210384
    mov r0, r4
    bl Scene_GetEmbedded10
    mov r1, #0x1
    bl TouchRegionManager_SetEnabled
    mov r0, r4
    bl Scene_GetEmbedded10
    mov r1, #0x1
    bl TouchRegionManager_NotifyAll
.L_02210384:
    ldr r0, [r4, #0x34]
    cmp r0, #0x0
    ldrne r0, [r4, #0x30]
    cmpne r0, #0x0
    beq .L_022103f8
    ldr r1, [sp, #0x4]
    mov r2, r1, lsl #0x1e
    movs r2, r2, asr #0x1f
    ldrneh r1, [r0, #0x24]
    bicne r1, r1, #0x2
    strneh r1, [r0, #0x24]
    bne .L_022103f8
    mov r1, r1, lsl #0x1f
    movs r1, r1, asr #0x1f
    ldrneh r1, [r0, #0x24]
    bicne r1, r1, #0x2
    strneh r1, [r0, #0x24]
    bne .L_022103f8
    ldrh r2, [r0, #0x24]
    and r1, r2, #0x2
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    bne .L_022103f8
    bic r1, r2, #0x1
    strh r1, [r0, #0x24]
    ldr r1, [r4, #0x30]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_022103f8:
    ldr r0, [r4, #0x24]
    ldr r0, [r0, #0x0]
    bl func_020740a4
    mov r0, r4
    bl Scene_GetEmbedded10
    bl TouchRegionManager_Tick
    ldr r0, .L_0221042c
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl func_02008e10
    mov r0, #0x0
.L_02210424:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_0221042c: .word data_021052fc
.size func_ov060_022102f0, . - func_ov060_022102f0
