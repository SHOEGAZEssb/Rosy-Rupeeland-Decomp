.text

/* Exact fallback; see src/overlays/ov035/overlay035_secondary_scene_constructor.c for documented portable C. */

    .extern func_ov035_021fce00
    .extern func_020720c0
    .extern func_ov035_021fdce8
    .extern func_020720e8
    .extern func_020779ac
    .extern func_02071adc
    .extern func_02077624
    .extern func_02077308
    .extern func_ov035_021fdd28
    .extern Heap_Alloc
    .extern func_020955d8
    .extern func_02095274
    .extern func_02094bbc
    .extern func_ov035_021fe5ec
    .extern func_020948d4
    .extern func_ov035_021fe8e4
    .extern func_ov035_021fcf34
    .extern func_ov035_021fdd70
    .extern func_ov035_021fdd78
    .extern func_020b0300
    .extern func_02092850
    .extern data_ov035_02203d04
    .extern data_020f4e18
    .extern data_ov035_02203d20
    .extern data_ov035_02203d38
    .extern data_ov035_02203d40
    .extern data_ov035_02203d48
    .extern gHeapContext


    .global func_ov035_021feb7c
func_ov035_021feb7c: 
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r4, r1
    mov r1, r2
    mov r5, r0
    bl func_ov035_021fce00
    ldr r1, L_021fefe0
    add r0, r5, #0xdc
    str r1, [r5, #0x0]
    bl func_020720c0
    add r0, r5, #0xe8
    bl func_020720c0
    add r0, r5, #0x10c
    bl func_ov035_021fdce8
    add r0, r5, #0x11c
    bl func_ov035_021fdce8
    add r0, r5, #0x12c
    bl func_ov035_021fdce8
    ldr r3, L_021fefe4
    add r0, r5, #0xdc
    str r3, [sp, #0x0]
    ldr r1, L_021fefe8
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0xdc
    bl func_020779ac
    ldr r0, [r5, #0x4]
    cmp r0, #0xc9
    beq L_021fec0c
    cmp r0, #0xcc
    beq L_021fec50
    cmp r0, #0xcf
    beq L_021fec94
L_021fec0c:
    ldr r3, L_021fefec
    ldr r0, L_021fefe8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    ldr r3, L_021feff0
    ldr r0, L_021fefe8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021fecd4
L_021fec50:
    ldr r3, L_021fefec
    ldr r0, L_021fefe8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    add r3, r3, #0x1
    bl func_020720e8
    ldr r3, L_021feff4
    ldr r0, L_021fefe8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021fecd4
L_021fec94:
    ldr r3, L_021fefec
    ldr r0, L_021fefe8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    add r3, r3, #0x2
    bl func_020720e8
    ldr r3, L_021feff8
    ldr r0, L_021fefe8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
L_021fecd4:
    mov r0, r4
    add r1, r5, #0xe8
    bl func_020779ac
    mov r0, r4
    add r1, r5, #0xcc
    bl func_020779ac
    ldr r0, L_021fefe8
    ldr r1, L_021feffc
    ldr r0, [r0, #0x0]
    bl func_02071adc
    str r0, [r5, #0xf4]
    mov r0, r4
    bl func_02077624
    add r1, r5, #0xdc
    str r0, [r5, #0xf8]
    bl func_02077308
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r2, #0x7
    str r2, [sp, #0x4]
    mov r2, #0x42
    str r2, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r6, r0
    bl func_ov035_021fdd28
    ldr r1, L_021ff000
    ldr r3, L_021ff004
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fed60
    mov r1, r6
    bl func_020955d8
L_021fed60:
    str r0, [r5, #0xfc]
    mov r1, r0
    add r0, r5, #0x10c
    bl func_02095274
    ldr r0, [r5, #0xf8]
    add r1, r5, #0xe8
    bl func_02077308
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r3, #0x8
    str r3, [sp, #0x4]
    mov r3, #0x42
    str r3, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r6, r0
    bl func_ov035_021fdd28
    ldr r1, L_021ff000
    ldr r3, L_021ff004
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fedc8
    mov r1, r6
    bl func_020955d8
L_021fedc8:
    str r0, [r5, #0x100]
    mov r1, r0
    add r0, r5, #0x10c
    bl func_02095274
    ldr r0, [r5, #0xf8]
    add r1, r5, #0xcc
    bl func_02077308
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r3, #0x8
    str r3, [sp, #0x4]
    mov r3, #0x42
    str r3, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r6, r0
    bl func_ov035_021fdd28
    ldr r1, L_021ff000
    ldr r3, L_021ff004
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fee30
    mov r1, r6
    bl func_020955d8
L_021fee30:
    str r0, [r5, #0xd8]
    mov r1, r0
    add r0, r5, #0x10c
    bl func_02095274
    mov r1, #0x0
    ldr r0, [r5, #0xd8]
    mov r3, r1
    mov r2, #0xe00
    bl func_02094bbc
    ldr r1, L_021ff008
    ldr r3, L_021ff004
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fee78
    mov r1, r4
    bl func_ov035_021fe5ec
L_021fee78:
    str r0, [r5, #0x13c]
    mov r1, r0
    add r0, r5, #0x10c
    bl func_02095274
    mov r1, #0x0
    ldr r0, [r5, #0x13c]
    mov r2, r1
    sub r3, r1, #0x600
    bl func_02094bbc
    ldr r0, [r5, #0x13c]
    ldr r1, L_021ff00c
    add r0, r0, #0x6c
    bl func_020948d4
    ldr r1, L_021ff010
    ldr r3, L_021ff004
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021feed0
    mov r1, r4
    bl func_ov035_021fe8e4
L_021feed0:
    str r0, [r5, #0x140]
    mov r1, r0
    add r0, r5, #0x10c
    bl func_02095274
    mov r1, #0x0
    ldr r0, [r5, #0x140]
    sub r2, r1, #0x800
    sub r3, r1, #0x600
    bl func_02094bbc
    ldr r1, L_021ff014
    ldr r3, L_021ff004
    mov r0, #0xc4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fef20
    ldr r1, [r5, #0xf4]
    mov r2, #0x0
    mov r3, #0x15
    bl func_ov035_021fcf34
L_021fef20:
    str r0, [r5, #0x104]
    mov r1, r0
    add r0, r5, #0x11c
    bl func_02095274
    ldr r1, L_021ff014
    ldr r3, L_021ff004
    mov r0, #0xc4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fef5c
    ldr r1, [r5, #0xf4]
    mov r2, #0x1
    mov r3, #0x9
    bl func_ov035_021fcf34
L_021fef5c:
    str r0, [r5, #0x108]
    mov r1, r0
    add r0, r5, #0x11c
    bl func_02095274
    ldr r4, [r5, #0x108]
    add r0, r5, #0xc
    ldrh r3, [r4, #0x98]
    mov r1, #0x0
    mov r2, #0x1400
    orr r3, r3, #0x2
    strh r3, [r4, #0x98]
    ldr ip, [r5, #0x108]
    mov r3, #0x2800
    ldrh r4, [ip, #0x98]
    orr r4, r4, #0x1
    strh r4, [ip, #0x98]
    bl func_ov035_021fdd70
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0xc
    bl func_ov035_021fdd78
    mov r0, #0x0
    ldr r2, L_021ff018
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_020b0300
    mov r0, #0x0
    bl func_02092850
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fefe0: .word data_ov035_02203d04
L_021fefe4: .word 0x6017
L_021fefe8: .word data_020f4e18
L_021fefec: .word 0x6072
L_021feff0: .word 0x610a
L_021feff4: .word 0x610d
L_021feff8: .word 0x6110
L_021feffc: .word 0x5009
L_021ff000: .word data_ov035_02203d20
L_021ff004: .word gHeapContext
L_021ff008: .word data_ov035_02203d38
L_021ff00c: .word 0x12e1
L_021ff010: .word data_ov035_02203d40
L_021ff014: .word data_ov035_02203d48
L_021ff018: .word 0x7fff
.size func_ov035_021feb7c, .-func_ov035_021feb7c

