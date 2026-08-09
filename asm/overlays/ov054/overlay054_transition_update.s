.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern GameWork_TestFlag
.extern func_020afd0c
.extern gGameWork

.global func_ov054_0220eb50
func_ov054_0220eb50:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, .L_0220ec0c
    mov r4, r0
    mov r5, r1
    ldr r0, [r2, #0x0]
    ldr r1, .L_0220ec10
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r5, #0x1
    bne .L_0220ebbc
    mov r0, #0x1
    str r0, [r4, #0x10]
    ldr r0, [r4, #0x4]
    mov ip, #0x4000000
    bic r0, r0, #0x1
    str r0, [r4, #0x4]
    ldr r0, [ip, #0x0]
    mov r1, #0x0
    bic r0, r0, #0xe000
    str r0, [ip, #0x0]
    mov r2, r1
    mov r3, r1
    add r0, ip, #0x50
    str r1, [sp, #0x0]
    bl func_020afd0c
    ldmia sp!, {r3, r4, r5, pc}
.L_0220ebbc:
    mov r0, #0x0
    str r0, [r4, #0x10]
    ldr r0, [r4, #0x4]
    mov r3, #0x4000000
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x4]
    ldr r0, [r3, #0x0]
    bic r0, r0, #0xe000
    orr r0, r0, #0x2000
    str r0, [r3, #0x0]
    ldr r1, [r3, #0x0]
    ldr r0, [r3, #0x0]
    and r1, r1, #0x1f00
    mov r2, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r2, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r3, #0x0]
    ldmia sp!, {r3, r4, r5, pc}
.L_0220ec0c: .word gGameWork
.L_0220ec10: .word 0x40a
.size func_ov054_0220eb50, . - func_ov054_0220eb50
