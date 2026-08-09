.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern data_ov059_02211ac0
.extern func_02003e20
.extern func_020c09cc
.extern func_ov059_0220fd20
.extern func_ov059_0220fd64
.extern gHeapContext

.global func_ov059_02210a2c
func_ov059_02210a2c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    movs r4, r1
    mov r5, r0
    moveq r0, #0x0
    streq r0, [r5, #0x0]
    streq r0, [r5, #0x4]
    beq .L_02210a94
    mov r0, #0x70
    mul r0, r4, r0
    ldr r1, .L_02210aa0
    ldr r3, .L_02210aa4
    add r0, r0, #0x8
    mov r2, #0x4
    bl func_02003e20
    cmp r0, #0x0
    beq .L_02210a90
    ldr r1, .L_02210aa8
    ldr ip, .L_02210aac
    str r1, [sp, #0x0]
    mov r1, r4
    mov r2, #0x70
    mov r3, #0x8
    str ip, [sp, #0x4]
    bl func_020c09cc
.L_02210a90:
    stmia r5, {r0, r4}
.L_02210a94:
    mov r0, r5
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_02210aa0: .word data_ov059_02211ac0
.L_02210aa4: .word gHeapContext
.L_02210aa8: .word func_ov059_0220fd20
.L_02210aac: .word func_ov059_0220fd64
.size func_ov059_02210a2c, . - func_ov059_02210a2c
