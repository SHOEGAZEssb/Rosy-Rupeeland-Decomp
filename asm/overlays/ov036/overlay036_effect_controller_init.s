.text

/* Exact fallback; see src/overlays/ov036/overlay036_effect_controller_init.c for documented portable C. */

    .extern func_ov036_021fce00
    .extern func_020720c0
    .extern func_ov036_021fe218
    .extern func_020720e8
    .extern func_020779ac
    .extern func_02077624
    .extern Heap_Alloc
    .extern func_ov036_021fdf30
    .extern func_02095274
    .extern func_02094bbc
    .extern func_ov036_021fe9fc
    .extern func_ov036_021fea04
    .extern data_ov036_02205f2c
    .extern data_020f4e18
    .extern data_ov036_02206150
    .extern gHeapContext


    .global func_ov036_021fea14
func_ov036_021fea14:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r1, r2
    mov r5, r0
    bl func_ov036_021fce00
    ldr r1, L_021fee30
    add r0, r5, #0xe0
    str r1, [r5, #0x0]
    bl func_020720c0
    add r0, r5, #0xec
    bl func_020720c0
    add r0, r5, #0xf8
    bl func_ov036_021fe218
    add r0, r5, #0x108
    bl func_ov036_021fe218
    ldr r0, [r5, #0x4]
    cmp r0, #0x12c
    bgt L_021feb14
    bge L_021fecbc
    cmp r0, #0xcb
    bgt L_021fead0
    bge L_021fec50
    cmp r0, #0xc8
    bgt L_021feab4
    bge L_021fec50
    cmp r0, #0x4d
    ble L_021febc0
    sub r1, r0, #0x64
    cmp r1, #0x8
    addls pc, pc, r1, lsl #0x2
    b L_021febc0
L_021fea90: ; jump table
    b L_021febe4 ; case 0
    b L_021fec08 ; case 1
    b L_021fec2c ; case 2
    b L_021febe4 ; case 3
    b L_021fec08 ; case 4
    b L_021fec2c ; case 5
    b L_021febe4 ; case 6
    b L_021fec08 ; case 7
    b L_021fec2c ; case 8
L_021feab4:
    cmp r0, #0xc9
    bgt L_021feac4
    beq L_021fec74
    b L_021febc0
L_021feac4:
    cmp r0, #0xca
    beq L_021fec98
    b L_021febc0
L_021fead0:
    cmp r0, #0xce
    bgt L_021feaf8
    bge L_021fec50
    cmp r0, #0xcc
    bgt L_021feaec
    beq L_021fec74
    b L_021febc0
L_021feaec:
    cmp r0, #0xcd
    beq L_021fec98
    b L_021febc0
L_021feaf8:
    cmp r0, #0xcf
    bgt L_021feb08
    beq L_021fec74
    b L_021febc0
L_021feb08:
    cmp r0, #0xd0
    beq L_021fec98
    b L_021febc0
L_021feb14:
    ldr r2, L_021fee34
    cmp r0, r2
    bgt L_021feb78
    bge L_021fecbc
    sub r1, r2, #0x3
    cmp r0, r1
    bgt L_021feb58
    bge L_021fecbc
    sub r1, r2, #0x5
    cmp r0, r1
    bgt L_021feb48
    beq L_021fece0
    b L_021febc0
L_021feb48:
    sub r1, r2, #0x4
    cmp r0, r1
    beq L_021fed04
    b L_021febc0
L_021feb58:
    cmp r0, #0x130
    bgt L_021feb68
    beq L_021fece0
    b L_021febc0
L_021feb68:
    sub r1, r2, #0x1
    cmp r0, r1
    beq L_021fed04
    b L_021febc0
L_021feb78:
    cmp r0, #0x258
    bgt L_021feba4
    bge L_021fed4c
    add r1, r2, #0x1
    cmp r0, r1
    bgt L_021feb98
    beq L_021fece0
    b L_021febc0
L_021feb98:
    cmp r0, #0x134
    beq L_021fed04
    b L_021febc0
L_021feba4:
    ldr r1, L_021fee38
    cmp r0, r1
    bgt L_021febb8
    beq L_021fed28
    b L_021febc0
L_021febb8:
    add r1, r1, #0x1
    cmp r0, r1
L_021febc0:
    ldr r3, L_021fee3c
    ldr r0, L_021fee40
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xec
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021fed6c
L_021febe4:
    ldr r3, L_021fee44
    ldr r0, L_021fee40
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xec
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021fed6c
L_021fec08:
    ldr r3, L_021fee48
    ldr r0, L_021fee40
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xec
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021fed6c
L_021fec2c:
    ldr r3, L_021fee4c
    ldr r0, L_021fee40
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xec
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021fed6c
L_021fec50:
    ldr r3, L_021fee50
    ldr r0, L_021fee40
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xec
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021fed6c
L_021fec74:
    ldr r3, L_021fee54
    ldr r0, L_021fee40
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xec
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021fed6c
L_021fec98:
    ldr r3, L_021fee58
    ldr r0, L_021fee40
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xec
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021fed6c
L_021fecbc:
    ldr r3, L_021fee5c
    ldr r0, L_021fee40
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xec
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021fed6c
L_021fece0:
    ldr r3, L_021fee60
    ldr r0, L_021fee40
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xec
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021fed6c
L_021fed04:
    ldr r3, L_021fee64
    ldr r0, L_021fee40
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xec
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021fed6c
L_021fed28:
    ldr r3, L_021fee68
    ldr r0, L_021fee40
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xec
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021fed6c
L_021fed4c:
    ldr r3, L_021fee6c
    ldr r0, L_021fee40
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xec
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
L_021fed6c:
    mov r0, r4
    add r1, r5, #0xec
    bl func_020779ac
    ldr r3, L_021fee70
    ldr r0, L_021fee40
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe0
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0xe0
    bl func_020779ac
    mov r0, r4
    bl func_02077624
    str r0, [r5, #0xdc]
    mov r0, #0xa0
    ldr r1, L_021fee74
    mov r2, #0x4
    ldr r3, L_021fee78
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fedd4
    mov r1, r4
    bl func_ov036_021fdf30
L_021fedd4:
    str r0, [r5, #0x11c]
    mov r1, r0
    add r0, r5, #0xf8
    bl func_02095274
    mov r1, #0x0
    ldr r0, [r5, #0x11c]
    mov r2, r1
    sub r3, r1, #0x600
    bl func_02094bbc
    mov r1, #0x0
    mov r2, r1
    add r0, r5, #0xc
    mov r3, #0x2000
    bl func_ov036_021fe9fc
    mov r1, #0x0
    add r0, r5, #0xc
    mov r2, r1
    mov r3, r1
    bl func_ov036_021fea04
    mov r0, #0x0
    str r0, [r5, #0x118]
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fee30: .word data_ov036_02205f2c
L_021fee34: .word 0x132
L_021fee38: .word 0x259
L_021fee3c: .word 0x60b6
L_021fee40: .word data_020f4e18
L_021fee44: .word 0x60b0
L_021fee48: .word 0x60a7
L_021fee4c: .word 0x609e
L_021fee50: .word 0x60b3
L_021fee54: .word 0x60aa
L_021fee58: .word 0x60a1
L_021fee5c: .word 0x60ad
L_021fee60: .word 0x60a4
L_021fee64: .word 0x609b
L_021fee68: .word 0x60b9
L_021fee6c: .word 0x60bc
L_021fee70: .word 0x6098
L_021fee74: .word data_ov036_02206150
L_021fee78: .word gHeapContext
    .size func_ov036_021fea14, .-func_ov036_021fea14

