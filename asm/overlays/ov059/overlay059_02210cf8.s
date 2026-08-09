.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern data_ov059_02211af8
.extern data_ov059_02211b08
.extern func_02028388
.extern func_ov059_0220fd80
.extern func_ov059_022104f0
.extern func_ov059_02210d90

.global func_ov059_02210cf8
func_ov059_02210cf8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    movs r5, r1
    mov r6, r0
    bmi .L_02210d80
    ldr r1, [r6, #0x8]
    ldrsh r0, [r1, #0x0]
    cmp r5, r0
    bge .L_02210d80
    add r0, r1, r5, lsl #0x1
    ldrsh r0, [r0, #0x8]
    sub r0, r0, #0x1
    bl func_02028388
    mov r7, r0
    mov r0, r6
    mov r1, r5
    bl func_ov059_02210d90
    mov r1, #0x70
    mul r4, r5, r1
    ldr r3, .L_02210d88
    mov r2, r0
    ldr r0, [r3, r2, lsl #0x2]
    mov r1, r7
    stmia sp, {r0, r2}
    ldr r0, .L_02210d8c
    ldr ip, [r6, #0x0]
    ldr r3, [r0, r2, lsl #0x2]
    add r0, ip, r4
    bl func_ov059_0220fd80
    ldr r0, [r6, #0x0]
    mov r2, r5, lsl #0x7
    add r0, r0, r4
    mov r1, #0x0
    bl func_ov059_022104f0
.L_02210d80:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02210d88: .word data_ov059_02211b08
.L_02210d8c: .word data_ov059_02211af8
.size func_ov059_02210cf8, . - func_ov059_02210cf8
