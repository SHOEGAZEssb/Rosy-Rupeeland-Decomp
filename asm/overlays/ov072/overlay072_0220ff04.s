.text
; Matching fallback for the portable implementation in src/overlays/ov072/overlay072_recovery.c.
.extern Scene_Destroy
.extern data_021052fc
.extern data_ov072_022109dc
.extern data_ov072_02210b0c
.extern func_02002290
.extern func_020022dc
.extern func_02007f24
.extern Actor_SetDirectionFromVector
.extern func_0204b680
.extern func_02073ef8
.extern func_ov072_0221004c
.extern gGameWork

.global func_ov072_0220ff04
func_ov072_0220ff04:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldr r1, .L_0221003c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x2c]
    bl func_02073ef8
    mov r5, #0x0
.L_0220ff24:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x30]
    bl func_02073ef8
    add r5, r5, #0x1
    cmp r5, #0x8
    blt .L_0220ff24
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_0220ff54
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0220ff54:
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq .L_0220ff6c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0220ff6c:
    ldr r0, .L_02210040
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x1000
    add r0, r0, #0x2000
    ldr r5, [r0, #0xea4]
    ldr ip, [r5, #0x54]
    mov r0, r5
    ldrh r3, [ip, #0x24]
    bic r3, r3, #0x4
    strh r3, [ip, #0x24]
    bl Actor_SetDirectionFromVector
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    ldr r0, .L_02210040
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_0220ffc8
    bl func_0204b680
.L_0220ffc8:
    ldr r0, [r4, #0x7c]
    cmp r0, #0x1
    bne .L_02210004
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    ldr r3, [r4, #0x78]
    ldr r1, .L_02210044
    mov r0, #0x1c
    mla r1, r3, r0, r1
    ldr r0, .L_02210040
    ldr r1, [r1, #0x14]
    ldr r0, [r0, #0x0]
    mov r3, r2
    bl func_02007f24
.L_02210004:
    ldr r0, .L_02210048
    ldr r3, [r4, #0x7c]
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    mov r2, #0x78
    bl func_ov072_0221004c
    bl func_020022dc
    mov r1, #0x2
    bl func_02002290
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_0221003c: .word data_ov072_02210b0c
.L_02210040: .word data_021052fc
.L_02210044: .word data_ov072_022109dc
.L_02210048: .word gGameWork
.size func_ov072_0220ff04, . - func_ov072_0220ff04
