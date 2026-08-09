.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern data_ov071_02212258
.extern data_ov071_02212394
.extern data_ov071_022123c8
.extern func_02004fe0
.extern func_02072b68
.extern func_0209a208
.extern func_ov071_0220fd20
.extern func_ov071_02210184
.extern func_ov071_02211514
.extern gGameWork
.extern gHeapContext

.global func_ov071_0220fd60
func_ov071_0220fd60:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x30
    mov r10, r0
    mov r4, r1
    mov r9, r2
    bl func_ov071_0220fd20
    ldr r1, .L_02210150
    add r0, r10, #0x4c
    str r1, [r10, #0x0]
    bl func_02004fe0
    add r0, r10, #0x5c
    bl func_02004fe0
    add r0, r10, #0x94
    bl func_ov071_02210184
    add r0, r10, #0xa0
    bl func_ov071_02210184
    add r0, r10, #0xac
    bl func_ov071_02210184
    add r0, r10, #0xdc
    bl func_ov071_02210184
    str r4, [r10, #0x48]
    ldr r0, .L_02210154
    ldr r1, .L_02210158
    mov r2, #0x4
    ldr r3, .L_0221015c
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220fdd8
    mov r1, r4
    bl func_ov071_02211514
.L_0220fdd8:
    ldr r1, .L_02210160
    str r0, [r10, #0xe8]
    ldr r0, [r1, #0x0]
    ldr r1, .L_02210164
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldr r1, .L_02210168
    beq .L_0220fe18
    str r9, [sp, #0x0]
    mov r2, #0x2
    str r2, [sp, #0x4]
    mov r0, r10
    add r2, r1, #0x3
    add r3, r1, #0x2
    bl func_0209a208
    b .L_0220fe34
.L_0220fe18:
    mov r0, r10
    str r9, [sp, #0x0]
    mov r4, #0x2
    add r2, r1, #0x1
    add r3, r1, #0x2
    str r4, [sp, #0x4]
    bl func_0209a208
.L_0220fe34:
    str r0, [r10, #0xec]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    ldr r1, [r10, #0xec]
    ldr r4, [r4, #0x0]
    mov r2, #0x40000
    mov r3, #0x64000
    blx r4
    ldr r2, [r10, #0xec]
    mov r1, #0x4
    ldrh r0, [r2, #0x42]
    bic r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r10, #0xec]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r1, .L_0221016c
    str r9, [sp, #0x0]
    mov r2, #0x2
    str r2, [sp, #0x4]
    mov r0, r10
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0xf0]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    ldr r1, [r10, #0xf0]
    ldr r4, [r4, #0x0]
    mov r2, #0x40000
    mov r3, #0x64000
    blx r4
    ldr r2, [r10, #0xf0]
    mov r1, #0x0
    ldrh r0, [r2, #0x42]
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r10, #0xf0]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r10, #0xf0]
    mvn r5, #0x7f
    ldr r4, [r0, #0xc]
    ldr r1, .L_02210170
    ldrh r2, [r4, #0x24]
    mov r3, #0x2
    mov r0, r10
    bic r2, r2, #0x2
    strh r2, [r4, #0x24]
    ldr r4, [r10, #0xf0]
    add r2, r1, #0x1
    str r5, [r4, #0x44]
    str r9, [sp, #0x0]
    str r3, [sp, #0x4]
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0xf4]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    ldr r1, [r10, #0xf4]
    ldr r4, [r4, #0x0]
    mov r2, #0x80000
    mov r3, #0x88000
    blx r4
    ldr r1, [r10, #0xf4]
    ldr r6, .L_02210174
    ldrh r0, [r1, #0x42]
    add r5, sp, #0x8
    mov r4, #0x2
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r10, #0xf4]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_0220ff88:
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_0220ff88
    ldmia r6, {r0, r1}
    mov r2, #0xa
    stmia r5, {r0, r1}
    ldr r11, .L_02210178
    sub r8, r2, #0x1
    mov r7, #0x2
    mov r6, #0x0
    add r5, sp, #0x8
    mvn r4, #0x7f
.L_0220ffbc:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r11
    add r2, r11, #0x1
    add r3, r11, #0x2
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x6c]
    str r6, [sp, #0x0]
    str r6, [sp, #0x4]
    mov r0, r10
    ldr r2, [r5, r8, lsl #0x2]
    ldr ip, [r0, #0x0]
    add r2, r2, #0x80
    ldr r1, [r1, #0x6c]
    ldr ip, [ip, #0x0]
    mov r3, #0xf1000
    mov r2, r2, lsl #0xc
    blx ip
    add r2, r10, r8, lsl #0x2
    ldr r1, [r2, #0x6c]
    subs r8, r8, #0x1
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r2, #0x6c]
    str r4, [r0, #0x44]
    bpl .L_0220ffbc
    ldr r0, [r10, #0x88]
    mov r1, #0xf4000
    str r1, [r0, #0x34]
    ldr r0, [r10, #0x88]
    mov r1, #0xa
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r10, #0x8c]
    mov r1, #0xf4000
    str r1, [r0, #0x34]
    ldr r0, [r10, #0x8c]
    mov r1, #0xa
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r10, #0x90]
    mov r1, #0xb
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldr r0, [r10, #0x90]
    mov r2, #0x78
    str r2, [r0, #0x44]
    mov r0, #0x80000
    str r0, [r10, #0x30]
    mov r0, #0xa000
    str r0, [r10, #0x34]
    mov r1, #0x0
    str r1, [r10, #0x38]
    mov r0, #0x100
    strh r0, [r10, #0x3c]
    strh r0, [r10, #0x3e]
    ldr r0, .L_0221017c
    strh r1, [r10, #0x40]
    str r1, [r0, #0x0]
    str r1, [r0, #0x8]
    str r1, [r10, #0x98]
    mov r0, #0xf0000
    str r0, [r10, #0x9c]
    str r1, [r10, #0xa8]
    str r1, [r10, #0xa4]
    str r1, [r10, #0xb4]
    str r1, [r10, #0xb0]
    mov r0, #0x8000
    strh r0, [r10, #0xb8]
    str r1, [r10, #0xc4]
    str r1, [r10, #0xc0]
    str r1, [r10, #0xbc]
    str r1, [r10, #0xd0]
    str r1, [r10, #0xc8]
    str r1, [r10, #0xd4]
    strh r1, [r10, #0xf8]
    ldr r0, .L_02210160
    str r1, [r10, #0xfc]
    ldr r2, [r0, #0x0]
    add r0, r2, #0x200
    ldrsh r0, [r0, #0x46]
    cmp r0, #0x0
    ldreq r0, .L_02210180
    ldrne r1, [r2, #0x40]
    ldrne r0, [r2, #0x7f8]
    addne r0, r1, r0
    str r0, [r10, #0xd8]
    ldr r0, .L_02210160
    ldr r1, .L_02210164
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldrne r0, [r10, #0xd8]
    movne r0, r0, lsl #0x1
    strne r0, [r10, #0xd8]
    mov r0, r10
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02210150: .word data_ov071_02212394
.L_02210154: .word 0xc38
.L_02210158: .word data_ov071_022123c8
.L_0221015c: .word gHeapContext
.L_02210160: .word gGameWork
.L_02210164: .word 0x306
.L_02210168: .word 0x10ab
.L_0221016c: .word 0x10d0
.L_02210170: .word 0x1685
.L_02210174: .word data_ov071_02212258
.L_02210178: .word 0x23ab
.L_0221017c: .word 0x4000014
.L_02210180: .word 0x7a120
.size func_ov071_0220fd60, . - func_ov071_0220fd60
